From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 1/3] nvmem: Update the OF binding to use a subnode for
 the cells list
Date: Wed, 18 Apr 2018 13:53:56 +0100
Message-ID: <e34619a4-e9b6-9945-a1cc-a3680aac6819@linaro.org>
References: <1521933899-362-1-git-send-email-albeu@free.fr>
 <1521933899-362-2-git-send-email-albeu@free.fr>
 <344e0087-7410-aebb-8a66-c6976064df10@linaro.org>
 <20180417165420.423a691b@avionic-0020>
 <8c4b48ad-e99e-030a-a4ee-b6df0fa59c79@linaro.org>
 <20180417180040.04f53495@avionic-0020> <20180418134119.2e587621@avionic-0020>
 <9f7d2987-b33e-79b5-ae58-2985fd7334e4@linaro.org>
 <20180418143243.3c23493c@avionic-0020>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180418143243.3c23493c@avionic-0020>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Alban <albeu@free.fr>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org



On 18/04/18 13:32, Alban wrote:
>> I was also suggesting you to use nvmem-cell subnode, but make it a
>> proper nvmem provider device, rather than reusing its parent device.
>>
>> You would end up some thing like this in dt.
>>
>> flash@0 {
>> 	#address-cells = <1>;
>> 	#size-cells = <1>;
>> 	compatible = "s25sl064a";
>> 	reg = <0>;
>>
>> 	nvmem-cells {
>> 		compatible = "mtd-nvmem";
>> 		#address-cells = <1>;
>> 		#size-cells = <1>;
>>
>> 		calibration: calib@404 {
>> 			reg = <0x404 0x10>;
>> 		};
>> 	};
>> };
> But the root cause is in the nvmem binding, this conflict could exists
No, the root cause is because of passing wrong device instance to nvmem 
core. And trying to workaround is the actual issue.

> with any device type, not just MTD. I don't understand why we would want
> such workarounds instead of just fixing the problem once and for all.
AFAIU, This is not a workaround, this is how nvmem provider bindings are 
and all providers should try to follow it.

I still do not understand what is the issue in making nvmem-cells node a 
proper nvmem provider device?

--srini
