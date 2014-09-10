From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [PATCH] ARM: DT: imx53: fix lvds channel 1 port
Date: Wed, 10 Sep 2014 09:28:32 +0800
Message-ID: <20140910012831.GB2341@dragon>
References: <1409848985-16140-1-git-send-email-list-09_linux_arm@tqsc.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1409848985-16140-1-git-send-email-list-09_linux_arm@tqsc.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Markus Niebel <list-09_linux_arm@tqsc.de>, p.zabel@pengutronix.de
Cc: devicetree@vger.kernel.org, festevam@gmail.com, Markus Niebel <Markus.Niebel@tq-group.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Sep 04, 2014 at 06:43:05PM +0200, Markus Niebel wrote:
> From: Markus Niebel <Markus.Niebel@tq-group.com>
> 
> using LVDS channel 1 on an i.MX53 leads to following error:
> 
> imx-ldb 53fa8008.ldb: unable to set di0 parent clock to ldb_di1
> 
> This comes from imx_ldb_set_clock with mux = 0. Mux parameter must be "1" for
> reparenting di1 clock to ldb_di1. The value of the mux param comes from device
> tree port settings.
> 
> On i.MX5, the internal two-input-multiplexer is used. Due to hardware limitations,
> only one port (port@[0,1]) can be used for each channel (lvds-channel@[0,1],
> respectively)
> 
> Documentation update suggested by Philipp Zabel <p.zabel@pengutronix.de>
> 
> Signed-off-by: Markus Niebel <Markus.Niebel@tq-group.com>

Philipp,

Does the patch look good to you?  I feel more comfortable to send it as
a fix and stable material only with your ACK at this stage.

Shawn

> ---
>  Documentation/devicetree/bindings/staging/imx-drm/ldb.txt | 15 +++++++++++++--
>  arch/arm/boot/dts/imx53.dtsi                              | 12 ++++++++++--
>  2 files changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/staging/imx-drm/ldb.txt b/Documentation/devicetree/bindings/staging/imx-drm/ldb.txt
> index 578a1fc..443bcb6 100644
> --- a/Documentation/devicetree/bindings/staging/imx-drm/ldb.txt
> +++ b/Documentation/devicetree/bindings/staging/imx-drm/ldb.txt
> @@ -56,6 +56,9 @@ Required properties:
>   - fsl,data-width : should be <18> or <24>
>   - port: A port node with endpoint definitions as defined in
>     Documentation/devicetree/bindings/media/video-interfaces.txt.
> +   On i.MX5, the internal two-input-multiplexer is used.
> +   Due to hardware limitations, only one port (port@[0,1])
> +   can be used for each channel (lvds-channel@[0,1], respectively)
>     On i.MX6, there should be four ports (port@[0-3]) that correspond
>     to the four LVDS multiplexer inputs.
>  
> @@ -78,6 +81,8 @@ ldb: ldb@53fa8008 {
>  		      "di0", "di1";
>  
>  	lvds-channel@0 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
>  		reg = <0>;
>  		fsl,data-mapping = "spwg";
>  		fsl,data-width = <24>;
> @@ -86,7 +91,9 @@ ldb: ldb@53fa8008 {
>  			/* ... */
>  		};
>  
> -		port {
> +		port@0 {
> +			reg = <0>;
> +
>  			lvds0_in: endpoint {
>  				remote-endpoint = <&ipu_di0_lvds0>;
>  			};
> @@ -94,6 +101,8 @@ ldb: ldb@53fa8008 {
>  	};
>  
>  	lvds-channel@1 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
>  		reg = <1>;
>  		fsl,data-mapping = "spwg";
>  		fsl,data-width = <24>;
> @@ -102,7 +111,9 @@ ldb: ldb@53fa8008 {
>  			/* ... */
>  		};
>  
> -		port {
> +		port@1 {
> +			reg = <1>;
> +
>  			lvds1_in: endpoint {
>  				remote-endpoint = <&ipu_di1_lvds1>;
>  			};
> diff --git a/arch/arm/boot/dts/imx53.dtsi b/arch/arm/boot/dts/imx53.dtsi
> index 6456a00..1a2202d 100644
> --- a/arch/arm/boot/dts/imx53.dtsi
> +++ b/arch/arm/boot/dts/imx53.dtsi
> @@ -419,10 +419,14 @@
>  				status = "disabled";
>  
>  				lvds-channel@0 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
>  					reg = <0>;
>  					status = "disabled";
>  
> -					port {
> +					port@0 {
> +						reg = <0>;
> +
>  						lvds0_in: endpoint {
>  							remote-endpoint = <&ipu_di0_lvds0>;
>  						};
> @@ -430,10 +434,14 @@
>  				};
>  
>  				lvds-channel@1 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
>  					reg = <1>;
>  					status = "disabled";
>  
> -					port {
> +					port@1 {
> +						reg = <1>;
> +
>  						lvds1_in: endpoint {
>  							remote-endpoint = <&ipu_di1_lvds1>;
>  						};
> -- 
> 2.1.0
> 
