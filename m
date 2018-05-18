From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 07/12] ARM: dts: imx7s: add mipi phy power domain
Date: Fri, 18 May 2018 11:50:22 -0500
Message-ID: <20180518165022.GB21131@rob-hp-laptop>
References: <20180518092806.3829-1-rui.silva@linaro.org>
 <20180518092806.3829-8-rui.silva@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <20180518092806.3829-8-rui.silva@linaro.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Rui Miguel Silva <rui.silva@linaro.org>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, sakari.ailus@linux.intel.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ryan Harkin <ryan.harkin@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Steve Longerbeam <slongerbeam@gmail.com>, Fabio Estevam <fabio.estevam@nxp.com>, mchehab@kernel.org, Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, May 18, 2018 at 10:28:01AM +0100, Rui Miguel Silva wrote:
> Add power domain index 0 related with mipi-phy to imx7s.
> 
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> ---
>  arch/arm/boot/dts/imx7s.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
> index 4d42335c0dee..67450ad89940 100644
> --- a/arch/arm/boot/dts/imx7s.dtsi
> +++ b/arch/arm/boot/dts/imx7s.dtsi
> @@ -636,6 +636,12 @@
>  					#address-cells = <1>;
>  					#size-cells = <0>;
>  
> +					pgc_mipi_phy: pgc-power-domain@0 {

power-domain@0

> +						#power-domain-cells = <0>;
> +						reg = <0>;
> +						power-supply = <&reg_1p0d>;
> +					};
> +
>  					pgc_pcie_phy: pgc-power-domain@1 {

ditto.

>  						#power-domain-cells = <0>;
>  						reg = <1>;
> -- 
> 2.17.0
> 
