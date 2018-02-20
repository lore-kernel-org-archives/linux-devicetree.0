Return-Path: <SRS0=RDbo=FO=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:56476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751592AbeBTL4Q (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 20 Feb 2018 06:56:16 -0500
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU9Oh7VzVnmQ2E=4LtQbW2ZJSC4KnwCav_uA6jnXQo4hg@mail.gmail.com>
References: <CAMuHMdU9Oh7VzVnmQ2E=4LtQbW2ZJSC4KnwCav_uA6jnXQo4hg@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 20 Feb 2018 12:56:14 +0100
Message-ID: <CAJKOXPfMvGvPdM2RbmROXOo2xpVUzcre=_UVix6jHeX014Vp0w@mail.gmail.com>
Subject: Re: pinctrl: samsung: Out-of-bounds access through DT aliases
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Feb 20, 2018 at 11:06 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi,
>
> The Samsung pinctrl driver uses the "pinctrlN" alias from DT without performing
> any validation on the returned index, which may lead to out-of-bounds accesses
> in the SoC-specific samsung_pin_ctrl[] arrays:
>
> drivers/pinctrl/samsung/pinctrl-samsung.c:samsung_pinctrl_get_soc_data():
>
>         id = of_alias_get_id(node, "pinctrl");
>         if (id < 0) {
>                 dev_err(&pdev->dev, "failed to get alias id\n");
>                 return ERR_PTR(-ENOENT);
>         }
>         ctrl = of_device_get_match_data(&pdev->dev);
>         // FIXME out-of-bounds access, limit not known
>         ctrl += id;

Hi Geert,

Indeed, lack of validation with wrong DT will cause out-of-bounds
accesses. This might be also an issue when using out-of-tree DTBs.

I'll take a look at possible fix.

Thanks for report, much appreciated!

Best regards,
Krzysztof
