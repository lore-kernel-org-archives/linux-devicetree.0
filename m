From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCHv2 1/2] ARM: dts: imx53: PPD: Add fixed-regulator
 information
Date: Tue, 3 Jul 2018 13:59:04 +0800
Message-ID: <20180703055902.GE4348@dragon>
References: <20180628163639.1078-1-sebastian.reichel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180628163639.1078-1-sebastian.reichel@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@collabora.com
List-Id: devicetree@vger.kernel.org

On Thu, Jun 28, 2018 at 06:36:38PM +0200, Sebastian Reichel wrote:
> Add information about 3V3 power rail to avoid kernel warnings,
> that dummy regulators have been added.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>

I changed subject prefix to 'ARM: dts: imx53-ppd: ...', and applied
both.

Shawn
