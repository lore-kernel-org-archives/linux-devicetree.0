From: Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH] arm64: dts: msm: add PDC device bindings for sdm845
Date: Wed, 15 Aug 2018 09:40:21 -0600
Message-ID: <20180815154021.GN5081@codeaurora.org>
References: <20180814173058.26143-1-ilina@codeaurora.org>
 <153434688280.37448.5200368407995060713@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <153434688280.37448.5200368407995060713@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: andy.gross@linaro.org, bjorn.andersson@linaro.org, marc.zyngier@arm.com, rplsssn@codeaurora.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org, devicetree@vger.kernel.org, david.brown@linaro.org, evgreen@chromium.org, dianders@chromium.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 15 2018 at 09:28 -0600, Stephen Boyd wrote:
>Quoting Lina Iyer (2018-08-14 10:30:58)
>> Add PDC interrupt controller device bindings for SDM845.
>>
>> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> index 24e254efb9d1..399bfbd52c5b 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> @@ -1106,6 +1106,15 @@
>>                         };
>>                 };
>>
>> +               pdc: interrupt-controller@b220000 {
>
>Please sort this by unit address within the SoC node.
>
Ah, didn't realize that. Will fix.

-- Lina

>> +                       compatible = "qcom,sdm845-pdc";
>> +                       reg = <0xb220000 0x30000>;
>> +                       qcom,pdc-ranges = <0 512 94>, <94 641 15>, <115 662 7>;
>> +                       #interrupt-cells = <2>;
>> +                       interrupt-parent = <&intc>;
>> +                       interrupt-controller;
>> +               };
>> +
>>                 timer@17c90000 {
>>                         #address-cells = <1>;
>>                         #size-cells = <1>;
