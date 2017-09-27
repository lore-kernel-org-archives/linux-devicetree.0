From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v7 1/2] dt-bindings: gpio: uniphier: add UniPhier GPIO binding
Date: Wed, 27 Sep 2017 15:42:05 +0200
Message-ID: <CACRpkdYJSXH+94QScrpSPdfy8ULa6dV2q0qRjsfKAAWSRuKTKQ@mail.gmail.com>
References: <1506480343-9597-1-git-send-email-yamada.masahiro@socionext.com> <1506480343-9597-2-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1506480343-9597-2-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 27, 2017 at 4:45 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> This GPIO controller is used on UniPhier SoC family.
>
> The vendor specific property "socionext,interrupt-ranges" is for
> specifying interrupt mapping to the parent interrupt controller
> because the mapping is not contiguous.  It works like "ranges",
> but transforms "interrupts" instead of "reg".
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Acked-by: Rob Herring <robh@kernel.org>

I don't think Rob has seen the new interrupt range thing?
(It's not a big deal. Things like these are a bit fuzzy.)

> +               socionext,interrupt-ranges = <0 48 16>, <16 154 5>, <21 217 3>;

If it is as you say, that other SoCs are doing the same, we should
think about creating a generic property for this. Like
hierarchy-interrupt-ranges or so.

I kind of liked the old patch where it was just "interrupts" and
then you looked it up from the irq subsystem. (tglx even ACKed
the patch).

But I want the DT people to say something here.

Yours,
Linus Walleij
