From: Rick Altherr <raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: dt-bindings: Document bindings for
 Aspeed AST2400/AST2500 ADC
Date: Mon, 6 Mar 2017 14:01:44 -0800
Message-ID: <CAPLgG=nkkom+zMTTJ-b-OUADAn2g=Hiupj6ku5pqheVnsJYYgg@mail.gmail.com>
References: <20170228201404.32125-1-raltherr@google.com> <20170303062131.u5gjyv2odbafkkpg@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170303062131.u5gjyv2odbafkkpg@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jdelvare-IBi9RG/b67k@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 2, 2017 at 10:21 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>  On Tue, Feb 28, 2017 at 12:14:03PM -0800, Rick Altherr wrote:
>> Signed-off-by: Rick Altherr <raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
>> ---
>>  .../devicetree/bindings/hwmon/aspeed_adc.txt       | 48 ++++++++++++++++++++++
>
> ADCs should really be documented in one place regardless of whether
> hwmon or IIO is used. Don't need to move it now, but certainly the
> bindings need to be compatible.
>

hwmon maintainers suggested IIO as well.  Looks like there is an IIO
to hwmon bridge so no concerns there.  I think IIO looks like a
plausible framework for this part based on my cursory look at the IIO
docs.  I'll be working on v2 as an IIO driver.

>>  1 file changed, 48 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/hwmon/aspeed_adc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed_adc.txt b/Documentation/devicetree/bindings/hwmon/aspeed_adc.txt
>> new file mode 100644
>> index 000000000000..9e481668c4d3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/aspeed_adc.txt
>> @@ -0,0 +1,48 @@
>> +Aspeed AST2400/2500 ADC
>> +
>> +This device is a 10-bit converter for 16 voltage channels.  All inputs are
>> +single ended.  Each channel can be individually enabled to allow for use of
>> +alternate pin functions.
>> +
>> +1) adc node
>> +
>> +  Required properties:
>> +  - compatible : Should be one of
>> +     "aspeed,ast2400-adc"
>> +     "aspeed,ast2500-adc"
>> +  - reg : memory window mapping address and length
>> +  - #address-cells : must be <1> corresponding to the channel child binding
>> +  - #size-cells : must be <0> corresponding to the channel child binding
>> +  - clocks : Input clock used to derive the sample clock. Expected to be the
>> +    SoC's APB clock.
>> +  - update-interval-ms : initial time between updates on a channel
>
> This is like sampling rate? I think we have a standard ADC property for
> that.
>

Will look.

>> +
>> +  The node contains child nodes for each channel that the platform uses.
>> +
>> +  Example adc node:
>> +    adc@1e6e9000 {
>> +     #address-cells = <1>;
>> +     #size-cells = <0>;
>> +     compatible = "aspeed,ast2400-adc";
>> +     reg = <0x1e6e9000 0xB0>;
>> +     clocks = <&clk_apb>;
>> +     update-interval-ms = <100>;
>> +
>> +     [ child node definitions... ]
>> +    };
>> +
>> +2) channel nodes
>> +
>> +  Optional properties:
>> +  - status: indicates the operational status of the device.
>> +    Value must be either "disabled" or "okay".
>
> Don't need to document this.
>

OK

>> +  - label : string describing the monitored value
>
> You need a reg property for the channel number.
>

Missed that when I fixed the code.  Will include in next revision.

>> +
>> +  Example channel node:
>> +  channel@1 {
>> +     status = "okay";
>> +     label = "3V3 rail";
>> +
>> +     pinctrl-names = "default";
>> +     pinctrl-0 = <&pinctrl_adc0_default>;
>
> Need to document these.

These are described in the pinctrl bindings.  I only put them in the
example as they will be commonly used together but the driver does not
use them.

>
>> +  };
>> --
>> 2.11.0.483.g087da7b7c-goog
>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
