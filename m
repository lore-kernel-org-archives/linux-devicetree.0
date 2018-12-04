From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx6qdl-sabresd: add egalax touch screen
 support on i2c2 bus
Date: Tue, 4 Dec 2018 08:19:11 -0200
Message-ID: <CAOMZO5D_GTWvLUjJaPSmhPqgjadJh_4pTZqHKz92=1ZAeYkstg@mail.gmail.com>
References: <1543913303-6216-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543913303-6216-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yongcai Huang <anson.huang@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Anson,

On Tue, Dec 4, 2018 at 6:54 AM Anson Huang <anson.huang@nxp.com> wrote:
>
> Add egalax touch screen support on i2c2 bus.

Please improve the commit log saying that this newly introduced
touchscreen controller is connected to LVDS0 and the existing one on
I2C3 is connected to LVDS1.

Thanks
