From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: Using device tree overlays in Linux
Date: Tue, 9 Apr 2019 12:19:14 -0700
Message-ID: <b2e0e55e-38a3-3dfb-3453-f57d7e2e99a3@gmail.com>
References: <71fb0ff289e84c55bd92ecd96bc9aa76@svr-chch-ex1.atlnz.lc>
 <61185ee9-4bee-eec3-f0d0-6d6760595845@gmail.com>
 <224942bd629e41eaa23ab327b015134e@svr-chch-ex1.atlnz.lc>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <224942bd629e41eaa23ab327b015134e@svr-chch-ex1.atlnz.lc>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>, "pantelis.antoniou@konsulko.com" <pantelis.antoniou@konsulko.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hamish Martin <Hamish.Martin@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

On 4/7/19 6:27 PM, Chris Packham wrote:
> Hi Frank,
> 
> On 8/04/19 1:05 PM, Frank Rowand wrote:
>> Hi Chris,
>>
>> On 4/3/19 6:50 PM, Chris Packham wrote:
>>> Hi,
>>>
>>> I'm implementing support for some modular Linux based systems using
>>> device tree overlays. The code is working but it seems a little more
>>> fiddly that than it should be so I'm wondering if I'm doing it right.
>>
>> Let me start by saying that I strongly discourage using device tree
>> overlays in the Linux kernel until the support is more baked.  For
>> some info on how unbaked overlays are, see:
>>
>>     https://elinux.org/Frank%27s_Evolving_Overlay_Thoughts
>>
>> You should consider applying overlays in the Linux kernel to be
>> fragile at best.
>>
>> If you can not figure out how to solve your needs without using
>> overlays, then having the boot loader apply the overlay instead
>> of the kernel applying the overlay avoids most of the issues.
>>
> 
> Consider us beta-testers :).

You should read the elinux.org page more carefully.  The support
isn't even alpha stage.  It is at the level of proof of concept.

I'll update that page to explicitly say the code is proof of
concept.

< snip >

I'll reply to the rest of the email separately.

-Frank
