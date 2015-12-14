From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] ARM64: ZynqMP: DT: Fix GIC's 'reg' property
Date: Mon, 14 Dec 2015 16:46:14 +0000
Message-ID: <20151214164613.GH21356@leverpostej>
References: <1450110700-14152-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1450110700-14152-1-git-send-email-soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, marc.zyngier-5wv7dgnIgG8@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alistair Francis <alistair.francis-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 14, 2015 at 08:31:40AM -0800, Soren Brinkmann wrote:
> Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> index 857eda5c7217..b5d1facadf16 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
> @@ -80,10 +80,10 @@
>  		gic: interrupt-controller@f9010000 {
>  			compatible = "arm,gic-400", "arm,cortex-a15-gic";
>  			#interrupt-cells = <3>;
> -			reg = <0x0 0xf9010000 0x10000>,
> -			      <0x0 0xf902f000 0x2000>,
> +			reg = <0x0 0xf9010000 0x1000>,
> +			      <0x0 0xf9020000 0x20000>,
>  			      <0x0 0xf9040000 0x20000>,
> -			      <0x0 0xf906f000 0x2000>;
> +			      <0x0 0xf9060000 0x20000>;

I'm confused. These sizes don't look right for GIC-400. Is this a custom
GIC?

Did this ever work wit hteh old offsets and sizes?

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
