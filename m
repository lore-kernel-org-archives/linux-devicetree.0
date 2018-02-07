From: Chintan Pandya <cpandya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH] of: cache phandle nodes to decrease cost of
 of_find_node_by_phandle()
Date: Wed, 7 Feb 2018 18:14:23 +0530
Message-ID: <1768c791-7456-c1fe-578b-f6245e79746f@codeaurora.org>
References: <1517429142-25727-1-git-send-email-frowand.list@gmail.com>
 <5b84a166-c71b-3a41-9e7f-a7624a8441f6@codeaurora.org>
 <38cdcae5-ec0f-d1be-b024-1990d4387731@gmail.com>
 <9e23d32f-05a0-ce8a-41f8-9a1a3d66be37@codeaurora.org>
 <fd9f5f63-b08e-602e-1510-85a65889f550@gmail.com>
 <567731e8-8f89-bd6e-c3d4-e36400e69198@codeaurora.org>
 <0db129ef-ffd8-96fe-46a7-55fb575272e3@gmail.com>
 <0a178f4b-75fe-0564-7b0e-596f52fca1dc@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0a178f4b-75fe-0564-7b0e-596f52fca1dc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 2/5/2018 5:53 PM, Chintan Pandya wrote:
> 
>>
>> My question was trying to determine whether the numbers reported above
>> are for a debug configuration or a production configuration.
> My reported numbers are from debug configuration.
> 
>> not a production configuration, I was requesting the numbers for a
>> production configuration.
> I'm working on it. But please expect some delay in my response for this. 
> As I mentioned earlier, I need to work with few teams to get these numbers.
> 
> 
>> show a significant boot time reduction from the patch then there is
>> less justification for adding complexity to the existing code.  I
>> prefer to use simpler data structures and algorithms __if__ extra
>> complexity does not provide any advantage.  The balance between
>> complexity and benefits is a core software engineering issue.
>>
> Ok

Avg Kernel boot time comparison in production set up:

[0] Base: 4519ms
[1] 4115ms (~400ms improvement)
[2] 4115ms (~400ms improvement)
[3] 4177ms (~340ms improvement)

Full data:
[1] 1024 sized pre-populated cache
ITR-1	ITR-2	ITR-3	ITR-4	Avg
4115	4123	4124	4107	4115

[2] Dynamic sized cache allocation/free
ITR-1	ITR-2	ITR-3	ITR-4	Avg
4122	4131	4106	4118	4115

[3] Fixed 64 sized cache
ITR-1	ITR-2	ITR-3	ITR-4	Avg
4153	4186	4198	4181	4177


[1] is my experimental patch and dirty enough to not get merged 
anywhere. So, I will not push it.



Chintan
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center,
Inc. is a member of the Code Aurora Forum, a Linux Foundation
Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
