Return-Path: <SRS0=U7M/=T4=denx.de=marex@kernel.org>
Subject: Re: [PATCH 1/2] media: dt-bindings: Add Intersil ISL7998x DT bindings
References: <20190520201812.7937-1-marex@denx.de>
 <20190528114758.a4oac3zgdy7dkx7k@uno.localdomain>
From: Marek Vasut <marex@denx.de>
Message-ID: <6cd36678-2a2c-2a43-e245-4263c0e0f666@denx.de>
Date: Tue, 28 May 2019 16:36:27 +0200
MIME-Version: 1.0
In-Reply-To: <20190528114758.a4oac3zgdy7dkx7k@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Jacopo Mondi <jacopo@jmondi.org>
Cc: linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 5/28/19 1:47 PM, Jacopo Mondi wrote:
> Hi Marek,
>    thanks for the patch

Hi,

> On Mon, May 20, 2019 at 10:18:11PM +0200, Marek Vasut wrote:
>> Add bindings for the Intersil ISL7998x BT656-to-MIPI-CSI2 decoder.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
>> Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> To: linux-media@vger.kernel.org
>> ---
>>  .../bindings/media/i2c/isl7998x.txt           | 37 +++++++++++++++++++
>>  1 file changed, 37 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/isl7998x.txt
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/isl7998x.txt b/Documentation/devicetree/bindings/media/i2c/isl7998x.txt
>> new file mode 100644
>> index 000000000000..c21703983360
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/i2c/isl7998x.txt
>> @@ -0,0 +1,37 @@
>> +Intersil ISL7998x BT656-to-MIPI-CSI2 decoder
>> +
>> +The Intersil ISL7998x is a BT656-to-MIPI-CSI decoder which, capable of
>> +receiving up to four analog stream and multiplexing them into up to four
>> +MIPI CSI2 virtual channels, using one MIPI clock lane and 1/2 data lanes.
>> +
> 
> The documentation is not public, so I can only read what's reported on
> the website and the short public datasheet at [1]

Right

> From my understanding of the product page, both the ISL79987 and
> ILS79988 devices support up to 4 analog inputs, and provide a CSI-2
> output and a BT656 output respectively.
> 
> What am I reading wrong ?

ISL79987 is analog video to mipi csi2 ; I have this chip.
ISL79988 is analog video to bt656 ; I don't have this chip.

> [1] https://www.renesas.com/eu/en/products/audio-video/video-decoders-encoders/video-decoders/device/ISL79987.html
> 
>> +Required Properties:
>> +- compatible: value should be "isil,isl79987"
>> +- pd-gpios: a GPIO spec for the Power Down pin (active high)
>> +
>> +Option Properties:
>> +- isil,num-inputs: Number of connected inputs (1, 2 or 4)
> 
> Can't you derive this from the number of connected input endpoints
> instead of providing a custom property?

Input endpoints from where ?

>> +
>> +For further reading on port node refer to
>> +Documentation/devicetree/bindings/media/video-interfaces.txt.
>> +
> 
> I think a description of the supported ports and their intended
> usages is required here. You have up to 4 inputs and 1 output port,
> how do you expect them to be numbered? is port@4 the last input or the
> output one?

The only port is the MIPI CSI2 , see the example below.

>> +Example:
>> +
>> +	i2c_master {
>> +		isl7998x_mipi@44 {
>> +			compatible = "isil,isl79987";
>> +			reg = <0x44>;
>> +			isil,num-inputs = <4>;
>> +			pinctrl-names = "default";
>> +			pinctrl-0 = <&pinctrl_videoadc>;
>> +			pd-gpios = <&gpio3 27 GPIO_ACTIVE_HIGH>;
>> +			status = "okay";
>> +
>> +			port {
>> +				isl79987_to_mipi_csi2: endpoint {
>> +					remote-endpoint = <&mipi_csi2_in>;
>> +					clock-lanes = <0>;
>> +					data-lanes = <1 2>;
>> +				};
> 
> I see from the example you only support one output port? How do you
> model the input ones.

I don't . Do we model analog inputs now somehow ?

-- 
Best regards,
Marek Vasut
