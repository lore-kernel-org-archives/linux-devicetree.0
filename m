From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: Add IMX290 CMOS sensor
 binding
Date: Tue, 13 Aug 2019 17:03:58 +0530
Message-ID: <20190813113358.GA28877@Mani-XPS-13-9360>
References: <20190806130938.19916-1-manivannan.sadhasivam@linaro.org>
 <20190806130938.19916-2-manivannan.sadhasivam@linaro.org>
 <20190813094526.GG835@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190813094526.GG835@valkosipuli.retiisi.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: mchehab@kernel.org, robh+dt@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, c.barrett@framos.com, a.brela@framos.com
List-Id: devicetree@vger.kernel.org

Hi Sakari,

Thanks for the review!

On Tue, Aug 13, 2019 at 12:45:26PM +0300, Sakari Ailus wrote:
> Hi Manivannan,
> 
> On Tue, Aug 06, 2019 at 06:39:36PM +0530, Manivannan Sadhasivam wrote:
> > Add devicetree binding for IMX290 CMOS image sensor.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../devicetree/bindings/media/i2c/imx290.txt  | 51 +++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/imx290.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/imx290.txt b/Documentation/devicetree/bindings/media/i2c/imx290.txt
> > new file mode 100644
> > index 000000000000..7535b5b5b24b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/imx290.txt
> > @@ -0,0 +1,51 @@
> > +* Sony IMX290 1/2.8-Inch CMOS Image Sensor
> > +
> > +The Sony IMX290 is a 1/2.8-Inch CMOS Solid-state image sensor with
> > +Square Pixel for Color Cameras. It is programmable through I2C and 4-wire
> > +interfaces. The sensor output is available via CMOS logic parallel SDR output,
> > +Low voltage LVDS DDR output and CSI-2 serial data output.
> 
> If there are three to choose from, then you should specify which one is in
> use. Given that I think chances remain slim we'd add support for the other
> two (it's certainly not ruled out though), CSI-2 could be the default. But
> this needs to be documented.
> 

Hmm... I'm not sure here. Bindings should describe the hardware and not the
limitations of the driver. Here as you said, the sensor can output frames
in 3 different modes/formats but the driver only supports CSI2. I can add a
note in the driver but not sure whether dt-binding is the right place or not!

> > +
> > +Required Properties:
> > +- compatible: Should be "sony,imx290"
> > +- reg: I2C bus address of the device
> > +- clocks: Reference to the xclk clock.
> > +- clock-names: Should be "xclk".
> > +- clock-frequency: Frequency of the xclk clock.
> 
> ...in Hz.
> 

Ack.

> > +- vdddo-supply: Sensor digital IO regulator.
> > +- vdda-supply: Sensor analog regulator.
> > +- vddd-supply: Sensor digital core regulator.
> > +
> > +Optional Properties:
> > +- reset-gpios: Sensor reset GPIO
> > +
> > +The imx290 device node should contain one 'port' child node with
> > +an 'endpoint' subnode. For further reading on port node refer to
> > +Documentation/devicetree/bindings/media/video-interfaces.txt.
> 
> Which other properties are relevant for the device?

Not much other than, clock/data lanes.

> I suppose you can't change the lane order, so clock-lanes is redundant
> (don't use it in the example) and data-lanes should be monotonically
> incrementing series from 1 to 4.
> 

We can change the order and the example here illustrates how it has been
wired in FRAMOS module. If I change the lane order like you said, it won't
work.

> > +
> > +Example:
> > +	&i2c1 {
> > +		...
> > +		imx290: imx290@1a {
> 
> imx290: camera-sensor@1a {

Ack.

Thanks,
Mani

> 
> > +			compatible = "sony,imx290";
> > +			reg = <0x1a>;
> > +
> > +			reset-gpios = <&msmgpio 35 GPIO_ACTIVE_LOW>;
> > +			pinctrl-names = "default";
> > +			pinctrl-0 = <&camera_rear_default>;
> > +
> > +			clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
> > +			clock-names = "xclk";
> > +			clock-frequency = <37125000>;
> > +
> > +			vdddo-supply = <&camera_vdddo_1v8>;
> > +			vdda-supply = <&camera_vdda_2v8>;
> > +			vddd-supply = <&camera_vddd_1v5>;
> > +
> > +			port {
> > +				imx290_ep: endpoint {
> > +					clock-lanes = <1>;
> > +					data-lanes = <0 2 3 4>;
> > +					remote-endpoint = <&csiphy0_ep>;
> > +				};
> > +			};
> > +		};
> 
> -- 
> Regards,
> 
> Sakari Ailus
