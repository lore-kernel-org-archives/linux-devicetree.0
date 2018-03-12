From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: i.MX25: define SSI FIFO depth
Date: Mon, 12 Mar 2018 15:24:08 +0800
Message-ID: <20180312072406.GL3217@dragon>
References: <1520373499-13623-1-git-send-email-martin@kaiser.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1520373499-13623-1-git-send-email-martin@kaiser.cx>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Kaiser <martin@kaiser.cx>
Cc: Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 06, 2018 at 10:58:19PM +0100, Martin Kaiser wrote:
> According to the i.MX25 reference manuals, each SSI has four FIFOs. All
> of those FIFOs can store up to 15 entries.
> 
> The fsl_ssi driver's internal default for the FIFO depth in 8. Set our
> non-default FIFO depth explicitly in the Device Tree.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>

Applied, thanks.
