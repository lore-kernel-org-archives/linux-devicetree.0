From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v3 5/7] dt-bindings: power: Add qcom rpmh power domain
 driver bindings
Date: Tue, 12 Jun 2018 12:10:49 +0530
Message-ID: <8aae8809-77e0-9aa7-0c90-1e6d956ab81e@codeaurora.org>
References: <20180612044052.4402-1-rnayak@codeaurora.org>
 <20180612044052.4402-6-rnayak@codeaurora.org>
 <20180612053953.GA18050@builder>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180612053953.GA18050@builder>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: viresh.kumar@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, ulf.hansson@linaro.org, collinsd@codeaurora.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 06/12/2018 11:09 AM, Bjorn Andersson wrote:
> On Mon 11 Jun 21:40 PDT 2018, Rajendra Nayak wrote:
> 
>> Add DT bindings to describe the rpmh powerdomains found on Qualcomm
>> Technologies, Inc. SoCs. These power domains communicate a performance
>> state to RPMh, which then translates it into corresponding voltage on
>> a PMIC rail.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>>  .../devicetree/bindings/power/qcom,rpmhpd.txt | 65 +++++++++++++++++++
>>  1 file changed, 65 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/power/qcom,rpmhpd.txt
>>
>> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmhpd.txt b/Documentation/devicetree/bindings/power/qcom,rpmhpd.txt
>> new file mode 100644
>> index 000000000000..41ef7afa6b24
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/power/qcom,rpmhpd.txt
>> @@ -0,0 +1,65 @@
>> +Qualcomm RPMh Power domains
>> +
>> +For RPMh Power domains, we communicate a performance state to RPMh
>> +which then translates it into a corresponding voltage on a rail
>> +
>> +Required Properties:
>> + - compatible: Should be one of the following
>> +	* qcom,sdm845-rpmhpd: RPMh Power domain for the sdm845 family of SoC
> 
> Afaict this binding is identical to the one introduced in patch 1, so I
> would suggest that you just add the compatible there.

Sure, makes sense. thanks.

> 
> Regards,
> Bjorn
> 
>> + - power-domain-cells: number of cells in power domain specifier
>> +	must be 1
>> + - operating-points-v2: Phandle to the OPP table for the power-domain.
>> +	Refer to Documentation/devicetree/bindings/power/power_domain.txt
>> +	and Documentation/devicetree/bindings/opp/qcom-opp.txt for more details
>> +
>> +Example:
>> +
>> +	rpmhpd: power-controller {
>> +		compatible = "qcom,sdm845-rpmhpd";
>> +		#power-domain-cells = <1>;
>> +		operating-points-v2 = <&rpmhpd_opp_table>;
>> +	};
>> +
>> +	rpmhpd_opp_table: opp-table {
>> +		compatible = "operating-points-v2-qcom-level";
>> +
>> +		rpmhpd_opp_ret: opp1 {
>> +			qcom-level = <16>;
>> +		};
>> +
>> +		rpmhpd_opp_min_svs: opp2 {
>> +			qcom-level = <48>;
>> +		};
>> +
>> +		rpmhpd_opp_low_svs: opp3 {
>> +			qcom-level = <64>;
>> +		};
>> +
>> +		rpmhpd_opp_svs: opp4 {
>> +			qcom-level = <128>;
>> +		};
>> +
>> +		rpmhpd_opp_svs_l1: opp5 {
>> +			qcom-level = <192>;
>> +		};
>> +
>> +		rpmhpd_opp_nom: opp6 {
>> +			qcom-level = <256>;
>> +		};
>> +
>> +		rpmhpd_opp_nom_l1: opp7 {
>> +			qcom-level = <320>;
>> +		};
>> +
>> +		rpmhpd_opp_nom_l2: opp8 {
>> +			qcom-level = <336>;
>> +		};
>> +
>> +		rpmhpd_opp_turbo: opp9 {
>> +			qcom-level = <384>;
>> +		};
>> +
>> +		rpmhpd_opp_turbo_l1: opp10 {
>> +			qcom-level = <416>;
>> +		};
>> +	};
>> -- 
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation
>>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
