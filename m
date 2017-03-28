From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ATM: dts: at91: sama5d2_xplained: add pwm controller
Date: Tue, 28 Mar 2017 13:34:52 +0200
Message-ID: <20170328113452.bje7har2ymbr32ad@piout.net>
References: <1487838778-13473-1-git-send-email-claudiu.beznea@microchip.com>
 <20170223084241.6eqm5jxe4t7fpn6a@piout.net>
 <60c37963-509f-7764-9554-520694294909@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <60c37963-509f-7764-9554-520694294909-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: m18063 <Claudiu.Beznea-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Cc: "nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org" <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org" <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org" <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 28/03/2017 at 14:04:25 +0300, m18063 wrote:
> >> diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5d2.dtsi
> >> index cd459e8..e88785e 100644
> >> --- a/arch/arm/boot/dts/sama5d2.dtsi
> >> +++ b/arch/arm/boot/dts/sama5d2.dtsi
> >> @@ -1098,6 +1098,14 @@
> >>  				status = "disabled";
> >>  			};
> >>  
> >> +			pwm0: pwm@f802c000 {
> >> +				compatible = "atmel,sama5d2-pwm";
> > This compatible is not documented and is not used in any driver. Is that
> > really working?
> 
> At the moment I send this patch another driver patch was send
> to used this device tree bindings and also to document it.
> Meanwhile you reviewed also that other patch.
> 

Yes, I received that patch first, without the other ones. You should
have put everything in the same series.

> Please let me know if you want to send again this DT patch since
> I didn't yet receive any inputs its v2.
> 

I'll take it once the pwm patch are taken by Thierry because it is not
useful as-is, unless you use:
 compatible = "atmel,sama5d2-pwm", "atmel,sama5d3-pwm";


-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
