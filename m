From: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 2/2] DT: iio: vadc: document dt binding
Date: Tue, 14 Oct 2014 12:27:27 +0300
Message-ID: <543CEC7F.50208@mm-sol.com>
References: <1411563415-11933-1-git-send-email-svarbanov@mm-sol.com> <1411563415-11933-3-git-send-email-svarbanov@mm-sol.com> <20141013150039.GB16598@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141013150039.GB16598@leverpostej>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Angelo Compagnucci <angelo.compagnucci-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Fugang Duan <B38611-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Johannes Thumshirn <johannes.thumshirn-csrFAY9JiS4@public.gmane.org>, Jean Delvare <jdelvare-l3A5Bk7waGM@public.gmane.org>, Philippe Reynes <tremyfr-Qt13gs6zZMY@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>Jo
List-Id: devicetree@vger.kernel.org

Mark,

Thanks for the comments!

On 10/13/2014 06:00 PM, Mark Rutland wrote:
> On Wed, Sep 24, 2014 at 01:56:55PM +0100, Stanimir Varbanov wrote:
>> Document DT binding for Qualcomm SPMI PMIC voltage ADC
>> driver.
>>
>> Signed-off-by: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Ivan T. Ivanov <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
>> ---
>>  .../devicetree/bindings/iio/adc/qcom,spmi-vadc.txt |  130 ++++++++++++++++++++
>>  1 files changed, 130 insertions(+), 0 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.txt b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.txt
>> new file mode 100644
>> index 0000000..fa30300
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.txt
>> @@ -0,0 +1,130 @@
>> +Qualcomm's SPMI PMIC voltage ADC
>> +
>> +SPMI PMIC voltage ADC (VADC) provides interface to clients to read
>> +voltage. A 15 bit ADC is used for voltage measurements. There are multiple
>> +peripherals to the VADC and the scope of the driver is to provide interface
>> +for the USR peripheral of the VADC.
>> +
>> +VADC node:
>> +
>> +- compatible:
>> +    Usage: required
>> +    Value type: <string>
> 
> Technically this is a list of strings.

true, will correct.

> 
>> +    Definition: Should contain "qcom,spmi-vadc".
>> +
>> +- reg:
>> +    Usage: required
>> +    Value type: <u32>
> 
> This is an address + size pair, not a u32 (following your example).
> 
>> +    Definition: Base address in the SPMI PMIC register map.
> 
> And the size, too.
> 

will rephrase.

>> +
>> +- address-cells:
>> +    Usage: required
>> +    Value type: <u32>
>> +    Definition: Must be one.
> 
> #address-cells.
> 
> What would this cell represent within the ADC?

"reg" property is used to describe ADC channel number in ADC child nodes.

> 
>> +
>> +- size-cells:
>> +    Usage: required
>> +    Value type: <u32>
>> +    Definition: Must be zero.
> 
> #size-cells.
> 
>> +
>> +- interrupts:
>> +    Usage: optional
>> +    Value type: <prop-encoded-array>
>> +    Definition: End of conversion interrupt number. If this property does
>> +            not exist polling will be used instead.
> 
> Just say "end of conversion interrupt". The interrupts property is
> standard, and driver behaviour is not a property of the device.

OK.

> 
>> +
>> +- interrupt-names:
>> +    Usage: optional
>> +    Value type: <string>
>> +    Definition: Should contain the interrupt name "eoc" (end of conversion).
> 
> If you wish to use interrupt-names, please define interrupts in terms of
> interrupt-names so as to make the relationship clear and to avoid
> redundancy.
> 
>> +
>> +Channel node properties:
>> +
>> +- reg:
>> +    Usage: required
>> +    Value type: <u32>
>> +    Definition: AMUX channel number.
>> +            See include/dt-bindings/iio/qcom,spmi-pmic-vadc.h
> 
> That header should be part of this patch (and this patch should come
> before the driver).

Sure will rebase the series.

> 
>> +
>> +- qcom,decimation:
>> +    Usage: optional
>> +    Value type: <u32>
>> +    Definition: Sampling rate to use for the individual channel measurement.
>> +            Quicker measurements can be made by reducing decimation ratio.
>> +            Valid values are 512, 1024, 2048, 4096.
>> +            If property is not found, default value of 512 will be used.
> 
> This description does not make sense. If reducing the value increases
> the sampling rate, this property should not be described as the
> "sampling rate".

I blindly copped above description from codeaurora kernel. From the
above I understand that reducing decimation ratio will decrease
conversion time.

Without go into signal processing theory, what about this:

Definition: Decimation factor per channel. Valid values are 512, 1024,
2048 and 4096.

I'm expecting the reader will be familiar enough how the decimation will
reflect on the data rate and conversion time.

> 
> This feels like something that should be runtime configurable rather
> than a fixed device property.

Currently the IIO hasn't generic way to configure such a properties.

Jonathan, could you share your opinion on that.

> 
>> +
>> +- qcom,pre-scaling:
>> +    Usage: optional
>> +    Value type: <u32 array>
>> +    Definition: Used for scaling the channel input signal before the signal is
>> +            fed to VADC. The configuration for this node is to know the
>> +            pre-determined ratio and use it for post scaling. Select one from
>> +            the following options.
>> +            <1 1>, <1 3>, <1 4>, <1 6>, <1 20>, <1 8>, <10 81>, <1 10>
>> +            If property is not found default value depending of chip will be used.
>> +
>> +- qcom,ratiometric:
>> +    Usage: optional
>> +    Value type: <empty>
>> +    Definition: Channel calibration type. If this property is specified
>> +            VADC will use the VDD reference(1.8V) and GND for channel
>> +            calibration. If property is not found, channel will be
>> +            calibrated with 625mV and 1.25V reference channels.
>> +            Otherwise the absolute calibration will be used.
> 
> Surely this should be part of the specifier?

Do you mean last sentence, if so no I'm not.

> 
>> +
>> +- qcom,hw-settle-time:
>> +    Usage: optional
>> +    Value type: <u32>
>> +    Definition: Time between AMUX getting configured and the ADC starting
>> +            conversion. Delay = 100us * (value) for value < 11, and
>> +            2ms * (value - 10) otherwise.
>> +            Valid values are: 0, 100, 200, 300, 400, 500, 600, 700, 800,
>> +            900 us and 1, 2, 4, 6, 8, 10 ms
>> +            If property is not found, channel will use 0us.
>> +
>> +- qcom,avg-samples:
>> +    Usage: optional
>> +    Value type: <u32>
>> +    Definition: Number of samples to be used for measurement.
>> +            Fast averaging provides the option to obtain a single measurement
>> +            from the ADC that is an average of multiple samples. The value
>> +            selected is 2^(value).
>> +            Valid values are: 1, 2, 4, 8, 16, 32, 64, 128, 256, 512
>> +            If property is not found, 1 sample will be used.
> 
> Likewise.

ditto

> 
> thanks,
> Mark.


-- 
regards,
Stan
