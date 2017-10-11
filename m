From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: gpio: uniphier: add UniPhier GPIO binding
Date: Wed, 11 Oct 2017 10:35:59 +0200
Message-ID: <CACRpkdaJE_-tfZ+Mr3UowY9W0EdEwWEMdfhCfkj7VVOzje7MrA@mail.gmail.com>
References: <1506480022-8995-1-git-send-email-yamada.masahiro@socionext.com> <1506480022-8995-2-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1506480022-8995-2-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 27, 2017 at 4:40 AM, Masahiro Yamada
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

Patch applied.

> +- socionext,interrupt-ranges: Specifies an interrupt number mapping between
> +  this GPIO controller and its interrupt parent, in the form of arbitrary
> +  number of <child-interrupt-base parent-interrupt-base length> triplets.
(...)
> +               socionext,interrupt-ranges = <0 48 16>, <16 154 5>, <21 217 3>;

Still uncertain about that thing.

But as it is, you need running code, and we have rough consensus.

So merging.

If it turns out to be a bad binding we may need to patch in an alternative
later.

Yours,
Linus Walleij
