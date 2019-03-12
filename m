From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v14 08/13] ARM: dts: imx7: Add video mux, csi and
 mipi_csi and connections
Date: Tue, 12 Mar 2019 16:10:46 +0200
Message-ID: <20190312141046.GB4845@pendragon.ideasonboard.com>
References: <20190206151328.21629-1-rui.silva@linaro.org>
 <20190206151328.21629-9-rui.silva@linaro.org>
 <20190310214102.GA7578@pendragon.ideasonboard.com>
 <m3y35kdw7v.fsf@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <m3y35kdw7v.fsf@linaro.org>
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, sakari.ailus@linux.intel.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil@xs4all.nl>, Philipp Zabel <p.zabel@pengutronix.de>, Steve Longerbeam <slongerbeam@gmail.com>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rui,

On Tue, Mar 12, 2019 at 02:05:24PM +0000, Rui Miguel Silva wrote:
> On Sun 10 Mar 2019 at 21:41, Laurent Pinchart wrote:
> > Hi Rui,
> >
> > Thank you for the patch.
> 
> Where have you been for the latest 14 versions? :)

Elsewhere I suppose :-)

> This is already merged, but... follow up patches can address your
> issues bellow.

I saw the driver and DT bindings patches merged in the media tree for
v5.2, where have the DT patches been merged ?

> > On Wed, Feb 06, 2019 at 03:13:23PM +0000, Rui Miguel Silva 
> > wrote:
> >> This patch adds the device tree nodes for csi, video 
> >> multiplexer and mipi-csi besides the graph connecting the necessary
> >> endpoints to make the media capture entities to work in imx7 Warp
> >> board.
> >> 
> >> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> >> ---
> >>  arch/arm/boot/dts/imx7s-warp.dts | 51 ++++++++++++++++++++++++++++++++
> >>  arch/arm/boot/dts/imx7s.dtsi     | 27 +++++++++++++++++
> >
> > I would have split this in two patches to make backporting 
> > easier, but it's not a big deal.
> >
> > Please see below for a few additional comments.
> >
> >>  2 files changed, 78 insertions(+)
> >> 
> >> diff --git a/arch/arm/boot/dts/imx7s-warp.dts 
> >> b/arch/arm/boot/dts/imx7s-warp.dts
> >> index 23431faecaf4..358bcae7ebaf 100644
> >> --- a/arch/arm/boot/dts/imx7s-warp.dts
> >> +++ b/arch/arm/boot/dts/imx7s-warp.dts
> >> @@ -277,6 +277,57 @@
> >>  	status = "okay";
> >>  };
> >>  
> >> +&gpr {
> >> +	csi_mux {
> >> +		compatible = "video-mux";
> >> +		mux-controls = <&mux 0>;
> >> +		#address-cells = <1>;
> >> +		#size-cells = <0>;
> >> +
> >> +		port@1 {
> >> +			reg = <1>;
> >> +
> >> +			csi_mux_from_mipi_vc0: endpoint {
> >> +				remote-endpoint = 
> >> <&mipi_vc0_to_csi_mux>;
> >> +			};
> >> +		};
> >> +
> >> +		port@2 {
> >> +			reg = <2>;
> >> +
> >> +			csi_mux_to_csi: endpoint {
> >> +				remote-endpoint = 
> >> <&csi_from_csi_mux>;
> >> +			};
> >> +		};
> >> +	};
> >> +};
> >> +
> >> +&csi {
> >> +	status = "okay";
> >> +
> >> +	port {
> >> +		csi_from_csi_mux: endpoint {
> >> +			remote-endpoint = <&csi_mux_to_csi>;
> >> +		};
> >> +	};
> >> +};
> >
> > Shouldn't these two nodes, as well as port@1 of the mipi_csi 
> > node, be moved to imx7d.dtsi ?
> 
> Yeah, I guess you are right here.
> 
> >
> >> +
> >> +&mipi_csi {
> >> +	clock-frequency = <166000000>;
> >> +	status = "okay";
> >> +	#address-cells = <1>;
> >> +	#size-cells = <0>;
> >> +	fsl,csis-hs-settle = <3>;
> >
> > Shouldn't this be an endpoint property ? Different sensors connected
> > through different endpoints could have different timing
> > requirements.
> 
> Hum... I see you point, even tho the phy hs-settle is a common
> control. 

I suppose we don't need to care about DT backward compatibility if we
make changes in the bindings for v5.2 ? Would you fix this, or do you
want a patch ?

> >> +
> >> +	port@1 {
> >> +		reg = <1>;
> >> +
> >> +		mipi_vc0_to_csi_mux: endpoint {
> >> +			remote-endpoint = <&csi_mux_from_mipi_vc0>;
> >> +		};
> >> +	};
> >> +};
> >> +
> >>  &wdog1 {
> >>  	pinctrl-names = "default";
> >>  	pinctrl-0 = <&pinctrl_wdog>;
> >> diff --git a/arch/arm/boot/dts/imx7s.dtsi 
> >> b/arch/arm/boot/dts/imx7s.dtsi
> >> index 792efcd2caa1..01962f85cab6 100644
> >> --- a/arch/arm/boot/dts/imx7s.dtsi
> >> +++ b/arch/arm/boot/dts/imx7s.dtsi
> >> @@ -8,6 +8,7 @@
> >>  #include <dt-bindings/gpio/gpio.h>
> >>  #include <dt-bindings/input/input.h>
> >>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >> +#include <dt-bindings/reset/imx7-reset.h>
> >>  #include "imx7d-pinfunc.h"
> >>  
> >>  / {
> >> @@ -709,6 +710,17 @@
> >>  				status = "disabled";
> >>  			};
> >>  
> >> +			csi: csi@30710000 {
> >> +				compatible = "fsl,imx7-csi";
> >> +				reg = <0x30710000 0x10000>;
> >> +				interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> >> +				clocks = <&clks IMX7D_CLK_DUMMY>,
> >> +						<&clks IMX7D_CSI_MCLK_ROOT_CLK>,
> >> +						<&clks IMX7D_CLK_DUMMY>;
> >> +				clock-names = "axi", "mclk", "dcic";
> >> +				status = "disabled";
> >> +			};
> >> +
> >>  			lcdif: lcdif@30730000 {
> >>  				compatible = "fsl,imx7d-lcdif", "fsl,imx28-lcdif";
> >>  				reg = <0x30730000 0x10000>;
> >> @@ -718,6 +730,21 @@
> >>  				clock-names = "pix", "axi";
> >>  				status = "disabled";
> >>  			};
> >> +
> >> +			mipi_csi: mipi-csi@30750000 {
> >> +				compatible = "fsl,imx7-mipi-csi2";
> >> +				reg = <0x30750000 0x10000>;
> >> +				interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> >> +				clocks = <&clks IMX7D_IPG_ROOT_CLK>,
> >> +					<&clks IMX7D_MIPI_CSI_ROOT_CLK>,
> >> +					<&clks IMX7D_MIPI_DPHY_ROOT_CLK>;
> >> +				clock-names = "pclk", "wrap", "phy";
> >> +				power-domains = <&pgc_mipi_phy>;
> >> +				phy-supply = <&reg_1p0d>;
> >> +				resets = <&src IMX7_RESET_MIPI_PHY_MRST>;
> >> +				reset-names = "mrst";
> >> +				status = "disabled";
> >
> > How about already declaring port@0 here too (but obviously 
> > without any endoint) ?
> 
> empty port, do not know if they make much sense.

The port describes the ability to connect. There's always a port@0 for
the CSI-2 receiver, so I would define it in imx7s.dtsi. If a system
doesn't connect any CSI-2 sensor then no endpoint will exist (and this
node will stay disabled anyway).

-- 
Regards,

Laurent Pinchart
