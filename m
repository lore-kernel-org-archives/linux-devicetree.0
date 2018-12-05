From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v5 7/8] arm64: dts: sdm845: Add rpmh powercontroller node
Date: Wed, 5 Dec 2018 12:37:29 +0530
Message-ID: <f6c6f238-0d5e-e47c-caf7-7e45bd1327dc@codeaurora.org>
References: <20181204052119.806-1-rnayak@codeaurora.org>
 <20181204052119.806-8-rnayak@codeaurora.org>
 <154396536335.88331.9265777410326926096@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154396536335.88331.9265777410326926096@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, andy.gross@linaro.org, collinsd@codeaurora.org, mka@chromium.org, robh@kernel.org, ulf.hansson@linaro.org, viresh.kumar@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 12/5/2018 4:46 AM, Stephen Boyd wrote:
> Quoting Rajendra Nayak (2018-12-03 21:21:18)
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> index b72bdb0a31a5..a6d0cd8d17b0 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> @@ -1324,6 +1325,56 @@
>>                                  compatible = "qcom,sdm845-rpmh-clk";
>>                                  #clock-cells = <1>;
>>                          };
>> +
>> +                       rpmhpd: power-controller {
>> +                               compatible = "qcom,sdm845-rpmhpd";
>> +                               #power-domain-cells = <1>;
>> +                               operating-points-v2 = <&rpmhpd_opp_table>;
>> +                       };
>> +
>> +                       rpmhpd_opp_table: opp-table {
> 
> This table should go somewhere else? I don't understand why it's in the
> rpmh node because it's not an rpmh device. Does it go to the root? Or
> does it go under rpmhpd itself? I'm not sure.

I could move it to root perhaps, we seem to do that atleast in the case of
GPU. The power domain bindings (Documentation/devicetree/bindings/power/power_domain.txt)
seem to suggest it can't be under the power-controller node itself.
