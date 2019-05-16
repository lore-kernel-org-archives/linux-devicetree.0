From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] pinctrl: bcm2835: bcm7211: Add support for 7211
 pull-up functionality
Date: Thu, 16 May 2019 15:27:40 +0200
Message-ID: <CACRpkdY3-yARtO9KQnUUMNefygzLC_c2RRn+ROZUdYfBJkRASQ@mail.gmail.com>
References: <20190509205955.27842-1-f.fainelli@gmail.com> <20190509205955.27842-4-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190509205955.27842-4-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, Al Cooper <alcooperx@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>, Doug Berger <opendmb@gmail.com>, Matheus Castello <matheus@castello.eng.br>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Lukas Wunner <lukas@wunner.de>, Nathan Chancellor <natechancellor@gmail.com>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 9, 2019 at 11:01 PM Florian Fainelli <f.fainelli@gmail.com> wrote:

> From: Al Cooper <alcooperx@gmail.com>
>
> The 7211 has a new way of selecting the pull-up/pull-down setting
> for a GPIO pin. The registers used for the bcm2837, GP_PUD and
> GP_PUDCLKn0, are no longer connected. A new set of registers,
> GP_GPIO_PUP_PDN_CNTRL_REGx must be used. This commit will add
> a new compatible string "brcm,bcm7211-gpio" and the kernel
> driver will use it to select which method is used to select
> pull-up/pull-down.
>
> Signed-off-by: Al Cooper <alcooperx@gmail.com>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Following the discussion with Stefan it appears this patch
needs more work, but you will only need to resend this
one patch.

Yours,
Linus Walleij
