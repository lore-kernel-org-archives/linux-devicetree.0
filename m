From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] of: use hash based search in of_find_node_by_phandle
Date: Fri, 26 Jan 2018 09:21:00 -0600
Message-ID: <CAL_JsqLj+hAtdCnhozYojzZukT1_dLLbZ8a0iTWH7zfn6k=3Sw@mail.gmail.com>
References: <1516875247-19599-1-git-send-email-cpandya@codeaurora.org>
 <CAL_JsqLSGS+XDzhWFNaBGHtzsrEQm+SA8TkmdUKXc-16EyG_6g@mail.gmail.com> <e6043f59-6351-a4f1-138f-26c500cb3b8a@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e6043f59-6351-a4f1-138f-26c500cb3b8a@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chintan Pandya <cpandya@codeaurora.org>
Cc: Frank Rowand <frowand.list@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 26, 2018 at 1:22 AM, Chintan Pandya <cpandya@codeaurora.org> wrote:
> On 1/25/2018 8:20 PM, Rob Herring wrote:
>>
>> On Thu, Jan 25, 2018 at 4:14 AM, Chintan Pandya <cpandya@codeaurora.org>
>> wrote:
>>>

[...]

>> I'd guess that there's really only a few phandle lookups that occur
>> over and over.
>
> On my system, there are ~6.7k calls of this API during boot.

And after boot it will be near 0 yet we carry the memory usage forever.

>> The clock controller, interrupt controller, etc. What
>> if you just had a simple array of previously found nodes for a cache
>> and of_find_node_by_phandle can check that array first. Probably 8-16
>> entries would be enough.
>
> I clearly see repeat calling with same phandle. But I have few hundreds of
> nodes.
> I see hashing as generic optimization which applies equally good to all
> sized DT.
> Using ~4KB more size to save 400 ms is a good trade-off, I believe.

But if you can use 200 bytes and save 350 ms, that would be a better
trade off IMO. But we don't know because we have no data.

Rob
