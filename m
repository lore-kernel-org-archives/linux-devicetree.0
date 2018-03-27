From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v9 7/9] pinctrl: madera: Add DT bindings for Cirrus Logic
 Madera codecs
Date: Tue, 27 Mar 2018 13:29:12 +0200
Message-ID: <CACRpkdZspUbmCk7OwA-rva6zd89TZXt45t5mFes0feuRyOUp9w@mail.gmail.com>
References: <20180313131904.13700-1-rf@opensource.cirrus.com> <20180313131904.13700-8-rf@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180313131904.13700-8-rf@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Lee Jones <lee.jones@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>, patches@opensource.cirrus.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 13, 2018 at 2:19 PM, Richard Fitzgerald
<rf@opensource.cirrus.com> wrote:

> This is the binding description of the pinctrl driver for Cirrus Logic
> Madera codecs. The binding uses the generic pinctrl binding so  the main
> purpose here is to describe the device-specific names for groups and
> functions.
>
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Acked-by: Rob Herring <robh@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I can also just apply this if you want, as it has no dependencies to
anything else. I just assume you want to keep it together with the
rest of this complex series.

Yours,
Linus Walleij
