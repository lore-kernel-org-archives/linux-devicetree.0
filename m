From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/3] ARM: dts: imx6sll-evk: correct lcd regulator GPIO pin
Date: Fri, 13 Jul 2018 15:00:40 -0300
Message-ID: <CAOMZO5DFrBr=gC_qwFC4yHxT-KH5NMh56a8cL6F=T72XmzRMnQ@mail.gmail.com>
References: <1531468707-25737-1-git-send-email-Anson.Huang@nxp.com> <1531468707-25737-2-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531468707-25737-2-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, NXP Linux Team <Linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 13, 2018 at 4:58 AM, Anson Huang <Anson.Huang@nxp.com> wrote:
> On i.MX6SLL EVK board, lcd regulator is controlled
> by GPIO4 IO03 using MX6SLL_PAD_KEY_ROW5__GPIO4_IO03 pin,
> NOT MX6SLL_PAD_ECSPI1_SCLK__GPIO4_IO08, correct it.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
