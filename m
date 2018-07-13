From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH V2] ARM: dts: make pfuze switch always-on for imx platforms
Date: Fri, 13 Jul 2018 02:16:55 +0000
Message-ID: <AM3PR04MB1315B66212D928D7EAF27557F5580@AM3PR04MB1315.eurprd04.prod.outlook.com>
References: <1530063055-25914-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1530063055-25914-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi, Shawn
	Although the commit 5fe156f1cab4 ("regulator: pfuze100: add enable/disable for switch") is reverted to avoid the boot failure on some i.MX platforms, but adding the "regulator-always-on" property for those pfuze's critical switches are the right way and making sense, no matter how the pfuze regulator's switch ON/OFF function will be implemented, below patches should can be applied anyway?

ARM: dts: imx6sll-evk: make pfuze100 sw4 always on
ARM: dts: make pfuze switch always-on for imx platforms
ARM: dts: imx6sl-evk: keep sw4 always on

	Let me know your thoughts, thanks!

Anson Huang
Best Regards!


> -----Original Message-----
> From: Anson Huang
> Sent: Wednesday, June 27, 2018 9:31 AM
> To: shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> Fabio Estevam <fabio.estevam@nxp.com>; robh+dt@kernel.org;
> mark.rutland@arm.com
> Cc: dl-linux-imx <linux-imx@nxp.com>; linux-arm-kernel@lists.infradead.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH V2] ARM: dts: make pfuze switch always-on for imx platforms
> 
> commit 5fe156f1cab4 ("regulator: pfuze100: add enable/disable for switch")
> will cause those unreferenced switches being turned off if
> "regulator-always-on" is NOT present, as pfuze switches are normally used by
> critical modules which must be always ON or shared by many peripherals which
> do NOT implement power domain control, so just make sure all switches
> always ON to avoid any system issue caused by unexpectedly turning off
> switches.
> 
> Fixes: 5fe156f1cab4 ("regulator: pfuze100: add enable/disable for switch")
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
> changes since V1:
> 	improve the way of referencing commit, and add fix tag.
>  arch/arm/boot/dts/imx6q-display5.dtsi  | 1 +
>  arch/arm/boot/dts/imx6q-mccmon6.dts    | 1 +
>  arch/arm/boot/dts/imx6q-novena.dts     | 1 +
>  arch/arm/boot/dts/imx6q-pistachio.dts  | 1 +
> arch/arm/boot/dts/imx6qdl-gw54xx.dtsi  | 1 +
> arch/arm/boot/dts/imx6qdl-sabresd.dtsi | 1 +
> arch/arm/boot/dts/imx6sx-sdb-reva.dts  | 1 +
>  7 files changed, 7 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6q-display5.dtsi
> b/arch/arm/boot/dts/imx6q-display5.dtsi
> index 85232c7..33d266f 100644
> --- a/arch/arm/boot/dts/imx6q-display5.dtsi
> +++ b/arch/arm/boot/dts/imx6q-display5.dtsi
> @@ -326,6 +326,7 @@
>  			sw4_reg: sw4 {
>  				regulator-min-microvolt = <800000>;
>  				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
>  			};
> 
>  			swbst_reg: swbst {
> diff --git a/arch/arm/boot/dts/imx6q-mccmon6.dts
> b/arch/arm/boot/dts/imx6q-mccmon6.dts
> index b7e9f38..e6429c5 100644
> --- a/arch/arm/boot/dts/imx6q-mccmon6.dts
> +++ b/arch/arm/boot/dts/imx6q-mccmon6.dts
> @@ -166,6 +166,7 @@
>  			sw4_reg: sw4 {
>  				regulator-min-microvolt = <800000>;
>  				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
>  			};
> 
>  			swbst_reg: swbst {
> diff --git a/arch/arm/boot/dts/imx6q-novena.dts
> b/arch/arm/boot/dts/imx6q-novena.dts
> index fcd824d..0b3c651 100644
> --- a/arch/arm/boot/dts/imx6q-novena.dts
> +++ b/arch/arm/boot/dts/imx6q-novena.dts
> @@ -341,6 +341,7 @@
>  			reg_sw4: sw4 {
>  				regulator-min-microvolt = <800000>;
>  				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
>  			};
> 
>  			reg_swbst: swbst {
> diff --git a/arch/arm/boot/dts/imx6q-pistachio.dts
> b/arch/arm/boot/dts/imx6q-pistachio.dts
> index a31e83c..6ea09f9 100644
> --- a/arch/arm/boot/dts/imx6q-pistachio.dts
> +++ b/arch/arm/boot/dts/imx6q-pistachio.dts
> @@ -253,6 +253,7 @@
>  			sw4_reg: sw4 {
>  				regulator-min-microvolt = <800000>;
>  				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
>  			};
> 
>  			swbst_reg: swbst {
> diff --git a/arch/arm/boot/dts/imx6qdl-gw54xx.dtsi
> b/arch/arm/boot/dts/imx6qdl-gw54xx.dtsi
> index a1a6fb5..281cae5 100644
> --- a/arch/arm/boot/dts/imx6qdl-gw54xx.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-gw54xx.dtsi
> @@ -268,6 +268,7 @@
>  			sw4_reg: sw4 {
>  				regulator-min-microvolt = <800000>;
>  				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
>  			};
> 
>  			swbst_reg: swbst {
> diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> index 15744ad..6e46a19 100644
> --- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> @@ -341,6 +341,7 @@
>  			sw4_reg: sw4 {
>  				regulator-min-microvolt = <800000>;
>  				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
>  			};
> 
>  			swbst_reg: swbst {
> diff --git a/arch/arm/boot/dts/imx6sx-sdb-reva.dts
> b/arch/arm/boot/dts/imx6sx-sdb-reva.dts
> index e3533e7..9cc6ff2 100644
> --- a/arch/arm/boot/dts/imx6sx-sdb-reva.dts
> +++ b/arch/arm/boot/dts/imx6sx-sdb-reva.dts
> @@ -63,6 +63,7 @@
>  			sw4_reg: sw4 {
>  				regulator-min-microvolt = <800000>;
>  				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
>  			};
> 
>  			swbst_reg: swbst {
> --
> 2.7.4
