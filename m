From: Ramiro Oliveira <Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/2] Add OV5647 device tree documentation
Date: Wed, 8 Jun 2016 14:18:10 +0100
Message-ID: <2b6eec93-78d6-2d53-054f-13ffd9dbc636@synopsys.com>
References: <cover.1464966020.git.roliveir@synopsys.com>
 <4221809485a46dbf12b883a8207784553fd776a3.1464966020.git.roliveir@synopsys.com>
 <20160606143837.GA22997@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160606143837.GA22997@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Ramiro Oliveira <Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, CARLOS.PALMINHA-HKixBCOQz3hWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 06-06-2016 15:38, Rob Herring wrote:
> On Fri, Jun 03, 2016 at 06:36:40PM +0100, Ramiro Oliveira wrote:
>> From: roliveir <roliveir-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>>
>> Signed-off-by: Ramiro Oliveira <roliveir-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>> ---
>>  .../devicetree/bindings/media/i2c/ov5647.txt          | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.txt
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5647.txt b/Documentation/devicetree/bindings/media/i2c/ov5647.txt
>> new file mode 100644
>> index 0000000..5e4aa49
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/i2c/ov5647.txt
>> @@ -0,0 +1,19 @@
>> +Omnivision OV5657 raw image sensor
> Still 5657?
Sorry, I thought I had changed it.
>> +---------------------------------
>> +
>> +OV5657 is a raw image sensor with MIPI CSI-2 and CCP2 image data interfaces
>> +and CCI (I2C compatible) control bus.
>> +
>> +Required properties:
>> +
>> +- compatible	: "ov5647";
> Needs vendor prefix?
I'll add the ovti prefix
>> +- reg		: I2C slave address of the sensor;
> What happened to the clocks property. I'm pretty sure the driver always 
> needs to know the input clock freq.
I've seen some drivers that don't make any reference to clock freq, but I can
add it, if you think it's necessary.
>> +
>> +The common video interfaces bindings (see video-interfaces.txt) should be
>> +used to specify link to the image data receiver. The OV5647 device
>> +node should contain one 'port' child node with an 'endpoint' subnode.
>> +
>> +Following properties are valid for the endpoint node:
>> +
>> +- data-lanes : (optional) specifies MIPI CSI-2 data lanes as covered in
>> +  video-interfaces.txt.  The sensor supports only two data lanes.
>> -- 
>> 2.8.1
>>
>>
Regards,
Ramiro
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
