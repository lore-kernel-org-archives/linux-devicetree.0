From: Dong Aisheng <aisheng.dong@freescale.com>
Subject: Re: [PATCH v1 0/5] dt: add basic imx28 support
Date: Wed, 14 Mar 2012 15:34:55 +0800
Message-ID: <20120314073454.GD8494@shlinux2.ap.freescale.net>
References: <1331628428-24017-1-git-send-email-b29396@freescale.com>
 <201203140701.07111.marek.vasut@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-mmc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201203140701.07111.marek.vasut@gmail.com>
Sender: linux-mmc-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Dong Aisheng <b29396@freescale.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, vinod.koul@linux.intel.com, s.hauer@pengutronix.de, rob.herring@calxeda.com, grant.likely@secretlab.ca, rdunlap@xenotime.net, kernel@pengutronix.de, cjb@laptop.org, shawn.guo@freescale.com
List-Id: devicetree@vger.kernel.org

On Wed, Mar 14, 2012 at 07:01:06AM +0100, Marek Vasut wrote:
> Dear Dong Aisheng,
> 
> > This patch series adds basic imx28 dt support including fec, mmc and dma.
> > 
> > Tested on mx28evk.
> > 
> > TODO:
> > Convert the remaining devices to support dt.
> > mxs-auart, mxs-gpio, i2c, flexcan, saif, rtc, pwm, fb.
> > 
> > Dong Aisheng (5):
> >   ARM: imx28: add basic dt support
> >   mmc: mxs-mmc: add dt probe support
> >   ARM: imx28evk: add mmc dt support
> >   dma: mxs-dma: add dt probe support
> >   ARM: mxs: add mxs dma dt support
> > 
> Can you keep me in Cc on new versions of these patches? Thanks!
> 
Of course yes.
Thanks for your review.

Regards
Dong Aisheng

