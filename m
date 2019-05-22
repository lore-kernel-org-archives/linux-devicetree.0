From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v9 1/3] arm64: dts: fsl: librem5: Add a device tree for
 the Librem5 devkit
Date: Wed, 22 May 2019 16:29:31 +0800
Message-ID: <20190522082929.GA9261@dragon>
References: <20190513145539.28174-1-angus@akkea.ca>
 <20190513145539.28174-2-angus@akkea.ca>
 <0f355f524122cb4dd6388431495a9d182e3ed9d6.camel@perches.com>
 <11c9a715ee0599e50359eb5ad5bd093e@www.akkea.ca>
 <a2a45d8f881d877027e2c32faf71c7a3f4897324.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a2a45d8f881d877027e2c32faf71c7a3f4897324.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Angus Ainslie <angus@akkea.ca>, angus.ainslie@puri.sm, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kernel-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, May 13, 2019 at 09:05:27AM -0700, Joe Perches wrote:
> On Mon, 2019-05-13 at 08:35 -0700, Angus Ainslie wrote:
> > Hi Joe,
> 
> Hi.
> 
> > On 2019-05-13 08:11, Joe Perches wrote:
> > > On Mon, 2019-05-13 at 07:55 -0700, Angus Ainslie (Purism) wrote:
> > > > This is for the development kit board for the Librem 5. The current 
> > > > level
> > > > of support yields a working console and is able to boot userspace from
> > > > the network or eMMC.
> > > []
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts 
> > > > b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> > > > new file mode 100644
> > > 
> > > Perhaps add an entry in the MAINTAINERS file for this
> > > .dts file similar to other freescale boards?
> > 
> > The MAINTAINERS files has this entry
> > 
> > ARM/FREESCALE IMX / MXC ARM ARCHITECTURE
> > M:  Shawn Guo <shawnguo@kernel.org>
> > M:  Sascha Hauer <s.hauer@pengutronix.de>
> > R:  Pengutronix Kernel Team <kernel@pengutronix.de>
> > R:  Fabio Estevam <festevam@gmail.com>
> > R:  NXP Linux Team <linux-imx@nxp.com>
> > L:  linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> > S:  Maintained
> > T:  git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
> > N:  imx
> > N:  mxs
> > X:  drivers/media/i2c/
> > 
> > Shouldn't the "N: imx" cover this board already ?
> 
> Yes, it would, but not 'exclusively' by the get_maintainer.pl
> script.

We moved to 'N' match with commit da8b7f0fb02b ("MAINTAINERS: add all
files matching "imx" and "mxs" to the IMX entry").  As long as
get_maintainer.pl reports those M/R/L addresses, we are fine, I think.

Shawn
