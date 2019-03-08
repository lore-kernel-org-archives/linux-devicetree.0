From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx6qdl: Enable fsl,sec-v4.0-pwrkey
Date: Fri, 8 Mar 2019 07:27:37 -0300
Message-ID: <CAOMZO5BNxC4e9X0ZKk4sENa98KKf8_pvJnrMYnev9hrpCj3xUw@mail.gmail.com>
References: <20190308010148.9000-1-aford173@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190308010148.9000-1-aford173@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Adam Ford <aford173@gmail.com>
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 7, 2019 at 10:02 PM Adam Ford <aford173@gmail.com> wrote:
>
> The imx6q Technical reference manual shows the interrupt is
> available to wake from sleep using the power button. The driver
> has been available for quite some time, and other variants of the
> i.MX6 have it enabled, so this implements it much like the others.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
