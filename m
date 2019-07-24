From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V5 1/5] dt-bindings: imx: Add clock binding doc for i.MX8MN
Date: Wed, 24 Jul 2019 08:41:33 -0600
Message-ID: <CAL_JsqKv39XdFABuRvxwiXg6qQpHSuykwgqTwsGw1g+D2wA1+w@mail.gmail.com>
References: <20190619055247.35771-1-Anson.Huang@nxp.com> <20190722015043.GP3738@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722015043.GP3738@dragon>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Anson Huang <Anson.Huang@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Olof Johansson <olof@lixom.net>, Simon Horman <horms+renesas@verge.net.au>, Jagan Teki <jagan@amarulasolutions.com>, Leonard Crestez <leonard.crestez@nxp.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Dinh Nguyen <dinguyen@kernel.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Dong Aisheng <aisheng.dong@nxp.com>, Bai Ping <ping.bai@nxp.com>, Abel Vesa <abel.vesa@nxp.com>, Lucas
List-Id: devicetree@vger.kernel.org

On Sun, Jul 21, 2019 at 7:51 PM Shawn Guo <shawnguo@kernel.org> wrote:
>
> On Wed, Jun 19, 2019 at 01:52:43PM +0800, Anson.Huang@nxp.com wrote:
> > From: Anson Huang <Anson.Huang@nxp.com>
> >
> > Add the clock binding doc for i.MX8MN.
> >
> > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> Applied all, thanks.

This breaks building of 'dt_binding_check'. Looks like there are tabs
in the file which doesn't mix with YAML. Please fix.

Rob
