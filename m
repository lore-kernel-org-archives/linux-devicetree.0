From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [PATCH v5 00/11] imx-drm dt bindings
Date: Mon, 7 Apr 2014 21:43:04 +0800
Message-ID: <20140407134302.GB2438@dragon>
References: <1394011262-16849-1-git-send-email-p.zabel@pengutronix.de>
 <20140311034607.GA26502@S2101-09.ap.freescale.net>
 <20140407042334.GA28025@dragon>
 <1396865135.3811.13.camel@paszta.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <1396865135.3811.13.camel@paszta.hi.pengutronix.de>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, David Airlie <airlied@linux.ie>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, kernel@pengutronix.de, Grant Likely <grant.likely@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 07, 2014 at 12:05:35PM +0200, Philipp Zabel wrote:
> > Did you get any chance to reproduce this dual display issue?  Now it
> > shows on mainline kernel.
> 
> I have not yet reproduced, but I've sent a patch today ("imx-drm:
> imx-drm-core: Fix imx_drm_encoder_get_mux_id") that might fix this.

Yes, it fixes my issue.

> 
> > And I see another HDMI regression with my testing on mainline kernel.  I
> > can have my HDMI work at 1920x1080 with v3.14 kernel, but it can only
> > probes 1024x768 with the mainline today.  The Xorg.0.log are attached
> > below.  The hardware and user space are same, so I guess this is another
> > issue introduced by the recently kernel driver changes?
> 
> Hmm, not sure. Have you updated to the i2c-ddc-bus phandle property as
> described in Documentation/devicetree/bindings/staging/imx-drm/hdmi.txt?

That's indeed the cause of my problem.  Thanks, Philipp.

Shawn
