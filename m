From: Ramiro Oliveira <Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v9 1/2] Add OV5647 device tree documentation
Date: Tue, 21 Feb 2017 20:13:16 +0000
Message-ID: <a2887a9a-0317-eb89-b971-9b238a214459@synopsys.com>
References: <cover.1487334912.git.roliveir@synopsys.com>
 <5a93352142495528dd56d5e281a8ed8ad6404a05.1487334912.git.roliveir@synopsys.com>
 <dd33c7bc-e6f7-c234-c3c6-6cc4c7353c68@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <dd33c7bc-e6f7-c234-c3c6-6cc4c7353c68-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Ramiro Oliveira <Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: CARLOS.PALMINHA-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Vladimir,

Thank you for your feedback

On 2/21/2017 3:58 PM, Vladimir Zapolskiy wrote:
> Hi Ramiro,
> 
> On 02/17/2017 03:14 PM, Ramiro Oliveira wrote:
>> Create device tree bindings documentation.
>>
>> Signed-off-by: Ramiro Oliveira <roliveir-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
>>  .../devicetree/bindings/media/i2c/ov5647.txt       | 35 ++++++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.txt
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5647.txt b/Documentation/devicetree/bindings/media/i2c/ov5647.txt
>> new file mode 100644
>> index 000000000000..31956426d3b9
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/i2c/ov5647.txt
>> @@ -0,0 +1,35 @@
>> +Omnivision OV5647 raw image sensor
>> +---------------------------------
>> +
>> +OV5647 is a raw image sensor with MIPI CSI-2 and CCP2 image data interfaces
>> +and CCI (I2C compatible) control bus.
>> +
>> +Required properties:
>> +
>> +- compatible		: "ovti,ov5647".
>> +- reg			: I2C slave address of the sensor.
>> +- clocks		: Reference to the xclk clock.
> 
> Is "xclk" clock a pixel clock or something else?
> 

It's an external oscillator.

>> +- clock-names		: Should be "xclk".
> 
> You can remove this property, because there is only one source clock.
> 

Ok.

>> +- clock-frequency	: Frequency of the xclk clock.
> 
> And after the last updates in the driver this property can be removed as well.
> 

But I'm still using clk_get_rate in the driver, if I remove the frequency here
the probing will fail.

>> +
>> +The common video interfaces bindings (see video-interfaces.txt) should be
>> +used to specify link to the image data receiver. The OV5647 device
>> +node should contain one 'port' child node with an 'endpoint' subnode.
>> +
>> +Example:
>> +
>> +	i2c@2000 {
>> +		...
>> +		ov: camera@36 {
>> +			compatible = "ovti,ov5647";
>> +			reg = <0x36>;
>> +			clocks = <&camera_clk>;
>> +			clock-names = "xclk";
>> +			clock-frequency = <25000000>;
> 
> When you remove two unused properties, please don't forget to update the
> example.
> 

Ok.

>> +			port {
>> +				camera_1: endpoint {
>> +					remote-endpoint = <&csi1_ep1>;
>> +				};
>> +			};
>> +		};
>> +	};
>>
> 
> --
> With best wishes,
> Vladimir
> 

-- 
Best Regards

Ramiro Oliveira
Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
