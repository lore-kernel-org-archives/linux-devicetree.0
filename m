From: David Dai <daidavid1@codeaurora.org>
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: Update Qualcomm SDM845 DT
 bindings
Date: Tue, 23 Jul 2019 14:48:42 -0700
Message-ID: <8c181f08-559b-5d77-a617-65cfd3d5da55@codeaurora.org>
References: <1563568344-1274-1-git-send-email-daidavid1@codeaurora.org>
 <1563568344-1274-2-git-send-email-daidavid1@codeaurora.org>
 <5d371ce7.1c69fb81.9650.8239@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5d371ce7.1c69fb81.9650.8239@mx.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org, georgi.djakov@linaro.org, robh+dt@kernel.org
Cc: evgreen@google.com, ilina@codeaurora.org, seansw@qti.qualcomm.com, elder@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Thanks for the feedback Stephen, much appreciated!

On 7/23/2019 7:42 AM, Stephen Boyd wrote:
> Quoting David Dai (2019-07-19 13:32:23)
>> Redefine the Network-on-Chip devices to more accurately describe
>> the interconnect topology on Qualcomm's SDM845 platform. Each
>> interconnect device can communicate with different instances of the
>> RPMh hardware which are described as RSCs(Resource State Coordinators).
>>
>> Signed-off-by: David Dai <daidavid1@codeaurora.org>
>> ---
>> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,bcm-voter.txt b/Documentation/devicetree/bindings/interconnect/qcom,bcm-voter.txt
>> new file mode 100644
>> index 0000000..2cf7da2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/interconnect/qcom,bcm-voter.txt
>> @@ -0,0 +1,32 @@
>> +Qualcomm BCM-Voter interconnect driver binding
>> +-----------------------------------------------------------
>> +
>> +The Bus Clock Manager (BCM) is a dedicated hardware accelerator
>> +that manages shared system resources by aggregating requests
>> +from multiple Resource State Coordinators (RSC). Interconnect
>> +providers are able to vote for aggregated thresholds values from
>> +consumers by communicating through their respective RSCs.
>> +
>> +Required properties :
>> +- compatible : shall contain only one of the following:
>> +                       "qcom,sdm845-bcm-voter",
>> +
>> +Examples:
>> +
>> +apps_rsc: rsc@179c0000 {
> But there isn't a reg property.
I'll change this to the generic example with just apps_rsc: rsc {
>
>> +       label = "apps_rsc";
> Is label required?
>
>> +       compatible = "qcom,rpmh-rsc";
>> +
>> +       apps_bcm_voter: bcm_voter {
>> +               compatible = "qcom,sdm845-bcm-voter";
>> +       };
>> +}
>> +
>> +disp_rsc: rsc@179d0000 {
>> +       label = "disp_rsc";
>> +       compatible = "qcom,rpmh-rsc";
>> +
>> +       disp_bcm_voter: bcm_voter {
>> +               compatible = "qcom,sdm845-bcm-voter";
>> +       };
>> +}
>> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,sdm845.txt b/Documentation/devicetree/bindings/interconnect/qcom,sdm845.txt
>> index 5c4f1d9..27f9ed9 100644
>> --- a/Documentation/devicetree/bindings/interconnect/qcom,sdm845.txt
>> +++ b/Documentation/devicetree/bindings/interconnect/qcom,sdm845.txt
>> @@ -4,21 +4,43 @@ Qualcomm SDM845 Network-On-Chip interconnect driver binding
>>   SDM845 interconnect providers support system bandwidth requirements through
>>   RPMh hardware accelerators known as Bus Clock Manager (BCM). The provider is
>>   able to communicate with the BCM through the Resource State Coordinator (RSC)
>> -associated with each execution environment. Provider nodes must reside within
>> -an RPMh device node pertaining to their RSC and each provider maps to a single
>> -RPMh resource.
>> +associated with each execution environment. Provider nodes must point to at
>> +least one RPMh device child node pertaining to their RSC and each provider
>> +can map to multiple RPMh resources.
>>   
>>   Required properties :
>>   - compatible : shall contain only one of the following:
>> -                       "qcom,sdm845-rsc-hlos"
>> +                       "qcom,sdm845-aggre1_noc",
>> +                       "qcom,sdm845-aggre2_noc",
>> +                       "qcom,sdm845-config_noc",
>> +                       "qcom,sdm845-dc_noc",
>> +                       "qcom,sdm845-gladiator_noc",
>> +                       "qcom,sdm845-mem_noc",
>> +                       "qcom,sdm845-mmss_noc",
>> +                       "qcom,sdm845-system_noc",
>>   - #interconnect-cells : should contain 1
>> +- reg : shall contain base register location and length
>> +- qcom,bcm-voter : shall contain phandles to bcm voters
>>   
>>   Examples:
>>   
>> -apps_rsc: rsc {
>> -       rsc_hlos: interconnect {
>> -               compatible = "qcom,sdm845-rsc-hlos";
>> -               #interconnect-cells = <1>;
>> -       };
>> +aggre1_noc: interconnect@16e0000 {
>> +       compatible = "qcom,sdm845-aggre1_noc";
>> +       reg = <0x16e0000 0xd080>;
>> +       interconnect-cells = <1>;
>> +       qcom,bcm-voter = <&apps_bcm_voter>;
>>   };
>>   
>> +mmss_noc: interconnect@1740000 {
>> +       compatible = "qcom,sdm845-mmss_noc";
>> +       reg = <0x1740000 0x1c1000>;
>> +       interconnect-cells = <1>;
>> +       qcom,bcm-voter = <&apps_bcm_voter>, <&disp_bcm_voter>;
>> +};
>> +
>> +mem_noc: interconnect@1380000 {
>> +       compatible = "qcom,sdm845-mem_noc";
>> +       reg = <0 0x1380000 0 0x27200>;
>> +       #interconnect-cells = <1>;
>> +       qcom,bcm-voter = <&apps_bcm_voter>, <&disp_bcm_voter>;
>> +};
> How does a consumer target a particular RSC? For example, how can
> display decide to use the disp_bcm_voter node from mem_noc here? Maybe
> you can add that consumer to the example?

I was thinking that the association between the bcm voters and the icc 
nodes would be handled by the interconnect provider, and that there 
would be a set of display specific icc nodes with their own unique IDs 
that the consumers could reference. I will mention this as part of the 
description and provide an example.

Ex: interconnects = <&mmss_noc MASTER_MDP0_DISP &mem_noc SLAVE_EBI_DISP>;

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
