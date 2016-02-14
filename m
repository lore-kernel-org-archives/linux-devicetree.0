From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: ls2080a: Add quirk for Erratum A009116
Date: Sun, 14 Feb 2016 16:47:14 +0800
Message-ID: <20160214084714.GS6756@tiger>
References: <1455059287-2500-1-git-send-email-Lijun.Pan@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1455059287-2500-1-git-send-email-Lijun.Pan@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lijun Pan <Lijun.Pan@freescale.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, rajesh.bhagat@freescale.com
List-Id: devicetree@vger.kernel.org

On Tue, Feb 09, 2016 at 05:08:07PM -0600, Lijun Pan wrote:
> Add "snps,quirk-frame-length-adjustment" property to
> USB3 node for erratum A009116. This property provides
> value of GFLADJ_30MHZ for post silicon frame length
> adjustment.
> 
> Signed-off-by: Lijun Pan <Lijun.Pan@freescale.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi |    2 ++
>  1 file changed, 2 insertions(+)

Forgot to mention that arm64 patches use a different subject prefix from
ARM ones.  I changed the patch subject to "arm64: dts: ..." when
applying.

Shawn

> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> index 6e9e033..fa506f5 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> @@ -501,6 +501,7 @@
>  			reg = <0x0 0x3100000 0x0 0x10000>;
>  			interrupts = <0 80 0x4>; /* Level high type */
>  			dr_mode = "host";
> +			snps,quirk-frame-length-adjustment = <0x20>;
>  		};
>  
>  		usb1: usb3@3110000 {
> @@ -509,6 +510,7 @@
>  			reg = <0x0 0x3110000 0x0 0x10000>;
>  			interrupts = <0 81 0x4>; /* Level high type */
>  			dr_mode = "host";
> +			snps,quirk-frame-length-adjustment = <0x20>;
>  		};
>  
>  		ccn@4000000 {
> -- 
> 1.7.9.5
> 
> 
