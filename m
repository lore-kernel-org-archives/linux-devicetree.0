From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] regulator: pfuze100: add support to en-/disable
 switch regulators
Date: Thu, 12 Jul 2018 12:18:14 -0300
Message-ID: <CAOMZO5AtrR52+U1XrJbeD6WnuVmsYMESYwq643uFvRE2avJxNA@mail.gmail.com>
References: <20180712110240.3006-1-m.felsch@pengutronix.de> <20180712110240.3006-3-m.felsch@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180712110240.3006-3-m.felsch@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Fabio Estevam <fabio.estevam@nxp.com>, Yongcai Huang <Anson.Huang@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Marco,

On Thu, Jul 12, 2018 at 8:02 AM, Marco Felsch <m.felsch@pengutronix.de> wrote:
> Add enable/disable support for switch regulators on pfuze100.
>
> Based on commit 5fe156f1cab4 ("regulator: pfuze100: add enable/disable for
> switch") which is reverted due to boot regressions by commit 464a5686e6c9
> ("regulator: Revert "regulator: pfuze100: add enable/disable for switch"").
> Disabling the switch regulators will only be done if the user specifies
> "pfuze-disable-sw" in its device tree to keep backward compatibility with
> current dtb's [1]. Otherwise the regulators are marked as 'disabled', but
> the driver keeps them on. So it's more like a simulated disable.
>
> [1] https://patchwork.kernel.org/patch/10490381/
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
