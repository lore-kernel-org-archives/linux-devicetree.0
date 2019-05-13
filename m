From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v9 1/3] arm64: dts: fsl: librem5: Add a device tree for
 the Librem5 devkit
Date: Mon, 13 May 2019 09:05:27 -0700
Message-ID: <a2a45d8f881d877027e2c32faf71c7a3f4897324.camel@perches.com>
References: <20190513145539.28174-1-angus@akkea.ca>
         <20190513145539.28174-2-angus@akkea.ca>
         <0f355f524122cb4dd6388431495a9d182e3ed9d6.camel@perches.com>
         <11c9a715ee0599e50359eb5ad5bd093e@www.akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <11c9a715ee0599e50359eb5ad5bd093e@www.akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Angus Ainslie <angus@akkea.ca>
Cc: angus.ainslie@puri.sm, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kernel-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 2019-05-13 at 08:35 -0700, Angus Ainslie wrote:
> Hi Joe,

Hi.

> On 2019-05-13 08:11, Joe Perches wrote:
> > On Mon, 2019-05-13 at 07:55 -0700, Angus Ainslie (Purism) wrote:
> > > This is for the development kit board for the Librem 5. The current 
> > > level
> > > of support yields a working console and is able to boot userspace from
> > > the network or eMMC.
> > []
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts 
> > > b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> > > new file mode 100644
> > 
> > Perhaps add an entry in the MAINTAINERS file for this
> > .dts file similar to other freescale boards?
> 
> The MAINTAINERS files has this entry
> 
> ARM/FREESCALE IMX / MXC ARM ARCHITECTURE
> M:  Shawn Guo <shawnguo@kernel.org>
> M:  Sascha Hauer <s.hauer@pengutronix.de>
> R:  Pengutronix Kernel Team <kernel@pengutronix.de>
> R:  Fabio Estevam <festevam@gmail.com>
> R:  NXP Linux Team <linux-imx@nxp.com>
> L:  linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> S:  Maintained
> T:  git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
> N:  imx
> N:  mxs
> X:  drivers/media/i2c/
> 
> Shouldn't the "N: imx" cover this board already ?

Yes, it would, but not 'exclusively' by the get_maintainer.pl
script.

> Maybe I misunderstood, are you suggesting I add an new entry for "F: 
> arch/arm64/boot/dts/freescale/*" ?

I don't believe an F: arch/arm64/boot/dts/freescale/*
pattern would be appropriate as there is already another
section with this path as a pattern.

ARM/FREESCALE LAYERSCAPE ARM ARCHITECTURE
M:	Shawn Guo <shawnguo@kernel.org>
M:	Li Yang <leoyang.li@nxp.com>
L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
S:	Maintained
T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
F:	arch/arm/boot/dts/ls1021a*
F:	arch/arm64/boot/dts/freescale/fsl-*
F:	arch/arm64/boot/dts/freescale/qoriq-*

I suggest perhaps just adding a more specific entry of

F:	arch/arm64/boot/dts/freescale/imx*

And just FYI:

F: entries should be preferred over N: entries as
filename collisions with other regex matches are common.

Controlling the mismatches as was done with the X: exclusion
for drivers/media/i2c/ may not scale if another filename
is added into the kernel tree that is not maintained by you
that matches either of the imx or mxs pattern.

It's not really a significant issue though you may get a few
patches for files you don't care about at some point.

cheers, Joe
