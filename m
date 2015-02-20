From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: mediatek: Fix build error in Mediatek pinctrl driver.
Date: Fri, 20 Feb 2015 11:04:55 +0100
Message-ID: <CACRpkdYNTT=qojYs8+vaXPFCSbHcUXJhzpWsM6Fga2erMKzPeQ@mail.gmail.com>
References: <1423727771-24112-1-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1423727771-24112-1-git-send-email-hongzhou.yang@mediatek.com>
Sender: linux-sh-owner@vger.kernel.org
To: Hongzhou Yang <hongzhou.yang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawn.guo@freescale.com>, Stefan Agner <stefan@agner.ch>, Stephen Warren <swarren@nvidia.com>, Fabio Estevam <fabio.estevam@freescale.com>, Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, Martin Fuzzey <mfuzzey@parkeon.com>, Kiran Padwal <kiran.padwal21@gmail.com>, Thierry Reding <treding@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 12, 2015 at 8:56 AM, Hongzhou Yang
<hongzhou.yang@mediatek.com> wrote:

> Since pinconf relate API changes in pinctrl devel branch, a build error happened.
> Send this small patch to fix it.
>
> ---
> Due to pinconf_generic_parse_dt_config() API changes in pinctrl devel branch,
> add one parameter to fix build error.
>
> Also fix warning:
> drivers/pinctrl/mediatek/pinctrl-mtk-common.c:718:3: warning: too many arguments for format [-Wformat-extra-args]
>       dev_err(&pdev->dev, "only support pins-are-numbered format\n", ret);
>       ^
>
> by removing extra parameter when calling dev_err in mtk_pctrl_init.
>
> Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>

Patch applied.

Yours,
Linus Walleij
