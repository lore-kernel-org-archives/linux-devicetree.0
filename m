From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 6/6] MAINTAINERS: Add linux-actions mailing list for
 Actions Semi
Date: Tue, 1 Jan 2019 04:32:40 +0100
Message-ID: <6c6cc111-ad1b-15eb-a1b0-3cbe8b5e5226@suse.de>
References: <20181231185517.18517-1-manivannan.sadhasivam@linaro.org>
 <20181231185517.18517-7-manivannan.sadhasivam@linaro.org>
 <2a7f53c58896e2a9c3115a8630040b98497e5877.camel@perches.com>
 <20190101032622.GC2736@Mani-XPS-13-9360>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190101032622.GC2736@Mani-XPS-13-9360>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Joe Perches <joe@perches.com>, sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am 01.01.19 um 04:26 schrieb Manivannan Sadhasivam:
> On Mon, Dec 31, 2018 at 11:12:18AM -0800, Joe Perches wrote:
>> On Tue, 2019-01-01 at 00:25 +0530, Manivannan Sadhasivam wrote:
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>> []
>>> @@ -1240,6 +1240,7 @@ ARM/ACTIONS SEMI ARCHITECTURE
>>>  M:	Andreas Färber <afaerber@suse.de>
>>>  R:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>>> +L:	linux-actions@lists.infradead.org (moderated for non-subscribers)
>>>  S:	Maintained
>>>  N:	owl
>>
>> The N: entry matches too many non-owl entries like:
>>
>> Documentation/parport-lowlevel.txt
>> drivers/misc/ibmasm/lowlevel.c
>> drivers/misc/ibmasm/lowlevel.h
>> fs/udf/lowle
>> vel.c
>> net/ipv6/ip6_flowlabel.c
>> sound/soc/samsung/lowland.c
>>
>> Maybe there should be two entries
>>
>> N:	/owl
>> N:	-owl
>>
> 
> Thanks for letting us know. Yes, we need to change it. How about below?
> 
> N: owl-
> N: -owl

No underscores anywhere?

Cheers,
Andreas

> 
> Will do it as a follow-up patch if agreed!
> 
> Regards,
> Mani
> 
>>


-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
