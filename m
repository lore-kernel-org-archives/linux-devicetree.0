Return-Path: <SRS0=hXfH=ND=codeaurora.org=rplsssn@kernel.org>
Subject: Re: [PATCH RFC v2 2/4] dt-bindings: introduce System PM domain
 bindings for Qualcomm SoCs
References: <1539186879-10009-1-git-send-email-rplsssn@codeaurora.org>
 <1539186879-10009-3-git-send-email-rplsssn@codeaurora.org>
 <20181017184247.GA28562@bogus>
From: Raju P L S S S N <rplsssn@codeaurora.org>
Message-ID: <ddcf0993-4d8e-91d7-cd83-4133034384ba@codeaurora.org>
Date: Wed, 24 Oct 2018 01:05:15 +0530
MIME-Version: 1.0
In-Reply-To: <20181017184247.GA28562@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>
Cc: ilina@codearuroa.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 10/18/2018 12:12 AM, Rob Herring wrote:
> On Wed, Oct 10, 2018 at 09:24:37PM +0530, Raju P.L.S.S.S.N wrote:
>> Add device binding documentation for Qualcomm Technology Inc's System PM
>> domain driver. The driver is used for managing system sleep activities
>> that are required when application processor is going to deepest low
>> power mode.
>>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Raju P.L.S.S.S.N <rplsssn@codeaurora.org>
>> ---
>>   .../bindings/soc/qcom/system_pm_domain.txt         | 38 ++++++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/soc/qcom/system_pm_domain.txt
>>
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/system_pm_domain.txt b/Documentation/devicetree/bindings/soc/qcom/system_pm_domain.txt
>> new file mode 100644
>> index 0000000..9f913c3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/qcom/system_pm_domain.txt
>> @@ -0,0 +1,38 @@
>> +Qualcomm Technologies system power domain
>> +-----------------------------------------
>> +
>> +System pm domain handles the tasks that need to be performed during application
>> +processor deeper low power mode entry for QCOM SoCs which have hardened IP blocks
>> +combinedly called as RPMH (Resource Power Manager Hardened) for shared resource
>> +management. Flushing the buffered requests to TCS (Triggered Command Set) in RSC
>> +(Resource State Coordinator) and programming the wakeup timer in PDC (Power
>> +Domain Controller) for timer based wakeup are handled as part of domain power
>> +down.
>> +
>> +The bindings for System PM domain is specified in the RSC section in devicetree.
>> +
>> +Properties:
>> +- compatible:
>> +	Usage: required
>> +	Value type: <string>
>> +	Definition: must be "qcom,system-pm-domain".
>> +
>> +- #power-domain-cells: number of cells in power domain specifier;
>> +    must be 0.
>> +
>> +Node of a device using power domains must have a power-domains property
>> +defined with a phandle to respective power domain.
>> +
>> +Example:
>> +
>> +	apps_rsc: rsc@179c0000 {
>> +		[...]
>> +		system_pd: system-power-domain {
>> +			compatible = "qcom,system-pm";
>> +            #power-domain-cells = <0>;
> 
> I don't understand why this is split from "qcom,cpu-pm-domain". Just
> make the parent (RSC) a power domain provider with multiple domains. As
> long as each domain doesn't have its own resources, you don't need child
> nodes here.

Hi Rob,

Since the patch had cc:devicetree, it was unintentionally posted in 
mailing list. Sorry about that and please ignore this one. The intended 
version is posted as https://lkml.org/lkml/2018/10/11/28
The power down activities are handled by top level rpmh layer[1] which 
are not core functions of RSC driver. Though it is doable, it would be 
messy to invoke calls to top level rpmh layer by declaring RSC parent 
node itself as power domain provider.

[1].https://patchwork.kernel.org/patch/10474327/

Thanks,
Raju


> 
> Rob
> 
