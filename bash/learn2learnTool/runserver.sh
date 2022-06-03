### runserver
##spython3 home/ec2-user/learntolearn/learntolearn-django-master/manage.py runserver;
 #/home/ec2-user/learntolearn/learntolearn-django-master

SCRIPT_PATH=$(pwd)

NODE_PID=$(lsof -i:3000 | grep "node" | awk '{print $2}')
DJANGO_PID=$(lsof -i:8000 | grep "python3" | awk '{print $2}')

# lsof -i:3000 | grep "node" | awk '{print $2}' | xargs kill -9

for pid in ${NODE_PID}
do
	if [ ! -z "${pid}" ]; then
		kill -9 ${pid}
	fi
done

for pid in ${DJANGO_PID}
do 
	if [ ! -z "${pid}" ]; then
		kill -9 ${pid}
	fi
done

nohup python3 ~/learntolearn/learntolearn-django-master/manage.py runserver 0.0.0.0:8000 --setting=config.settings.dev & > /dev/null

cd /home/ec2-user/learntolearn/learntolearn-next-develop; 

echo -e "DJANGO_HOST=http://13.124.162.93:8000\nNEXT_PUBLIC_DJANGO_HOST=http://13.124.162.93:8000" > .env.development
nohup npm run dev & > /dev/null

cd -;