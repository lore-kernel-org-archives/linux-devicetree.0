From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl: bcm: Allow PINCTRL_BCM2835 for ARCH_BRCMSTB
Date: Thu, 16 May 2019 15:25:36 +0200
Message-ID: <CACRpkdYXp3LMXrSQrndUWWNq0eYb=P22FC9V0__j2AZPGCq0Jw@mail.gmail.com>
References: <20190509205955.27842-1-f.fainelli@gmail.com> <20190509205955.27842-3-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190509205955.27842-3-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, Doug Berger <opendmb@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>, Matheus Castello <matheus@castello.eng.br>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Lukas Wunner <lukas@wunner.de>, Nathan Chancellor <natechancellor@gmail.com>, Al Cooper <alcooperx@gmail.com>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 9, 2019 at 11:01 PM Florian Fainelli <f.fainelli@gmail.com> wrote:

> From: Doug Berger <opendmb@gmail.com>
>
> ARCH_BRCMSTB needs to use the BCM2835 pin controller for chips
> like BCM7211 which adopted that pin controller for GPIO. This
> commit makes the option menu configurable with default enabled
> for ARCH_BRCMSTB and ARCH_BCM2835.
>
> Signed-off-by: Doug Berger <opendmb@gmail.com>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Patch applied for v5.3 with the ACKs.

Yours,
Linus Walleij
