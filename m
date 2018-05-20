From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx51-zii-rdu1: limit usbh1 to full-speed
Date: Sun, 20 May 2018 20:36:07 +0800
Message-ID: <20180520123606.GU26863@dragon>
References: <20180515084502.17148-1-nikita.yoush@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180515084502.17148-1-nikita.yoush@cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lucas Stach <l.stach@pengutronix.de>, Chris Healy <cphealy@gmail.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, Marco Franchi <marcofrk@gmail.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, May 15, 2018 at 11:45:02AM +0300, Nikita Yushchenko wrote:
> On RDU1, imx51 usbh1 interface is either not used, or used via external
> block that breaks USB2 signalling.
> 
> To keep things working if high-speed device gets connected to that
> block, use ChipIdea feature to limit port to full speed.
> 
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>

Applied, thanks.
