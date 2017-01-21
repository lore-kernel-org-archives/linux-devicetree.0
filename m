From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCHv5 2/2] dt-bindings: iio: document MAX11100 ADC
Date: Sat, 21 Jan 2017 13:33:11 +0000
Message-ID: <8b5a8edf-b3d5-b979-d793-07615a6ae02b@kernel.org>
References: <1484757053-7102-1-git-send-email-jacopo+renesas@jmondi.org>
 <1484757053-7102-3-git-send-email-jacopo+renesas@jmondi.org>
 <ff915715-98c4-9792-eae7-9f466d5fa459@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ff915715-98c4-9792-eae7-9f466d5fa459-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 21/01/17 13:22, Jonathan Cameron wrote:
> On 18/01/17 16:30, Jacopo Mondi wrote:
>> Add device tree bindings documentation for Maxim MAX11100 single-channel
>> ADC
>>
>> Signed-off-by: Jacopo Mondi <jacopo+renesas-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>> Acked-by: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>
> Simple enough I'm happy to take it without bothering Rob or Mark. 
> However, any device tree bindings at all should be cc'd to them and to the devicetree
> list.
> 
> Done in case anyone wants to comment.

Also applied to the togreg branch of iio.git which is pushed out as testing for
the autobuilders to play with everything in it.

Thanks,

Jonathan
>> ---
>>  .../devicetree/bindings/iio/adc/max11100.txt          | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/iio/adc/max11100.txt
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/max11100.txt b/Documentation/devicetree/bindings/iio/adc/max11100.txt
>> new file mode 100644
>> index 0000000..ad0bc31
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/max11100.txt
>> @@ -0,0 +1,19 @@
>> +* Maxim max11100 Analog to Digital Converter (ADC)
>> +
>> +Required properties:
>> +  - compatible: Should be "maxim,max11100"
>> +  - reg: the adc unit address
>> +  - vref-supply: phandle to the regulator that provides reference voltage
>> +
>> +Optional properties:
>> +  - spi-max-frequency: SPI maximum frequency
>> +
>> +Example:
>> +
>> +max11100: adc@0 {
>> +        compatible = "maxim,max11100";
>> +        reg = <0>;
>> +        vref-supply = <&adc0_vref>;
>> +        spi-max-frequency = <240000>;
>> +};
>> +
>>
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
