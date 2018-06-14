From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v3 5/7] dt-bindings: power: Add qcom rpmh power domain
 driver bindings
Date: Thu, 14 Jun 2018 11:56:25 +0530
Message-ID: <383ec081-d03b-5d71-3f28-9be31a3356d9@codeaurora.org>
References: <20180612044052.4402-1-rnayak@codeaurora.org>
 <20180612044052.4402-6-rnayak@codeaurora.org>
 <ca7fd33a-5ecd-203e-4a83-09c4f1074c2e@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ca7fd33a-5ecd-203e-4a83-09c4f1074c2e@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: David Collins <collinsd@codeaurora.org>, viresh.kumar@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, ulf.hansson@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi David,

On 06/14/2018 03:42 AM, David Collins wrote:
> Hello Rajendra,
> 
> On 06/11/2018 09:40 PM, Rajendra Nayak wrote:
>> Add DT bindings to describe the rpmh powerdomains found on Qualcomm
> 
> s/powerdomains/power domains/
> 
>> Technologies, Inc. SoCs. These power domains communicate a performance
>> state to RPMh, which then translates it into corresponding voltage on
>> a PMIC rail.
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>>  .../devicetree/bindings/power/qcom,rpmhpd.txt | 65 +++++++++++++++++++
>>  1 file changed, 65 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/power/qcom,rpmhpd.txt
> 
> include/dt-bindings/power/qcom-rpmhpd.h from patch 6/7 should be moved to
> this patch.

right, Rob mentioned this too, I will move it in v4.

> 
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
>> + - power-domain-cells: number of cells in power domain specifier
>> +	must be 1
>> + - operating-points-v2: Phandle to the OPP table for the power-domain.
>> +	Refer to Documentation/devicetree/bindings/power/power_domain.txt
>> +	and Documentation/devicetree/bindings/opp/qcom-opp.txt for more details
> 
> Could you please mention here that qcom,level properties in the associated
> opp-table should use the RPMH_REGULATOR_LEVEL_* constants?  RPMh ARC
> resources depend upon the RPMH_REGULATOR_LEVEL_* constants to provide a
> mapping of levels supported by hardware.
> 
>> +Example:
> 
> Could you please add this here?
> 
> #include <dt-bindings/power/qcom-rpmhpd.h>

I will, I wasn't sure its okay to reference a kernel include file in a DT
binding documentation. But looking around it seems like its common practice.

> 
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
> 
> As per qcom-opp.txt, 'qcom,level' should be used, not 'qcom-level'.

d'oh! I just keep getting this wrong.

> 
> Where is the qcom-opp.txt patch?  It isn't part of the v3 patch series but
> was in the v2 series [1].

Oops, looks like I accidentally dropped it in v3 :(

> 
> Could you please change this to be the following?
> 
>     qcom,level = <RPMH_REGULATOR_LEVEL_RETENTION>;
> 
> Also, please use the level constants for all other subnodes in this
> example as well.
> 
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
> 
> Could you please add an example consumer DT node as well which uses
> "SDM845 Power Domain Indexes" from qcom-rpmhpd.h?  It isn't clear how a
> specific power domain (e.g. SDM845_CX) is specified from the consumer
> side.  It also isn't clear how the consumer specifies a mapping for the
> power domain levels that it will be using.

I can add an example consumer with a power-domains property pointing to
the phandle and index (as is general practice)

For specifying the power domain levels, I am not quite sure what the approach
we would use. One way is for consumers to use OPP bindings, but that wasn't
liked by some and we now have plans to stuff it all within the clock driver code.
In which case I expect we would just maintain internal mapping tables for clock
frequencies/power domain levels so nothing comes in from DT, or maybe it will
come in from DT, i just don't know.

I can certainly describe the OPP way a consumer could map to a power domain level,
but I am not sure how the clock bindings if any would be at this point to handle this.

regards,
Rajendra

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
