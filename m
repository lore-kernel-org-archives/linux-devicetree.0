From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V5 1/5] dt-bindings: imx: Add clock binding doc for
 i.MX8MN
Date: Tue, 9 Jul 2019 11:05:31 -0600
Message-ID: <20190709170531.GA19236@bogus>
References: <20190619055247.35771-1-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190619055247.35771-1-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson.Huang@nxp.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com, will.deacon@arm.com, maxime.ripard@bootlin.com, olof@lixom.net, horms+renesas@verge.net.au, jagan@amarulasolutions.com, leonard.crestez@nxp.com, bjorn.andersson@linaro.org, dinguyen@kernel.org, enric.balletbo@collabora.com, aisheng.dong@nxp.com, ping.bai@nxp.com, abel.vesa@nxp.com, l.stach@pengutronix.de, peng.fan@nxp.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On Wed, 19 Jun 2019 13:52:43 +0800, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> Add the clock binding doc for i.MX8MN.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
> No changes.
> ---
>  .../devicetree/bindings/clock/imx8mn-clock.yaml    | 112 +++++++++++
>  include/dt-bindings/clock/imx8mn-clock.h           | 215 +++++++++++++++++++++
>  2 files changed, 327 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/imx8mn-clock.yaml
>  create mode 100644 include/dt-bindings/clock/imx8mn-clock.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
