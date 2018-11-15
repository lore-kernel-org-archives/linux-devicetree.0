From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: gpio: add sama5d2 PIOBU support
Date: Thu, 15 Nov 2018 10:43:05 +0100
Message-ID: <CACRpkdZvJmH61C8Rd3TeTioag+11GHPGdCDwRHxx3UAzB-rUHg@mail.gmail.com>
References: <1541603580-17448-1-git-send-email-andrei.stefanescu@microchip.com>
 <1541603580-17448-2-git-send-email-andrei.stefanescu@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541603580-17448-2-git-send-email-andrei.stefanescu@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrei.Stefanescu@microchip.com
Cc: Greg KH <gregkh@linuxfoundation.org>, Nicolas Ferre <Nicolas.Ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ludovic Desroches <Ludovic.Desroches@microchip.com>, Cristian.Birsan@microchip.com, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 7, 2018 at 4:12 PM <Andrei.Stefanescu@microchip.com> wrote:

> +Required properties:
> +- compatible:          "syscon", "microchip,sama5d2-piobu"

Looks like "syscon" should be dropped, it is using a syscon,
but it is no syscon.

> +       secumod@fc040000 {
> +               compatible = "syscon", "microchip,sama5d2-piobu";
> +               reg = <0xfc040000 0x100>;
> +
> +               gpio-controller;
> +               #gpio-cells = <2>;
> +       };

Isn't it easiest to just make this driver be a subnode of the
syscon so it can just refer to its parent to find the
syscon it needs?

Just state that in the bindings and make an example where
it is inside the syscon.

Yours,
Linus Walleij
