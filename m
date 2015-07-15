From: Tim Bird <tim.bird@sonymobile.com>
Subject: Re: [PATCH 1/3] ARM: dts: qcom: Add binding for the qcom coincell
 charger
Date: Wed, 15 Jul 2015 11:24:29 -0700
Message-ID: <55A6A55D.8000209@sonymobile.com>
References: <1436830772-32632-1-git-send-email-tim.bird@sonymobile.com> <CAL_JsqJ4poHe_644aOooAXJqwSvTW-3NPCFJ7LmaBj=wAQQp1w@mail.gmail.com> <55A58221.7040004@sonymobile.com> <CAL_Jsq+FUCvQgicWkJLQOVTSijWxqDyWDKwJgFr85KAvtC=bkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+FUCvQgicWkJLQOVTSijWxqDyWDKwJgFr85KAvtC=bkg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?B?IkFuZGVyc3NvbiwgQmrDtnJuIg==?= <Bjorn.Andersson@sonymobile.com>, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org

On 07/14/2015 06:07 PM, Rob Herring wrote:
> On Tue, Jul 14, 2015 at 4:41 PM, Tim Bird <tim.bird@sonymobile.com> wrote:
>> Rob,
>>
>> Thanks for the quick feedback.  You responded off-list.  I don't know if
>> you meant to do this or not.  My response is off-list as well, but let me
>> know if I should have responded on-list, or set something differently in
>> my original e-mail.
> 
> Didn't mean to do that. Added back now.
> 
> Also adding Mark B in case he has any comments with respect to regulators.
> 
>>
>> On 07/13/2015 08:59 PM, Rob Herring wrote:
>>> On Mon, Jul 13, 2015 at 6:39 PM, Tim Bird <tim.bird@sonymobile.com> wrote:
>>>> This binding is used to configure the driver for the coincell charger
>>>> found in Qualcomm PMICs.
>>>>
>>>> Signed-off-by: Tim Bird <tim.bird@sonymobile.com>
>>>> ---
>>>>  .../bindings/power/qcom,coincell-charger.txt       | 44 ++++++++++++++++++++++
>>>>  1 file changed, 44 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/power/qcom,coincell-charger.txt
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/power/qcom,coincell-charger.txt b/Documentation/devicetree/bindings/power/qcom,coincell-charger.txt
>>>> new file mode 100644
>>>> index 0000000..bf39e2a
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/power/qcom,coincell-charger.txt
>>>> @@ -0,0 +1,44 @@
>>>> +Qualcomm Coincell Charger:
>>>> +
>>>> +The hardware block controls charging for a coincell or capacitor that is
>>>> +used to provide power backup for certain features of the power management
>>>> +IC (PMIC)
>>>> +
>>>
>>> Would the regulator binding work for this? I ask mainly because that
>>> is what FSL mc13892 coincell charger already uses.
>>
>> I could use the regulator binding, but I think it would imply
>> more functionality than the driver supports.  The regulator
>> binding docs list lots of (admittedly optional) attributes that
>> don't really apply.
>>
>> I looked at the mc13892 binding, and I didn't like it too much,
>> because it doesn't really indicate what the allowed values are
>> for the regulator -- but it's possible on that hardware that it's
>> acting like a normal regulator with a fine-grained range of
>> voltage outputs and other configurable attributes.
>>
>> This is really just 2 values and an enable bit and I think
>> the mapping from the regulator attributes to this is not a
>> good fit.
> 
> Okay.
> 
>>>
>>>> +- compatible:
>>>> +       Usage: required
>>>> +       Value type: <string>
>>>> +       Definition: must be: "qcom,pm8941-coincell"
>>>> +
>>>> +- reg:
>>>> +       Usage: required
>>>> +       Value type: <u32>
>>>> +       Definition: base address of the coincell charger registers
>>>> +
>>>> +- qcom,rset-ohms:
>>>> +       Usage: required
>>>> +       Value type: <u32>
>>>> +       Definition: resistance (in ohms) for current-limiting resistor
>>>> +               must be one of: 800, 1200, 1700, 2100
>>>
>>> Can you define the current limit and then calculate the resistor value
>>> to use in the driver? Current is ultimately what the battery is
>>> spec'ed to.
>>
>> It's possible, but not very useful.  The resistor is one of 4 values,
>> and specifies exactly what the hardware is doing.  Specifying the current
>> limit is imprecise, and would have to be mapped onto the correct
>> resistor value (depending on the voltage) by the driver.
>>
>> Besides being imprecise, however, it's not how these things are usually
>> specified.  The SoC specification, system configuration and schematics
>> list the resistor value, and the data sheet for the coincell itself
>> usually specifies a recommended voltage and resistor value.
> 
> Okay, if that is how things are spec'ed with batteries then I'm okay with it.
> 
>> So if we specify the max current then developers setting this
>> would need to translate the numbers to what the dt expects, so
>> that the driver can reverse that math and fit it to one of the
>> supported values.
>>
>>>
>>>> +- qcom,vset-millivolts:
>>>> +       Usage: required
>>>> +       Value type: <u32>
>>>> +       Definition: voltage (in millivolts) to apply for charging
>>>> +               must be one of: 2500, 3000, 3100, 3200
>>>> +
>>>> +- qcom,charge-enable:
>>>> +       Usage: optional
>>>> +       Value type: <u32> or <none>
>>>> +       Definition: definining this property, with an optional non-zero
>>>> +               value, enables charging
>>>
>>> I'm not sure that this belongs in DT. Don't you want to enable
>>> charging when plugged in perhaps or at some voltage threshold?
>>
>> In practice this is never changed at runtime. It's only set at kernel boot.
>> The main use of this is to override (either on or off) whatever the firmware
>> did.
> 
> If your firmware and dtb are separate from your kernel, then ... (well
> you know where I'm headed :) ).

Sorry, I have no idea how the sentence would end, so I think I'm missing
where you are headed.

> If we do keep this, I think it should be a disable property with not
> present being the default and enabling charging. Also, it only needs
> to be bool (i.e. no value).

Are you suggesting something like this, then?

  - qcom,charger-disable:
       Usage: optional
       Value type: <none>
       Definition: defining this property disables charging

The logic would be as follows:
 - if the developer wants to just use the firmware settings, then
  the kernel would just not define this dts node at all, and nothing
  would change on kernel boot
 - if the developers want to change the settings, either turning off
  the charger, or specifying desired settings, then they define
  the appropriate attributes.

I'm OK with that.

It would make no sense to define rset and vset values when this
is defined.  Should I note that somewhere in the binding doc?

Thanks.
 -- Tim
