From: Rocky Liao <rjliao@codeaurora.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: net: bluetooth: Add device property
 firmware-name for QCA6174
Date: Fri, 03 May 2019 15:56:23 +0800
Message-ID: <17221139821fb6ee35f3119df7405401@codeaurora.org>
References: <1554368908-22017-2-git-send-email-rjliao@codeaurora.org>
 <1554888476-17560-1-git-send-email-rjliao@codeaurora.org>
 <A85D7982-E000-4A5F-9927-CA36E0BA60F2@holtmann.org>
 <7e0cf9ba98260309c43d9d6e63dead6c@codeaurora.org>
 <CAL_JsqLnM4XqQTCT7VTUSmukujz0VHJoCbXMF2--RmTEx_LZww@mail.gmail.com>
 <60C7AC89-37B6-441C-9349-BCB15717EB2C@holtmann.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <60C7AC89-37B6-441C-9349-BCB15717EB2C@holtmann.org>
Sender: netdev-owner@vger.kernel.org
To: Marcel Holtmann <marcel@holtmann.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Johan Hedberg <johan.hedberg@gmail.com>, Thierry Escande <thierry.escande@linaro.org>, netdev <netdev@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel@vger.kernel.org, "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Balakrishna Godavarthi <bgodavar@codeaurora.org>, linux-bluetooth-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Marcel,

On 2019-04-27 13:59, Marcel Holtmann wrote:
> Hi Rob,
> 
>>>>> This patch adds an optional device property "firmware-name" to 
>>>>> allow
>>>>> the
>>>>> driver to load customized nvm firmware file based on this property.
>>>>> 
>>>>> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
>>>>> ---
>>>>> Changes in v3:
>>>>> * added firmware-name instead of nvm-postfix to specify full 
>>>>> firmware
>>>>> name
>>>>> ---
>>>>> Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt | 2 ++
>>>>> 1 file changed, 2 insertions(+)
>>>>> 
>>>>> diff --git
>>>>> a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
>>>>> b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
>>>>> index 824c0e2..2bcea50 100644
>>>>> --- a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
>>>>> +++ b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
>>>>> @@ -16,6 +16,7 @@ Optional properties for compatible string
>>>>> qcom,qca6174-bt:
>>>>> 
>>>>> - enable-gpios: gpio specifier used to enable chip
>>>>> - clocks: clock provided to the controller (SUSCLK_32KHZ)
>>>>> + - firmware-name: specify the name of nvm firmware to load
>>>>> 
>>>>> Required properties for compatible string qcom,wcn3990-bt:
>>>>> 
>>>>> @@ -39,6 +40,7 @@ serial@7570000 {
>>>>> 
>>>>>             enable-gpios = <&pm8994_gpios 19 GPIO_ACTIVE_HIGH>;
>>>>>             clocks = <&divclk4>;
>>>>> +            firmware-name = "nvm_00440302.bin";
>>>>>     };
>>>> 
>>>> and how is this a firmware-name property. Wouldn’t this be more like
>>>> nvm-file or something along these lines. This really needs to be
>>>> cleared with Rob to pick the right property name.
>>>> 
>>>> Regards
>>>> 
>>>> Marcel
>>> 
>>> Hi Rob,
>>> 
>>> Are you OK to use a property name "nvm-file" or "firmware-nvm-file"?
>>> Actually we have two firmware files, one is the patch file which is
>>> common to all of the products, the other is the nvm file which is
>>> customized. Using a "nvm-file" or "firmware-nvm-file" property name
>>> would be more clear.
>> 
>> 'firmware-name' is the standard name for specifying firmware file 
>> names.
> 
> but it is not a firmware file, it is a NVM file. What happens if in
> the future they need a firmware file and a NVM file?
> 
> Regards
> 
> Marcel

We won't need to specify a rampatch firmware file in future as it's a 
same file for all the boards with same chip, only the NVM firmware file 
may have board differences. NVM file is also one of the firmware files 
so I think it should be OK to use "firmware-name" property to specify 
it.

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
