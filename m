From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH RESEND 1/2] ARM: dts: imx6sl: Assign corresponding clocks
 instead of dummy clock
Date: Fri, 17 May 2019 09:11:02 +0800
Message-ID: <20190517011101.GU15856@dragon>
References: <1557655028-12654-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1557655028-12654-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Sun, May 12, 2019 at 10:02:10AM +0000, Anson Huang wrote:
> i.MX6SL's KPP and WDOG use IMX6SL_CLK_IPG as clock root,
> assign IMX6SL_CLK_IPG to them instead of IMX6SL_CLK_DUMMY.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>

Applied both ,thanks.
