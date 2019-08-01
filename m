From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 1/1] dt-bindings: reset: Fix typo in imx8mq resets
Date: Thu, 01 Aug 2019 11:01:26 +0200
Message-ID: <1564650086.7439.9.camel@pengutronix.de>
References: <cover.1564647612.git.agx@sigxcpu.org>
         <660b4fb6ab9acec05aa5fde323d878e04e3d1f64.1564647612.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <660b4fb6ab9acec05aa5fde323d878e04e3d1f64.1564647612.git.agx@sigxcpu.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, 2019-08-01 at 10:20 +0200, Guido Günther wrote:
> Some of the mipi dsi resets were called
> 
>   IMX8MQ_RESET_MIPI_DIS__
> 
> instead of
> 
>   IMX8MQ_RESET_MIPI_DSI__
> 
> Since they're DSI related this looks like a typo. This fixes the
> only in tree user as well to not break bisecting.
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>

Thank you, this was a typo in the Rev.0 reference manual.
It has been fixed in Rev. 1.

Applied to reset/next with Lucas' R-b.

regards
Philipp
