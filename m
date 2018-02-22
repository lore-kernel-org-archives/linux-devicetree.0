Return-Path: <SRS0=Q8ug=FQ=linaro.org=linus.walleij@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180214155512.17218-1-ckeepax@opensource.cirrus.com>
References: <20180214155512.17218-1-ckeepax@opensource.cirrus.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 22 Feb 2018 15:46:55 +0100
Message-ID: <CACRpkda3Tc0U_UJAyu-Jhja3E8xg2FRcswcxe2hMofrrXLTAEQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mfd: arizona: Update reset pin to use GPIOD
Content-Type: text/plain; charset="UTF-8"
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@opensource.cirrus.com
List-ID: <devicetree@vger.kernel.org>

On Wed, Feb 14, 2018 at 4:55 PM, Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

> Now GPIOD has support for both pdata systems and for non-standard DT
> bindings the Arizona reset GPIO can be converted to use it.
>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
(...)
> +       pdata->reset = devm_gpiod_get_from_of_node(arizona->dev,
> +                                                  arizona->dev->of_node,
> +                                                  "wlf,reset", 0,
> +                                                  GPIOD_OUT_LOW,
> +                                                  "arizona /RESET");

It seems this call is really useful.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Also thanks for testing this API, I had nothing to test it on...

Yours,
Linus Walleij
