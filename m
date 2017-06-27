From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [linux-sunxi] Re: [PATCH v3 2/3] dt-bindings: input: Add R_LRADC
 support for A83T
Date: Tue, 27 Jun 2017 20:15:35 +0200
Message-ID: <20170627181535.2nhd3rd542wpryjy@piout.net>
References: <20170624024515.4669-1-techping.chan@gmail.com>
 <20170624024515.4669-3-techping.chan@gmail.com>
 <20170626171524.cqfyasetpsfr6xfg@flea.lan>
 <CAAST=9x+fS41tznuJ9hQ-cQxecKN751=61YkhEt31DvpeqeEcA@mail.gmail.com>
 <24845446a80e3542d90a1111a6141415@aosc.io>
 <20170627173631.2rjdzgwdwnksqjzm@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170627173631.2rjdzgwdwnksqjzm@flea>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: icenowy-h8G6r0blFSE@public.gmane.org, techping.chan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 27/06/2017 at 19:36:31 +0200, Maxime Ripard wrote:
> Hi,
> 
> On Tue, Jun 27, 2017 at 11:29:10PM +0800, icenowy-h8G6r0blFSE@public.gmane.org wrote:
> > Maxime, here's another problem: if we have already a GP LRADC driver,
> > how can we tell the kernel to use it as IIO ADC rather than keys?
> 
> The GPADC IIO driver is not for the LRADC driver, but the GPADC /
> temperature sensor.
> 
> We used to have an LRADC IIO driver in the CHIP BSP written by Alex
> (in CC):
> https://github.com/NextThingCo/CHIP-linux/commit/8675b761c54be73dc7cc0113209f02e10cc63a27
> 
> But he never mainlined it.
> 
> > Should we introduce a new property for this once ready?
> 
> We need to keep the current binding. We can just check for the
> presence or not of child nodes to see if it has some keys, and we'd
> need an IIO-to-input driver that is yet to be written.
> 

The whole submission is here and can already replace the existing driver
but it will be polling instead of using interrupts:

http://lists.infradead.org/pipermail/linux-arm-kernel/2016-July/440734.html

It is not upstream because it seems the full replacement was required at
once instead of doing it incrementally and there was (is) no API for
in-kernel events consumers.

Also, the DT ABI stuff would have to be solved.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
