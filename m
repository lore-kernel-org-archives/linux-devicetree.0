From: "Wu, Songjun" <songjun.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] [media] atmel-isc: DT binding for Image Sensor
 Controller driver
Date: Wed, 20 Apr 2016 10:50:28 +0800
Message-ID: <5716EE74.6040107@atmel.com>
References: <1460533460-32336-1-git-send-email-songjun.wu@atmel.com>
 <1460533460-32336-3-git-send-email-songjun.wu@atmel.com>
 <20160414152933.GA14073@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160414152933.GA14073@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: g.liakhovetski-Mmb7MZpHnFY@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 4/14/2016 23:29, Rob Herring wrote:
> On Wed, Apr 13, 2016 at 03:44:20PM +0800, Songjun Wu wrote:
>> DT binding documentation for ISC driver.
>>
>> Signed-off-by: Songjun Wu <songjun.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
>> ---
>>
>>   .../devicetree/bindings/media/atmel-isc.txt        | 84 ++++++++++++++++++++++
>>   1 file changed, 84 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/atmel-isc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/media/atmel-isc.txt b/Documentation/devicetree/bindings/media/atmel-isc.txt
>> new file mode 100644
>> index 0000000..449f05f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/atmel-isc.txt
>> @@ -0,0 +1,84 @@
>> +Atmel Image Sensor Controller (ISC)
>> +----------------------------------------------
>> +
>> +Required properties:
>> +- compatible
>> +	Must be "atmel,sama5d2-isc"
>> +- reg
>> +	Physical base address and length of the registers set for the device;
>> +- interrupts
>> +  Should contain IRQ line for the ISI;
>> +- clocks
>> +	List of clock specifiers, corresponding to entries in
>> +	the clock-names property;
>> +	Please refer to clock-bindings.txt.
>> +- clock-names
>> +	Required elements: "hclock", "ispck".
>> +- pinctrl-names, pinctrl-0
>> +	Please refer to pinctrl-bindings.txt.
>> +- clk_in_isc
>
> No underscores and this needs a better explanation.
>
Accept.
This is a node includes the isc internal clocks.
Maybe it should be 'List of ISC interal clocks'.
Do you think it's better?
Thank you.

>> +	ISC internal clock node, it includes the isc_ispck and isc_mck.
>> +	Please refer to clock-bindings.txt.
>> +- atmel,sensor-preferred
>> +	Sensor is preferred to process image (1-preferred, 0-not).
>> +	The default value is 1.
>
> This seems a bit questionable.
>
ISC has an internal image processor, it can convert raw format to the 
other format, like YUYV format. If user want to output YUYV format, ISC 
driver has two choices, one is sensor output YUYV format, ISC does not 
do any process, the other is sensor output raw format, ISC converts raw 
format to YUYV format.
But how to choose? I set a option 'atmel,sensor-preferred' in dts to let 
user decide.

>> +
>> +ISC supports a single port node with parallel bus. It should contain one
>> +'port' child node with child 'endpoint' node. Please refer to the bindings
>> +defined in Documentation/devicetree/bindings/media/video-interfaces.txt.
>> +
>> +Example:
>> +isc: isc@f0008000 {
>> +	compatible = "atmel,sama5d2-isc";
>> +	reg = <0xf0008000 0x4000>;
>> +	interrupts = <46 IRQ_TYPE_LEVEL_HIGH 5>;
>> +	clocks = <&isc_clk>, <&isc_ispck>;
>> +	clock-names = "hclock", "ispck";
>> +	atmel,sensor-preferred = <1>;
>> +
>> +	port {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		isc_0: endpoint@0 {
>
> Don't need a unit address for a single endpoint.
>
Yes, it's a single endpoint.
But we can create more endpoints, but only one endpoint will be 
effective. If you want to change the sensor, you can use the same dtb 
file. It's convenient for user.

>> +			remote-endpoint = <&ov7740_0>;
>> +			hsync-active = <1>;
>> +			vsync-active = <0>;
>> +			pclk-sample = <1>;
>
> Are these documented? They are really properties of the sensor and
> should be part of the sensor node.
>
Accept. It should be part of the sensor node.
Thank you.

>> +		};
>> +	};
>> +
>> +	clk_in_isc {
>
> Completely missed this is a node from the above description. I should be
> able to write or validate the example from the description.
>
> I think perhaps you should just drop all this from the DT, just list the
> input clocks, and make the ISC node the clock controller.
>
I think this node is needed. ISC will provide the clock to sensor, we 
need create the corresponding clock node int DT file, then the sensor 
will get this clock and set the clock rate in DT file

>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		isc_ispck: isc_ispck {
>
> No underscores in node names.
Accept, thank you.

>
>> +			#clock-cells = <0>;
>> +			reg = <0>;
>
> Drop or you need a unit address.
>
OK, I will set a unit address.

>> +			clocks = <&isc_clk>, <&iscck>;
>> +		};
>> +
>> +		isc_mck: isc_mck {
>> +			#clock-cells = <0>;
>> +			reg = <1>;
>> +			clocks = <&isc_clk>, <&iscck>, <&isc_gclk>;
>> +		};
>> +	};
>> +};
>> +
>> +i2c1: i2c@fc028000 {
>> +	ov7740: camera@0x21 {
>
> Drop "0x"
>
Accept, thank you.

>> +	compatible = "ovti,ov7740";
>> +	reg = <0x21>;
>> +
>> +	clocks = <&isc_mck>;
>> +	clock-names = "xvclk";
>> +	assigned-clocks = <&isc_mck>;
>> +	assigned-clock-rates = <24000000>;
>> +
>> +	port {
>> +		ov7740_0: endpoint {
>> +			remote-endpoint = <&isc_0>;
>> +		};
>> +	};
>> +};
>> --
>> 2.7.4
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
