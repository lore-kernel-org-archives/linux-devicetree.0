From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 5/6] arm64: dts: ls1043a: update gic dts node
Date: Wed, 26 Oct 2016 11:35:31 +0100
Message-ID: <20161026103516.GE19965@leverpostej>
References: <1477398945-22774-1-git-send-email-Minghuan.Lian@nxp.com>
 <1477398945-22774-5-git-send-email-Minghuan.Lian@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1477398945-22774-5-git-send-email-Minghuan.Lian@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Minghuan Lian <Minghuan.Lian@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Stuart Yoder <stuart.yoder@nxp.com>, Yang-Leo Li <leoyang.li@nxp.com>, Gong Qianyu <Qianyu.Gong@nxp.com>, Scott Wood <scott.wood@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 25, 2016 at 08:35:44PM +0800, Minghuan Lian wrote:
> From: Gong Qianyu <Qianyu.Gong@nxp.com>
> 
> In order to support kvm, rev1.1 LS1043a GIC register has been
> changed to align as 64K. The patch updates GIC node according to
> the rev1.1 hardware.
> 
> Signed-off-by: Gong Qianyu <Qianyu.Gong@nxp.com>
> Signed-off-by: Minghuan Lian <Minghuan.Lian@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
> index 5295bb9..da1809d 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
> @@ -144,10 +144,10 @@
>  		compatible = "arm,gic-400";
>  		#interrupt-cells = <3>;
>  		interrupt-controller;
> -		reg = <0x0 0x1401000 0 0x1000>, /* GICD */
> -		      <0x0 0x1402000 0 0x2000>, /* GICC */
> -		      <0x0 0x1404000 0 0x2000>, /* GICH */
> -		      <0x0 0x1406000 0 0x2000>; /* GICV */
> +		reg = <0x0 0x1410000 0 0x10000>, /* GICD */
> +		      <0x0 0x1420000 0 0x20000>, /* GICC */
> +		      <0x0 0x1440000 0 0x20000>, /* GICH */
> +		      <0x0 0x1460000 0 0x20000>; /* GICV */

... this breaks HW prior to rev1.1, then.

Thanks,
Mark.
