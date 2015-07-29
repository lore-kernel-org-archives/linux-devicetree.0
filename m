From: Tim Bird <tim.bird-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Subject: Re: [PATCH v3 1/3] ARM: dts: qcom: Add binding for the qcom coincell
 charger
Date: Wed, 29 Jul 2015 11:12:30 -0700
Message-ID: <55B9178E.6030700@sonymobile.com>
References: <1437090933-1232-1-git-send-email-tim.bird@sonymobile.com> <CAL_Jsq+5zzw1+gper6uwac-3P9zVN=rjjPb7Za27t=RbPU2-1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+5zzw1+gper6uwac-3P9zVN=rjjPb7Za27t=RbPU2-1w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?IkFuZGVyc3NvbiwgQmrDtnJuIg==?= <Bjorn.Andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Greg,

At this point I've got Reviewed-by from Rob on the binding and dts bits,
and Reviewed-by from Andy Gross on the complete patch series (v3).

I believe I've addressed all issues raised. Can you please add this
(v3) to drivers/misc?

Let me know if you want me to re-send anything.

Thanks very much.
 -- Tim


On 07/17/2015 08:42 AM, Rob Herring wrote:
> On Thu, Jul 16, 2015 at 6:55 PM, Tim Bird <tim.bird-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org> wrote:
>> This binding is used to configure the driver for the coincell charger
>> found in Qualcomm PMICs.
>>
>> Signed-off-by: Tim Bird <tim.bird-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
> 
> Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
>> ---
>>
>> Changes in v3:
>>  - change charge-enable property to charger-disable
>> Changes in v2:
>>  - remove 'qcom,' from example node name
>>  - Added reference to parent node pm8941@0 and binding doc for it
>>
>>  .../bindings/power/qcom,coincell-charger.txt       | 48 ++++++++++++++++++++++
>>  1 file changed, 48 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/power/qcom,coincell-charger.txt
>>
>> diff --git a/Documentation/devicetree/bindings/power/qcom,coincell-charger.txt b/Documentation/devicetree/bindings/power/qcom,coincell-charger.txt
>> new file mode 100644
>> index 0000000..0e6d875
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/power/qcom,coincell-charger.txt
>> @@ -0,0 +1,48 @@
>> +Qualcomm Coincell Charger:
>> +
>> +The hardware block controls charging for a coincell or capacitor that is
>> +used to provide power backup for certain features of the power management
>> +IC (PMIC)
>> +
>> +- compatible:
>> +       Usage: required
>> +       Value type: <string>
>> +       Definition: must be: "qcom,pm8941-coincell"
>> +
>> +- reg:
>> +       Usage: required
>> +       Value type: <u32>
>> +       Definition: base address of the coincell charger registers
>> +
>> +- qcom,rset-ohms:
>> +       Usage: required
>> +       Value type: <u32>
>> +       Definition: resistance (in ohms) for current-limiting resistor
>> +               must be one of: 800, 1200, 1700, 2100
>> +
>> +- qcom,vset-millivolts:
>> +       Usage: required
>> +       Value type: <u32>
>> +       Definition: voltage (in millivolts) to apply for charging
>> +               must be one of: 2500, 3000, 3100, 3200
>> +
>> +- qcom,charger-disable:
>> +       Usage: optional
>> +       Value type: <boolean>
>> +       Definition: definining this property disables charging
>> +
>> +This charger is a sub-node of one of the 8941 PMIC blocks, and is specified
>> +as a child node in DTS of that node.  See ../mfd/qcom,spmi-pmic.txt and
>> +../mfd/qcom-pm8xxx.txt
>> +
>> +Example:
>> +
>> +       pm8941@0 {
>> +               coincell@2800 {
>> +                       compatible = "qcom,pm8941-coincell";
>> +                       reg = <0x2800>;
>> +
>> +                       qcom,rset-ohms = <2100>;
>> +                       qcom,vset-millivolts = <3000>;
>> +               };
>> +       };
>> --
>> 1.8.2.2
>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
