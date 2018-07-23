From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pfuze100: add optional disable
 switch-regulators binding
Date: Mon, 23 Jul 2018 17:48:09 -0300
Message-ID: <CAOMZO5CPqLDJTSYYRmVci_NMqooSLSQrHOYb4FvHLxMzRB-c3g@mail.gmail.com>
References: <20180723074747.9328-1-m.felsch@pengutronix.de> <20180723074747.9328-2-m.felsch@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180723074747.9328-2-m.felsch@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Yongcai Huang <Anson.Huang@nxp.com>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jul 23, 2018 at 4:47 AM, Marco Felsch <m.felsch@pengutronix.de> wrote:
> This binding is used to keep the backward compatibility with the current
> dtb's [1]. The binding informs the driver that the unused switch regulators
> can be disabled.
> If it is not specified, the driver doesn't disable the switch regulators.
>
> [1] https://patchwork.kernel.org/patch/10490381/
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
