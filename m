From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v8 7/9] pinctrl: madera: Add DT bindings for Cirrus Logic
 Madera codecs
Date: Wed, 21 Mar 2018 09:04:44 +0100
Message-ID: <CACRpkdaRm84UZw1K5cOsp9wAt5tkMEtiLxz20Gg3a3QSO-+MYw@mail.gmail.com>
References: <20180226130558.7634-1-rf@opensource.cirrus.com> <20180226130558.7634-8-rf@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180226130558.7634-8-rf@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Lee Jones <lee.jones@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>, patches@opensource.cirrus.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 26, 2018 at 2:05 PM, Richard Fitzgerald
<rf@opensource.cirrus.com> wrote:

> This is the binding description of the pinctrl driver for Cirrus Logic
> Madera codecs. The binding uses the generic pinctrl binding so  the main
> purpose here is to describe the device-specific names for groups and
> functions.
>
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Tell me if you want me to just merge this patch to get your patch stack
smaller.

Yours,
Linus Walleij
