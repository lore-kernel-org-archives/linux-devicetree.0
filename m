From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v7 0/5] Add Actions Semi S700 pinctrl support
Date: Mon, 19 Nov 2018 14:15:02 +0100
Message-ID: <CACRpkdbBmujFjpu0uyH4vTN8BUfp8Mq0Yt1KWnfTkihQ34pJLA@mail.gmail.com>
References: <20181115124748.268286-1-pn@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181115124748.268286-1-pn@denx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: pn@denx.de
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, mp-cs@actions-semi.com, "Thomas C. Liau" <thomas.liau@actions-semi.com>, linux@cubietech.com, saravanan sekar <sravanhome@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 15, 2018 at 1:48 PM Parthiban Nallathambi <pn@denx.de> wrote:

> This patchset adds pinctrl support for Actions Semi S700 SoC.
> Pinmux functions are only accessible for pin groups while pinconf
> parameters are available for both pin groups and individual pins.

This v7 patch set applied for v4.21, thanks a *lot* for your work!

Let's see if there is some bugs to shake out in the linux-next
builds, the grunt work is done.

Yours,
Linus Walleij
