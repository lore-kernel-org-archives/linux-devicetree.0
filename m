From: Sricharan R <sricharan@codeaurora.org>
Subject: Re: [PATCH 5/6] arm64: dts: Add ipq6018 SoC and CP01 board support
Date: Mon, 10 Jun 2019 15:39:56 +0530
Message-ID: <50231fba-7212-f8b9-9313-0c79294d4cc6@codeaurora.org>
References: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org>
 <1559754961-26783-6-git-send-email-sricharan@codeaurora.org>
 <CAAd0S9DKqAgFPgLzHiCBiJgE+OmUW7ainyjM_3-RyfCoKEa51A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAd0S9DKqAgFPgLzHiCBiJgE+OmUW7ainyjM_3-RyfCoKEa51A@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Lamparter <chunkeey@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, agross@kernel.org, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, =?UTF-8?B?0J/QsNCy0LXQuw==?= <be.dissent@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Christian,

On 6/6/2019 2:11 AM, Christian Lamparter wrote:
> On Wed, Jun 5, 2019 at 7:16 PM Sricharan R <sricharan@codeaurora.org> wrote:
>>
>> Add initial device tree support for the Qualcomm IPQ6018 SoC and
>> CP01 evaluation board.
>>
>> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
>> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>>
>> +       clocks {
>> +               sleep_clk: sleep_clk {
>> +                       compatible = "fixed-clock";
>> +                       clock-frequency = <32000>;
>> +                       #clock-cells = <0>;
>> +               };
>> +
> Recently-ish, we ran into an issue with the clock-frequency of the sleep_clk
> on older IPQ40XX (and IPQ806x) on the OpenWrt Github and ML.
> From what I know, the external "32KHz" crystals have 32768 Hz, but the QSDK
> declares them at 32000 Hz. Since you probably have access to the BOM and
> datasheets. Can you please confirm what's the real clock frequency for
> the IPQ6018.
> (And maybe also for the sleep_clk of the IPQ4018 as well?).
> 

What exactly is the issue that you faced ?
Looking in to the docs, it is <32000> only on ipq6018 and ipq40xx as well.

Regards,
 Sricharan

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
