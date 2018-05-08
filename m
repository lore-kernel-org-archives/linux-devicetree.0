From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] arm: dts: imx: fix IPU OF graph endpoint node names
Date: Tue, 08 May 2018 16:19:18 +0200
Message-ID: <1525789158.18091.7.camel@pengutronix.de>
References: <20180508135930.5768-1-robh@kernel.org>
 <20180508135930.5768-2-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180508135930.5768-2-robh@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Joshua Clayton <stillcompiling@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Tue, 2018-05-08 at 08:59 -0500, Rob Herring wrote:
> OF graph endpoint nodes are supposed to be named 'endpoint' with an
> address if there is more than one. The i.MX IPU binding graph has used
> unique endpoint names instead which now generate dtc warnings:

This partially reverts commit 416196cd9099 ("ARM: dts: imx6: fix dtc
warnings for ipu endpoints") and also solves the same issue differently
by adding reg properties. Should this get a Fixes: tag for these
changes?

regards
Philipp

> Warning (graph_endpoint): /soc/ipu@2400000/port@2/disp0-endpoint: graph endpont node name should be 'endpoint'
> Warning (graph_endpoint): /soc/ipu@2400000/port@2/hdmi-endpoint: graph endpont node name should be 'endpoint'
> Warning (graph_endpoint): /soc/ipu@2400000/port@2/mipi-endpoint: graph endpont node name should be 'endpoint'
> Warning (graph_endpoint): /soc/ipu@2400000/port@2/lvds0-endpoint: graph endpont node name should be 'endpoint'
> Warning (graph_endpoint): /soc/ipu@2400000/port@2/lvds1-endpoint: graph endpont node name should be 'endpoint'
> Warning (graph_endpoint): /soc/ipu@2400000/port@3/disp1-endpoint: graph endpont node name should be 'endpoint'
> Warning (graph_endpoint): /soc/ipu@2400000/port@3/hdmi-endpoint: graph endpont node name should be 'endpoint'
> Warning (graph_endpoint): /soc/ipu@2400000/port@3/mipi-endpoint: graph endpont node name should be 'endpoint'
> Warning (graph_endpoint): /soc/ipu@2400000/port@3/lvds0-endpoint: graph endpont node name should be 'endpoint'
> Warning (graph_endpoint): /soc/ipu@2400000/port@3/lvds1-endpoint: graph endpont node name should be 'endpoint'
> Warning (graph_endpoint): /soc/ipu@2800000/port@2/disp0-endpoint: graph endpont node name should be 'endpoint'
> Warning (graph_endpoint): /soc/ipu@2800000/port@2/hdmi-endpoint: graph endpont node name should be 'endpoint'
> Warning (graph_endpoint): /soc/ipu@2800000/port@2/mipi-endpoint: graph endpont node name should be 'endpoint'
> Warning (graph_endpoint): /soc/ipu@2800000/port@2/lvds0-endpoint: graph endpont node name should be 'endpoint'
> Warning (graph_endpoint): /soc/ipu@2800000/port@2/lvds1-endpoint: graph endpont node name should be 'endpoint'
> Warning (graph_endpoint): /soc/ipu@2800000/port@3/hdmi-endpoint: graph endpont node name should be 'endpoint'
> Warning (graph_endpoint): /soc/ipu@2800000/port@3/mipi-endpoint: graph endpont node name should be 'endpoint'
> Warning (graph_endpoint): /soc/ipu@2800000/port@3/lvds0-endpoint: graph endpont node name should be 'endpoint'
> Warning (graph_endpoint): /soc/ipu@2800000/port@3/lvds1-endpoint: graph endpont node name should be 'endpoint'
> 
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  arch/arm/boot/dts/imx6q.dtsi             | 27 ++++++++++++++-------
>  arch/arm/boot/dts/imx6qdl-sabrelite.dtsi |  3 ---
>  arch/arm/boot/dts/imx6qdl-sabresd.dtsi   |  3 ---
>  arch/arm/boot/dts/imx6qdl.dtsi           | 30 ++++++++++++++++--------
>  4 files changed, 38 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
> index ae7b3f107893..c2fda9d21a17 100644
> --- a/arch/arm/boot/dts/imx6q.dtsi
> +++ b/arch/arm/boot/dts/imx6q.dtsi
> @@ -162,22 +162,27 @@
>  				#size-cells = <0>;
>  				reg = <2>;
>  
> -				ipu2_di0_disp0: disp0-endpoint {
> +				ipu2_di0_disp0: endpoint@0 {
> +					reg = <0>;
>  				};
>  
> -				ipu2_di0_hdmi: hdmi-endpoint {
> +				ipu2_di0_hdmi: endpoint@1 {
> +					reg = <1>;
>  					remote-endpoint = <&hdmi_mux_2>;
>  				};
>  
> -				ipu2_di0_mipi: mipi-endpoint {
> +				ipu2_di0_mipi: endpoint@2 {
> +					reg = <2>;
>  					remote-endpoint = <&mipi_mux_2>;
>  				};
>  
> -				ipu2_di0_lvds0: lvds0-endpoint {
> +				ipu2_di0_lvds0: endpoint@3 {
> +					reg = <3>;
>  					remote-endpoint = <&lvds0_mux_2>;
>  				};
>  
> -				ipu2_di0_lvds1: lvds1-endpoint {
> +				ipu2_di0_lvds1: endpoint@4 {
> +					reg = <4>;
>  					remote-endpoint = <&lvds1_mux_2>;
>  				};
>  			};
> @@ -187,19 +192,23 @@
>  				#size-cells = <0>;
>  				reg = <3>;
>  
> -				ipu2_di1_hdmi: hdmi-endpoint {
> +				ipu2_di1_hdmi: endpoint@1 {
> +					reg = <1>;
>  					remote-endpoint = <&hdmi_mux_3>;
>  				};
>  
> -				ipu2_di1_mipi: mipi-endpoint {
> +				ipu2_di1_mipi: endpoint@2 {
> +					reg = <2>;
>  					remote-endpoint = <&mipi_mux_3>;
>  				};
>  
> -				ipu2_di1_lvds0: lvds0-endpoint {
> +				ipu2_di1_lvds0: endpoint@3 {
> +					reg = <3>;
>  					remote-endpoint = <&lvds0_mux_3>;
>  				};
>  
> -				ipu2_di1_lvds1: lvds1-endpoint {
> +				ipu2_di1_lvds1: endpoint@4 {
> +					reg = <4>;
>  					remote-endpoint = <&lvds1_mux_3>;
>  				};
>  			};
> diff --git a/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi b/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
> index 18b65052553d..654cf2c9b073 100644
> --- a/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
> @@ -379,9 +379,6 @@
>  		powerdown-gpios = <&gpio6 9 GPIO_ACTIVE_HIGH>; /* NANDF_WP_B */
>  
>  		port {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
>  			ov5640_to_mipi_csi2: endpoint {
>  				remote-endpoint = <&mipi_csi2_in>;
>  				clock-lanes = <0>;
> diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> index f019f9900369..c2de2250718c 100644
> --- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
> @@ -294,9 +294,6 @@
>  		reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
>  
>  		port {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
>  			ov5640_to_mipi_csi2: endpoint {
>  				remote-endpoint = <&mipi_csi2_in>;
>  				clock-lanes = <0>;
> diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
> index c003e62bf290..0ebcf057961e 100644
> --- a/arch/arm/boot/dts/imx6qdl.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl.dtsi
> @@ -1300,22 +1300,27 @@
>  				#size-cells = <0>;
>  				reg = <2>;
>  
> -				ipu1_di0_disp0: disp0-endpoint {
> +				ipu1_di0_disp0: endpoint@0 {
> +					reg = <0>;
>  				};
>  
> -				ipu1_di0_hdmi: hdmi-endpoint {
> +				ipu1_di0_hdmi: endpoint@1 {
> +					reg = <1>;
>  					remote-endpoint = <&hdmi_mux_0>;
>  				};
>  
> -				ipu1_di0_mipi: mipi-endpoint {
> +				ipu1_di0_mipi: endpoint@2 {
> +					reg = <2>;
>  					remote-endpoint = <&mipi_mux_0>;
>  				};
>  
> -				ipu1_di0_lvds0: lvds0-endpoint {
> +				ipu1_di0_lvds0: endpoint@3 {
> +					reg = <3>;
>  					remote-endpoint = <&lvds0_mux_0>;
>  				};
>  
> -				ipu1_di0_lvds1: lvds1-endpoint {
> +				ipu1_di0_lvds1: endpoint@4 {
> +					reg = <4>;
>  					remote-endpoint = <&lvds1_mux_0>;
>  				};
>  			};
> @@ -1325,22 +1330,27 @@
>  				#size-cells = <0>;
>  				reg = <3>;
>  
> -				ipu1_di1_disp1: disp1-endpoint {
> +				ipu1_di1_disp1: endpoint@0 {
> +					reg = <0>;
>  				};
>  
> -				ipu1_di1_hdmi: hdmi-endpoint {
> +				ipu1_di1_hdmi: endpoint@1 {
> +					reg = <1>;
>  					remote-endpoint = <&hdmi_mux_1>;
>  				};
>  
> -				ipu1_di1_mipi: mipi-endpoint {
> +				ipu1_di1_mipi: endpoint@2 {
> +					reg = <2>;
>  					remote-endpoint = <&mipi_mux_1>;
>  				};
>  
> -				ipu1_di1_lvds0: lvds0-endpoint {
> +				ipu1_di1_lvds0: endpoint@3 {
> +					reg = <3>;
>  					remote-endpoint = <&lvds0_mux_1>;
>  				};
>  
> -				ipu1_di1_lvds1: lvds1-endpoint {
> +				ipu1_di1_lvds1: endpoint@4 {
> +					reg = <4>;
>  					remote-endpoint = <&lvds1_mux_1>;
>  				};
>  			};
