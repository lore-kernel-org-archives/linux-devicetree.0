From: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH] ARM: dts: imx7d: fix LCDIF clock assignment
Date: Mon, 05 Dec 2016 12:29:39 -0800
Message-ID: <533232ee44a8807c42cbd060fac75273@agner.ch>
References: <20161123004204.10851-1-stefan@agner.ch>
 <CAOMZO5AqKupmmKb4biGfmy4v3ZwS-BFjPY=MLd8Rc0ZXL+vQvg@mail.gmail.com>
 <7e4829f484f6c4425fc9d01bea1a094f@agner.ch>
 <20161205070609.a6t7hzh3m3l2t37s@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161205070609.a6t7hzh3m3l2t37s@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, robh+dt@kernel.org, Peter Chen <peter.chen@freescale.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Liu Ying <Ying.Liu@freescale.com>, linux-arm-kernel@lists.infradead.org, gary.bisson@boundarydevices.com
List-Id: devicetree@vger.kernel.org

On 2016-12-04 23:06, Uwe Kleine-König wrote:
> Hello Stefan,
> 
> On Sun, Dec 04, 2016 at 05:26:58PM -0800, Stefan Agner wrote:
>> Since this fixes a kernel freeze, is there a chance to get this still in
>> 4.9?
> 
> a Fixes:-Line would be nice then.

Good point.

Fixes: e8ed73f691bd ("ARM: dts: imx7d: add lcdif support")

--
Stefan
