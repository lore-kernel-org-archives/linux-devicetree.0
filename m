From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: fsl: ls1046: Modify the qspi flash frequency
Date: Thu, 23 May 2019 20:48:06 +0800
Message-ID: <20190523124806.GU9261@dragon>
References: <20190521150336.8409-1-pankaj.bansal@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190521150336.8409-1-pankaj.bansal@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Pankaj Bansal <pankaj.bansal@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rajesh Bhagat <rajesh.bhagat@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mingkai Hu <mingkai.hu@nxp.com>, Leo Li <leoyang.li@nxp.com>
List-Id: devicetree@vger.kernel.org

On Tue, May 21, 2019 at 09:40:09AM +0000, Pankaj Bansal wrote:
> The qspi flash in ls1046a based QDS and RDB boards can operate
> at 50MHz frequency.
> Therefore, update the maximum supported freq in their respective
> dts files.
> 
> Signed-off-by: Pankaj Bansal <pankaj.bansal@nxp.com>

Do not use base64 encoding for patch posting.

Shawn

> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts | 4 ++--
>  arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts | 5 +++--
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
> index eec62c63dafe..e441dbfbfb81 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts
> @@ -3,7 +3,7 @@
>   * Device Tree Include file for Freescale Layerscape-1046A family SoC.
>   *
>   * Copyright 2016 Freescale Semiconductor, Inc.
> - * Copyright 2018 NXP
> + * Copyright 2018-2019 NXP
>   *
>   * Shaohui Xie <Shaohui.Xie@nxp.com>
>   */
> @@ -169,7 +169,7 @@
>  		compatible = "spansion,m25p80";
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> -		spi-max-frequency = <20000000>;
> +		spi-max-frequency = <50000000>;
>  		spi-rx-bus-width = <4>;
>  		spi-tx-bus-width = <4>;
>  		reg = <0>;
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
> index 6a6514d0e5a9..6f5411d09bb9 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
> @@ -3,6 +3,7 @@
>   * Device Tree Include file for Freescale Layerscape-1046A family SoC.
>   *
>   * Copyright 2016 Freescale Semiconductor, Inc.
> + * Copyright 2019 NXP
>   *
>   * Mingkai Hu <mingkai.hu@nxp.com>
>   */
> @@ -105,7 +106,7 @@
>  		compatible = "spansion,m25p80";
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> -		spi-max-frequency = <20000000>;
> +		spi-max-frequency = <50000000>;
>  		spi-rx-bus-width = <4>;
>  		spi-tx-bus-width = <4>;
>  		reg = <0>;
> @@ -115,7 +116,7 @@
>  		compatible = "spansion,m25p80";
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> -		spi-max-frequency = <20000000>;
> +		spi-max-frequency = <50000000>;
>  		spi-rx-bus-width = <4>;
>  		spi-tx-bus-width = <4>;
>  		reg = <1>;
> -- 
> 2.17.1
> 
