From: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: ad5272: Add bindings for Analog
 Devices digital potentiometers
Date: Mon, 5 Feb 2018 15:25:59 +0800
Message-ID: <f1d2bf62-c4b7-9cd4-4962-3c07c22bdb5e@electromag.com.au>
References: <1517231574-92777-1-git-send-email-preid@electromag.com.au>
 <1517231574-92777-2-git-send-email-preid@electromag.com.au>
 <20180205060729.ux62jvdsy4d37s4x@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180205060729.ux62jvdsy4d37s4x@rob-hp-laptop>
Content-Language: en-AU
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Michael.Hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 5/02/2018 14:07, Rob Herring wrote:
> On Mon, Jan 29, 2018 at 09:12:53PM +0800, Phil Reid wrote:
>> Add binding documentation for Analog Devices AD5272 and AD5274 digital
>> potentiometer devices.
>>
>> Signed-off-by: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
>> ---
>>   .../bindings/iio/potentiometer/ad5272.txt          | 27 ++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/iio/potentiometer/ad5272.txt
>>
>> diff --git a/Documentation/devicetree/bindings/iio/potentiometer/ad5272.txt b/Documentation/devicetree/bindings/iio/potentiometer/ad5272.txt
>> new file mode 100644
>> index 0000000..11e804c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/potentiometer/ad5272.txt
>> @@ -0,0 +1,27 @@
>> +* Analog Devices AD5272 digital potentiometer driver
> 
> Bindings describe h/w not drivers.
ok

> 
>> +
>> +The node for this driver must be a child node of a I2C controller, hence
>> +all mandatory properties for your controller must be specified. See directory:
>> +
>> +        Documentation/devicetree/bindings/i2c
>> +
>> +for more details.
>> +
>> +Required properties:
>> +	- compatible:  	Must be one of the following, depending on the model:
>> +			adi,ad5272-020
>> +			adi,ad5272-050
>> +			adi,ad5272-100
>> +			adi,ad5274-020
>> +			adi,ad5274-100
>> +
>> +Optional properties:
>> + - reset-gpios: GPIO specification for the RESET input. This is an
>> +		active low signal to the PCA953x.
>> +
>> +Example:
>> +ad5272: ad5272@2f {
> 
> potentiometer@2f
ok

> 
> Probably a node name we need to add to the spec.
> 
>> +	reg = <0x2F>;
>> +	compatible = "adi,ad5272-020";
>> +	reset-gpios = <&gpio3 6 GPIO_ACTIVE_HIGH>;
>> +};
>> -- 
>> 1.8.3.1
>>
> 
> 
Jonathan,

How would you like me to fix this as you've applied it to togreg already?
A patch on top of this or a v5.


-- 
Regards
Phil Reid

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
