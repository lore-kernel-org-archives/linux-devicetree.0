From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] of/address: replace printk() with pr_debug() / pr_err()
Date: Wed, 9 Dec 2015 22:36:58 +0200
Message-ID: <CAHp75VcXGA1kFt6+g8QAu6VDnF24eff+CNVu_wy8zBn68XpHmg@mail.gmail.com>
References: <1449590868-19070-1-git-send-email-yamada.masahiro@socionext.com>
	<1449591386.3315.2.camel@perches.com>
	<1449594231.13275.2.camel@perches.com>
	<CAL_JsqJ0oftptSxyAcGOnQ3XA9v55B2n=8DiWBcErcLKgfsppg@mail.gmail.com>
	<1449619439.18646.20.camel@perches.com>
	<CAHp75VeN3hX4Dus6LLaie5c3xkdgQQc55fCOoAQ15JNib9La=A@mail.gmail.com>
	<1449689319.25389.28.camel@perches.com>
	<CAHp75VdHrG_uk9K7B=q8+ZnjNehJ2AY=-RsMGByxn62Uh_-sRA@mail.gmail.com>
	<87si3b8jha.fsf@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87si3b8jha.fsf@rasmusvillemoes.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Joe Perches <joe@perches.com>, Rob Herring <robh+dt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 9, 2015 at 10:17 PM, Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
> On Wed, Dec 09 2015, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>> On Wed, Dec 9, 2015 at 9:28 PM, Joe Perches <joe@perches.com> wrote:

>>> +enum {
>>> +       DUMP_TYPE_CPU = 0,
>>
>> And still open this, do we need it? I think you may just mention in
>> the documentation that default behaviour is CPU like.
>
> I think it's best to have a name for the default. In this case it's
> unlikely to ever be relevant, but in general one could imagine stuff
> like
>
> #ifdef THIS_OR_THAT
> #define MY_DUMP_TYPE DUMP_TYPE_LE
> #else
> #define MY_DUMP_TYPE DUMP_TYPE_CPU
> #endif
>
> which is a lot more readable than if the latter was a naked 0.

Point taken.

Though _CPU suggests user to think if it's equivalent to BE or LE. I'm
wondering if _NATIVE is better?

-- 
With Best Regards,
Andy Shevchenko
