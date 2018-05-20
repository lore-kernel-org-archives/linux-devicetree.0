From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx51-zii-rdu1: cleanup eMMC node
Date: Sun, 20 May 2018 20:59:03 +0800
Message-ID: <20180520125902.GZ26863@dragon>
References: <20180516065349.11160-1-nikita.yoush@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180516065349.11160-1-nikita.yoush@cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Healy <cphealy@gmail.com>, Andrey Smirnov <andrew.smirnov@gmail.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 16, 2018 at 09:53:49AM +0300, Nikita Yushchenko wrote:
> On RDU1, sdhc1 is used for eMMC, and that is 3.3V only.
> 
> Thus configure device node not to probe it as SD/SDIO and not try 1.8V.
> 
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>

Applied, thanks.
