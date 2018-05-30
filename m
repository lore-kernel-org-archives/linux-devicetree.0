From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v2 5/6] soc: qcom: rpmh powerdomain driver
Date: Wed, 30 May 2018 14:25:22 +0530
Message-ID: <36822404-bdf5-1915-03e7-e5ffcff05c9b@codeaurora.org>
References: <20180525100121.28214-1-rnayak@codeaurora.org>
 <20180525100121.28214-6-rnayak@codeaurora.org>
 <215deee5-6472-d587-9a90-f7158162ed82@codeaurora.org>
 <6f8e5fe2-199d-ba1f-19d7-2faf276075f3@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6f8e5fe2-199d-ba1f-19d7-2faf276075f3@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: David Collins <collinsd@codeaurora.org>, viresh.kumar@linaro.org, sboyd@kernel.org, andy.gross@linaro.org, ulf.hansson@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>
List-Id: devicetree@vger.kernel.org

[]...

>>> +Required Properties:
>>> + - compatible: Should be one of the following
>>> +	* qcom,sdm845-rpmhpd: RPMh powerdomain for the sdm845 family of SoC
>>> + - power-domain-cells: number of cells in power domain specifier
>>> +	must be 1
>>> + - operating-points-v2: Phandle to the OPP table for the power-domain.
>>> +	Refer to Documentation/devicetree/bindings/power/power_domain.txt
>>> +	and Documentation/devicetree/bindings/opp/qcom-opp.txt for more details
>>> +
>>> +Example:
>>> +
>>> +	rpmhpd: power-controller {
>>> +		compatible = "qcom,sdm845-rpmhpd";
>>> +		#power-domain-cells = <1>;
>>> +		operating-points-v2 = <&rpmhpd_opp_table>,
>>> +				      <&rpmhpd_opp_table>,
>>> +				      <&rpmhpd_opp_table>,
>>> +				      <&rpmhpd_opp_table>,
>>> +				      <&rpmhpd_opp_table>,
>>> +				      <&rpmhpd_opp_table>,
>>> +				      <&rpmhpd_opp_table>,
>>> +				      <&rpmhpd_opp_table>,
>>> +				      <&rpmhpd_opp_table>;
>>
>> Can this be changed to simply:
>>   operating-points-v2 = <&rpmhpd_opp_table>;
>>
>> The opp binding documentation [1] states that this should be ok:
>>
>>     If only one phandle is available, then the same OPP table will be used
>>     for all power domains provided by the power domain provider.
> 
> thanks, I mentioned this to Viresh but didn't realize he fixed it up.
> Will remove the redundant entries.

Looks like the kernel implementation does not handle this yet, and I get
an error adding the OPP tables for the powerdomains if I just specify
a single OPP table phandle.

Viresh, is this expected with the latest patches in linux-next?

It would be good if I can specify just one phandle instead of coping
the same phandle n times. 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
