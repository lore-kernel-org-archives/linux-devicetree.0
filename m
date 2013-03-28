From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v9 RESEND 4/4] ARM: dts: add sram for imx53 and imx6q
Date: Thu, 28 Mar 2013 09:16:36 +0800
Message-ID: <20130328011634.GB5429@S2101-09.ap.freescale.net>
References: <1363776767-2635-1-git-send-email-p.zabel@pengutronix.de>
 <1363776767-2635-5-git-send-email-p.zabel@pengutronix.de>
 <20130327152910.80bf4812a9506d8c2b5fab1a@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130327152910.80bf4812a9506d8c2b5fab1a@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Huang Shijie <shijie8@gmail.com>, Dong Aisheng <dong.aisheng@linaro.org>, Matt Porter <mporter@ti.com>, Fabio Estevam <fabio.estevam@freescale.com>, Javier Martin <javier.martin@vista-silicon.com>, kernel@pengutronix.de, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Wed, Mar 27, 2013 at 03:29:10PM -0700, Andrew Morton wrote:
> On Wed, 20 Mar 2013 11:52:47 +0100 Philipp Zabel <p.zabel@pengutronix.de> wrote:
> 
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > Reviewed-by: Shawn Guo <shawn.guo@linaro.org>
> > Acked-by: Grant Likely <grant.likely@secretlab.ca>
> > ---
> > Changes since v8:
> >  - Changed device tree compatible string to "mmio-sram"
> > ---
> >  arch/arm/boot/dts/imx53.dtsi |    5 +++++
> >  arch/arm/boot/dts/imx6q.dtsi |    6 ++++++
> 
> This doesn't apply, due to stuff which is pending in linux-next.  I had
> a go at fixing it but ran out of confidence - those files have changed
> significantly.
> 
> Redo and resend, please?

We will merge this patch via IMX tree.

Shawn
