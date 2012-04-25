From: Dong Aisheng <aisheng.dong@freescale.com>
Subject: Re: [PATCH v2 1/3] pinctrl: pinctrl-imx: add imx pinctrl core
 driver
Date: Wed, 25 Apr 2012 20:10:53 +0800
Message-ID: <20120425121052.GD17631@shlinux2.ap.freescale.net>
References: <1334933916-12971-1-git-send-email-b29396@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1334933916-12971-1-git-send-email-b29396@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dong Aisheng <b29396@freescale.com>
Cc: linux-kernel@vger.kernel.org, linus.walleij@stericsson.com, devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, s.hauer@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Fri, Apr 20, 2012 at 10:58:34PM +0800, Dong Aisheng wrote:
> From: Dong Aisheng <dong.aisheng@linaro.org>
> 
> The driver has mux and config support while the gpio is still
> not supported.
> For select input setting, the driver will handle it internally
> and do not need user to take care of it.
> 
> The pinctrl-imx core driver will parse the dts file and dynamically
> create the pinmux functions and groups.
> 
> Each IMX SoC pinctrl driver should register pins with a pin register map
> including mux register and config register and select input map to core
> for proper operations.
> 
> Signed-off-by: Dong Aisheng <dong.aisheng@linaro.org>
> 
I will send out an updated version with minor dt fix
(SION bit in mux missed from v2, thanks for Richard's report).

Regards
Dong Aisheng
