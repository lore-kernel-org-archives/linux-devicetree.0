From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Driver for SYSCON-based GPIOs
Date: Thu, 12 Dec 2013 22:35:01 +0100
Message-ID: <CACRpkdY9umneaukyEr4W=7AxA8XuPY=ueBCiJNjQ+AihOu3Fog@mail.gmail.com>
References: <1386689216-5139-1-git-send-email-shc_work@mail.ru>
	<CACRpkdZ6kcEiYuVc5CMmsstr5L1oHp-EY6QXZGeKb2f_RTgPWQ@mail.gmail.com>
	<1386876057.320972508@f419.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1386876057.320972508@f419.i.mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 12, 2013 at 8:20 PM, Alexander Shiyan <shc_work@mail.ru> wrote:
>> On Tue, Dec 10, 2013 at 4:26 PM, Alexander Shiyan <shc_work@mail.ru> wrote:

>> I take it that bit-offset can be say 1024 and bit count
>> 32 for a 32-bit register at syscon_base + 0x80?
>
> This can be represented in DT as (0x80 << 4).

That's better of course but you still have to read both the
device tree and the driver and correlate to figure out
what's going on.

>> I sort of like the syscon driver but I don't like the idea
>> of encoding register offsets into the device tree, even
>> less do I like the idea of encoding it in bit notation.
>
> I also have no idea how to present it differently.
> Can try to specify the byte offset through the "reg" property?
> The "bit-offset" will remain, but will point offset from the "reg" byte.

This does not help. I don't want the offset inside the
device tree at all.

>> I prefer that you put a header with all the offsets
>> into <linux/mfd/syscon-foo.h> and define all the
>> offsets there, then to reuse this driver with several
>> GPIO controllers all doing this GPIO-in-syscon
>> business, to #include <linux/mfd/syscon-bar.h>
>> etc and use the compatible string to figure out
>> which file to pick the offsets from.
>
> No headers is needed. Driver will be used in DTS only.

I am claiming it is needed because I don't want it to
be inside the DTS, I want it to be in the kernel.

Yours,
Linus Walleij
