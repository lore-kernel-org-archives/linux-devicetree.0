From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH RESEND 1/5] ARM: dts: imx6qdl-sabresd: Assign
 corresponding power supply for LDOs
Date: Mon, 20 May 2019 11:04:09 +0800
Message-ID: <20190520030408.GN15856@dragon>
References: <1557654739-12564-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1557654739-12564-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Sun, May 12, 2019 at 09:57:20AM +0000, Anson Huang wrote:
> On i.MX6Q/DL SabreSD board, vgen5 supplies vdd1p1/vdd2p5 LDO and
> sw2 supplies vdd3p0 LDO, this patch assigns corresponding power
> supply for vdd1p1/vdd2p5/vdd3p0 to avoid confusion by below log:
> 
> vdd1p1: supplied by regulator-dummy
> vdd3p0: supplied by regulator-dummy
> vdd2p5: supplied by regulator-dummy
> 
> With this patch, the power supply is more accurate:
> 
> vdd1p1: supplied by VGEN5
> vdd3p0: supplied by SW2
> vdd2p5: supplied by VGEN5
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied all, thanks.
