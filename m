From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 5/5] MAINTAINERS: Add Actions Semi S900 pinctrl entries
Date: Wed, 23 May 2018 10:40:48 +0200
Message-ID: <CACRpkdYF7a-uwye0uwn-pT9Bprj74q1-Pcbq4WLyiE+kYY4j7w@mail.gmail.com>
References: <20180520051736.4842-1-manivannan.sadhasivam@linaro.org> <20180520051736.4842-6-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180520051736.4842-6-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: Rob Herring <robh+dt@kernel.org>, liuwei@actions-semi.com, mp-cs@actions-semi.com, 96boards@ucrobotics.com, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Daniel Thompson <daniel.thompson@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, hzhang@ucrobotics.com, bdong@ucrobotics.com, Mani Sadhasivam <manivannanece23@gmail.com>
List-Id: devicetree@vger.kernel.org

On Sun, May 20, 2018 at 7:17 AM, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

> Add S900 pinctrl entries under ARCH_ACTIONS
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Patch applied tentatively so we have some maintenance entry for this.

Andreas expressed concerns about the driver earlier, so he might want it
split from the platform parts and have a separate entry for the pinctrl+GPIO
so Manivannan can maintain that part, also it makes sense to list
Manivannan as comaintainer of ARCH_ACTIONS with this in.

Andreas: how would you like to proceed?

I understand that I was a bit pushy or even rude in my last message
about the maintenance of this platform and the code structure of
the pin control driver. I am sorry if it caused any bad feelings on your
side :( social conflicts give me the creeps, I just try my best. Maybe
my best isn't always what it should be.

Yours,
Linus Walleij
