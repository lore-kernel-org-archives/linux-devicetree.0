From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: ccimx6ulsbcpro: Add support for Goodix
 touch controller
Date: Mon, 22 Oct 2018 09:36:56 -0300
Message-ID: <CAOMZO5BhwsaLOG--kdpk4XB9jvOpxvTxx7rP22Ns9HZgrit83A@mail.gmail.com>
References: <1540204399-12982-1-git-send-email-alex.gonzalez@digi.com> <1540204399-12982-3-git-send-email-alex.gonzalez@digi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540204399-12982-3-git-send-email-alex.gonzalez@digi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gonzalez, Alex" <alex.gonzalez@digi.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 22, 2018 at 7:34 AM Alex Gonzalez <alex.gonzalez@digi.com> wrote:

Please add a commit log.

> Signed-off-by: Alex Gonzalez <alex.gonzalez@digi.com>
> ---
>  arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts | 19 +++++++++++++++++++
>  arch/arm/configs/imx_v6_v7_defconfig        |  1 +

Please split this into two patches: one for the dts and other for the
defconfig change, thanks.
