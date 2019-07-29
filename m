From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [v5 1/2] dt-bindings: gpio: aspeed: Add SGPIO support
Date: Mon, 29 Jul 2019 23:57:16 +0200
Message-ID: <CACRpkdZcLNe+oM1jWPpva0LECc-P48ab3H-kG7eabMmSvmvioA@mail.gmail.com>
References: <1563564291-9692-1-git-send-email-hongweiz@ami.com>
 <1563564291-9692-2-git-send-email-hongweiz@ami.com> <CACRpkdYhVoP75ZDfASW+DH5yf-a5diitiXsh7eLsJx5hsTC9sQ@mail.gmail.com>
 <ef9d9c17-6e2d-4a4e-ac44-f8da4bb3b8eb@www.fastmail.com> <CACRpkdZxsF9gQj0VicVLsPKXg6rKA1mLwbywmazOf0w8PLnOfA@mail.gmail.com>
 <f2875111-9ba9-43b7-b2a4-d00c8725f5a0@www.fastmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f2875111-9ba9-43b7-b2a4-d00c8725f5a0@www.fastmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Hongwei Zhang <hongweiz@ami.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Joel Stanley <joel@jms.id.au>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 29, 2019 at 2:19 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> The behaviour is to periodically emit the state of all enabled GPIOs
> (i.e. the ngpios value), one per bus clock cycle. There's no explicit
> addressing scheme, the protocol encodes the value for a given GPIO
> by its position in the data stream relative to a pulse on the "load data"
> (LD) line, whose envelope covers the clock cycle for the last GPIO in
> the sequence. Similar to SPI the bus has both out and in lines, which
> cater to output/input GPIOs.
>
> A rough timing diagram for a 16-GPIO configuration looks like what
> I've pasted here:
>
> https://gist.github.com/amboar/c9543af1957854474b8c05ab357f0675

OK that is complex. I agree we need to keep this driver together.

Yours,
Linus Walleij
