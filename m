From: "Yang, Wenyou" <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: RE: [PATCH] ARM: dts: at91-sama5d3_xplained: add the regulator
 device node
Date: Tue, 22 Apr 2014 01:37:15 +0000
Message-ID: <B256D81BAE5131468A838E5D7A24364180A876DA@penmbx01>
References: <1398054547-5834-1-git-send-email-wenyou.yang@atmel.com>
 <20140421095443.GA3461@piout.net> <20140421122205.GB3461@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140421122205.GB3461-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Ferre, Nicolas" <Nicolas.FERRE-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

> -----Original Message-----
> From: Alexandre Belloni [mailto:alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org]
> Sent: Monday, April 21, 2014 8:22 PM
> To: Yang, Wenyou
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Ferre, Nicolas; linux-
> kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; linux-
> arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Subject: Re: [PATCH] ARM: dts: at91-sama5d3_xplained: add the regulator
> device node
> 
> On 21/04/2014 at 11:54:43 +0200, Alexandre Belloni wrote :
> > Hi,
> >
> > On 21/04/2014 at 12:29:07 +0800, Wenyou Yang wrote :
> > > +
> > > +						vddana_reg: LDO_REG2 {
> > > +							regulator-name = "VDDANA";
> > > +							regulator-min-microvolt =
> <3300000>;
> > > +							regulator-max-microvolt =
> <3300000>;
> > > +							regulator-always-on;
> >
> > I'm pretty sure that one is not always on as you actually have to
> > configure it to get any voltage. Are you sure you want to set the
> > regulator-always-on property here ?
> >
> 
> Just to clarify my though, wouldn't it be better to make the ADC driver
> handle that regulator instead of using regulator-always-on ?
Yes, you are right. 
It should not use regulator-always-on property for this regulator. It is ADC driver and ISI driver to handle it(The ISI takes PCK for clock).

I will send new version patch.

Thanks

> 
> --
> Alexandre Belloni, Free Electrons
> Embedded Linux, Kernel and Android engineering http://free-
> electrons.com

Best Regards,
Wenyou Yang
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
