From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 00/11] imx-drm dt bindings
Date: Fri, 7 Mar 2014 10:28:57 -0800
Message-ID: <20140307182857.GB6963@kroah.com>
References: <1394011262-16849-1-git-send-email-p.zabel@pengutronix.de>
 <20140307175612.GR21483@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <20140307175612.GR21483@n2100.arm.linux.org.uk>
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
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, kernel@pengutronix.de, Grant Likely <grant.likely@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 07, 2014 at 05:56:12PM +0000, Russell King - ARM Linux wrote:
> On Wed, Mar 05, 2014 at 10:20:51AM +0100, Philipp Zabel wrote:
> > Hi,
> > 
> > this latest version of the imx-drm DT binding patches applies
> > on top of staging-next and also depends on the OF graph binding
> > patchset that moves the v4l2_of helpers to drivers/of.
> > Currently, the two patchsets are also available at:
> >     git://git.pengutronix.de/git/pza/linux.git topic/of-graph
> >     git://git.pengutronix.de/git/pza/linux.git topic/imx-drm-dt
> 
> Okay, having looked at the second tree, pulling that will result in
> pulling in all of the staging tree here, which I'd rather not do.  Unless
> there's any objection, I'd like to take these as patches on top of the
> imx-drm stuff which I sent to Greg plus the of-graph stuff which they
> depend upon.  In other words, exactly how I've been testing it today.
> 
> Any objections?

None from me!  :)
