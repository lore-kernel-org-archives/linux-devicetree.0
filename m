From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [RFC PATCH] of: overlay: update phandle cache on overlay apply
 and remove
Date: Wed, 20 Jun 2018 22:52:34 -0700
Message-ID: <1bb4ef5c-5813-fbea-9536-48b339c1e010@gmail.com>
References: <1529251416-14814-1-git-send-email-frowand.list@gmail.com>
 <CAL_JsqJdp16D4svB8Y7jurNVdHzVgz8_pkOKBA6mFyhXkqWi6w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqJdp16D4svB8Y7jurNVdHzVgz8_pkOKBA6mFyhXkqWi6w@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Alan Tull <atull@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

On 06/20/18 11:23, Rob Herring wrote:
> On Sun, Jun 17, 2018 at 10:03 AM,  <frowand.list@gmail.com> wrote:
>> From: Frank Rowand <frank.rowand@sony.com>
>>
>> A comment in the review of the patch adding the phandle cache said that
>> the cache would have to be updated when modules are applied and removed.
>> This patch implements the cache updates.
>>
>> Fixes: 0b3ce78e90fc ("of: cache phandle nodes to reduce cost of of_find_node_by_phandle()")
>> Reported-by: Alan Tull <atull@kernel.org>
>> Suggested-by: Alan Tull <atull@kernel.org>
>> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
>> ---
>>
>> Compiles for one configuration.
>> NOT boot tested.
>> Not run through my normal process to check for new warnings, etc.
> 
> I'm assuming you will resend a non-RFC version for me to apply.

Yes, I will.

> 
> I think it would be a bit better if callers didn't have to do free and
> populate themselves, but just made an invalidate call (like a normal
> cache) and re-populating the cache could happen on demand. Or if it
> was done as a single call, you could just copy the old entries to the
> new larger array. But maybe there would be a race condition in doing
> that? In any case, all that could be a subsequent patch.

Yes, the unspoken, underlying issue is a race condition.  I'll update
the commit comment to explain the race issues a little bit.  And maybe
add a code comment if I can be concise enough.

-Frank

> 
> Rob
> 
