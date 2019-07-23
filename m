From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [RFC,V2,1/2] media: dt-bindings: media: i2c: Add bindings for
 OV02A10
Date: Tue, 23 Jul 2019 10:41:54 +0300
Message-ID: <20190723074153.GA4606@paasikivi.fi.intel.com>
References: <20190704084651.3105-1-dongchun.zhu@mediatek.com>
 <20190704084651.3105-2-dongchun.zhu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190704084651.3105-2-dongchun.zhu@mediatek.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, shengnan.wang@mediatek.com, --to=drinkcat@chromium.org, tfiga@chromium.org, louis.kuo@mediatek.com, sj.huang@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, bingbu.cao@intel.com, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Dongchun,

On Thu, Jul 04, 2019 at 04:46:50PM +0800, dongchun.zhu@mediatek.com wrote:
> From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> 
> Add device tree binding documentation for the OV02A10 camera sensor.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  .../devicetree/bindings/media/i2c/ov02a10.txt      | 43 ++++++++++++++++++++++
>  MAINTAINERS                                        |  7 ++++
>  2 files changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov02a10.txt b/Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> new file mode 100644
> index 0000000..d40aa87
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ov02a10.txt
> @@ -0,0 +1,43 @@
> +* Omnivision OV02A10 MIPI CSI-2 sensor
> +
> +Required Properties:
> +- compatible: shall be "ovti,ov02a10"
> +- clocks: reference to the xvclk input clock
> +- clock-names: shall be "xvclk"
> +- avdd-supply: Analog voltage supply, 2.8 volts
> +- dovdd-supply: Digital I/O voltage supply, 1.8 volts
> +- dvdd-supply: Digital core voltage supply, 1.8 volts
> +- reset-gpios: Low active reset gpio
> +
> +The device node shall contain one 'port' child node with an
> +'endpoint' subnode for its digital output video port,
> +in accordance with the video interface bindings defined in
> +Documentation/devicetree/bindings/media/video-interfaces.txt.
> +The endpoint optional property 'data-lanes' shall be "<1>".

How many lanes does the module (or the sensor) have?

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
> +		clock-names = "xvclk", "freq_mux";
> +
> +		avdd-supply = <&mt6358_vcama1_reg>;
> +		dvdd-supply = <&mt6358_vcn18_reg>;
> +		dovdd-supply = <&mt6358_vcamio_reg>;
> +		pwdn-gpios = <&pio 107 1>;
> +		reset-gpios = <&pio 109 1>;
> +
> +		port {
> +		   ov02a10_core: endpoint {
> +		       remote-endpoint = <&ov02a10_0>;

Indentation is still wrong. :-(

> +			   data-lanes = <1>;
> +			};
> +		};
> +	};
> +};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5cfbea4..62b81ff 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11571,6 +11571,13 @@ T:	git git://linuxtv.org/media_tree.git
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
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
