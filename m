From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v4 2/2] of: Add unit tests for applying overlays
Date: Thu, 27 Jul 2017 16:46:23 -0700
Message-ID: <597A7B4F.2000702@gmail.com>
References: <1493165394-29367-1-git-send-email-frowand.list@gmail.com>
 <1493165394-29367-3-git-send-email-frowand.list@gmail.com>
 <CAL_JsqKZ5JcunaY9K5MEjyS-sxargKtJq11x+DVMwHs8WrnH+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKZ5JcunaY9K5MEjyS-sxargKtJq11x+DVMwHs8WrnH+Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Stephen Boyd <stephen.boyd@linaro.org>, Michal Marek <mmarek@suse.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 07/25/17 13:36, Rob Herring wrote:
> On Tue, Apr 25, 2017 at 7:09 PM,  <frowand.list@gmail.com> wrote:
>> From: Frank Rowand <frank.rowand@sony.com>
>>
>> Existing overlay unit tests examine individual pieces of the overlay
>> code.  The new tests target the entire process of applying an overlay.
>>
>> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
>> ---
> 
> [...]
> 
>> @@ -1261,6 +1263,8 @@ void __init unflatten_device_tree(void)
>>
>>         /* Get pointer to "/chosen" and "/aliases" nodes for use everywhere */
>>         of_alias_scan(early_init_dt_alloc_memory_arch);
>> +
>> +       unittest_unflatten_overlay_base();
> 
> This breaks on systems that don't boot with FDT and call
> unflatten_device_tree, namely x86 and UML (UML needs a few hacks to
> work) which was a feature of the unittest. Considering applying
> overlays on x86 is something we'll want to support, the unittest
> should support that case.
> 
> Rob
> 

I meant to reply when I read this...

I'll look at this, probably next week.  Thanks for pointing out
the issue.

-Frank
