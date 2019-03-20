From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: pfla02: increase phy reset duration
Date: Wed, 20 Mar 2019 16:59:38 +0800
Message-ID: <20190320085937.GG4980@dragon>
References: <20190304104940.18138-1-m.felsch@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190304104940.18138-1-m.felsch@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, Christian Hemp <c.hemp@phytec.de>, Stefan Christ <s.christ@phytec.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 04, 2019 at 11:49:40AM +0100, Marco Felsch wrote:
> Increase the reset duration to ensure correct phy functionality. The
> reset duration is taken from barebox commit 52fdd510de ("ARM: dts:
> pfla02: use long enough reset for ethernet phy"):
> 
>   Use a longer reset time for ethernet phy Micrel KSZ9031RNX. Otherwise a
>   small percentage of modules have 'transmission timeouts' errors like
> 
>   barebox@Phytec phyFLEX-i.MX6 Quad Carrier-Board:/ ifup eth0
>   warning: No MAC address set. Using random address 7e:94:4d:02:f8:f3
>   eth0: 1000Mbps full duplex link detected
>   eth0: transmission timeout
>   T eth0: transmission timeout
>   T eth0: transmission timeout
>   T eth0: transmission timeout
>   T eth0: transmission timeout
> 
> Cc: Stefan Christ <s.christ@phytec.de>
> Cc: Christian Hemp <c.hemp@phytec.de>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Do you want to get this in as a fix or just -next material?  If it's a
fix, please have a Fixes tag.

Shawn

> ---
>  arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi b/arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi
> index 673711f445b6..7e53ac6cfa8a 100644
> --- a/arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi
> @@ -91,6 +91,7 @@
>  	pinctrl-0 = <&pinctrl_enet>;
>  	phy-handle = <&ethphy>;
>  	phy-mode = "rgmii";
> +	phy-reset-duration = <10>; /* in msecs */
>  	phy-reset-gpios = <&gpio3 23 GPIO_ACTIVE_LOW>;
>  	phy-supply = <&vdd_eth_io_reg>;
>  	status = "disabled";
> -- 
> 2.20.1
> 
