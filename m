From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 08/12] ARM: dts: imx7s: add multiplexer controls
Date: Fri, 18 May 2018 11:51:46 -0500
Message-ID: <20180518165146.GC21131@rob-hp-laptop>
References: <20180518092806.3829-1-rui.silva@linaro.org>
 <20180518092806.3829-9-rui.silva@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <20180518092806.3829-9-rui.silva@linaro.org>
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

On Fri, May 18, 2018 at 10:28:02AM +0100, Rui Miguel Silva wrote:
> The IOMUXC General Purpose Register has bitfield to control video bus
> multiplexer to control the CSI input between the MIPI-CSI2 and parallel
> interface. Add that register and mask.
> 
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  arch/arm/boot/dts/imx7s.dtsi | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
> index 67450ad89940..3590dab529f9 100644
> --- a/arch/arm/boot/dts/imx7s.dtsi
> +++ b/arch/arm/boot/dts/imx7s.dtsi
> @@ -520,8 +520,14 @@
>  
>  			gpr: iomuxc-gpr@30340000 {
>  				compatible = "fsl,imx7d-iomuxc-gpr",
> -					"fsl,imx6q-iomuxc-gpr", "syscon";
> +					"fsl,imx6q-iomuxc-gpr", "syscon", "simple-mfd";
>  				reg = <0x30340000 0x10000>;
> +
> +				mux: mux-controller {
> +					compatible = "mmio-mux";
> +					#mux-control-cells = <1>;
> +					mux-reg-masks = <0x14 0x00000010>;

If 1 bit control, then #mux-control-cells can be 0.

> +				};
>  			};
>  
>  			ocotp: ocotp-ctrl@30350000 {
> -- 
> 2.17.0
> 
