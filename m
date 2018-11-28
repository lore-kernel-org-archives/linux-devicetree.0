From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v8 1/4] ARM: dts: imx: Add an cpu0 label for imx6dl
 devices.
Date: Wed, 28 Nov 2018 10:06:04 +0800
Message-ID: <20181128020602.GA20643@dragon>
References: <20180829100811.55836-1-jan.tuerk@emtrion.com>
 <20181127150407.15098-1-jan.tuerk@emtrion.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181127150407.15098-1-jan.tuerk@emtrion.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jan Tuerk <jan.tuerk@emtrion.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 27, 2018 at 04:04:01PM +0100, Jan Tuerk wrote:
> Adding the label cpu0 allows the adjustment of cpu-parameters
> by reference in overlaying dtsi files in the same way as it
> is possible for imx6q devices.
> 
> Signed-off-by: Jan Tuerk <jan.tuerk@emtrion.com>
> Reviewed-by: Andreas Färber <afaerber@suse.de>

Applied all, thanks.
