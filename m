From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 03/10] of/irq: document properties for wakeup interrupt parent
Date: Wed, 17 Apr 2019 16:36:36 +0200
Message-ID: <CACRpkdZW8OhqmNdeC8KmiAN6iTDAm7NUzGGmu5+-3utdT+dtCg@mail.gmail.com>
References: <20190313211844.29416-1-ilina@codeaurora.org> <20190313211844.29416-4-ilina@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190313211844.29416-4-ilina@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lina Iyer <ilina@codeaurora.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Cc: Stephen Boyd <swboyd@chromium.org>, Evan Green <evgreen@chromium.org>, Marc Zyngier <marc.zyngier@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, rplsssn@codeaurora.org, linux-arm-msm@vger.kernel.org, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Doug Anderson <dianders@chromium.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 13, 2019 at 10:19 PM Lina Iyer <ilina@codeaurora.org> wrote:

> +Mapping the interrupt specifiers in the device tree can be done using the
> +"irqdomain-map" property. The property contains interrupt specifier at the
> +current interrupt controller followed by the interrupt specifier at the mapped
> +interrupt controller.
> +
> +   irqdomain-map = <incoming-interrupt-specifier mapped-interrupt-specifier>
> +
> +The optional properties "irqdomain-map-mask" and "irqdomain-map-pass-thru" may
> +be provided to help interpret the valid bits of the incoming and mapped
> +interrupt specifiers respectively.
> +
> +   Example:
> +       irqdomain-map = <22 0 &intc 36 0>, <24 0 &intc 37 0>;
> +       irqdomain-map-mask = <0xff 0>;
> +       irqdomain-map-pass-thru = <0 0xff>;

This is looking a bit familiar to the existing interrupt-map that is
used for PCI interrupts and Swizzling back to a set of PCI
host interrupts.

I tried to document interrupt-map here:
https://elinux.org/Device_Tree_Usage#Advanced_Interrupt_Mapping

interrupt-map is a bit convoluted, so I don't know if it would be subject
to reuse for this. I suspect that interrupt-map, despite the name,
is for PCI only.

Yours,
Linus Walleij
