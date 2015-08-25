From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 0/3] ARM: uniphier: add outer cache support and rework SMP operations
Date: Mon, 24 Aug 2015 20:05:45 -0700
Message-ID: <CAOesGMj2M2GBE+KgkUw1PeWQEbzv0spkx58WfVDoGyPYDQGC4g@mail.gmail.com>
References: <1440382692-3855-1-git-send-email-yamada.masahiro@socionext.com>
	<CAOesGMgL3bNH_wG3igSJhNOkV0uUfNWEi0t-Gny2A1oNnGKu=w@mail.gmail.com>
	<CAK7LNAQk4aEgZV3y90zBVMeq=jA45v683sCR1e5BBYtg5AcDOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNAQk4aEgZV3y90zBVMeq=jA45v683sCR1e5BBYtg5AcDOA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Jungseung Lee <js07.lee@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, "arm@kernel.org" <arm@kernel.org>, Jiri Slaby <jslaby@suse.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Joe Perches <joe@perches.com>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Paul Bolle <pebolle@tiscali.nl>, Greg KH <gregkh@linuxfoundation.org>, Nathan Lynch <nathan_lynch@mentor.com>"linux-kernel@vger.kernel.org" <linu>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 24, 2015 at 6:50 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Hi Olof,
>
>
> 2015-08-25 6:47 GMT+09:00 Olof Johansson <olof@lixom.net>:
>> Hi,
>>
>> On Sun, Aug 23, 2015 at 7:18 PM, Masahiro Yamada
>> <yamada.masahiro@socionext.com> wrote:
>>> 1/3: add outer cache support
>>> 2/3: rework SMP operations
>>> 3/3: add device tree nodes
>>
>> Timing of this is unfortunate, please resend after 4.3-rc1 is out and
>> we can queue it up.
>
> Given that rc8 is out and the merge window has been delayed,
> is it still too late for 4.3-rc1?

Yes.

>>> Because 2/3 highly depends on 1/3, I hope whole of this series
>>> is applied to ARM-SOC tree.
>>
>> Review or acked-by from Russell would be appreciated in that case.
>>
>>> Olof,
>>> From this series, I am using "ARM: uniphier:" rather than "ARM: UniPhier:"
>>> for the subject prefixes because I noticed you often rephased so when you
>>> applied my patches.
>>> Are sub-arch names in lower cases preferable in subject prefixes?
>>
>> If you look at "git log --no-merges --oneline arch/arm/mach-*" you'll
>> see that most platforms use either all-caps or all-lowercase.
>
> I see.
>
> But, we use "UniPhier" (with only U and P capitalized) in our official
> documents.

That's OK, others surely capitalize their platform names too in
documentation. Some of them even have funkier capitalization than
that, such as "SPEAr".


-Olof
