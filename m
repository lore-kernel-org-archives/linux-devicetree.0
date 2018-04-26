Return-Path: <SRS0=PkqA=HP=linaro.org=linus.walleij@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1523585925-169568-2-git-send-email-shawn.lin@rock-chips.com>
References: <1523585925-169568-1-git-send-email-shawn.lin@rock-chips.com> <1523585925-169568-2-git-send-email-shawn.lin@rock-chips.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 26 Apr 2018 15:18:55 +0200
Message-ID: <CACRpkda7cHEKP8ynKMx1Pk4dLSppfT8RYw2_sDM0efxn8zVLWg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mmc: core: Add tunable delay before detecting card
 after card is inserted
Content-Type: text/plain; charset="UTF-8"
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, Apr 13, 2018 at 4:18 AM, Shawn Lin <shawn.lin@rock-chips.com> wrote:

> Allow to use tunable delay before detecting card after card is inserted,
> which either comes from firmware node, or comes from debounce value
> passed on to mmc_gpiod_request_cd(). If the platform doesn't support
> debounce, then we fall back to use the debounce period as the delay,
> otherwise, it behaves the same as before that a HW debounce(if set) plus
> a 200ms hardcode delay before detecting the card.
>
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
>
> ---
>
> Changes in v2:
> - doesn't introduce new agrument for mmc_gpiod_request_cd and drop
>   the change for host drivers

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
