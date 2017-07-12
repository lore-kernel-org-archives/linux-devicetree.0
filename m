From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] ARM: dts: imx: Correct B850v3 clock assignment
Date: Wed, 12 Jul 2017 16:31:10 +0800
Message-ID: <20170712083109.GK3172@dragon>
References: <20170630134337.18245-1-romain.perier@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170630134337.18245-1-romain.perier@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Romain Perier <romain.perier@collabora.com>
Cc: Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Martyn Welch <martyn.welch@collabora.co.uk>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 30, 2017 at 03:43:37PM +0200, Romain Perier wrote:
> From: Martyn Welch <martyn.welch@collabora.co.uk>
> 
> The IPU that drives HDMI must have its pre_sel set to pll2_pfd_396m
> to avoid stepping on the LVDS output's toes, as the PLL can't be clocked
> to the pixel clock and to the LVDS serial clock (3.5*pixel clock) at the
> same time.
> 
> As we are using ipu1_di0 and ipu2_di0, ensure both are switched to
> to pll2_pfd2_396m to avoid issues. The LDB driver will switch the
> required IPU to ldb_di1 when it uses it to drive LVDS.
> 
> Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>
> Signed-off-by: Romain Perier <romain.perier@collabora.com>

Applied, thanks.
