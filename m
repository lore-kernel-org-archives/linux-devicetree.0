From: Rasmus Villemoes <linux-qQsb+v5E8BnlAoU/VqSP6n9LOBIZ5rWg@public.gmane.org>
Subject: Re: [PATCH v2] of/address: replace printk() with pr_debug() / pr_err()
Date: Wed, 09 Dec 2015 21:17:37 +0100
Message-ID: <87si3b8jha.fsf@rasmusvillemoes.dk>
References: <1449590868-19070-1-git-send-email-yamada.masahiro@socionext.com>
	<1449591386.3315.2.camel@perches.com>
	<1449594231.13275.2.camel@perches.com>
	<CAL_JsqJ0oftptSxyAcGOnQ3XA9v55B2n=8DiWBcErcLKgfsppg@mail.gmail.com>
	<1449619439.18646.20.camel@perches.com>
	<CAHp75VeN3hX4Dus6LLaie5c3xkdgQQc55fCOoAQ15JNib9La=A@mail.gmail.com>
	<1449689319.25389.28.camel@perches.com>
	<CAHp75VdHrG_uk9K7B=q8+ZnjNehJ2AY=-RsMGByxn62Uh_-sRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHp75VdHrG_uk9K7B=q8+ZnjNehJ2AY=-RsMGByxn62Uh_-sRA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
	(Andy Shevchenko's message of "Wed, 9 Dec 2015 22:02:26 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel@vger.kernel.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 09 2015, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> On Wed, Dec 9, 2015 at 9:28 PM, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org> wrote:
>> ---
>>  include/linux/printk.h |  7 +++++++
>>  lib/hexdump.c          | 39 +++++++++++++++++++++++++++++++--------
>>  2 files changed, 38 insertions(+), 8 deletions(-)
>>
>> diff --git a/include/linux/printk.h b/include/linux/printk.h
>> index 9729565..4be190c 100644
>> --- a/include/linux/printk.h
>> +++ b/include/linux/printk.h
>> @@ -424,6 +424,13 @@ enum {
>>         DUMP_PREFIX_ADDRESS,
>>         DUMP_PREFIX_OFFSET
>>  };
>> +
>> +enum {
>> +       DUMP_TYPE_CPU = 0,
>
> And still open this, do we need it? I think you may just mention in
> the documentation that default behaviour is CPU like.

I think it's best to have a name for the default. In this case it's
unlikely to ever be relevant, but in general one could imagine stuff
like

#ifdef THIS_OR_THAT
#define MY_DUMP_TYPE DUMP_TYPE_LE
#else
#define MY_DUMP_TYPE DUMP_TYPE_CPU
#endif

which is a lot more readable than if the latter was a naked 0.

The feature seems fine to me. It's always been somewhat annoying that
grouping changes the order of the byte values on little-endian machines
(so grouping is actually a wrong name for it; it's more like "treat the
bytes an array of u16/u32/u64"), and one can now get around that by
specifying DUMP_TYPE_BE.

Rasmus
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
