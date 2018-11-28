MIME-Version: 1.0
Date: Wed, 28 Nov 2018 09:46:05 -0600
References: <87r2f60wiu.wl-kuninori.morimoto.gx@renesas.com>
	<87o9aa0whf.wl-kuninori.morimoto.gx@renesas.com>
	<CAL_JsqJmYcd=SVjivse93_GyYvz9MnbOzgjkf_PSxqRCZtUAqg@mail.gmail.com>
	<87in0h24yx.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87in0h24yx.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <CAL_JsqJ=44-odEWvefbXn-2Kdx=pPuC8n9REYKEFHaPZZd--XA@mail.gmail.com>
Subject: Re: [PATCH 2/2][resend] OF: add for_each_port_of_node()
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Nov 27, 2018 at 10:46 PM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Rob
>
> Thank you for reviewing
>
> > I'd like to see the user for this first.
> >
> > Generally, I don't think iterating over port or endpoint nodes is the
> > right way to walk the graph. A given port address has a defined
> > function and you should be requesting the specific ports.
>
> I attached patch which is using for_each_port_of_node().
> I want to know "specified" port location.
>
> -------------
> From 1abf55f28cc12c207bce646e579f19ded117d5c6 Mon Sep 17 00:00:00 2001
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Date: Thu, 15 Nov 2018 11:18:31 +0900
> Subject: [PATCH] ASoC: simple-card-utils: fixup asoc_simple_card_get_dai_id()
>  counting
>
> asoc_simple_card_get_dai_id() returns DAI ID, but it is based on
> DT node's "endpoint" count.
> Almost all cases 1 port has 1 endpoint, thus, it was no problem.
> But in reality, port : endpoint = 1 : N, thus, counting endpoint
> is BUG, it should count "port".
> This patch fixup it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/generic/simple-card-utils.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
> index c69ce1e..119f831 100644
> --- a/sound/soc/generic/simple-card-utils.c
> +++ b/sound/soc/generic/simple-card-utils.c
> @@ -270,7 +270,8 @@ EXPORT_SYMBOL_GPL(asoc_simple_card_parse_dai);
>  static int asoc_simple_card_get_dai_id(struct device_node *ep)
>  {
>         struct device_node *node;
> -       struct device_node *endpoint;
> +       struct device_node *p;
> +       struct device_node *port;
>         int i, id;
>         int ret;
>
> @@ -279,20 +280,22 @@ static int asoc_simple_card_get_dai_id(struct device_node *ep)
>                 return ret;
>
>         node = of_graph_get_port_parent(ep);
> +       port = of_graph_get_port(ep);
>
>         /*
> -        * Non HDMI sound case, counting port/endpoint on its DT
> +        * Non HDMI sound case, counting port on its DT
>          * is enough. Let's count it.
>          */
>         i = 0;
>         id = -1;
> -       for_each_endpoint_of_node(node, endpoint) {
> -               if (endpoint == ep)
> +       for_each_port_of_node(node, p) {
> +               if (port == p)
>                         id = i;
>                 i++;
>         }

This is fragile because it assumes 0-N port numbering. While that's
usually true, it's not guaranteed.

Just add a of_graph_get_port_id() that reads and returns 'reg' value
or 0 if no 'reg'. Or just use of_graph_parse_endpoint().

Rob
