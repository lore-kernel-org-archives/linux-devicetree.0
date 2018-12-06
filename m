From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH V2 2/4] ARM: dts: imx6qdl-sabresd: add light sensor support
Date: Wed, 5 Dec 2018 23:48:24 -0200
Message-ID: <CAOMZO5BUPAWJBb8XQrYF7dTfSdoBNbK85d10QN0e4+X=tUPbQg@mail.gmail.com>
References: <1544060203-22163-1-git-send-email-Anson.Huang@nxp.com> <1544060203-22163-2-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544060203-22163-2-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yongcai Huang <anson.huang@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 5, 2018 at 11:43 PM Anson Huang <anson.huang@nxp.com> wrote:
>
> Add isl29023 light sensor support on i2c3 bus, the light
> sensor's power is controlled by a fixed regulator, since
> the isl29023 driver and most of other sensors on same
> board like mag3110 and mma8451 do NOT support regulator
> operation currently, they are all controlled by this
> regulator, so this patch also adds the fixed regulator
> support and make it always on.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
