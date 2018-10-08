From: cang@codeaurora.org
Subject: Re: [PATCH v9 7/7] dt-bindings: ufshcd-pltfrm: Add core reset string
Date: Mon, 08 Oct 2018 15:32:31 +0800
Message-ID: <1cf6d77f049c6dcd62b9d9758e06b186@codeaurora.org>
References: <1537504081-29976-1-git-send-email-quic_cang@quicinc.com>
 <1537504081-29976-8-git-send-email-quic_cang@quicinc.com>
 <20180927150606.GA20771@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180927150606.GA20771@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Can Guo <quic_cang@quicinc.com>, subhashj@codeaurora.org, asutoshd@codeaurora.org, vivek.gautam@codeaurora.org, evgreen@chromium.org, rnayak@codeaurora.org, vinholikatti@gmail.com, jejb@linux.vnet.ibm.com, martin.petersen@oracle.com, Amit Nischal <anischal@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Mathieu Malaterre <malat@debian.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 2018-09-27 23:06, Rob Herring wrote:
> On Thu, Sep 20, 2018 at 09:28:00PM -0700, Can Guo wrote:
>> From: Can Guo <cang@codeaurora.org>
>> 
>> Add core reset support string for UFS.
>> 
>> Signed-off-by: Amit Nischal <anischal@codeaurora.org>
>> Signed-off-by: Can Guo <cang@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt | 7 +++++++
>>  1 file changed, 7 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt 
>> b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
>> index c39dfef..6b697c4 100644
>> --- a/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
>> +++ b/Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
>> @@ -11,6 +11,11 @@ Required properties:
>>  					  "qcom,ufshc"
>>  - interrupts        : <interrupt mapping for UFS host controller IRQ>
>>  - reg               : <registers mapping>
>> +- reset             : reset specifier pair consists of phandle for 
>> the reset provider
>> +                      and reset lines used by this controller. It is 
>> mandatory for
>> +		      QCOM SDM845 platform.
>> +- reset-names       : reset signal name strings sorted in the same 
>> order as the
>> +		      resets property. It is mandatory for QCOM SDM845 platform.
> 
> This already exists as of 4.19 under optional properties. (And you 
> can't
> add new required properties anyways.)
> 

Thank you Rob, I also found the newly merged change from Huawei on 4.19.
Then our code would need a small change to parse the new reset-names 
string.

>> 
>>  Optional properties:
>>  - phys                  : phandle to UFS PHY node
>> @@ -64,6 +69,8 @@ Example:
>>  		clocks = <&core 0>, <&ref 0>, <&iface 0>;
>>  		clock-names = "core_clk", "ref_clk", "iface_clk";
>>  		freq-table-hz = <100000000 200000000>, <0 0>, <0 0>;
>> +		resets = <clock_gcc GCC_UFS_BCR>;
>> +		reset-names = "core_reset";
> 
> And the name should be "rst" (or omitted).
> 

Sure, got it, thank you.

>>  		phys = <&ufsphy1>;
>>  		phy-names = "ufsphy";
>>  	};
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 
