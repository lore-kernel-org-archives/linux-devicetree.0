From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 0/6] genirq/gpio: Add driver for ThunderX and OCTEON-TX SoCs
Date: Thu, 23 Feb 2017 14:37:02 +0100
Message-ID: <CACRpkdYBwnBLzpwjTTZhsC81YOS2DRJ=mJ3GyW3Nn_P5bcSN1A@mail.gmail.com>
References: <1487206866-4011-1-git-send-email-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1487206866-4011-1-git-send-email-david.daney@cavium.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Daney <david.daney@cavium.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 16, 2017 at 2:01 AM, David Daney <david.daney@cavium.com> wrote:

> The ThunderX/OCTEON-TX GPIO hardware looks like a PCIe device, with
> the interrupt signal from each GPIO line being routed to a dedicated
> MSI-X.  This interrupt routing requires that we add some custom
> processing to the beginning of the MSI-X irqdomain hierarchy.
>
> Changes from v3:

Hats of for this series.

It's just a very genuinely well done piece of engineering.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

For all of the patches.

Once the IRQ portions are fine with the maintainers:

If Marc/Greg want to merge all of it (including the GPIO driver)
I'm happy for them to do so with my ACK.

Else I can take an immutable branch from the IRQ tree into the
GPIO tree, or merge all the patches to the GPIO tree with their
ACKs (if they feel safe about that).

Yours,
Linus Walleij
