From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx7d-sdb: add rev-a board support
Date: Wed, 7 Nov 2018 08:03:09 -0200
Message-ID: <CAOMZO5AL03yy6Vj_eC=h7scSDnuja1G8rsWER+r7w3FEVaceDg@mail.gmail.com>
References: <1541567625-11812-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541567625-11812-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yongcai Huang <anson.huang@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Anson,

On Wed, Nov 7, 2018 at 3:19 AM Anson Huang <anson.huang@nxp.com> wrote:

> +&fec2 {
> +       pinctrl-0 = <&pinctrl_enet2>;
> +       /delete-property/pinctrl-assert-gpios;

"pinctrl-assert-gpios" does not exist in mainline, so not sure why you
are deleting it.
