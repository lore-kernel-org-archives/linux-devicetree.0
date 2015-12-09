From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v2] of/address: replace printk() with pr_debug() /
 pr_err()
Date: Wed, 09 Dec 2015 12:42:23 -0800
Message-ID: <1449693743.25389.59.camel@perches.com>
References: <1449590868-19070-1-git-send-email-yamada.masahiro@socionext.com>
	 <1449591386.3315.2.camel@perches.com>
	 <1449594231.13275.2.camel@perches.com>
	 <CAL_JsqJ0oftptSxyAcGOnQ3XA9v55B2n=8DiWBcErcLKgfsppg@mail.gmail.com>
	 <1449619439.18646.20.camel@perches.com>
	 <CAHp75VeN3hX4Dus6LLaie5c3xkdgQQc55fCOoAQ15JNib9La=A@mail.gmail.com>
	 <1449689319.25389.28.camel@perches.com>
	 <CAHp75VdHrG_uk9K7B=q8+ZnjNehJ2AY=-RsMGByxn62Uh_-sRA@mail.gmail.com>
	 <87si3b8jha.fsf@rasmusvillemoes.dk>
	 <CAHp75VcXGA1kFt6+g8QAu6VDnF24eff+CNVu_wy8zBn68XpHmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VcXGA1kFt6+g8QAu6VDnF24eff+CNVu_wy8zBn68XpHmg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Rob Herring <robh+dt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2015-12-09 at 22:36 +0200, Andy Shevchenko wrote:
[]
> wondering if _NATIVE is better?

I think CPU is better myself and it's already
in use like:

include/linux/iio/iio.h-enum iio_endian {
include/linux/iio/iio.h:	IIO_CPU,
include/linux/iio/iio.h-	IIO_BE,
include/linux/iio/iio.h-	IIO_LE,
