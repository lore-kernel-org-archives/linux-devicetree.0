From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCHv2 2/3] ARM: drm: Intel FPGA VIP Frame Buffer II drm driver
Date: Wed, 03 May 2017 13:34:34 -0700
Message-ID: <87o9v9znl1.fsf@eliezer.anholt.net>
References: <1493086006-4392-1-git-send-email-hean.loong.ong@intel.com>
 <1493086006-4392-3-git-send-email-hean.loong.ong@intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0231717085=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1493086006-4392-3-git-send-email-hean.loong.ong@intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: daniel.vetter@intel.com, dinguyen@kernel.org, robh+dt@kernel.org
Cc: hean.loong.ong@intel.com, devicetree@vger.kernel.org, tien.hock.loh@intel.com, dri-devel@lists.freedesktop.org, Ong@freedesktop.org
List-Id: devicetree@vger.kernel.org

--===============0231717085==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

hean.loong.ong@intel.com writes:

> From: "Ong, Hean Loong" <hean.loong.ong@intel.com>
>
> Driver for Intel FPGA Video and Image Processing
> Suite Frame Buffer II. The driver only supports the Intel
> Arria10 devkit and its variants. This driver can be either
> loaded staticlly or in modules. The OF device tree binding
> is located at:
> Documentation/devicetree/bindings/display/altr,vip-fb2.txt
>
> Signed-off-by: Ong, Hean Loong <hean.loong.ong@intel.com>

I'm not sure if this driver is going to make sense as-is, if it doesn't
actually do display of planes from system memory.  But in case I was
wrong, here's my review:


> diff --git a/drivers/gpu/drm/ivip/intel_vip_conn.c b/drivers/gpu/drm/ivip/intel_vip_conn.c
> new file mode 100644
> index 0000000..499d3b4
> --- /dev/null
> +++ b/drivers/gpu/drm/ivip/intel_vip_conn.c
> @@ -0,0 +1,96 @@
> +/*
> + * intel_vip_conn.c -- Intel Video and Image Processing(VIP)
> + * Frame Buffer II driver
> + *
> + * This driver supports the Intel VIP Frame Reader component.
> + * More info on the hardware can be found in the Intel Video
> + * and Image Processing Suite User Guide at this address
> + * http://www.altera.com/literature/ug/ug_vip.pdf.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * Authors:
> + * Ong, Hean-Loong <hean.loong.ong@intel.com>
> + *
> + */
> +
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_encoder_slave.h>
> +#include <drm/drm_plane_helper.h>
> +
> +static enum drm_connector_status
> +intelvipfb_drm_connector_detect(struct drm_connector *connector, bool force)
> +{
> +	return connector_status_connected;
> +}
> +
> +static void intelvipfb_drm_connector_destroy(struct drm_connector *connector)
> +{
> +	drm_connector_unregister(connector);
> +	drm_connector_cleanup(connector);
> +}
> +
> +static const struct drm_connector_funcs intelvipfb_drm_connector_funcs = {
> +	.dpms = drm_helper_connector_dpms,
> +	.reset = drm_atomic_helper_connector_reset,
> +	.detect = intelvipfb_drm_connector_detect,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = intelvipfb_drm_connector_destroy,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static int intelvipfb_drm_connector_get_modes(struct drm_connector *connector)
> +{
> +	struct drm_device *drm = connector->dev;
> +	int count;
> +
> +	count = drm_add_modes_noedid(connector, drm->mode_config.max_width,
> +				     drm->mode_config.max_height);
> +	drm_set_preferred_mode(connector, drm->mode_config.max_width,
> +			       drm->mode_config.max_height);
> +	return count;
> +}

You're adding a bunch of modes here, but I don't see anywhere in the
driver that you change the resolution being scanned out.

If you can't change resolution, then I'd probably use drm_gtf_mode() or
something to generate just the one mode (do you have a vrefresh for
it?).  Also, in the simple display pipe's atomic_check, make sure that
the mode chosen is the width/height you can support.

> +
> +static const struct drm_connector_helper_funcs
> +intelvipfb_drm_connector_helper_funcs = {
> +	.get_modes = intelvipfb_drm_connector_get_modes,
> +};
> +
> +struct drm_connector *
> +intelvipfb_conn_setup(struct drm_device *drm)
> +{
> +	struct drm_connector *conn;
> +	int ret;
> +
> +	conn = devm_kzalloc(drm->dev, sizeof(*conn), GFP_KERNEL);
> +	if (IS_ERR(conn))
> +		return NULL;
> +
> +	ret = drm_connector_init(drm, conn, &intelvipfb_drm_connector_funcs,
> +				 DRM_MODE_CONNECTOR_DisplayPort);

Are you actually outputting DisplayPort
(https://en.wikipedia.org/wiki/DisplayPort)?

You probably want something else from the DRM_MODE_CONNECTOR list, or
maybe just DRM_MODE_CONNECTOR_Unknown.


> +	if (ret < 0) {
> +		dev_err(drm->dev, "failed to initialize drm connector\n");
> +		ret = -ENOMEM;
> +		goto error_connector_cleanup;
> +	}
> +
> +	drm_connector_helper_add(conn, &intelvipfb_drm_connector_helper_funcs);
> +
> +	return conn;
> +
> +error_connector_cleanup:
> +	drm_connector_cleanup(conn);
> +
> +	return NULL;
> +}
> diff --git a/drivers/gpu/drm/ivip/intel_vip_core.c b/drivers/gpu/drm/ivip/intel_vip_core.c
> new file mode 100644
> index 0000000..4e83343
> --- /dev/null
> +++ b/drivers/gpu/drm/ivip/intel_vip_core.c
> @@ -0,0 +1,171 @@
> +/*
> + * intel_vip_core.c -- Intel Video and Image Processing(VIP)
> + * Frame Buffer II driver
> + *
> + * This driver supports the Intel VIP Frame Reader component.
> + * More info on the hardware can be found in the Intel Video
> + * and Image Processing Suite User Guide at this address
> + * http://www.altera.com/literature/ug/ug_vip.pdf.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * Authors:
> + * Ong, Hean-Loong <hean.loong.ong@intel.com>
> + *
> + */
> +
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +
> +#include <drm/drmP.h>
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_plane_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
> +
> +#include "intel_vip_drv.h"
> +
> +static const u32 fbpriv_formats[] = {
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_RGB565
> +};

You're registering that you support this set of formats, but I don't see
anything programming the hardware differently based on the format of the
plane.

> +static void intelvipfb_start_hw(void __iomem *base, resource_size_t addr)
> +{
> +	/*
> +	 * The frameinfo variable has to correspond to the size of the VIP Suite
> +	 * Frame Reader register 7 which will determine the maximum size used
> +	 * in this frameinfo
> +	 */
> +
> +	u32 frameinfo;
> +
> +	frameinfo =
> +		readl(base + INTELVIPFB_FRAME_READER) & 0x00ffffff;
> +	writel(frameinfo, base + INTELVIPFB_FRAME_INFO);
> +	writel(addr, base + INTELVIPFB_FRAME_START);
> +	/* Finally set the control register to 1 to start streaming */
> +	writel(1, base + INTELVIPFB_CONTROL);
> +}

The addr you're passing in here is from dev->mode_config.fb_base, which
is this weird sideband value from drm_fbdev_cma.  It's the wrong value
to use if anything else uses the KMS interfaces to change the plane --
you should be using
drm_fb_cma_get_gem_addr(drm_simple_display_pipe->plane->state, 0)
instead.

> +
> +static void intelvipfb_disable_hw(void __iomem *base)
> +{
> +	/* set the control register to 0 to stop streaming */
> +	writel(0, base + INTELVIPFB_CONTROL);
> +}

These two functions should be be called from fbpriv_funcs.enable() and
.disable(), not device load/unload.

> +static const struct drm_mode_config_funcs intelvipfb_mode_config_funcs = {
> +	.fb_create = drm_fb_cma_create,
> +	.atomic_check = drm_atomic_helper_check,
> +	.atomic_commit = drm_atomic_helper_commit,
> +};
> +
> +static struct drm_mode_config_helper_funcs intelvipfb_mode_config_helpers = {
> +	.atomic_commit_tail = drm_atomic_helper_commit_tail,
> +};
> +
> +static void intelvipfb_setup_mode_config(struct drm_device *drm)
> +{
> +	drm_mode_config_init(drm);
> +	drm->mode_config.funcs = &intelvipfb_mode_config_funcs;
> +	drm->mode_config.helper_private = &intelvipfb_mode_config_helpers;
> +}
> +
> +static int intelvipfb_pipe_prepare_fb(struct drm_simple_display_pipe *pipe,
> +				      struct drm_plane_state *plane_state)
> +{
> +	return drm_fb_cma_prepare_fb(&pipe->plane, plane_state);
> +}
> +
> +static struct drm_simple_display_pipe_funcs fbpriv_funcs = {
> +	.prepare_fb = intelvipfb_pipe_prepare_fb,
> +};
> +
> +int intelvipfb_probe(struct device *dev, void __iomem *base)
> +{
> +	int retval;
> +	struct drm_device *drm;
> +	struct intelvipfb_priv *fbpriv = dev_get_drvdata(dev);
> +	struct drm_connector *connector;
> +
> +	dev_set_drvdata(dev, fbpriv);
> +
> +	drm = fbpriv->drm;
> +
> +	intelvipfb_setup_mode_config(drm);
> +
> +	connector = intelvipfb_conn_setup(drm);
> +	if (!connector) {
> +		dev_err(drm->dev, "Connector setup failed\n");
> +		goto err_mode_config;
> +	}
> +
> +	retval = drm_simple_display_pipe_init(drm, &fbpriv->pipe,
> +					      &fbpriv_funcs,
> +					      fbpriv_formats,
> +					      ARRAY_SIZE(fbpriv_formats),
> +					      connector);
> +	if (retval < 0) {
> +		dev_err(drm->dev, "Cannot setup simple display pipe\n");
> +		goto err_mode_config;
> +	}
> +
> +	fbpriv->fbcma = drm_fbdev_cma_init(drm, PREF_BPP,
> +					   drm->mode_config.num_connector);
> +	if (!fbpriv->fbcma) {
> +		fbpriv->fbcma = NULL;
> +		dev_err(drm->dev, "Failed to init FB CMA area\n");
> +		goto err_mode_config;
> +	}

On failure, drm_fbdev_cma_init() returns an ERR_PTR, not NULL.

Also, you're passing this PREF_BPP value here, ignoring
the altr,bits-per-symbol property.  That seems wrong.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlkKPtoACgkQtdYpNtH8
nuiDNBAAqM9IKp7GUCbC6EdbxmwsMgK0U2hMfZuzqgfcidk+9iiW2Qs0sEgahn82
RQJnB5MLUeDSKg05oXs6mT3li5wyXEbeSdDrp6AeJBDg011Jul+wggTL7p+zQ7a7
hNCeL/vyIdGsETVvCgEAbBTBI5Y7Y+HUDENjr61Vcx8ctU2nW7gTF3s/E3UGd9Uo
DtByOUoHuy7tWJkRPXRQN5mEnoywDqvYMFLEIAPKHyd6fSwFqJ9ongkahkCkRSeo
+RwBDg1jpGjE7tZtQJGzIsCUw1ndj/XOj/ZtDxamypMa4E+VcPrwCOJyO++FlDZd
UFVjfrcvUE4sucG2NyQOWuwpS7QhZ+Tx0KfrKSCM6kAtGaUnnHdODpsKuOH2RBDV
1ffcbA5mtZHCoRJRChJlmqGsocz7ym5nM7to8o5iQ+LPw5nK32KOPQOXOWznNrMI
cVoK9dEp68uezQVyzYSkBf/GRplu1zK1mpq/HahJSXSv4BrOUBMj6BQGl6Shob5X
WydpI/gaRcMCaKC1jbEYk/zjSwSeI8x/UnmfNDWfqGc36ZbliD7ettHzcXADc6Ve
PcQfWaIq+gsEwv71HoBPIyQnFCYBzREowNMSDATjWcK2OI2pxAEzO3CtfAecgs+2
DIcPkQItNRbBwX5pPMSDauZeLdy9VNDSo/CQ0wI8Cb0ZQqrt/IE=
=D7Vj
-----END PGP SIGNATURE-----
--=-=-=--

--===============0231717085==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0231717085==--
