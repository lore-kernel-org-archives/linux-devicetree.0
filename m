From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx7s-warp: enable i2c3 device support
Date: Mon, 20 Aug 2018 12:58:04 -0300
Message-ID: <CAOMZO5BGN4182yz3VO9-iddqRWPsy8BA+y81Kgdybq0O36w1ww@mail.gmail.com>
References: <1534540997-20094-1-git-send-email-texier.pj2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1534540997-20094-1-git-send-email-texier.pj2@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pierre-Jean Texier <texier.pj2@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel <linux-kernel@vger.kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 17, 2018 at 6:23 PM, Pierre-Jean Texier
<texier.pj2@gmail.com> wrote:
> The WaRP7 has one mikroBUS socket on the back to plug click boards.
> This patch allows to interact with some of these
> i2c modules (EEPROM, RTC and so on).
>
> Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
