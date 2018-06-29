From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/3] pinctrl: actions: Add interrupt support for OWL
 S900 SoC
Date: Fri, 29 Jun 2018 14:31:54 +0200
Message-ID: <CACRpkdZcUJBsb-P5eT3PcYe1ukYCU8OC95pBbR58wYXutdT1JQ@mail.gmail.com>
References: <20180623045954.6729-1-manivannan.sadhasivam@linaro.org> <20180623045954.6729-4-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180623045954.6729-4-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, liuwei@actions-semi.com, mp-cs@actions-semi.com, 96boards@ucrobotics.com, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Daniel Thompson <daniel.thompson@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, hzhang@ucrobotics.com, bdong@ucrobotics.com, Mani Sadhasivam <manivannanece23@gmail.com>, "Thomas C. Liau" <thomas.liau@actions-semi.com>, Jeff Chen <jeff.chen@actions-semi.com>
List-Id: devicetree@vger.kernel.org

On Sat, Jun 23, 2018 at 7:00 AM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

> Add interrupt support for Actions Semi OWL S900 SoC.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Patch applied with Andy's review tag.

I really like the looks of this!

If you have ideas on how we can move more of the multiple
IRQ parent per-bank IRQ into the core and make it easier to
use, feel free to contribute ideas and code :)

Yours,
Linus Walle=C3=ADj
