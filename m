From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Re: [PATCH RFC V3 2/3] mxs: add driver for ocotp in i.MX23 and
 i.MX28
Date: Fri, 7 Nov 2014 20:44:35 +0100 (CET)
Message-ID: <1818938629.87757.1415389475195.JavaMail.open-xchange@oxbsltgw03.schlund.de>
References: <1413628372-2809-1-git-send-email-stefan.wahren@i2se.com> <3434817.dk7dLDFrcN@wuerfel> <544FCFB3.10100@vanguardiasur.com.ar> <2223659.OW08fe0cS1@wuerfel> <1003885907.22061.1415301932743.JavaMail.open-xchange@oxbsltgw00.schlund.de> <545D1A0D.9050307@vanguardiasur.com.ar>
Reply-To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <545D1A0D.9050307-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Cc: mhei-Z/Lg1yOAjpkb1SvskN2V4Q@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org


> Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org> hat am 7. November 2014 um
> 20:14 geschrieben:
>
>
> While you are here, maybe you can check if your API and driver will also
> be useful to support i.MX6 OCOTP?

That's why i named the driver fsl_ocotp and not mxs_ocotp ;-)

Sure the handling would be a little different.

>
> I understand that I might be asking too much, and that perhaps i.MX23/28
> eFuses are completely different from other another i.MX.

I don't believe that, but i didn't doublecheck it.

BR Stefan

>
> --
> Ezequiel Garcia, VanguardiaSur
> www.vanguardiasur.com.ar
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
