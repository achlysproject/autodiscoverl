FROM erlang:alpine

RUN apk add make git

RUN mkdir -p /buildroot/autodiscoverl
WORKDIR /buildroot/autodiscoverl

COPY src           .
COPY include       .
COPY config        .
COPY tools         .
COPY Makefile      .
COPY rebar.config* .
COPY VERSION       .

RUN make release v=1

FROM alpine

RUN apk add openssl ncurses-libs

RUN VERSION=$(cat VERSION) && export autodiscoverl_VERSION=$VERSION
COPY --from=0 autodiscoverl-$autodiscoverl_VERSION /autodiscoverl

WORKDIR /
RUN rm -rf /buildroot

CMD ["/autodiscoverl/bin/autodiscoverl", "foreground"]
