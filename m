From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: gpio: Add binding documentation for gpio-thunderx
Date: Mon, 9 Jan 2017 20:36:57 +0100
Message-ID: <CACRpkdZ0xkhUC7_0A4uHxpGaU7BHgNp8TNuDPuPN9h6dDsQx4g@mail.gmail.com>
References: <1483744980-25898-1-git-send-email-ddaney.cavm@gmail.com> <1483744980-25898-2-git-send-email-ddaney.cavm@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1483744980-25898-2-git-send-email-ddaney.cavm@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: David Daney <ddaney.cavm@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Daney <david.daney@cavium.com>
List-Id: devicetree@vger.kernel.org

On Sat, Jan 7, 2017 at 12:22 AM, David Daney <ddaney.cavm@gmail.com> wrote:

> From: David Daney <david.daney@cavium.com>
>
> Signed-off-by: David Daney <david.daney@cavium.com>
(...)

> +Optional Properties:
> +- compatible: "cavium,thunder-8890-gpio", unused as PCI driver binding is used.
> +- interrupt-controller: Marks the device node as an interrupt controller.
> +- #interrupt-cells: Must be present and have value of 2 if
> +                    "interrupt-controller" is present.
> +  - First cell is the GPIO pin number relative to the controller.
> +  - Second cell is triggering flags as defined in interrupts.txt.

AFAICT this device has an optional list of interrupts as well?
One per pin even?

Yours,
Linus Walleij
