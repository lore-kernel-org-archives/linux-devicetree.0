From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Driver for SYSCON-based GPIOs
Date: Thu, 12 Dec 2013 19:52:38 +0100
Message-ID: <CACRpkdZ6kcEiYuVc5CMmsstr5L1oHp-EY6QXZGeKb2f_RTgPWQ@mail.gmail.com>
References: <1386689216-5139-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1386689216-5139-1-git-send-email-shc_work@mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 10, 2013 at 4:26 PM, Alexander Shiyan <shc_work@mail.ru> wrote:

> SYSCON driver was designed for using memory areas (registers)
> that are used in several subsystems. There are systems (CPUs)
> which use bits in one register for various purposes and thus
> should be handled by various kernel subsystems. This driver
> allows you to use the individual SYSCON bits as GPIOs.
>
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
(...)
> ---
> +Required properties:
> +- compatible: Should be "gpio-syscon".
> +- syscon: Phandle to syscon device node.
> +- gpio-controller: Marks the device node as a gpio controller.
> +- #gpio-cells: Should be two. The first cell is the pin number and
> +  the second cell is used to specify the gpio polarity:
> +    0 = Active high,
> +    1 = Active low.
> +- bit-offset: Offset to the first bit used by driver.
> +- bit-count: Number of bits used.
> +
> +Example:
> +       sysgpio: sysgpio {
> +               compatible = "gpio-syscon";
> +               syscon = <&syscon>;
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +               bit-offset = <4>;
> +               bit-count = <1>;

I take it that bit-offset can be say 1024 and bit count
32 for a 32-bit register at syscon_base + 0x80?

I have a real big problem with encoding register offsets into
the device tree as I have stated before, it is starting to
get real hard to debug this, like:

"hmmm where did this go wrong?"

"in the byte offset from the base stored in this
other driver plus ... 1024? no wait, that is stored
it bit notation so I need to divide by 8 ... hm which
was it now ... and where do I have all these figures
in my ICE debugger?"

The code is not helpful anymore, you have to go in
and reverse-engineer this and bring up a calculator
to figure out what is going on.

I sort of like the syscon driver but I don't like the idea
of encoding register offsets into the device tree, even
less do I like the idea of encoding it in bit notation.

I prefer that you put a header with all the offsets
into <linux/mfd/syscon-foo.h> and define all the
offsets there, then to reuse this driver with several
GPIO controllers all doing this GPIO-in-syscon
business, to #include <linux/mfd/syscon-bar.h>
etc and use the compatible string to figure out
which file to pick the offsets from.

I know I may be alone in thinking this so if other
smarter people think this register-offset-in-DT
is a real good idea I guess I need to rest my
case... anyway I'll need the ACK of the DT
bindings maintainers to proceed and I'd even like
two of them to vote me down on this if I shall
apply this to the GPIO tree.

Yours,
Linus Walleij
