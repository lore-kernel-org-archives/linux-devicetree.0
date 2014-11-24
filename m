From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 3/4] powerpc/mpc85xx: Add FSL QorIQ DPAA BMan support
 to device tree(s)
Date: Mon, 24 Nov 2014 17:45:36 -0600
Message-ID: <1416872736.15957.158.camel@freescale.com>
References: <1416827243-16396-1-git-send-email-Emilian.Medve@Freescale.com>
	 <1416827243-16396-4-git-send-email-Emilian.Medve@Freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416827243-16396-4-git-send-email-Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Geoff Thorpe <Geoff.Thorpe-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>, Hai-Ying Wang <Haiying.Wang-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>, Chunhe Lan <Chunhe.Lan-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>, Poonam Aggrwal <poonam.aggrwal-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2014-11-24 at 05:07 -0600, Emil Medve wrote:
> From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> 
> Change-Id: If643fa5ba0a903aef8f5056a2c90ebecc995b760
> Signed-off-by: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> Signed-off-by: Geoff Thorpe <Geoff.Thorpe-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Signed-off-by: Hai-Ying Wang <Haiying.Wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Signed-off-by: Chunhe Lan <Chunhe.Lan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Signed-off-by: Poonam Aggrwal <poonam.aggrwal-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> [Emil Medve: Sync with the upstream binding]
> Signed-off-by: Emil Medve <Emilian.Medve-eDlz3WWmN0ll57MIdRCFDg@public.gmane.org>
> ---
>  arch/powerpc/boot/dts/b4qds.dtsi            |  20 ++-
>  arch/powerpc/boot/dts/fsl/b4860si-post.dtsi |  60 ++++++-
>  arch/powerpc/boot/dts/fsl/b4si-post.dtsi    |  84 ++++++++-
>  arch/powerpc/boot/dts/fsl/p1023si-post.dtsi |  30 +++-
>  arch/powerpc/boot/dts/fsl/p2041si-post.dtsi |   6 +-
>  arch/powerpc/boot/dts/fsl/p3041si-post.dtsi |   6 +-
>  arch/powerpc/boot/dts/fsl/p4080si-post.dtsi |   6 +-
>  arch/powerpc/boot/dts/fsl/p5020si-post.dtsi |   6 +-
>  arch/powerpc/boot/dts/fsl/p5040si-post.dtsi |   6 +-
>  arch/powerpc/boot/dts/fsl/t1040si-post.dtsi |  60 ++++++-
>  arch/powerpc/boot/dts/fsl/t2081si-post.dtsi | 100 ++++++++++-
>  arch/powerpc/boot/dts/fsl/t4240si-post.dtsi | 260 +++++++++++++++++++++++++++-
>  arch/powerpc/boot/dts/kmcoge4.dts           |  18 ++
>  arch/powerpc/boot/dts/oca4080.dts           |  18 ++
>  arch/powerpc/boot/dts/p1023rdb.dts          |  21 ++-
>  arch/powerpc/boot/dts/p2041rdb.dts          |  20 ++-
>  arch/powerpc/boot/dts/p3041ds.dts           |  20 ++-
>  arch/powerpc/boot/dts/p4080ds.dts           |  20 ++-
>  arch/powerpc/boot/dts/p5020ds.dts           |  20 ++-
>  arch/powerpc/boot/dts/p5040ds.dts           |  20 ++-
>  arch/powerpc/boot/dts/t104xqds.dtsi         |  20 ++-
>  arch/powerpc/boot/dts/t104xrdb.dtsi         |  18 ++
>  arch/powerpc/boot/dts/t208xqds.dtsi         |  20 ++-
>  arch/powerpc/boot/dts/t208xrdb.dtsi         |  18 ++
>  arch/powerpc/boot/dts/t4240qds.dts          |  20 ++-
>  arch/powerpc/boot/dts/t4240rdb.dts          |  18 ++
>  26 files changed, 893 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/powerpc/boot/dts/b4qds.dtsi b/arch/powerpc/boot/dts/b4qds.dtsi
> index 6188583..3a73103 100644
> --- a/arch/powerpc/boot/dts/b4qds.dtsi
> +++ b/arch/powerpc/boot/dts/b4qds.dtsi
> @@ -1,7 +1,7 @@
>  /*
>   * B4420DS Device Tree Source
>   *
> - * Copyright 2012 Freescale Semiconductor, Inc.
> + * Copyright 2012 - 2014 Freescale Semiconductor, Inc.
>   *
>   * Redistribution and use in source and binary forms, with or without
>   * modification, are permitted provided that the following conditions are met:
> @@ -104,10 +104,28 @@
>  		device_type = "memory";
>  	};
>  
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		bman_fbpr: bman-fbpr {
> +			compatible = "fsl,bman-fbpr";
> +			alloc-ranges = <0 0 0xffff 0xffffffff>;
> +			size = <0 0x1000000>;
> +			alignment = <0 0x1000000>;
> +			no-map;
> +		};

Again, I don't think this should have no-map.  It's not required by the
hardware, it doesn't perform as advertised on PPC and would be
burdensome to support on e500, we don't currently create a separate
coherence domain for it, and you haven't indicated that there's been any
benchmarks to show that using a separate coherence domain is beneficial.

Is there a reason why these reserved-memory nodes need to be repeated in
each board dts rather than being in a dtsi?

-Scott


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
