From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: imx6q: remove references to PLL4_AUDIO_DIV
Date: Mon, 11 Mar 2019 13:39:21 -0300
Message-ID: <CAOMZO5AAz210dRw7aDD8SxVAh63RGN=sJsCGnPgY4xtnQoeLQA@mail.gmail.com>
References: <1552304271.2453.12.camel@pengutronix.de> <1552319997-24622-1-git-send-email-eric@nelint.com>
 <1552319997-24622-3-git-send-email-eric@nelint.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552319997-24622-3-git-send-email-eric@nelint.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Nelson <eric@nelint.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, Yongcai Huang <anson.huang@nxp.com>, Colin Didier <colin.didier@devialet.com>, Sascha Hauer <kernel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, NXP Linux Team <linux-imx@nxp.com>, linux-kernel <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, tiny.windzz@gmail.com
List-Id: devicetree@vger.kernel.org

On Mon, Mar 11, 2019 at 1:02 PM Eric Nelson <eric@nelint.com> wrote:
>
> Since we removed the PLL4_AUDIO_DIV clock, we need to replace
> any references to it in the device tree with PLL4_POST_DIV to
> keep the proper parents.
>
> Signed-off-by: Eric Nelson <eric@nelint.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
