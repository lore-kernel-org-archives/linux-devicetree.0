From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [RFC PATCH v3 2/9] staging: imx-drm: Add temporary copies of
 v4l2-of parsing functions
Date: Mon, 24 Feb 2014 18:31:30 +0100
Message-ID: <1393263090.3091.78.camel@pizza.hi.pengutronix.de>
References: <1392723370-4772-1-git-send-email-p.zabel@pengutronix.de>
 <1392723370-4772-3-git-send-email-p.zabel@pengutronix.de>
 <20140224155221.GM21483@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20140224155221.GM21483@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Philipp Zabel <philipp.zabel@gmail.com>, David Airlie <airlied@linux.ie>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, kernel@pengutronix.de, Grant Likely <grant.likely@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am Montag, den 24.02.2014, 15:52 +0000 schrieb Russell King - ARM Linux:
> On Tue, Feb 18, 2014 at 12:36:03PM +0100, Philipp Zabel wrote:
> > From: Philipp Zabel <philipp.zabel@gmail.com>
> > 
> > The existing v4l2-of parser functions for the video interface bindings
> > described in Documentation/device-tree/bindings/media/video-interfaces.txt
> > are useful for DRM drivers, too. They will be moved to drivers/media
> > so they can be used by drm drivers, too. Until then, duplicate the
> > v4l2-of parser functions temporarily.
> > 
> > Signed-off-by: Philipp Zabel <philipp.zabel@gmail.com>
> 
> Ergh.  So, because we can't get agreement on where to put the common
> helpers, we have to put up with adding duplicate helpers into the
> staging directory, inflating not only the kernel source code size
> but also the binary size as well.

This part is only for the convenience of prospective reviewers/testers.
I hope I don't have exhausted your patience at this patch, because the
real changes start at 3/9.

This is one reason why I still didn't drop the RFC. Basically, with so
many moving parts, I didn't feel like telling people to fetch three
different series just to make sense of this one.

> Come on people, get agreement on how to deal with this.  Staging may
> be a dumping ground for drivers which aren't ready to be merged as
> proper drivers, but this is no reason to ignore proper process.
> 
> Do we, or do we not want to get imx-drm out of drivers/staging?  If
> we do, the only way that's going to happen is if we stop throwing in
> this kind of stuff.

regards
Philipp
