From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [V4, 1/2] media: dt-bindings: media: i2c: Add bindings for OV02A10
Date: Mon, 9 Sep 2019 09:46:47 +0300
Message-ID: <20190909064647.GM5475@paasikivi.fi.intel.com>
References: <20190907092728.23897-1-dongchun.zhu@mediatek.com>
 <20190907092728.23897-2-dongchun.zhu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190907092728.23897-2-dongchun.zhu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dongchun.zhu@mediatek.com
Cc: mark.rutland@arm.com, drinkcat@chromium.org, andriy.shevchenko@linux.intel.com, srv_heupstream@mediatek.com, devicetree@vger.kernel.org, shengnan.wang@mediatek.com, tfiga@chromium.org, louis.kuo@mediatek.com, sj.huang@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, bingbu.cao@intel.com, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Dongchun,

On Sat, Sep 07, 2019 at 05:27:27PM +0800, dongchun.zhu@mediatek.com wrote:
> From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> 
> This patch adds device tree bindings documentation for OV02A10 camera sensor.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>

Please remember to add acks you get.

> ---
>  .../devicetree/bindings/media/i2c/ov02a10.txt      | 54 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 +++
>  2 files changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov02a10.txt b/Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> new file mode 100644
> index 0000000..18acc4f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> @@ -0,0 +1,54 @@
> +* Omnivision OV02A10 MIPI CSI-2 sensor
> +
> +Required Properties:
> +- compatible: shall be "ovti,ov02a10"
> +- clocks: reference to the eclk input clock
> +- clock-names: shall be "eclk"
> +- dovdd-supply: Digital I/O voltage supply, 1.8 volts
> +- avdd-supply: Analog voltage supply, 2.8 volts
> +- dvdd-supply: Digital core voltage supply, 1.8 volts
> +- powerdown-gpios: reference to the GPIO connected to the powerdown pin,
> +		   if any. This is an active low signal to the OV02A10.
> +- reset-gpios: reference to the GPIO connected to the reset pin, if any.
> +	       This is an active high signal to the OV02A10.
> +
> +Optional Properties:
> +- rotation: as defined in
> +	    Documentation/devicetree/bindings/media/video-interfaces.txt,
> +	    valid values are 0 (sensor mounted upright) and 180 (sensor
> +	    mounted upside down).

This needs to be either mandatory or the default needs to be documented. I
think it could be simply:

	    Documentation/devicetree/bindings/media/video-interfaces.txt,
	    valid values are 0 (sensor mounted upright; the default) and
	    180 (sensor mounted upside down).

> +
> +The device node shall contain one 'port' child node with an
> +'endpoint' subnode for its digital output video port,
> +in accordance with the video interface bindings defined in
> +Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +Example:
> +&i2c4 {
> +	ov02a10: camera-sensor@3d {
> +		compatible = "ovti,ov02a10";
> +		reg = <0x3d>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&camera_pins_cam1_mclk_on>;
> +
> +		clocks = <&topckgen CLK_TOP_MUX_CAMTG2>,
> +			<&topckgen CLK_TOP_UNIVP_192M_D8>;
> +		clock-names = "eclk", "freq_mux";
> +		clock-frequency = <24000000>;
> +
> +		dovdd-supply = <&mt6358_vcamio_reg>;
> +		avdd-supply = <&mt6358_vcama1_reg>;
> +		dvdd-supply = <&mt6358_vcn18_reg>;
> +		powerdown-gpios = <&pio 107 GPIO_ACTIVE_LOW>;
> +		reset-gpios = <&pio 109 GPIO_ACTIVE_HIGH>;
> +		rotation = <180>;
> +
> +		port {
> +			/* MIPI CSI-2 bus endpoint */
> +			ov02a10_core: endpoint {
> +				remote-endpoint = <&ov02a10_0>;
> +				link-frequencies = /bits/ 64 <390000000>;
> +			};
> +		};
> +	};
> +};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 783569e..41734fb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11816,6 +11816,13 @@ T:	git git://linuxtv.org/media_tree.git
>  S:	Maintained
>  F:	drivers/media/i2c/ov13858.c
>  
> +OMNIVISION OV02A10 SENSOR DRIVER
> +M:	Dongchun Zhu <dongchun.zhu@mediatek.com>
> +L:	linux-media@vger.kernel.org
> +T:	git git://linuxtv.org/media_tree.git
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> +
>  OMNIVISION OV2680 SENSOR DRIVER
>  M:	Rui Miguel Silva <rmfrfs@gmail.com>
>  L:	linux-media@vger.kernel.org

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
