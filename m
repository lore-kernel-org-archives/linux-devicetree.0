From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH] ARM: dts: imx6qdl-sr-som: fix AR8035 phy interface mode
Date: Wed, 19 Jun 2019 23:37:27 +0100
Message-ID: <20190619223727.zgfypqxg7bpxtduh@shell.armlinux.org.uk>
References: <E1hdjBO-0007Yt-9M@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <E1hdjBO-0007Yt-9M@rmk-PC.armlinux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 19, 2019 at 11:35:58PM +0100, Russell King wrote:
> A change to the AT803x driver fixed the handling of the phy interface
> mode, but this breaks all platforms that use "rgmii" as the mode in
> their DT.  Fix the Solidrun platforms.
> 
> Fixes: 6d4cd041f0af ("net: phy: at803x: disable delay only for RGMII mode")
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Note that without this, SolidRun Hummingboard and Cubox-i platforms
have no working ethernet with at least 5.1 kernels, which is a
regression.

> ---
>  arch/arm/boot/dts/imx6qdl-sr-som.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/imx6qdl-sr-som.dtsi b/arch/arm/boot/dts/imx6qdl-sr-som.dtsi
> index 4ccb7afc4b35..6d7f6b9035bc 100644
> --- a/arch/arm/boot/dts/imx6qdl-sr-som.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-sr-som.dtsi
> @@ -53,7 +53,7 @@
>  &fec {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_microsom_enet_ar8035>;
> -	phy-mode = "rgmii";
> +	phy-mode = "rgmii-id";
>  	phy-reset-duration = <2>;
>  	phy-reset-gpios = <&gpio4 15 GPIO_ACTIVE_LOW>;
>  	status = "okay";
> -- 
> 2.7.4
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
