From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] arm: dts: imx53: Fix LDB OF graph warning
Date: Tue, 08 May 2018 16:16:37 +0200
Message-ID: <1525788997.18091.5.camel@pengutronix.de>
References: <20180508135930.5768-1-robh@kernel.org>
 <20180508135930.5768-3-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180508135930.5768-3-robh@kernel.org>
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
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Tue, 2018-05-08 at 08:59 -0500, Rob Herring wrote:
> Single child nodes in OF graph don't need an address and now dtc will
> warn about this:
> 
> Warning (graph_child_address): /soc/aips@50000000/ldb@53fa8008/lvds-channel@0: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
> 
> Since the LDB should always have an output port, fix the warning by
> adding the output port, 2, to the DT.
> 
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  arch/arm/boot/dts/imx53.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx53.dtsi b/arch/arm/boot/dts/imx53.dtsi
> index 7d647d043f52..1cf2fc9d0a58 100644
> --- a/arch/arm/boot/dts/imx53.dtsi
> +++ b/arch/arm/boot/dts/imx53.dtsi
> @@ -488,6 +488,10 @@
>  							remote-endpoint = <&ipu_di0_lvds0>;
>  						};
>  					};
> +
> +					port@2 {
> +						reg = <2>;
> +					};

Now that the reg property of port@2 is added in the .dtsi, it could be
removed from the one .dts files that use it:

----------8<----------
--- a/arch/arm/boot/dts/imx53-ppd.dts
+++ b/arch/arm/boot/dts/imx53-ppd.dts
@@ -559,8 +559,6 @@
                status = "okay";
 
                port@2 {
-                       reg = <2>;
-
                        lvds0_out: endpoint {
                                remote-endpoint = <&panel_in_lvds0>;
                        };
---------->8----------

>  				};
>  
>  				lvds-channel@1 {
> @@ -503,6 +507,10 @@
>  							remote-endpoint = <&ipu_di1_lvds1>;
>  						};
>  					};
> +
> +					port@2 {
> +						reg = <2>;
> +					};
>  				};
>  			};
>  

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
