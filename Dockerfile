FROM letmeaskmydog/toyhauler-base
WORKDIR /app

COPY ./bin /app/bin
COPY ./package.json /app
COPY ./package-lock.json /app

# We need the source code because the openApi spec is going to scan it for symbols when it builds the api spec.
# If we do that at build time instead of at runtime, we wouldnt need to deploy the source code.
# TODO: Consider generating the openapi spec at build time. 
COPY ./src /app/src
COPY ./tsconfig.json /app

# Leave these to the run command
# EXPOSE 17888
# ENV environment DEV

CMD ["node", "./bin/index.js"]