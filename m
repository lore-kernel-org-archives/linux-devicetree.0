From: Chintan Pandya <cpandya@codeaurora.org>
Subject: Re: [PATCH] of: use hash based search in of_find_node_by_phandle
Date: Fri, 26 Jan 2018 12:52:43 +0530
Message-ID: <e6043f59-6351-a4f1-138f-26c500cb3b8a@codeaurora.org>
References: <1516875247-19599-1-git-send-email-cpandya@codeaurora.org>
 <CAL_JsqLSGS+XDzhWFNaBGHtzsrEQm+SA8TkmdUKXc-16EyG_6g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLSGS+XDzhWFNaBGHtzsrEQm+SA8TkmdUKXc-16EyG_6g@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 1/25/2018 8:20 PM, Rob Herring wrote:
> On Thu, Jan 25, 2018 at 4:14 AM, Chintan Pandya <cpandya@codeaurora.org> wrote:
>> of_find_node_by_phandle() takes a lot of time finding
> Got some numbers for what is "a lot of time"?
On my SDM device, I see total saving of 400ms during boot time. For some 
clients
whose node is quite deeper, they see 1ms time taken by this API.
>
>> right node when your intended device is too right-side
>> in the fdt. Reason is, we search each device serially
>> from the fdt, starting from left-most to right-most.
> By right side, you mean a deep path?
Yes, will correct this if original is confusing.
>
>> Implement, device-phandle relation in hash-table so
>> that look up can be faster.
>>
>> Change-Id: I4a2bc7eff6de142e4f91a7bf474893a45e61c128
> Run checkpatch.pl
Sure. My bad.
>
>> @@ -61,6 +62,7 @@ struct device_node {
>>          struct  kobject kobj;
>>          unsigned long _flags;
>>          void    *data;
>> +       struct hlist_node hash;
> Always base your patches on the latest -rc at least. This won't apply.
Ok, sure.
>
> This grows struct device_node for every single node which we recently
> worked on to shrink (which is why this won't apply). So I'm now
> sensitive to anything that grows it. I'd really prefer something out
> of band.
>
> I'd guess that there's really only a few phandle lookups that occur
> over and over.
On my system, there are ~6.7k calls of this API during boot.

> The clock controller, interrupt controller, etc. What
> if you just had a simple array of previously found nodes for a cache
> and of_find_node_by_phandle can check that array first. Probably 8-16
> entries would be enough.
I clearly see repeat calling with same phandle. But I have few hundreds 
of nodes.
I see hashing as generic optimization which applies equally good to all 
sized DT.
Using ~4KB more size to save 400 ms is a good trade-off, I believe.


Chintan Pandya

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
