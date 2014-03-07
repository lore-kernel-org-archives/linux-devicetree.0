From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 1/2] imx-drm: imx-ldb: Add drm_panel support
Date: Fri, 07 Mar 2014 18:45:15 +0100
Message-ID: <1394214315.16309.47.camel@paszta.hi.pengutronix.de>
References: <1394114080-27223-1-git-send-email-p.zabel@pengutronix.de>
	<20140307172243.GQ21483@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20140307172243.GQ21483@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, kernel@pengutronix.de, Grant Likely <grant.likely@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Russell,

Am Freitag, den 07.03.2014, 17:22 +0000 schrieb Russell King - ARM
Linux:
> On Thu, Mar 06, 2014 at 02:54:39PM +0100, Philipp Zabel wrote:
> > This patch allows to optionally attach the lvds-channel to a panel
> > supported by a drm_panel driver instead of supplying the modes via
> > device tree.
> 
> Hmm, I think something may be missing in this patch... you're introducing
> calls into the drm panel code, but there's nothign which ensures that
> code gets built alongside imx-ldb.c.  With imx-ldb built as a module,
> I get:
> 
> ERROR: "drm_panel_attach" [drivers/staging/imx-drm/imx-ldb.ko] undefined!
> ERROR: "of_drm_find_panel" [drivers/staging/imx-drm/imx-ldb.ko] undefined!

Thanks for testing. Yes, this Kconfig change is missing from patch 1:

diff --git a/drivers/staging/imx-drm/Kconfig
b/drivers/staging/imx-drm/Kconfig
index 82fb758..8e5b7e9 100644
--- a/drivers/staging/imx-drm/Kconfig
+++ b/drivers/staging/imx-drm/Kconfig
@@ -35,6 +35,7 @@ config DRM_IMX_TVE
 config DRM_IMX_LDB
 	tristate "Support for LVDS displays"
 	depends on DRM_IMX && MFD_SYSCON
+	select DRM_PANEL
 	help
 	  Choose this to enable the internal LVDS Display Bridge (LDB)
 	  found on i.MX53 and i.MX6 processors.

I haven't noticed because I've enabled the parallel display driver,
which does correctly select DRM_PANEL.

regards
Philipp
