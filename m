From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mq: fix SAI compatible
Date: Tue, 23 Jul 2019 15:33:43 +0800
Message-ID: <20190723073342.GG15632@dragon>
References: <20190717095436.28154-1-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190717095436.28154-1-l.stach@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lucas Stach <l.stach@pengutronix.de>, Daniel Baluta <daniel.baluta@nxp.com>
Cc: devicetree@vger.kernel.org, patchwork-lst@pengutronix.de, NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add Daniel for comment.

On Wed, Jul 17, 2019 at 11:54:36AM +0200, Lucas Stach wrote:
> The i.MX8M SAI block is not compatible with the i.MX6SX one, as the
> register layout has changed due to two version registers being added
> at the beginning of the address map. Remove the bogus compatible.
> 
> Fixes: 8c61538dc945 "arm64: dts: imx8mq: Add SAI2 node"

The format should be the following.  I can fix it when applying though.

Fixes: 8c61538dc945 ("arm64: dts: imx8mq: Add SAI2 node")

Shawn

> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> index 9326bd4150a3..0c533c66b340 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -718,8 +718,7 @@
>  
>  			sai2: sai@308b0000 {
>  				#sound-dai-cells = <0>;
> -				compatible = "fsl,imx8mq-sai",
> -					     "fsl,imx6sx-sai";
> +				compatible = "fsl,imx8mq-sai";
>  				reg = <0x308b0000 0x10000>;
>  				interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks = <&clk IMX8MQ_CLK_SAI2_IPG>,
> -- 
> 2.20.1
> 
