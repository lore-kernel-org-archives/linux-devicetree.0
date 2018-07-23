From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 2/2] regulator: pfuze100: add support to en-/disable
 switch regulators
Date: Mon, 23 Jul 2018 17:48:48 -0300
Message-ID: <CAOMZO5BpFebK1Y3o_3m2WTDTjsv7Y34+kwR_2EEmDHMvPH+O0Q@mail.gmail.com>
References: <20180723074747.9328-1-m.felsch@pengutronix.de> <20180723074747.9328-3-m.felsch@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180723074747.9328-3-m.felsch@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Yongcai Huang <Anson.Huang@nxp.com>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 23, 2018 at 4:47 AM, Marco Felsch <m.felsch@pengutronix.de> wrote:
> Add enable/disable support for switch regulators on pfuze100.
>
> Based on commit 5fe156f1cab4 ("regulator: pfuze100: add enable/disable for
> switch") which is reverted due to boot regressions by commit 464a5686e6c9
> ("regulator: Revert "regulator: pfuze100: add enable/disable for switch"").
> Disabling the switch regulators will only be done if the user specifies
> "fsl,pfuze-support-disable-sw" in its device tree to keep backward
> compatibility with current dtb's [1].
>
> [1] https://patchwork.kernel.org/patch/10490381/
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
