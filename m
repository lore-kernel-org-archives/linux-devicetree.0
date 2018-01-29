From: Chintan Pandya <cpandya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2] of: use hash based search in of_find_node_by_phandle
Date: Mon, 29 Jan 2018 23:48:35 +0530
Message-ID: <85e2f338-0475-dff0-f8e9-6ab06db23a3b@codeaurora.org>
References: <1516955496-17236-1-git-send-email-cpandya@codeaurora.org>
 <f08592cf-5e49-e631-c481-e166b741f25e@prevas.dk>
 <aa84e40d-5032-1d1d-6146-391ca1e5e528@codeaurora.org>
 <CAL_JsqJ=6bmOZCsj=NVthgXsZRRjyhQUDv0-CrngF_1MaYtKqA@mail.gmail.com>
 <20180126213943.7zwijanlbrq3y666@rob-hp-laptop>
 <b20292f5-e080-2b66-bae6-4a230cb0627a@codeaurora.org>
 <CAL_JsqLwRYOYQ3WJ08AznZcN_BpR-udWw859W5q-CPKh=rPNFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqLwRYOYQ3WJ08AznZcN_BpR-udWw859W5q-CPKh=rPNFQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rasmus Villemoes <rasmus.villemoes-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


>> Scenarios:
>> [1] Cache size 1024 + early cache build up [Small change in your cache
>> patch,
>>      see the patch below]
>> [2] Hash 64 approach[my original v2 patch]
>> [3] Cache size 64
>> [4] Cache size 128
>> [5] Cache size 256
>> [6] Base build
>>
>> Result (boot to shell in sec):
>> [1] 14.292498 14.370994 14.313537 --> 850ms avg gain
>> [2] 14.340981 14.395900 14.398149 --> 800ms avg gain
>> [3] 14.546429 14.488783 14.468694 --> 680ms avg gain
>> [4] 14.506007 14.497487 14.523062 --> 670ms avg gain
>> [5] 14.671100 14.643344 14.731853 --> 500ms avg gain
> It's strange that bigger sizes are slower. Based on this data, I'd pick [3].
>
> How many phandles do you have? I thought it was hundreds, so 1024
> entries would be more than enough and you should see some curve to a
> max gain as cache size approaches # of phandles.
>
1063 phandles for my device. In one of the previous mails, I estimated it to
be few hundreds but I wastoo short of actual number. However, 1063 still
doesn't justify why [4] and [5] are notbetter than [3].

I would still be interested to find out a way to dynamically allocate array
with size near to total # of phandles with pre-stored mapping. And free this
array once done with it. But at present, no idea how will I achieve this. If
you can share any pointers around this, that would help !

Thanks,
Chintan Pandya

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
