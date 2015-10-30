From: Stuart Yoder <stuart.yoder-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: RE: [PATCH v2] arm64: dts: Added syscon-reboot node for FSL's LS2085A
 SoC
Date: Fri, 30 Oct 2015 16:34:26 +0000
Message-ID: <CY1PR0301MB07483E9D229314891961B6AD872F0@CY1PR0301MB0748.namprd03.prod.outlook.com>
References: <1446066584-3738-1-git-send-email-German.Rivera@freescale.com>
 <3919319.0f6zV1T7g0@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3919319.0f6zV1T7g0@wuerfel>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Jose Rivera <German.Rivera-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sharma Bhupesh <bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Li Leo <LeoLi-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Arnd Bergmann [mailto:arnd-r2nGTMty4D4@public.gmane.org]
> Sent: Thursday, October 29, 2015 4:49 PM
> To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: Rivera Jose-B46482; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; mark.rutland-5wv7dgnIgG8@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-
> kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Sharma Bhupesh-B45370; Li Yang-Leo-R58472; Yoder Stuart-B08248
> Subject: Re: [PATCH v2] arm64: dts: Added syscon-reboot node for FSL's LS2085A SoC
> 
> On Wednesday 28 October 2015 16:09:44 J. German Rivera wrote:
> > +       rst_ccsr: rstccsr@1E60000 {
> > +               compatible = "syscon";
> > +               reg = <0x0 0x1E60000 0x0 0x10000>;
> > +       };
> > +
> >
> 
> What does 'rstccsr' stand for? Is this by chance a reset controller?

It is a region of some miscellaneous registers, some related to reset.
 
> If so, we probably want a real driver for it rather than just a
> syscon.

There is not other stuff in this region that to be exposed,
and so we really don't need a real driver.

My suggestion is to perhaps make that more explicit in the proposed
device tree node, by making the reg size "4" and naming it
as per the register name

       rstcr: rstcr@1E60000 {
               compatible = "syscon";
               reg = <0x0 0x1E60000 0x0 0x4>;
       };

The intent is really just to expose a single reset register
and use syscon-reboot until PSCI is available.

Thanks,
Stuart
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
