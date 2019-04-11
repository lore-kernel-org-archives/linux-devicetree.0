From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx6dl-sabreauto: update opp table for auto
 part
Date: Thu, 11 Apr 2019 14:59:47 +0800
Message-ID: <20190411065945.GD26817@dragon>
References: <1554709166-21952-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1554709166-21952-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 08, 2019 at 07:44:21AM +0000, Anson Huang wrote:
> Update i.MX6DL automotive part's opp table according to i.MX6DL
> automotive datasheet Rev.9, 11/2018, it adds 996MHz set-point
> support as below:
> 
> LDO enabled(min value):
> 996MHz: VDDARM: 1.275V, VDDSOC: 1.175V;
> 792MHz: VDDARM: 1.150V, VDDSOC: 1.150V;
> 396MHz: VDDARM: 1.125V, VDDSOC: 1.150V;
> 
> Adding 25mV to cover board IR drop, for LDO enabled mode of 996MHz,
> as the max value of LDO output can NOT exceed 1.3V, so 25mV is NOT
> added for VDDARM.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied, thanks.
