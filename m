From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: at91-sama5d3_xplained: add the regulator
 device node
Date: Mon, 21 Apr 2014 14:22:05 +0200
Message-ID: <20140421122205.GB3461@piout.net>
References: <1398054547-5834-1-git-send-email-wenyou.yang@atmel.com>
 <20140421095443.GA3461@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140421095443.GA3461-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wenyou Yang <wenyou.yang-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 21/04/2014 at 11:54:43 +0200, Alexandre Belloni wrote :
> Hi,
> 
> On 21/04/2014 at 12:29:07 +0800, Wenyou Yang wrote :
> > +
> > +						vddana_reg: LDO_REG2 {
> > +							regulator-name = "VDDANA";
> > +							regulator-min-microvolt = <3300000>;
> > +							regulator-max-microvolt = <3300000>;
> > +							regulator-always-on;
> 
> I'm pretty sure that one is not always on as you actually have to
> configure it to get any voltage. Are you sure you want to set the
> regulator-always-on property here ?
> 

Just to clarify my though, wouldn't it be better to make the ADC driver
handle that regulator instead of using regulator-always-on ?

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
