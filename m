From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/3] ARM: dts: Add big-endian for IFC on LS1021A
Date: Mon, 27 Aug 2018 15:24:55 +0800
Message-ID: <20180827072452.GH3850@dragon>
References: <20180817101920.20503-1-prabhakar.kushwaha@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180817101920.20503-1-prabhakar.kushwaha@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>, Li Yang <leoyang.li@nxp.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, robh@kernel.org, Alison Wang <alison.wang@nxp.com>, Jagdish Gediya <jagdish.gediya@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 17, 2018 at 03:49:18PM +0530, Prabhakar Kushwaha wrote:

Please resend the series with Li Yang <leoyang.li@nxp.com> on copy.

Shawn

> Register space of IFC controller is big-endian.
> 
> So add big-endian in IFC device tree node.
> 
> Signed-off-by: Alison Wang <alison.wang@nxp.com>
> Signed-off-by: Jagdish Gediya <jagdish.gediya@nxp.com>
> Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> ---
>  arch/arm/boot/dts/ls1021a.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
> index f18490548c78..1f9cae75bad3 100644
> --- a/arch/arm/boot/dts/ls1021a.dtsi
> +++ b/arch/arm/boot/dts/ls1021a.dtsi
> @@ -1,5 +1,6 @@
>  /*
>   * Copyright 2013-2014 Freescale Semiconductor, Inc.
> + * Copyright 2018 NXP
>   *
>   * This file is dual-licensed: you can use it either under the terms
>   * of the GPL or the X11 license, at your option. Note that this dual
> @@ -154,6 +155,7 @@
>  		ifc: ifc@1530000 {
>  			compatible = "fsl,ifc", "simple-bus";
>  			reg = <0x0 0x1530000 0x0 0x10000>;
> +			big-endian;
>  			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> -- 
> 2.14.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
