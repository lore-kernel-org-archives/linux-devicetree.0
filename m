From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] of/address: replace printk() with pr_debug() / pr_err()
Date: Tue, 8 Dec 2015 15:28:10 -0600
Message-ID: <CAL_JsqJ0oftptSxyAcGOnQ3XA9v55B2n=8DiWBcErcLKgfsppg@mail.gmail.com>
References: <1449590868-19070-1-git-send-email-yamada.masahiro@socionext.com>
 <1449591386.3315.2.camel@perches.com> <1449594231.13275.2.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449594231.13275.2.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 8, 2015 at 11:03 AM, Joe Perches <joe@perches.com> wrote:
> On Tue, 2015-12-08 at 08:16 -0800, Joe Perches wrote:
>> On Wed, 2015-12-09 at 01:07 +0900, Masahiro Yamada wrote:
>> > Trivial changes suggested by checkpatch.pl.
>> []
>> > diff --git a/drivers/of/address.c b/drivers/of/address.c
>> []
>> > @@ -23,7 +23,7 @@ static int __of_address_to_resource(struct device_node *dev,
>> >  #ifdef DEBUG
>> >  static void of_dump_addr(const char *s, const __be32 *addr, int na)
>> >  {
>> > -   printk(KERN_DEBUG "%s", s);
>> > +   pr_debug("%s", s);
>> >     while (na--)
>> >             printk(" %08x", be32_to_cpu(*(addr++)));
>> >     printk("\n");
>>
>> mixing pr_debug and printk doesn't make much sense.
>>
>> It might be nicer to use
>>
>> static void of_dumpaddr(const char *s, const __be32 *addr, int na)
>> {
>> #ifdef DEBUG
>>       ...
>> #endif
>> }
>>
>> to avoid the other static declaration
>
> Or more simply:
>
> static void of_dumpaddr(const char *s, const __be32 *addr, int na)
> {
>         print_hex_dump_debug(s, DUMP_PREFIX_NONE, 16, 1,
>                              addr, na * sizeof(__be32), false);
> }

Except that it doesn't do the endian swapping. Looking closer at this,
we should just drop this hunk. So I will take v1.

Rob
