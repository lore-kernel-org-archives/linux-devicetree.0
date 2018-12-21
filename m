From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 01/13] clk: qcom: gcc: limit GPLL0_AO_OUT operating frequency
Date: Fri, 21 Dec 2018 13:51:24 -0800
Message-ID: <154542908449.13075.11379256415955338261@swboyd.mtv.corp.google.com>
References: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org> <1545039990-19984-2-git-send-email-jorge.ramirez-ortiz@linaro.org> <e97d9050-effc-56d7-0f9b-768df90dd73a@codeaurora.org> <6814777f-1e5f-bd99-db63-a0050dcdd930@linaro.org> <874ce15d-67f5-8e55-8b62-73071fe6ae06@codeaurora.org> <20181221192823.GA9704@minitux> <94b12f58-b586-6b4b-6c0c-b4adad80d7b0@linaro.org> <154542841268.13075.13095552962351570142@swboyd.mtv.corp.google.com> <914bd56c-4470-4f78-75ac-f7bedd83d7c0@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <914bd56c-4470-4f78-75ac-f7bedd83d7c0@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>, Taniya Das <tdas@codeaurora.org>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, will.deacon@arm.com, mturquette@baylibre.com, jassisinghbrar@gmail.com, vkoul@kernel.org, niklas.cassel@linaro.org, sibis@codeaurora.org, georgi.djakov@linaro.org, arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de, enric.balletbo@collabora.com, jagan@amarulasolutions.com, olof@lixom.net, amit.kucheria@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Jorge Ramirez (2018-12-21 13:45:41)
> On 12/21/18 22:40, Stephen Boyd wrote:
> > Quoting Jorge Ramirez (2018-12-21 11:45:28)
> >> On 12/21/18 20:28, Bjorn Andersson wrote:
> >>> Perhaps there's a better way to define that this particular clock
> >>> hardware can change rate, but in this implementation it must not?
> >> the initialization for this particular PLL on this particular platform
> >> is wrong
> >> as the interface does not apply to the platform needs even though it i=
s an
> >> alpha_pll
> >>
> >> if the VCO is not an option -even though it reflects the platform
> >> constrains-
> >> I would suggest nullifying the alpha_pll_ops that do not apply to this
> >> platform:
> >> ie: set_rate, round_rate set to null in the probe.
> >>
> >> allowing the interface calls (ops) to go through to later on make them=
 fail
> >> based on some setting would be fundamentally wrong IMO
> >>
> > We have clk_alpha_pll_postdiv_ro_ops so maybe just add another set of
> > those for the alpha_pll itself?
> >
> >
>=20
> something like=20
> clk_alpha_pll_fixed_ops?

Either way works. We're not consistent in naming now that we have
clk_alpha_pll_fixed_fabia_ops.
