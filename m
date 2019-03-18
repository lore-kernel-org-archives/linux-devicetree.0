From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [V2 1/2] clk: imx6q: remove unsupported pll4_audio_div
Date: Mon, 18 Mar 2019 13:25:01 -0700
Message-ID: <155294070124.20095.17167777488324467790@swboyd.mtv.corp.google.com>
References: <1552304271.2453.12.camel@pengutronix.de> <1552319997-24622-1-git-send-email-eric@nelint.com> <1552319997-24622-2-git-send-email-eric@nelint.com> <0cf890a4-20b0-13ce-14d3-06f7c3227655@nelint.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0cf890a4-20b0-13ce-14d3-06f7c3227655@nelint.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eric Nelson <eric@nelint.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: anson.huang@nxp.com, colin.didier@devialet.com, festevam@gmail.com, kernel@pengutronix.de, l.stach@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, linux-kernel@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org, tiny.windzz@gmail.com
List-Id: devicetree@vger.kernel.org

Quoting Eric Nelson (2019-03-11 13:48:55)
>  > On March 11, 2019, 6:35 p.m. UTC, Stephen Boyd wrote:
> > Quoting Eric Nelson (2019-03-11 08:59:56)
> >> + *
> >> + * Renamed to _BROKEN to prevent inadvertent use,
> >> + * but reserved the array slot to maintain DT binary
> >> + * compatibility.
> >> + */
> >> +#define IMX6QDL_CLK_PLL4_AUDIO_DIV_BROKEN      203
> >=20
> > But it breaks the build. I don't get it. Just add a comment indicating
> > it shouldn't be used? That breaks the cross-tree dependency chain and
> > lets clk tree merge the clk driver part and arm-soc merge the dts part.
> The device tree update also requires the update to clk-imx6q.c
> for proper run-time operation, so I don't see how these two parts
> can be separated.
>=20
> I thought about leaving the PLL4_AUDIO_DIV clock in place but
> turning it into a dummy (placeholder), but that might lead others
> down the long path I traversed before I found out that my manual
> was old and the clock didn't function.

I'm not suggesting that it's left as a dummy forever, just until the
other trees can merge their parts of this series and so that these
patches can be applied in order that they're sent. Right now, the kbuild
robot fails on this patch series because this patch intentionally breaks
the build. Please don't do that. Send patch series that are bisectable
so that the build doesn't break in the middle.
