From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V1] ARM: dts: imx6: Change the clock name for spba clock
Date: Wed, 2 Dec 2015 14:14:12 +0800
Message-ID: <20151202061412.GI692@tiger>
References: <8cd5b975aa4792f1dd9ac2f8909689f8d2018160.1448505436.git.shengjiu.wang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8cd5b975aa4792f1dd9ac2f8909689f8d2018160.1448505436.git.shengjiu.wang@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shengjiu Wang <shengjiu.wang@freescale.com>
Cc: kernel@pengutronix.de, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 26, 2015 at 10:39:30AM +0800, Shengjiu Wang wrote:
> Audio IP need the spba clock, but original clock name "dma" is not
> accurate, so change it to name "spba". The audio driver has been
> using the new name "spba", the binding document has been updated.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@freescale.com>

Applied, thanks.
