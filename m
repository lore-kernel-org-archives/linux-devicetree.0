From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx7: use 3 PWM cells
Date: Tue, 16 May 2017 08:49:12 -0300
Message-ID: <CAOMZO5AnZq+FU5zoCchxgON7nAfoSs1kEchEXZDkABXo94S2Cw@mail.gmail.com>
References: <20170516074013.3571-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170516074013.3571-1-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Peter Chen <peter.chen@freescale.com>, Fabio Estevam <fabio.estevam@nxp.com>, Liu Ying <Ying.Liu@freescale.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 16, 2017 at 4:40 AM, Stefan Agner <stefan@agner.ch> wrote:
> The PWM driver has now capability to specify the PWM polarity
> which is e.g. for backlight control. Allow to make use of PWM
> polarity by specifying pwm-cells to be 3 in the base dt.
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
