From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx6sll-evk: use WDOG_B pin reset
Date: Wed, 28 Nov 2018 16:24:07 +0800
Message-ID: <20181128082405.GK20643@dragon>
References: <1542855018-30217-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1542855018-30217-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 22, 2018 at 02:55:45AM +0000, Anson Huang wrote:
> i.MX6SLL EVK board has WDOG_B pin connected to the PMIC;
> 
> Add the WDOG_B pinctrl entry and 'fsl,ext-reset-output'
> property to wdog node to let watchdog trigger a system
> POR reset via the PMIC.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied, thanks.
