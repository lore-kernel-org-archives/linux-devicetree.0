From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH RESEND V2 0/4] ARM: dts: imx: Add flexcan stop mode wake
Date: Thu, 6 Dec 2018 10:21:09 +0800
Message-ID: <20181206022108.GY3987@dragon>
References: <20181203051753.1532-1-qiangqing.zhang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181203051753.1532-1-qiangqing.zhang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joakim Zhang <qiangqing.zhang@nxp.com>
Cc: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 03, 2018 at 05:20:16AM +0000, Joakim Zhang wrote:
> This patchset intends to add flexcan stop mode wakeup support on IMX6/7 platforms.
> 
> ChangeLog:
> V1->V2:
> 	*update stop mode property(stop-mode -> fsl,stop-mode).
> 
> Hi Shawn,
>    This property has been merged both flexcan bindings doc and kernel
>    driver.
> 
> Best Regards,
> Joakim Zhang
> 
> Aisheng Dong (4):
>   ARM: dts: imx6sx: Add flexcan stop mode wakeup support
>   ARM: dts: imx6qdl: Add flexcan stop mode wakeup support
>   ARM: dts: imx6ul: Add flexcan stop mode wakeup support
>   ARM: dts: imx7s: Add flexcan stop mode wakeup support

Applied all, thanks.
