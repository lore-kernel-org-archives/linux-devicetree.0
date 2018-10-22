From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1] ARM: dts: imx6ul: ccimx6ulsom: Add support for
 wireless SOM variant
Date: Mon, 22 Oct 2018 09:33:16 -0300
Message-ID: <CAOMZO5CeZN5QhGha8rOm6qvSPmeVAPjQogmYsHLj5BE4CJ2jAQ@mail.gmail.com>
References: <1540200443-24773-1-git-send-email-alex.gonzalez@digi.com> <1540200443-24773-2-git-send-email-alex.gonzalez@digi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540200443-24773-2-git-send-email-alex.gonzalez@digi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gonzalez, Alex" <alex.gonzalez@digi.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 22, 2018 at 6:28 AM Alex Gonzalez <alex.gonzalez@digi.com> wrote:
>
> The wireless variants of the ConnecCore 6UL SOM include a Qualcomm
> QCA6564 wireless chip with dual WiFi and Bluetooth.
>
> Both the ConnectCore 6UL SBC Express and Pro boards fit a wireless SOM.
>
> The Wifi is connected through the SDIO interface on usdhc1 and the
> Bluetooth is connected via uart1.
>
> Signed-off-by: Alex Gonzalez <alex.gonzalez@digi.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
