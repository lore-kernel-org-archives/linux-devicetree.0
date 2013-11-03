From: Rostislav Lisovy <lisovy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: dts: i.MX53: dts for Voipac x53-dmm-668 module
Date: Sun, 03 Nov 2013 16:38:07 +0100
Message-ID: <1383493087.15754.1.camel@lolumad>
References: <1381874609-14464-1-git-send-email-lisovy@gmail.com>
	 <1381874609-14464-4-git-send-email-lisovy@gmail.com>
	 <20131101225759.GA3224@kartoffel>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131101225759.GA3224@kartoffel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "pisa-/N2ztlQkxE7Ub/6JBqosbQ@public.gmane.org" <pisa-/N2ztlQkxE7Ub/6JBqosbQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2013-11-01 at 15:58 -0700, Mark Rutland wrote:
> > +#include "imx53.dtsi"
> > +
> > +/ {
> > +     model = "Voipac i.MX53 X53-DMM-668";
> > +     compatible = "vp,imx53-dmm-668", "fsl,imx53";
> > +
> > +     memory@0 {
> > +             device_type = "memory";
> > +             reg = <0x70000000 0x20000000>;
> > +     };
> > +
> > +     memory@1 {
> > +             device_type = "memory";
> > +             reg = <0xb0000000 0x20000000>;
> > +     };
> 
> This looks wrong. Any unit-address should match the first reg entry,
> and I've
> not seen memory nodes with unit addresses anywhere else.
> 
> Why not:
> 
> memory {
>         device_type = "memory";
>         reg = <0x70000000 0x20000000>,
>               <0xb0000000 0x20000000>;
> };

This has already been fixed in the newer version of the patch.

Regards;
Rostislav Lisovy;

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
