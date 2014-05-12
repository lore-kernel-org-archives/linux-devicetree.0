From: "Yang, Wenyou" <Wenyou.Yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: RE: [PATCH] ARM: dts: at91-sama5d3_xplained: add the regulator
 device node
Date: Mon, 12 May 2014 04:42:53 +0000
Message-ID: <B256D81BAE5131468A838E5D7A2436418C90E487@penmbx01>
References: <1398054547-5834-1-git-send-email-wenyou.yang@atmel.com>
 <20140421095443.GA3461@piout.net> <20140421122205.GB3461@piout.net>
 <B256D81BAE5131468A838E5D7A24364180A876DA@penmbx01>
 <536CF49E.1050708@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <536CF49E.1050708-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ferre, Nicolas" <Nicolas.FERRE-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Ferre, Nicolas
> Sent: Friday, May 09, 2014 11:31 PM
> To: Yang, Wenyou; Alexandre Belloni
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; linux-arm-
> kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Subject: Re: [PATCH] ARM: dts: at91-sama5d3_xplained: add the regulator
> device node
> 
> On 22/04/2014 03:37, Yang, Wenyou :
> > Hi,
> >
> >> -----Original Message-----
> >> From: Alexandre Belloni [mailto:alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org]
> >> Sent: Monday, April 21, 2014 8:22 PM
> >> To: Yang, Wenyou
> >> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Ferre, Nicolas; linux-
> >> kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org;
> >> linux- arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> >> Subject: Re: [PATCH] ARM: dts: at91-sama5d3_xplained: add the
> >> regulator device node
> >>
> >> On 21/04/2014 at 11:54:43 +0200, Alexandre Belloni wrote :
> >>> Hi,
> >>>
> >>> On 21/04/2014 at 12:29:07 +0800, Wenyou Yang wrote :
> >>>> +
> >>>> +						vddana_reg: LDO_REG2 {
> >>>> +							regulator-name =
> "VDDANA";
> >>>> +							regulator-min-microvolt
> =
> >> <3300000>;
> >>>> +							regulator-max-microvolt
> =
> >> <3300000>;
> >>>> +							regulator-always-on;
> >>>
> >>> I'm pretty sure that one is not always on as you actually have to
> >>> configure it to get any voltage. Are you sure you want to set the
> >>> regulator-always-on property here ?
> >>>
> >>
> >> Just to clarify my though, wouldn't it be better to make the ADC
> >> driver handle that regulator instead of using regulator-always-on ?
> > Yes, you are right.
> > It should not use regulator-always-on property for this regulator.
> > It is ADC driver and ISI driver to handle it(The ISI takes PCK for
> clock).
> 
> Hi Wenyou and Alexandre,
> 
> After talking to our system engineers, it not usual to avoid to power
> the VDDANA rail. In fact it will prevent you to use all the pads that
> are powered by VDDANA: PD20-PD31. Moreover, even if you do not activate
> the ADC output on these lines you won't be able to use them as plain
> GPIO... (Cf. package and pinout section of the datasheet).
> 
> As the ADVREF pin of the SoC is connected to the VDDANA on this board
> (even if this default configuration can be modified with a soldering
> iron), we have to note that we may consume a little bit more power.
> 
> But still, I would recommend to keep the "regulator-always-on" property
> on this node. Do you agree and allow me to take your first revision of
> the patch?
I agree.

> 
> 
> Bye,
> --
> Nicolas Ferre

Best Regards,
Wenyou Yang
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
