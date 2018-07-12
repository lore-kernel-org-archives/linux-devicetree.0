From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pfuze100: add optional pfuze-disable-sw binding
Date: Thu, 12 Jul 2018 12:19:53 -0300
Message-ID: <CAOMZO5Cx-ooNJ8hseTYBvBvWx6mMX0jOsFTmRxC1yogXk0ZZuA@mail.gmail.com>
References: <20180712110240.3006-1-m.felsch@pengutronix.de> <20180712110240.3006-2-m.felsch@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180712110240.3006-2-m.felsch@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Fabio Estevam <fabio.estevam@nxp.com>, Yongcai Huang <Anson.Huang@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 12, 2018 at 8:02 AM, Marco Felsch <m.felsch@pengutronix.de> wrote:

> +Optional properties:
> +- pfuze-disable-sw: Disable all unused switch regulators to save power
> +  consumption. Attention, some platforms are using the switch regulators as DDR
> +  ref or supply voltage. Mark these regulators as "regulator-always-on" to skip
> +  disabling these regulators. If not specified, the driver simualtes the

s/simualtes/simulates/

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
