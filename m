From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 1/2] imx-drm: imx-ldb: Add drm_panel support
Date: Fri, 7 Mar 2014 17:22:43 +0000
Message-ID: <20140307172243.GQ21483@n2100.arm.linux.org.uk>
References: <1394114080-27223-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1394114080-27223-1-git-send-email-p.zabel@pengutronix.de>
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

On Thu, Mar 06, 2014 at 02:54:39PM +0100, Philipp Zabel wrote:
> This patch allows to optionally attach the lvds-channel to a panel
> supported by a drm_panel driver instead of supplying the modes via
> device tree.

Hmm, I think something may be missing in this patch... you're introducing
calls into the drm panel code, but there's nothign which ensures that
code gets built alongside imx-ldb.c.  With imx-ldb built as a module,
I get:

ERROR: "drm_panel_attach" [drivers/staging/imx-drm/imx-ldb.ko] undefined!
ERROR: "of_drm_find_panel" [drivers/staging/imx-drm/imx-ldb.ko] undefined!

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
