From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 2/2] pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO driver
Date: Wed, 29 Aug 2018 10:31:08 +0200
Message-ID: <CACRpkdb5PSx52xqeqiCO-dcQXT0uuUZGstvKP2YKUFnCnoWOpw@mail.gmail.com>
References: <20180808092526.87405-1-tmaimon77@gmail.com> <20180808092526.87405-3-tmaimon77@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180808092526.87405-3-tmaimon77@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>, Brendan Higgins <brendanhiggins@google.com>, avifishman70@gmail.com, Joel Stanley <joel@jms.id.au>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 8, 2018 at 11:26 AM Tomer Maimon <tmaimon77@gmail.com> wrote:

> Add Nuvoton BMC NPCM750/730/715/705 Pinmux and
> GPIO controller driver.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Patch applied! It's a very nice driver.

I had to add back select GPIO_GENERIC as the driver
uses bgpio_init() exactly as I wanted.

Yours,
Linus Walleij
