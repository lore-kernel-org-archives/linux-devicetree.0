From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: dtc: import latest upstream dtc
Date: Wed, 10 Oct 2012 12:40:12 -0600
Message-ID: <5075C10C.1030205@wwwdotorg.org>
References: <1348867559-2495-1-git-send-email-swarren@wwwdotorg.org> <5069C042.40209@gmail.com> <5069C11C.6040505@wwwdotorg.org> <5069D946.1060502@gmail.com> <5069E1F0.5070902@wwwdotorg.org> <E1TIktZ-0000U4-Qh@jdl.com> <50749441.8030307@wwwdotorg.org> <5075ABB8.103@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5075ABB8.103@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Jon Loeliger <jdl@jdl.com>, Michal Marek <mmarek@suse.cz>, David Gibson <david@gibson.dropbear.id.au>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 10/10/2012 11:09 AM, Rob Herring wrote:
> On 10/09/2012 04:16 PM, Stephen Warren wrote:
>> On 10/01/2012 12:39 PM, Jon Loeliger wrote:
>>>>
>>>> What more do you think needs discussion re: dtc+cpp?
>>>
>>> How not to abuse the ever-loving shit out of it? :-)
>>
>> Perhaps we can just handle this through the regular patch review
>> process; I think it may be difficult to define and agree upon exactly
>> what "abuse" means ahead of time, but it's probably going to be easy
>> enough to recognize it when one sees it?
> 
> Rather than repeating things over and over in reviews, we should
> document at least rules we can easily agree on and then add to it when
> people get "creative." Also, I can't keep up with every single binding
> review as is, and this could just add another level of complexity to the
> review. A few off the top of my head and from the thread discussion:
> 
> - Headers must be self contained with no outside (i.e. libc, kernel,
> etc.) header dependencies.
> - No kernel kconfig option usage
> - No gcc built-in define usage
> - No unused items (i.e. externs, structs, etc.)

> - No macro concatenation

That seems to be potentially a very useful feature; I have no idea why
we would ban that; it isn't banned in C code in the kernel is it?

> - No macros for strings or property names

Property names I can understand. Property values - I can perhaps see a
use-case for...
