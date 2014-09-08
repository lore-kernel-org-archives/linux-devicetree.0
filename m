From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v7 1/5] Documentation: Add device tree bindings for
 Freescale i.MX GPC
Date: Mon, 08 Sep 2014 13:54:36 +0200
Message-ID: <1410177276.3981.35.camel@paszta.hi.pengutronix.de>
References: <1409060791-23167-1-git-send-email-p.zabel@pengutronix.de>
	 <1409060791-23167-2-git-send-email-p.zabel@pengutronix.de>
	 <CAMuHMdUqbk+OZiBMUsebQ_==7jCan+dHsfJLhi+CPUE=xc6yRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdUqbk+OZiBMUsebQ_==7jCan+dHsfJLhi+CPUE=xc6yRA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Geert,

Am Freitag, den 05.09.2014, 13:47 +0200 schrieb Geert Uytterhoeven:
> Hi Philipp,
> 
> On Tue, Aug 26, 2014 at 3:46 PM, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > +++ b/Documentation/devicetree/bindings/power/fsl,imx-gpc.txt
> > @@ -0,0 +1,54 @@
> 
> > +IP cores belonging to a power domain should contain a 'power-domain' property
> 
> power-domains
> 
> > +that is a phandle pointing to the gpc device node and a DOMAIN_INDEX specifying
> > +the power domain the device belongs to.
> > +
> > +Example of a device that is part of the PU power domain:
> > +
> > +       vpu: vpu@02040000 {
> > +               reg = <0x02040000 0x3c000>;
> > +               /* ... */
> > +               power-domain = <&gpc 1>;
> 
> power-domains

Thanks, I'll change those.

regards
Philipp


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
