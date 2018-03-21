Return-Path: <SRS0=kSoW=GL=codeaurora.org=rnayak@kernel.org>
Subject: Re: [PATCH v4 5/6] arm64: dts: sdm845: Add serial console support
References: <1521071931-9294-1-git-send-email-kramasub@codeaurora.org>
 <1521071931-9294-6-git-send-email-kramasub@codeaurora.org>
 <152157474508.187949.10348604942277810227@swboyd.mtv.corp.google.com>
From: Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <5e8bcb81-48c9-0c35-b9d8-35c40b03ab0c@codeaurora.org>
Date: Wed, 21 Mar 2018 14:07:53 +0530
MIME-Version: 1.0
In-Reply-To: <152157474508.187949.10348604942277810227@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Stephen Boyd <swboyd@chromium.org>, Karthikeyan Ramasubramanian <kramasub@codeaurora.org>, andy.gross@linaro.org, corbet@lwn.net, david.brown@linaro.org, gregkh@linuxfoundation.org, mark.rutland@arm.com, robh+dt@kernel.org, wsa@the-dreams.de
Cc: linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org, jslaby@suse.com, evgreen@chromium.org, acourbot@chromium.org
List-ID: <devicetree@vger.kernel.org>


On 3/21/2018 1:09 AM, Stephen Boyd wrote:
> Quoting Karthikeyan Ramasubramanian (2018-03-14 16:58:50)
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
>> index 979ab49..ea3efc5 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
>> @@ -12,4 +12,43 @@
>>   / {
>>          model = "Qualcomm Technologies, Inc. SDM845 MTP";
>>          compatible = "qcom,sdm845-mtp";
>> +
>> +       aliases {
>> +               serial0 = &uart2;
>> +       };
>> +
>> +       chosen {
>> +               stdout-path = "serial0";
> 
> Also add :115200n8 ?
> 
> 
>> +       };
>> +};
>> +
>> +&soc {
> 
> I think the method is to put these inside soc node without using the
> phandle reference. So indent everything once more.

Some of this was discussed in the previous versions [1] and we arrived
at a consensus to follow this way of doing it.
Bjorn also said he was going to do a series to move all the existing
dts files to follow similar convention so its all consistent.

https://lkml.org/lkml/2018/2/6/676

> 
>> +       geniqup@ac0000 {
>> +               serial@a84000 {
>> +                       status = "okay";
>> +               };
>> +       };
>> +
>> +       pinctrl@3400000 {
>> +               qup-uart2-default {
>> +                       pinconf_tx {
>> +                               pins = "gpio4";
>> +                               drive-strength = <2>;
>> +                               bias-disable;
>> +                       };
>> +
>> +                       pinconf_rx {
>> +                               pins = "gpio5";
>> +                               drive-strength = <2>;
>> +                               bias-pull-up;
>> +                       };
>> +               };
>> +
>> +               qup-uart2-sleep {
>> +                       pinconf {
>> +                               pins = "gpio4", "gpio5";
>> +                               bias-pull-down;
>> +                       };
>> +               };
>> +       };
>>   };
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> index 32f8561..59334d9 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> @@ -6,6 +6,7 @@
>>    */
>>   
>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +#include <dt-bindings/clock/qcom,gcc-sdm845.h>
>>   
>>   / {
>>          interrupt-parent = <&intc>;
>> @@ -194,6 +195,20 @@
>>                          #gpio-cells = <2>;
>>                          interrupt-controller;
>>                          #interrupt-cells = <2>;
>> +
>> +                       qup_uart2_default: qup-uart2-default {
>> +                               pinmux {
>> +                                       function = "qup9";
>> +                                       pins = "gpio4", "gpio5";
>> +                               };
>> +                       };
>> +
>> +                       qup_uart2_sleep: qup-uart2-sleep {
>> +                               pinmux {
>> +                                       function = "gpio";
>> +                                       pins = "gpio4", "gpio5";
>> +                               };
>> +                       };
> 
> Are these supposed to go to the board file?

Again, this was discussed in the previous versions, and we decided it
makes sense to have the pinmux (default) which rarely changes across
boards in the SoC file, and have boards specify the pinconf (electrical)
properties.
And get rid of all the soc-pins/board-pins/pmic-pins files.

https://lkml.org/lkml/2018/2/6/693

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
