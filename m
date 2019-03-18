From: Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH v4 06/10] dt-bindings: sdm845-pinctrl: add wakeup
 interrupt parent for GPIO
Date: Mon, 18 Mar 2019 09:37:58 -0600
Message-ID: <20190318153758.GB30156@codeaurora.org>
References: <20190313211844.29416-1-ilina@codeaurora.org>
 <20190313211844.29416-7-ilina@codeaurora.org>
 <20190315233748.GA7219@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190315233748.GA7219@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: swboyd@chromium.org, evgreen@chromium.org, marc.zyngier@arm.com, linux-kernel@vger.kernel.org, rplsssn@codeaurora.org, linux-arm-msm@vger.kernel.org, thierry.reding@gmail.com, bjorn.andersson@linaro.org, dianders@chromium.org, linus.walleij@linaro.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Thanks for the review Rob.

On Fri, Mar 15 2019 at 17:37 -0600, Rob Herring wrote:
>On Wed, Mar 13, 2019 at 03:18:40PM -0600, Lina Iyer wrote:
>> SDM845 SoC has an always-on interrupt controller (PDC) with select GPIO
>> routed to the PDC as interrupts that can be used to wake the system up
>> from deep low power modes and suspend.
>>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
>> ---
>>  .../devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt    | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>
>I still don't love this being specific to wake-up, but don't have a
>better suggestion. One nit, otherwise:
>
I added this to interrupts.txt. I will remove this, if the documentation in
[PATCH v4 03/10] of/irq: document properties for wakeup interrupt parent
of this series works.

-- Lina

>Reviewed-by: Rob Herring <robh@kernel.org>
>
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
>> index 665aadb5ea28..f0fedbc5d41a 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
>> @@ -29,6 +29,11 @@ SDM845 platform.
>>  	Definition: must be 2. Specifying the pin number and flags, as defined
>>  		    in <dt-bindings/interrupt-controller/irq.h>
>>
>> +- wakeup-parent:
>> +	Usage: optional
>> +	Value type: <phandle>
>> +	Definition: A phandle to the wakeup interrupt controller for the SoC.
>> +
>>  - gpio-controller:
>>  	Usage: required
>>  	Value type: <none>
>> @@ -53,7 +58,6 @@ pin, a group, or a list of pins or groups. This configuration can include the
>>  mux function to select on those pin(s)/group(s), and various pin configuration
>>  parameters, such as pull-up, drive strength, etc.
>>
>> -
>>  PIN CONFIGURATION NODES:
>>
>>  The name of each subnode is not important; all subnodes should be enumerated
>> @@ -160,6 +164,7 @@ Example:
>>  		#gpio-cells = <2>;
>>  		interrupt-controller;
>>  		#interrupt-cells = <2>;
>> +		wake-parent = <&pdc_intc>;
>
>wakeup-parent
>
>>
>>  		qup9_active: qup9-active {
>>  			mux {
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
