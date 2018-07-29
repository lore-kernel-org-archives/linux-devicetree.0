From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] MIPS: mscc: ocelot: add interrupt controller
 properties to GPIO controller
Date: Sun, 29 Jul 2018 23:25:20 +0200
Message-ID: <CACRpkdbNAvoEagYwW0K7rQtnq6tsWnheiLuHQMhcUUBEs4FMrA@mail.gmail.com>
References: <20180725122621.31713-1-quentin.schulz@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180725122621.31713-1-quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: quentin.schulz@bootlin.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, paul.burton@mips.com, James Hogan <jhogan@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux MIPS <linux-mips@linux-mips.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 25, 2018 at 2:27 PM Quentin Schulz
<quentin.schulz@bootlin.com> wrote:

> The GPIO controller also serves as an interrupt controller for events
> on the GPIO it handles.
>
> An interrupt occurs whenever a GPIO line has changed.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
