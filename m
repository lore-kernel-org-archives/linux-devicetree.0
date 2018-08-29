From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx7d-sdb: enable gpio buttons as wakeup source
Date: Wed, 29 Aug 2018 10:32:44 -0300
Message-ID: <CAOMZO5DvoxbSCLDDaMy9LnYRpHQR+Yr47qzZGtK_OD6WBGE7tw@mail.gmail.com>
References: <1535507138-4626-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1535507138-4626-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, NXP Linux Team <Linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 28, 2018 at 10:45 PM, Anson Huang <Anson.Huang@nxp.com> wrote:
> This patch enables i.MX7D SDB board's below GPIO buttons
> as wakeup sources:
>
> S1(FUNC1): KEY_VOLUMEUP
> S3(FUNC2): KEY_VOLUMEDOWN
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
