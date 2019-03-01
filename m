Return-Path: <SRS0=oAt5=RE=gmail.com=ian.arkver.dev@kernel.org>
Subject: Re: [PATCH 1/3] media: dt-bindings: add bindings for Toshiba TC358746
References: <20181218141240.3056-1-m.felsch@pengutronix.de>
 <20181218141240.3056-2-m.felsch@pengutronix.de>
 <20190218100333.qvptfllrd4pyhsyb@paasikivi.fi.intel.com>
 <20190301105235.a23jwiwmxejuv2yf@pengutronix.de>
From: Ian Arkver <ian.arkver.dev@gmail.com>
Message-ID: <a51ecc47-df19-a48b-3d82-01b21d03972c@gmail.com>
Date: Fri, 1 Mar 2019 11:07:58 +0000
MIME-Version: 1.0
In-Reply-To: <20190301105235.a23jwiwmxejuv2yf@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
To: Marco Felsch <m.felsch@pengutronix.de>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: hans.verkuil@cisco.com, mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org, graphics@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

Hi,

On 01/03/2019 10:52, Marco Felsch wrote:
> Hi Sakari,
> 
> On 19-02-18 12:03, Sakari Ailus wrote:
>> Hi Marco,
>>
>> My apologies for reviewing this so late. You've received good comments
>> already. I have a few more.
> 
> Thanks for your review for the other patches as well =) Sorry for my
> delayed response.
> 
>> On Tue, Dec 18, 2018 at 03:12:38PM +0100, Marco Felsch wrote:
>>> Add corresponding dt-bindings for the Toshiba tc358746 device.
>>>
>>> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
>>> ---
>>>   .../bindings/media/i2c/toshiba,tc358746.txt   | 80 +++++++++++++++++++
>>>   1 file changed, 80 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.txt b/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.txt
>>> new file mode 100644
>>> index 000000000000..499733df744a
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/i2c/toshiba,tc358746.txt
>>> @@ -0,0 +1,80 @@
>>> +* Toshiba TC358746 Parallel to MIPI CSI2-TX or MIPI CSI2-RX to Parallel Bridge
>>> +
>>> +The Toshiba TC358746 is a bridge that converts a Parallel-in stream to MIPI CSI-2 TX
>>> +or a MIPI CSI-2 RX stream into a Parallel-out. It is programmable through I2C.
>>
>> This is interesting. The driver somehow needs to figure out the direction
>> of the data flow if it does not originate from DT. I guess it shouldn't as
>> it's not the property of an individual device, albeit in practice in all
>> hardware I've seen the direction of the pipeline is determinable and this
>> is visible in the kAPI as well. So I'm suggesting no changes due to this in
>> bindings, likely we'll need to address it somehow elsewhere going forward.
> 
> What did you mean with "... and this is visible in the kAPI as well"?
> I'm relative new in the linux-media world but I never saw a device which
> supports two directions. Our customer which uses that chip use it
> only in parallel-in/csi-out mode. To be flexible the switching should be
> done by a subdev-ioctl but it is also reasonable to define a default value
> within the DT.

The mode is set by a pin strap at reset time (MSEL). It's not 
programmable by i2c. As far as I can see, looking at the registers, it's 
also not readable by i2c, so there's no easy way for a driver which 
supports both modes to see what the pinstrap is set to.

I'm not sure if the driver could tell from the direction of the 
endpoints it's linked to which mode to use, but if not it'll need to be 
told somehow and a DT property seems reasonable to me. Given that the 
same pins are used in each direction I think the direction is most 
likely to be hard wired and board specific.

Regards,
Ian.

>>> +
>>> +Required Properties:
>>> +
>>> +- compatible: should be "toshiba,tc358746"
>>> +- reg: should be <0x0e>
>>> +- clocks: should contain a phandle link to the reference clock source
>>> +- clock-names: the clock input is named "refclk".
>>> +
>>> +Optional Properties:
>>> +
>>> +- reset-gpios: gpio phandle GPIO connected to the reset pin
>>> +
>>> +Parallel Endpoint:
>>> +
>>> +Required Properties:
>>
>> It'd be nice if the relation between these sections would be somehow
>> apparent. E.g. using different underlining, such as in
>> Documentation/devicetree/bindings/media/ti,omap3isp.txt .
> 
> Thats a really good example thanks.
> 
>>
>>> +
>>> +- reg: should be <0>
>>> +- bus-width: the data bus width e.g. <8> for eight bit bus, or <16>
>>> +	     for sixteen bit wide bus.
>>> +
>>> +MIPI CSI-2 Endpoint:
>>> +
>>> +Required Properties:
>>> +
>>> +- reg: should be <1>
>>> +- data-lanes: should be <1 2 3 4> for four-lane operation,
>>> +	      or <1 2> for two-lane operation
>>> +- clock-lanes: should be <0>
>>> +- link-frequencies: List of allowed link frequencies in Hz. Each frequency is
>>> +		    expressed as a 64-bit big-endian integer. The frequency
>>> +		    is half of the bps per lane due to DDR transmission.
>>> +
>>> +Optional Properties:
>>> +
>>> +- clock-noncontinuous: Presence of this boolean property decides whether the
>>> +		       MIPI CSI-2 clock is continuous or non-continuous.
>>> +
>>> +For further information on the endpoint node properties, see
>>> +Documentation/devicetree/bindings/media/video-interfaces.txt.
>>> +
>>> +Example:
>>> +
>>> +&i2c {
>>> +	tc358746: tc358746@0e {
>>
>> The node name should be a generic name of the type of the device, not the
>> name of the specific device as such. A similar Cadence device uses
>> "csi-bridge".
> 
> Okay, I will change that.
> 
>>
>>> +		reg = <0x0e>;
>>> +		compatible = "toshiba,tc358746";
>>> +		pinctrl-names = "default";
>>> +		clocks = <&clk_cam_ref>;
>>> +		clock-names = "refclk";
>>> +		reset-gpios = <&gpio3 2 GPIO_ACTIVE_LOW>;
>>> +
>>> +		#address-cells = <1>;
>>> +		#size-cells = <0>;
>>> +
>>> +		port@0 {
>>> +			reg = <0>;
>>> +
>>> +			tc358746_parallel_in: endpoint {
>>> +				bus-width = <8>;
>>> +				remote-endpoint = <&micron_parallel_out>;
>>> +			};
>>> +		};
>>> +
>>> +		port@1 {
>>> +			reg = <1>;
>>> +
>>> +			tc358746_mipi2_out: endpoint {
>>> +				remote-endpoint = <&mipi_csi2_in>;
>>> +				data-lanes = <1 2>;
>>> +				clock-lanes = <0>;
>>> +				clock-noncontinuous;
>>> +				link-frequencies = /bits/ 64 <216000000>;
>>> +			};
>>> +		};
>>> +	};
>>> +};
>>
>> -- 
>> Kind regards,
>>
>> Sakari Ailus
>> sakari.ailus@linux.intel.com
>>
> 
