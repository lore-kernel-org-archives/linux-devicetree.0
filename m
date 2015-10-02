From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/6] pinctrl: berlin: regmap as an extra argument of berlin_pinctrl_probe()
Date: Fri, 2 Oct 2015 03:37:09 -0700
Message-ID: <CACRpkdaJc_j1S=W2kropf52uRHfYmTXsZChPvMBLe=Cj67x5RQ@mail.gmail.com>
References: <1442829860-4647-1-git-send-email-jszhang@marvell.com>
	<1442829860-4647-2-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1442829860-4647-2-git-send-email-jszhang@marvell.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jisheng Zhang <jszhang@marvell.com>, Antoine Tenart <antoine.tenart@free-electrons.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Pawe=C5=82_Moll?= <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 21, 2015 at 3:04 AM, Jisheng Zhang <jszhang@marvell.com> wrote:

> Let berlin_pinctrl_probe() accepts an extra argument: regmap, this is to
> prepare for the next berlin4ct support, where we won't use simple-mfd
> any more.
>
> Signed-off-by: Jisheng Zhang <jszhang@marvell.com>

Waiting for Antoine's review of this patch before applying.

Yours,
Linus Walleij
