From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 4/9] dt-bindings: gpio: Add gpio nodes for Actions S900 SoC
Date: Thu, 12 Apr 2018 10:54:28 +0200
Message-ID: <CACRpkdYtdJc7jXfFPmXQUg5Q5YACk29-FvohOkXMmnOgV5_NzQ@mail.gmail.com>
References: <20180328174703.19778-1-manivannan.sadhasivam@linaro.org> <20180328174703.19778-5-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180328174703.19778-5-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, liuwei@actions-semi.com, mp-cs@actions-semi.com, 96boards@ucrobotics.com, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Daniel Thompson <daniel.thompson@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, hzhang@ucrobotics.com, bdong@ucrobotics.com, Mani Sadhasivam <manivannanece23@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 28, 2018 at 7:46 PM, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

> Add gpio nodes for Actions Semi S900 SoC.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

This should probably have Subject "add bindings" rather than "add gpio nodes"
but it's fine, I can fix it up when applying if I just get Rob's ACK
on these bindings (that look entirely uncontroversial).

Yours,
Linus Walleij
