From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: atmel: describe SECUMOD usage as
 a GPIO controller
Date: Fri, 21 Dec 2018 10:55:09 +0100
Message-ID: <CACRpkdY+u0jiPNwbFR6pnaFm4VyXmw3q6JTBS+HNUniDuWaOXA@mail.gmail.com>
References: <1544615784-29331-1-git-send-email-andrei.stefanescu@microchip.com>
 <1544615784-29331-2-git-send-email-andrei.stefanescu@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544615784-29331-2-git-send-email-andrei.stefanescu@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrei.Stefanescu@microchip.com
Cc: Rob Herring <robh+dt@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Nicolas Ferre <Nicolas.Ferre@microchip.com>, Mark Rutland <mark.rutland@arm.com>, Ludovic Desroches <Ludovic.Desroches@microchip.com>, Cristian.Birsan@microchip.com, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 12, 2018 at 12:57 PM <Andrei.Stefanescu@microchip.com> wrote:

> This patch describes the Security Module's usage as a GPIO
> controller for its PIOBU pins. These pins have the special
> property of maintaining their voltage during suspend-to-mem.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@microchip.com>

Patch applied with Rob's ACK.

Yours,
Linus Walleij
