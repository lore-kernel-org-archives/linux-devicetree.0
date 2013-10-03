From: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/4] SoCFPGA: dts cleanups and SoCkit support
Date: Thu, 3 Oct 2013 10:12:01 -0500
Message-ID: <1380813121.7464.18.camel@linux-builds1>
References: <1380699333-558-1-git-send-email-s.trumtrar@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380699333-558-1-git-send-email-s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2013-10-02 at 09:35 +0200, Steffen Trumtrar wrote:
> Hi!
> 
> This series includes some minor cleanups (indentation and clock labels) and
> reorders the socfpga dts hierarchy from
> 	socfpga.dtsi
> 	-> socfpga_$board.dts
> 	-> socfpga_$otherboard.dts
> to
> 	socfpga.dtsi
> 	-> socfpga_cyclone5.dtsi
> 	--> socfpga_cyclone5_$board.dts
> 	--> socfpga_cyclone5_$otherboard.dts
> 
> The Socfpga is a SoC with an FPGA on board. This FPGA does not have to be a
> Cyclone5.
> The current socfpga_cyclone5.dts is however not specific to a SoC with this
> combination, but describes one specific board: the Altera Cyclone5 Development Kit.
> Therefore, I propose moving the common stuff to socfpga_cyclone5.dtsi as long as
> it is as easy as now.
> 
> Finally, the series adds minimal support for the terasic SoCkit.
> 
> BTW: It seems there is no official maintainer(tree) for the socfpga dt stuff.
> So, I rebased onto next-20130927.

I've pretty much Acked this whole series, with the minor comment of a
baudrate change.

I think Rob had mentioned in a another patch(that since the patch
doesn't involve a binding change, it may not get too many comments), and
since this patch series is not making a binding change at all, comments
may not come, but we still need an Ack from a DTS binding maintainer
before the arm-soc maintainer(s) will take it.

Thanks,
Dinh
> Regards,
> Steffen
> 
> 
> Steffen Trumtrar (4):
>   ARM: socfpga: dts: Move common nodes to cyclone5 dtsi
>   ARM: socfpga: dts: Add support for terasic SoCkit
>   ARM: socfpga: dts: cleanup indentation
>   ARM: socfpga: dts: fix s2f_* clock name
> 
>  arch/arm/boot/dts/Makefile                         |   3 +-
>  arch/arm/boot/dts/socfpga.dtsi                     | 296 ++++++++++-----------
>  ...{socfpga_cyclone5.dts => socfpga_cyclone5.dtsi} |  20 --
>  arch/arm/boot/dts/socfpga_cyclone5_socdk.dts       |  40 +++
>  arch/arm/boot/dts/socfpga_cyclone5_sockit.dts      |  37 +++
>  5 files changed, 227 insertions(+), 169 deletions(-)
>  rename arch/arm/boot/dts/{socfpga_cyclone5.dts => socfpga_cyclone5.dtsi} (78%)
>  create mode 100644 arch/arm/boot/dts/socfpga_cyclone5_socdk.dts
>  create mode 100644 arch/arm/boot/dts/socfpga_cyclone5_sockit.dts
> 



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
