From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH linux-next v6 07/13] dt-bindings: mfd: Add a document for
 PECI client MFD
Date: Tue, 3 Jul 2018 10:21:58 -0700
Message-ID: <88cab816-3bc1-5e0b-7282-4ca05f458a9a@linux.intel.com>
References: <20180621193721.20588-1-jae.hyun.yoo@linux.intel.com>
 <20180621194054.20897-1-jae.hyun.yoo@linux.intel.com>
 <20180703165835.GA18160@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180703165835.GA18160@rob-hp-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, James Feist <james.feist@linux.intel.com>, Jason M Biils <jason.m.bills@linux.intel.com>, Joel Stanley <joel@jms.id.au>, Vernon Mauery <vernon.mauery@linux.intel.com>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Thanks for the review. Please see my inline answer.

On 7/3/2018 9:58 AM, Rob Herring wrote:
> On Thu, Jun 21, 2018 at 12:40:54PM -0700, Jae Hyun Yoo wrote:
>> This commit adds a dt-bindings document for PECI client MFD.
> 
> This and the next patch still have the same issues I've outlined in at
> least 2 prior versions.
>   

Okay. I think the next patch (9/13) for hwmon dt-bindings document
is not needed anymore because those were already added in MFD driver
implementation in the patch 8/13. Please correct me if it's not
you pointed.

>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> Cc: Andrew Jeffery <andrew@aj.id.au>
>> Cc: James Feist <james.feist@linux.intel.com>
>> Cc: Jason M Biils <jason.m.bills@linux.intel.com>
>> Cc: Joel Stanley <joel@jms.id.au>
>> Cc: Vernon Mauery <vernon.mauery@linux.intel.com>
>> ---
>>   .../bindings/mfd/intel-peci-client.txt        | 34 +++++++++++++++++++
>>   1 file changed, 34 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mfd/intel-peci-client.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/intel-peci-client.txt b/Documentation/devicetree/bindings/mfd/intel-peci-client.txt
>> new file mode 100644
>> index 000000000000..cb341e363add
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/intel-peci-client.txt
>> @@ -0,0 +1,34 @@
>> +* Intel PECI client bindings
>> +
>> +PECI (Platform Environment Control Interface) is a one-wire bus interface that
>> +provides a communication channel from PECI clients in Intel processors and
>> +chipset components to external monitoring or control devices. PECI is designed
>> +to support the following sideband functions:
>> +
>> +- Processor and DRAM thermal management
>> +- Platform Manageability
>> +- Processor Interface Tuning and Diagnostics
>> +- Failure Analysis
>> +
>> +Required properties:
>> +- compatible : Should be "intel,peci-client".
>> +- reg        : Should contain address of a client CPU. Address range of CPU
>> +	       clients starts from 0x30 based on PECI specification.
>> +
>> +Example:
>> +	peci-bus@0 {
>> +		compatible = "vendor,soc-peci";
>> +		reg = <0x0 0x1000>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		peci-client@30 {
>> +			compatible = "intel,peci-client";
>> +			reg = <0x30>;
>> +		};
>> +
>> +		peci-client@31 {
>> +			compatible = "intel,peci-client";
>> +			reg = <0x31>;
>> +		};
>> +	};
>> -- 
>> 2.17.1
>>
> 
