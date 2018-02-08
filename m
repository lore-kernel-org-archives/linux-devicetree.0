From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: phycore-imx6: set buck regulator modes explicitly
Date: Thu, 8 Feb 2018 17:15:45 -0200
Message-ID: <CAOMZO5CbKWXmFGzB25HtZuVa+C3wZk9DncBoe54ir8jWhyw7aw@mail.gmail.com>
References: <1518088421.2347.9.camel@googlemail.com> <CAOMZO5Bsp2VGY0++XBqMd4aXj6uo-guzfH-jQ9R6uyanStfMtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5Bsp2VGY0++XBqMd4aXj6uo-guzfH-jQ9R6uyanStfMtA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christoph Fritz <chf.fritz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Christian Hemp <c.hemp-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 8, 2018 at 5:14 PM, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> According to Documentation/devicetree/bindings/regulator/twl-regulator.txt:

Sorry, I mean "Documentation/devicetree/bindings/regulator/regulator.txt".

>
> "- regulator-initial-mode: initial operating mode. The set of possible operating
>   modes depends on the capabilities of every hardware so each device binding
>   documentation explains which values the regulator supports."
>
> However, I haven't found the explanation of this property for the
> da9062-regulator.
>
> Could you please add it into
> Documentation/devicetree/bindings/mfd/da9062.txt, so that we we know
> what the value 2 means here?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
