From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8qxp: fix mbox-cells
Date: Thu, 21 Mar 2019 19:36:18 +0800
Message-ID: <20190321113614.GJ12513@dragon>
References: <20190313093626.18589-1-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190313093626.18589-1-peng.fan@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peng Fan <peng.fan@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Anson Huang <anson.huang@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "van.freenix@gmail.com" <van.freenix@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 13, 2019 at 09:24:19AM +0000, Peng Fan wrote:
> Currently lsio_mu1 is used by Linux Kernel with mbox-cells as 2, but
> actually mu0-4 could be used to communicate with SCU. So fix the
> mbox-cells.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied, thanks.
