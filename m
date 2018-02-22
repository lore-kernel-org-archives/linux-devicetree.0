Return-Path: <SRS0=Q8ug=FQ=linaro.org=linus.walleij@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1519032320-103817-2-git-send-email-preid@electromag.com.au>
References: <1519032320-103817-1-git-send-email-preid@electromag.com.au> <1519032320-103817-2-git-send-email-preid@electromag.com.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 22 Feb 2018 16:05:19 +0100
Message-ID: <CACRpkdZ7x+QcG6sWNU5pzuO8TfeHeffMRV8UgJewiQ4FN9hnYg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] pinctrl: mcp23s08: fix probing of mcp23s18
Content-Type: text/plain; charset="UTF-8"
To: Phil Reid <preid@electromag.com.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sebastian Reichel <sre@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>
List-ID: <devicetree@vger.kernel.org>

On Mon, Feb 19, 2018 at 10:25 AM, Phil Reid <preid@electromag.com.au> wrote:

> one_regmap_config is always null if mcp type is MCP_TYPE_S18.
> Remove the null check so that the mcp23s18 will probe.
>
> Fixes: 1781af563aef66c2eb7cda ("pinctrl: mcp23s08: spi: Fix
> duplicate pinctrl debugfs entries")
>
> Signed-off-by: Phil Reid <preid@electromag.com.au>

Patch applied with Jan's ACK.

Yours,
Linus Walleij
