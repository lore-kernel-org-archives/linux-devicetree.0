From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx6: Add stdout-path to Wandboard
Date: Mon, 20 Aug 2018 13:01:02 -0300
Message-ID: <CAOMZO5A2U5vZkfCE7xaMfrTQCogBojBDAWUe3XDCr7-JipD2Wg@mail.gmail.com>
References: <20180814204758.3049-1-tuomas@tuxera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180814204758.3049-1-tuomas@tuxera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tuomas Tynkkynen <tuomas@tuxera.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Tuomas,

On Tue, Aug 14, 2018 at 5:47 PM, Tuomas Tynkkynen <tuomas@tuxera.com> wrote:
> Setting a stdout-path in the .dtb is convenient because then the user
> gets a serial console on the RS-232 connector without any extra effort
> of figuring out the relevant 'console=' boot parameter.
>
> Signed-off-by: Tuomas Tynkkynen <tuomas@tuxera.com>

Patch looks good.

Only a minor nit on the Subject line: I would do it like this to make
it consistent:

ARM: dts: imx6qdl-wandboard: Add stdout-path

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
