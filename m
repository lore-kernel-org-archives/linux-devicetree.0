From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [V2 1/2] clk: imx6q: remove unsupported pll4_audio_div
Date: Mon, 11 Mar 2019 13:38:48 -0300
Message-ID: <CAOMZO5B9rYwRu=xa4W1+oB=zbjyMOuqrKxRDqwcviCF_94ebXA@mail.gmail.com>
References: <1552304271.2453.12.camel@pengutronix.de> <1552319997-24622-1-git-send-email-eric@nelint.com>
 <1552319997-24622-2-git-send-email-eric@nelint.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552319997-24622-2-git-send-email-eric@nelint.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Nelson <eric@nelint.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, Yongcai Huang <anson.huang@nxp.com>, Colin Didier <colin.didier@devialet.com>, Sascha Hauer <kernel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, NXP Linux Team <linux-imx@nxp.com>, linux-kernel <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, tiny.windzz@gmail.com
List-Id: devicetree@vger.kernel.org

On Mon, Mar 11, 2019 at 1:02 PM Eric Nelson <eric@nelint.com> wrote:
>
> The pll4_audio_div attempted to reflect one bit of a two-bit
> divisor (AUDIO_DIV_LSB) in the CCM_ANALOG_MISC2 register.
>
> Unfortunately, this divisor is non-functional at least on the
> latest silicon revisions and has been removed from the reference
> manual.
>
> This is discussed in this NXP Community thread:
>
>     https://community.nxp.com/thread/462806
>
> Remove the definition of pll4_audio_div to reflect this and
> reparent the ssi, cko1, and ESAI/ASRC/SPDIF clocks to the
> pll4_post_div clock.
>
> Signed-off-by: Eric Nelson <eric@nelint.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
