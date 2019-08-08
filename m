From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [V1, 1/2] media: dt-bindings: media: i2c: Add bindings for ov8856
Date: Thu, 8 Aug 2019 19:54:16 +0300
Message-ID: <20190808165416.GA1845@kekkonen.localdomain>
References: <20190808092215.5608-1-dongchun.zhu@mediatek.com>
 <20190808092215.5608-2-dongchun.zhu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190808092215.5608-2-dongchun.zhu@mediatek.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, drinkcat@chromium.org, srv_heupstream@mediatek.com, shengnan.wang@mediatek.com, Ben Kao <ben.kao@intel.com>, tfiga@chromium.org, louis.kuo@mediatek.com, sj.huang@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, bingbu.cao@intel.com, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Dongchun,

(Cc'ing Ben, too.)

On Thu, Aug 08, 2019 at 05:22:14PM +0800, dongchun.zhu@mediatek.com wrote:
> From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> 
> Add device tree binding documentation for the ov8856 camera sensor.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  .../devicetree/bindings/media/i2c/ov8856.txt       | 41 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.txt b/Documentation/devicetree/bindings/media/i2c/ov8856.txt
> new file mode 100644
> index 0000000..96b10e0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ov8856.txt
> @@ -0,0 +1,41 @@
> +* Omnivision OV8856 MIPI CSI-2 sensor
> +
> +Required Properties:
> +- compatible: shall be "ovti,ov8856"
> +- clocks: reference to the xvclk input clock
> +- clock-names: shall be "xvclk"

Could you add "clock-frequency" property here, please, and specify the
upper and lower limits?

> +- avdd-supply: Analog voltage supply, 2.8 volts
> +- dovdd-supply: Digital I/O voltage supply, 1.8 volts
> +- dvdd-supply: Digital core voltage supply, 1.2 volts
> +- reset-gpios: Low active reset gpio
> +
> +The device node shall contain one 'port' child node with an
> +'endpoint' subnode for its digital output video port,
> +in accordance with the video interface bindings defined in
> +Documentation/devicetree/bindings/media/video-interfaces.txt.
> +The endpoint optional property 'data-lanes' shall be "<0 1 3 4>".

If you don't support lane reordering, then monotonically incrementing lane
numbers from 1 onwards are recommended.

Please also make the property mandatory.

> +
> +Example:
> +&i2c7 {
> +	ov8856: camera-sensor@10 {
> +		compatible = "ovti,ov8856";
> +		reg = <0x10>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&clk_24m_cam>;
> +
> +		clocks = <&cru SCLK_TESTCLKOUT1>;
> +		clock-names = "xvclk";
> +
> +		avdd-supply = <&mt6358_vcama2_reg>;
> +		dvdd-supply = <&mt6358_vcamd_reg>;
> +		dovdd-supply = <&mt6358_vcamio_reg>;
> +		reset-gpios = <&gpio2 3 GPIO_ACTIVE_LOW>;
> +
> +		port {
> +			wcam_out: endpoint {
> +				remote-endpoint = <&mipi_in_wcam>;
> +				data-lanes = <0 1 3 4>;
> +			};
> +		};
> +	};
> +};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 783569e..7746c6b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11889,6 +11889,7 @@ L:	linux-media@vger.kernel.org
>  T:	git git://linuxtv.org/media_tree.git
>  S:	Maintained
>  F:	drivers/media/i2c/ov8856.c
> +F:	Documentation/devicetree/bindings/media/i2c/ov8856.txt
>  
>  OMNIVISION OV9650 SENSOR DRIVER
>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Regards,

Sakari Ailus
sakari.ailus@linux.intel.com
