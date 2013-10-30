From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH v2 4/6] edac: Document Krait L1/L2 EDAC driver binding
Date: Wed, 30 Oct 2013 16:56:19 -0500
Message-ID: <F38814D8-723E-4A41-839D-DEE351738017@codeaurora.org>
References: <1383164736-1849-1-git-send-email-sboyd@codeaurora.org> <1383164736-1849-5-git-send-email-sboyd@codeaurora.org> <872F86E8-85CE-472B-9546-CDCC96F6F08B@codeaurora.org> <52717EA5.6030208@codeaurora.org>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <52717EA5.6030208@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Oct 30, 2013, at 4:48 PM, Stephen Boyd wrote:

> On 10/30/13 14:45, Kumar Gala wrote:
>> On Oct 30, 2013, at 3:25 PM, Stephen Boyd wrote:
>> 
>>> @@ -75,3 +77,50 @@ Example:
>>> 			reg = <0x101>;
>>> 		};
>>> 	};
>>> +
>>> +If the compatible string contains "qcom,krait" there shall be an interrupts
>>> +property containing the L1/CPU error interrupt number. There shall also be an
>> 'also be a'
> 
> ok
> 
>> 
>>> +l2-cache node containing the following properties:
>> Is the L1 interrupt not per core L1 cache (even if they are OR together at PIC)?
> 
> Yes it is per CPU. That is what the 0xf part of the cpus interrupts
> property is showing.

Than why not have it in each cpu node?

>>> 
>>> + - compatible: Shall contain at least "cache"
>>> + - cache-level: Must be 2
>>> + - interrupts: Shall contain the L2 error interrupt
>>> +
>>> +Example:
>>> +
>>> +	cpus {
>>> +		#address-cells = <1>;
>>> +		#size-cells = <0>;
>>> +		interrupts = <1 9 0xf04>;
>>> +		compatible = "qcom,krait";
>>> 


- k

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
