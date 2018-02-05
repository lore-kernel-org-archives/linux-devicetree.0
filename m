From: Chintan Pandya <cpandya@codeaurora.org>
Subject: Re: [PATCH] of: cache phandle nodes to decrease cost of
 of_find_node_by_phandle()
Date: Mon, 5 Feb 2018 17:53:06 +0530
Message-ID: <0a178f4b-75fe-0564-7b0e-596f52fca1dc@codeaurora.org>
References: <1517429142-25727-1-git-send-email-frowand.list@gmail.com>
 <5b84a166-c71b-3a41-9e7f-a7624a8441f6@codeaurora.org>
 <38cdcae5-ec0f-d1be-b024-1990d4387731@gmail.com>
 <9e23d32f-05a0-ce8a-41f8-9a1a3d66be37@codeaurora.org>
 <fd9f5f63-b08e-602e-1510-85a65889f550@gmail.com>
 <567731e8-8f89-bd6e-c3d4-e36400e69198@codeaurora.org>
 <0db129ef-ffd8-96fe-46a7-55fb575272e3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0db129ef-ffd8-96fe-46a7-55fb575272e3@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


> 
> My question was trying to determine whether the numbers reported above
> are for a debug configuration or a production configuration.
My reported numbers are from debug configuration.

> not a production configuration, I was requesting the numbers for a
> production configuration.
I'm working on it. But please expect some delay in my response for this. 
As I mentioned earlier, I need to work with few teams to get these numbers.


> show a significant boot time reduction from the patch then there is
> less justification for adding complexity to the existing code.  I
> prefer to use simpler data structures and algorithms __if__ extra
> complexity does not provide any advantage.  The balance between
> complexity and benefits is a core software engineering issue.
> 
Ok
> 
>> I don't have a set up for taking these numbers in perf mode. For
>> that, I need to ask some other team and round trip follow ups. In my
>> set up, I rely on serial console logging which gets disabled in perf
>> mode.
>>
>>>
>>> Thanks,
>>>
>>> Frank
>>>
>>
>> Chintan
> 

Chintan
-- 
Qualcom India Private Limited, on behalf of Qualcomm Innovation Center,
Inc. is a member of the Code Aurora Forum, a Linux Foundation
Collaborative Project
