From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: ls1028a: fix a compatible issue
Date: Sat, 14 Sep 2019 10:42:32 +0800
Message-ID: <20190914024231.GB3425@dragon>
References: <20190829073439.13069-1-andy.tang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190829073439.13069-1-andy.tang@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Yuantian Tang <andy.tang@nxp.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, leoyang.li@nxp.com
List-Id: devicetree@vger.kernel.org

On Thu, Aug 29, 2019 at 03:34:39PM +0800, Yuantian Tang wrote:
> The I2C multiplexer used on ls1028aqds is PCA9547, not PCA9847.
> So correct it.

Can elaborate the fix a little bit, saying what's the issue exactly 
with using that incorrect compatible?

> 
> Signed-off-by: Yuantian Tang <andy.tang@nxp.com>

Do we need a fix tag?

Shawn

> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> index 5e14e5a19744..f5da9e8b0d9d 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
> @@ -107,7 +107,7 @@
>  	status = "okay";
>  
>  	i2c-mux@77 {
> -		compatible = "nxp,pca9847";
> +		compatible = "nxp,pca9547";
>  		reg = <0x77>;
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> -- 
> 2.17.1
> 
