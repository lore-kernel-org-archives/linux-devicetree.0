From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v3 5/5] arm: qcom: dts: Enable NAND node on IPQ8064 AP148
 platform
Date: Tue, 04 Aug 2015 20:36:34 +0530
Message-ID: <55C0D4FA.9080305@codeaurora.org>
References: <1421419702-17812-1-git-send-email-architt@codeaurora.org> <1438578498-32254-1-git-send-email-architt@codeaurora.org> <1438578498-32254-6-git-send-email-architt@codeaurora.org> <20150803205829.GA21068@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150803205829.GA21068@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: devicetree@vger.kernel.org, dehrenberg@google.com, linux-arm-msm@vger.kernel.org, cernekee@gmail.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, agross@codeaurora.org, computersforpeace@gmail.com
List-Id: devicetree@vger.kernel.org



On 8/4/2015 2:28 AM, Stephen Boyd wrote:
> On 08/03, Archit Taneja wrote:
>> @@ -93,5 +115,19 @@
>>   		sata@29000000 {
>>   			status = "ok";
>>   		};
>> +
>> +		nand@1ac00000 {
>> +			status = "ok";
>> +
>> +			pinctrl-0 = <&nand_pins>;
>> +			pinctrl-names = "default";
>> +
>> +			nand-ecc-strength = <4>;
>> +			nand-bus-width = <8>;
>> +		};
>>   	};
>>   };
>> +
>> +&adm_dma {
>> +	status = "ok";
>> +};
>
> I think the preference is to put the full path to the device in
> the dts file and then have status = "ok". So please move this
> into the soc node and give the correct offset, etc. like we've
> done for other nodes.

I'll do that.

Archit

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
