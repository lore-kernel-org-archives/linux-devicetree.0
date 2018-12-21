From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 2/2] gpio: add driver for SAMA5D2 PIOBU pins
Date: Fri, 21 Dec 2018 10:57:03 +0100
Message-ID: <CACRpkdaeyHOhGDR4HAJR6sSVFA-fGXNwY63rzicER-GFoBQtPA@mail.gmail.com>
References: <1544615784-29331-1-git-send-email-andrei.stefanescu@microchip.com>
 <1544615784-29331-3-git-send-email-andrei.stefanescu@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544615784-29331-3-git-send-email-andrei.stefanescu@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrei.Stefanescu@microchip.com
Cc: Rob Herring <robh+dt@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Nicolas Ferre <Nicolas.Ferre@microchip.com>, Mark Rutland <mark.rutland@arm.com>, Ludovic Desroches <Ludovic.Desroches@microchip.com>, Cristian.Birsan@microchip.com, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 12, 2018 at 12:57 PM <Andrei.Stefanescu@microchip.com> wrote:

> PIOBU pins do not lose their voltage during Backup/Self-refresh.
> This patch adds a simple GPIO controller for them and a
> maintainer for the driver.
>
> This driver adds support for using the pins as GPIO
> offering the possibility to read/set the voltage.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@microchip.com>

Patch applied for v4.21, sorry for taking so long to reply!

Good work on this driver Andrei, it looks really nice now.

Yours,
Linus Walleij
