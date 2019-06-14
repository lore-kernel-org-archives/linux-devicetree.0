From: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add DT bindings for TI
 ads1000/ads1100 ADCs
Date: Fri, 14 Jun 2019 09:04:16 +0300
Message-ID: <20190614060414.52t7ahfkw44a4eqp@mobilestation>
References: <20190514225810.12591-1-fancer.lancer@gmail.com>
 <20190514225810.12591-2-fancer.lancer@gmail.com>
 <20190613203313.GA23102@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190613203313.GA23102@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, Serge Semin <Sergey.Semin@t-platforms.ru>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Rob

On Thu, Jun 13, 2019 at 02:33:13PM -0600, Rob Herring wrote:
> On Wed, May 15, 2019 at 01:58:08AM +0300, Serge Semin wrote:
> > Add dt-binding documentation for the Texas Instruments ads1000/ads1100 ADCs
> > driver.
> > 
> > Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> > ---
> >  .../devicetree/bindings/hwmon/ads1000.txt     | 61 ++++++++++++++++
> 
> Bindings should be separate patch.
> 
> >  Documentation/hwmon/ads1000.rst               | 72 +++++++++++++++++++
> >  2 files changed, 133 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/ads1000.txt
> >  create mode 100644 Documentation/hwmon/ads1000.rst
> > 
> > diff --git a/Documentation/devicetree/bindings/hwmon/ads1000.txt b/Documentation/devicetree/bindings/hwmon/ads1000.txt
> > new file mode 100644
> > index 000000000000..3907b7da9b33
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/ads1000.txt
> > @@ -0,0 +1,61 @@
> > +ADS1000/ADS1100 (I2C)
> > +
> > +This device is a 12-16 bit A-D converter with 1 input.
> 
> ADC's should be in bindings/iio/adc/
> 
> > +
> > +The inputs can be used either as a differential pair of Vin+ Vin- or as a single
> > +ended sensor for Vin+ GND. The inputs mode is platform-dependent and isn't
> > +configured by software in any case.
> > +
> > +Device A-D converter sensitivity can be configured using two parameters:
> > + - pga is the programmable gain amplifier
> > +    0: x1 (default) 
> > +    1: x2
> > +    2: x4
> > +    3: x8
> > + - data_rate in samples per second also affecting the output code accuracy
> > +    0: 128SPS - +/- Vdd*0.488mV (default, ads1000 accepts this rate only)
> > +    1: 32SPS  - +/- Vdd*0.122mV
> > +    2: 16SPS  - +/- Vdd*0.061mV
> > +    3: 8SPS   - +/- Vdd*0.030mV
> > +   Since this parameter also affects the output accuracy, be aware the greater
> > +   SPS the worse accuracy.
> > +
> > +As a result the output value is calculated by the next formulae:
> > +dVin = Cod * Vdd / (PGA * max(|Cod|)), where
> > +max(|Cod|) - maximum possible value of the output code, which depends on the SPS
> > +setting from the table above.
> > +
> > +The ADS1000/ADS1100 dts-node:
> > +
> > +  Required properties:
> > +   - compatible : must be "ti,ads1000" or "ti,ads1100"
> > +   - reg : I2C bus address of the device
> > +   - #address-cells : must be <1>
> > +   - #size-cells : must be <0>
> > +   - vdd-supply : regulator for reference supply voltage (usually fixed)
> > +
> > +  Optional properties:
> > +   - ti,gain : the programmable gain amplifier setting
> > +   - ti,datarate : the converter data rate
> 
> IIRC, we have standard properties for these.
> 
> > +   - ti,voltage-divider : <R1 R2> Ohms inbound voltage dividers,
> > +     so dVin = (R1 + R2)/R2 * dVin
> > +
> > +Example:
> > +
> > +vdd_5v0: fixedregulator@0 {
> > +	compatible = "regulator-fixed";
> > +	regulator-name = "vdd-ref";
> > +	regulator-min-microvolt = <5000000>;
> > +	regulator-max-microvolt = <5000000>;
> > +	regulator-always-on;
> > +};
> > +
> > +tiadc: ads1000@48 {
> 
> adc@48
> 
> > +	compatible = "ti,ads1000";
> > +	reg = <0x48>;
> > +
> > +	vdd-supply = <&vdd_5v0>;
> > +	ti,gain = <0>;
> > +	ti,voltage-divider = <31600 3600>;
> > +};
> > +

Thanks for this patch review. We had a conversation with Guenter Roeck
and Jonathan Cameron regarding the Linux subsystem to place this patchset
to, and decided to port the driver into the iio subsystem. So if this code
is ported as a separate driver I'll certainly take your comments into
account, while if I manage to integrate it into the existing ads1015 driver,
then this patch will be dropped since ads1015 already have the dedicated
bindings. In the last case sorry for wasting your time in advance.

Regards,
-Sergey
