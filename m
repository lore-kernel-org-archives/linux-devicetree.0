From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [RFC PATCH v3 2/9] staging: imx-drm: Add temporary copies of
	v4l2-of parsing functions
Date: Mon, 24 Feb 2014 15:52:21 +0000
Message-ID: <20140224155221.GM21483@n2100.arm.linux.org.uk>
References: <1392723370-4772-1-git-send-email-p.zabel@pengutronix.de>
	<1392723370-4772-3-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1392723370-4772-3-git-send-email-p.zabel@pengutronix.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, kernel@pengutronix.de, Grant Likely <grant.likely@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 18, 2014 at 12:36:03PM +0100, Philipp Zabel wrote:
> From: Philipp Zabel <philipp.zabel@gmail.com>
> 
> The existing v4l2-of parser functions for the video interface bindings
> described in Documentation/device-tree/bindings/media/video-interfaces.txt
> are useful for DRM drivers, too. They will be moved to drivers/media
> so they can be used by drm drivers, too. Until then, duplicate the
> v4l2-of parser functions temporarily.
> 
> Signed-off-by: Philipp Zabel <philipp.zabel@gmail.com>

Ergh.  So, because we can't get agreement on where to put the common
helpers, we have to put up with adding duplicate helpers into the
staging directory, inflating not only the kernel source code size
but also the binary size as well.

Come on people, get agreement on how to deal with this.  Staging may
be a dumping ground for drivers which aren't ready to be merged as
proper drivers, but this is no reason to ignore proper process.

Do we, or do we not want to get imx-drm out of drivers/staging?  If
we do, the only way that's going to happen is if we stop throwing in
this kind of stuff.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
