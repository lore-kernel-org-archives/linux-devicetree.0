From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v5 04/10] drm/stm: Add STM32 LTDC driver
Date: Tue, 11 Apr 2017 13:45:01 -0700
Message-ID: <87wpaqeks2.fsf@eliezer.anholt.net>
References: <1490694293-18358-1-git-send-email-yannick.fertre@st.com>
 <1490694293-18358-5-git-send-email-yannick.fertre@st.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1415973842=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1490694293-18358-5-git-send-email-yannick.fertre@st.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Yannick Fertre <yannick.fertre@st.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Benjamin Gaignard <benjamin.gaignard@st.com>Yannick Fertre <yannick.fertre@st.com>
Cc: devicetree@vger.kernel.org, kernel@stlinux.com, Philippe Cornu <philippe.cornu@st.com>, dri-devel@lists.freedesktop.org, Fabien Dessenne <fabien.dessenne@st.com>, Mickael Reulier <mickael.reulier@st.com>, Vincent Abriou <vincent.abriou@st.com>, Gabriel FERNANDEZ <gabriel.fernandez@st.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============1415973842==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Yannick Fertre <yannick.fertre@st.com> writes:

> This controller provides output signals to interface directly a variety
> of LCD and TFT panels. These output signals are: RGB signals
> (up to 24bpp), vertical & horizontal synchronisations, data enable and
> the pixel clock.
>
> Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
> ---
>  drivers/gpu/drm/Kconfig      |    3 +-
>  drivers/gpu/drm/Makefile     |    1 +
>  drivers/gpu/drm/stm/Kconfig  |   16 +
>  drivers/gpu/drm/stm/Makefile |    7 +
>  drivers/gpu/drm/stm/drv.c    |  221 ++++++++
>  drivers/gpu/drm/stm/ltdc.c   | 1210 ++++++++++++++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/stm/ltdc.h   |   40 ++
>  7 files changed, 1497 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/stm/Kconfig
>  create mode 100644 drivers/gpu/drm/stm/Makefile
>  create mode 100644 drivers/gpu/drm/stm/drv.c
>  create mode 100644 drivers/gpu/drm/stm/ltdc.c
>  create mode 100644 drivers/gpu/drm/stm/ltdc.h
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 78d7fc0..dd5762a 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -203,7 +203,6 @@ config DRM_VGEM
>  	  as used by Mesa's software renderer for enhanced performance.
>  	  If M is selected the module will be called vgem.
>=20=20
> -

Stray whitespace change.

With this removed, the driver is:

Reviewed-by: Eric Anholt <eric@anholt.net>

Apologies for the delay in the second review offered.  The remainder of
my comments are little cleanups, all of which I think are optional and
fine to do after the code lands.

You should probably update MAINTAINERS for your new driver.  If you'd
like to maintain this driver in the drm-misc small drivers collection
(https://01.org/linuxgraphics/gfx-docs/maintainer-tools/drm-misc.html),
send a follow-up patch to the list to add the MAINTAINERS entry, and I
can get that and patches 1-4 merged.  Once you have a few more patches
in, we can add you to the drm-misc committers crew so you can merge
directly after getting review.

I'll also take this moment to plug something: Please feel welcome to
review other people's driver patches on the list.  You've built
something nice here, and probably learned a lot of lessons along the way
that you could share with others.  (I just found out about
of_reset_control in reviewing your code, and I wish I had known about it
back when I was landing vc4!)

> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> new file mode 100644
> index 0000000..922f021
> --- /dev/null
> +++ b/drivers/gpu/drm/stm/ltdc.c

> +static void ltdc_crtc_disable(struct drm_crtc *crtc)
> +{
> +	struct ltdc_device *ldev =3D crtc_to_ltdc(crtc);
> +	struct drm_pending_vblank_event *event =3D crtc->state->event;
> +
> +	DRM_DEBUG_DRIVER("\n");
> +
> +	if (!crtc->enabled) {
> +		DRM_DEBUG_DRIVER("already disabled\n");
> +		return;
> +	}

I think this crtc->enabled is a given for the disable() being called.

> +
> +	drm_crtc_vblank_off(crtc);
> +
> +	/* disable LTDC */
> +	reg_clear(ldev->regs, LTDC_GCR, GCR_LTDCEN);
> +
> +	/* disable IRQ */
> +	reg_clear(ldev->regs, LTDC_IER, IER_RRIE | IER_FUIE | IER_TERRIE);
> +
> +	/* immediately commit disable of layers before switching off LTDC */
> +	reg_set(ldev->regs, LTDC_SRCR, SRCR_IMR);
> +
> +	if (event) {
> +		crtc->state->event =3D NULL;
> +
> +		spin_lock_irq(&crtc->dev->event_lock);
> +		if (crtc->state->active && drm_crtc_vblank_get(crtc) =3D=3D 0)
> +			drm_crtc_arm_vblank_event(crtc, event);
> +		else
> +			drm_crtc_send_vblank_event(crtc, event);
> +		spin_unlock_irq(&crtc->dev->event_lock);
> +	}

I believe that we're guaranteed that crtc->state->event is NULL in the
disable call, since your atomic_flush() already armed or sent the event
and NULLed out the pointer.

> +struct drm_connector *ltdc_rgb_connector_create(struct drm_device *ddev)
> +{
> +	struct drm_connector *connector;
> +	int err;
> +
> +	connector =3D devm_kzalloc(ddev->dev, sizeof(*connector), GFP_KERNEL);
> +	if (!connector) {
> +		DRM_ERROR("Failed to allocate connector\n");
> +		return NULL;
> +	}
> +
> +	connector->polled =3D DRM_CONNECTOR_POLL_HPD;
> +
> +	err =3D drm_connector_init(ddev, connector, &ltdc_rgb_connector_funcs,
> +				 DRM_MODE_CONNECTOR_LVDS);

I think DRM_MODE_CONNECTOR_DPI (and _ENCODER_DPI) are slightly more
accurate descriptions, if I'm interpreting your pinmux setup right.
It's cosmetic, though.

> +static struct drm_panel *ltdc_get_panel(struct drm_device *ddev)
> +{
> +	struct device *dev =3D ddev->dev;
> +	struct device_node *np =3D dev->of_node;
> +	struct device_node *entity, *port =3D NULL;
> +	struct drm_panel *panel =3D NULL;
> +
> +	DRM_DEBUG_DRIVER("\n");
> +
> +	/*
> +	 * Parse ltdc node to get remote port and find RGB panel / HDMI slave
> +	 * If a dsi or a bridge (hdmi, lvds...) is connected to ltdc,
> +	 * a remote port & RGB panel will not be found.
> +	 */
> +	for_each_endpoint_of_node(np, entity) {
> +		if (!of_device_is_available(entity))
> +			continue;
> +
> +		port =3D of_graph_get_remote_port_parent(entity);
> +		if (port) {
> +			panel =3D of_drm_find_panel(port);
> +			of_node_put(port);
> +			if (panel) {
> +				DRM_DEBUG_DRIVER("remote panel %s\n",
> +						 port->full_name);
> +			} else {
> +				DRM_DEBUG_DRIVER("panel missing\n");
> +				of_node_put(entity);
> +			}
> +		}
> +	}

Future work: You may find the new drm_of_find_panel_or_bridge() useful
to drop this loop.

> +
> +	return panel;
> +}
> +
> +int ltdc_load(struct drm_device *ddev)
> +{
> +	struct platform_device *pdev =3D to_platform_device(ddev->dev);
> +	struct ltdc_device *ldev =3D ddev->dev_private;
> +	struct device *dev =3D ddev->dev;
> +	struct device_node *np =3D dev->of_node;
> +	struct drm_encoder *encoder;
> +	struct drm_connector *connector =3D NULL;
> +	struct drm_crtc *crtc;
> +	struct reset_control *rstc;
> +	struct resource res;
> +	int irq, ret, i;
> +
> +	DRM_DEBUG_DRIVER("\n");
> +
> +	ldev->panel =3D ltdc_get_panel(ddev);
> +	if (!ldev->panel)
> +		return -EPROBE_DEFER;
> +
> +	rstc =3D of_reset_control_get(np, NULL);
> +
> +	mutex_init(&ldev->err_lock);
> +
> +	ldev->pixel_clk =3D devm_clk_get(dev, "lcd");
> +	if (IS_ERR(ldev->pixel_clk)) {
> +		DRM_ERROR("Unable to get lcd clock\n");
> +		return -ENODEV;
> +	}
> +
> +	if (clk_prepare_enable(ldev->pixel_clk)) {
> +		DRM_ERROR("Unable to prepare pixel clock\n");
> +		return -ENODEV;
> +	}

Future work: You may want to move the pixel clock enable into the CRTC's
.enable() and disable in .disable().  It sounded in previous versions
like the HW uses that clock for all register accesses, so you'd need to
protect a couple of other places, but that should save power when the
device is off, right?

> +
> +	if (of_address_to_resource(np, 0, &res)) {
> +		DRM_ERROR("Unable to get resource\n");
> +		return -ENODEV;
> +	}
> +
> +	ldev->regs =3D devm_ioremap_resource(dev, &res);
> +	if (IS_ERR(ldev->regs)) {
> +		DRM_ERROR("Unable to get ltdc registers\n");
> +		return PTR_ERR(ldev->regs);
> +	}
> +
> +	for (i =3D 0; i < MAX_IRQ; i++) {
> +		irq =3D platform_get_irq(pdev, i);
> +		if (irq < 0)
> +			continue;
> +
> +		ret =3D devm_request_threaded_irq(dev, irq, ltdc_irq,
> +						ltdc_irq_thread, IRQF_ONESHOT,
> +						dev_name(dev), ddev);
> +		if (ret) {
> +			DRM_ERROR("Failed to register LTDC interrupt\n");
> +			return ret;
> +		}
> +	}
> +
> +	if (!IS_ERR(rstc))
> +		reset_control_deassert(rstc);
> +
> +	/* Disable interrupts */
> +	reg_clear(ldev->regs, LTDC_IER,
> +		  IER_LIE | IER_RRIE | IER_FUIE | IER_TERRIE);
> +
> +	ret =3D ltdc_get_caps(ddev);
> +	if (ret) {
> +		DRM_ERROR("hardware identifier (0x%08x) not supported!\n",
> +			  ldev->caps.hw_version);
> +		return ret;
> +	}
> +
> +	DRM_INFO("ltdc hw version 0x%08x - ready\n", ldev->caps.hw_version);
> +
> +	if (ltdc_create_encoders(ddev)) {
> +		DRM_ERROR("Failed to create encoders\n");
> +		return -EINVAL;
> +	}
> +
> +	if (ldev->panel) {
> +		encoder =3D ltdc_rgb_encoder_find(ddev);
> +		if (!encoder) {
> +			DRM_ERROR("Failed to find RGB encoder\n");
> +			ret =3D -EINVAL;
> +			goto err;
> +		}

Given that ltdc_create_encoders() only does work if ldev->panel, its
body could probably be moved in here and then ltdc_rgb_encoder_find
could be dropped.

> +
> +		connector =3D ltdc_rgb_connector_create(ddev);
> +		if (!connector) {
> +			DRM_ERROR("Failed to create RGB connector\n");
> +			ret =3D -EINVAL;
> +			goto err;
> +		}
> +
> +		ret =3D drm_mode_connector_attach_encoder(connector, encoder);
> +		if (ret) {
> +			DRM_ERROR("Failed to attach connector to encoder\n");
> +			goto err;
> +		}
> +
> +		drm_panel_attach(ldev->panel, connector);
> +	}

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAljtQE0ACgkQtdYpNtH8
nuiP2w//c+n8W9LlwFz73Pvexhb6qitsRdp1AoSxiZ7/7ZF/pyWEhVww/HuZTOXY
sc8kk3DzY4PUfcKhymiikzt3gg5piF5zpYVJwLutU6fdeKi5Cr01X3ndaPR3Dz1g
sqwWc8MNqb0h1G2tYSs6HhOg7HA7gARrQS27bJ2MPdsl58+i7E1KKnGhE1bAw1wc
ua+8qQOkLLfFqZQxVqbAjyCnFJb4ujiFLtChpqj9tm45We3NKrAPZb6JBFCtFGdN
w519NjQZmeDdWT5q6CNvEKLSrPfxU2IQqt2kAXdU0DDMDCubd4mXnBjmuL/i89Ky
xGHBHuQX5g9WvHEuTSmkP0Zh/V9/6ageNQsLgtwwn1OnzYEmCLhKCHK/H9vbKTdj
zr+6XxF+PBjrSqbUHEhVNB+eZOp6niGkwPllu21/2VC6FPbm9+S193jc2wgTVBrm
aZS5Aj1jksmNajXz3zSjb96ySQJ90HoW0kpRLM5CP50zeuKvaqC940S83eV8jBSa
WR/YLbl/194UiEgpOou3YZI/R56pOBDAA9i1yreBqxDap5SwBTjSlLR0i7L9Nqcs
ZqntzinC2dK8lvg2SC7gRpq/9FTEBGedscSWXmmeFEEdJCwxQ4HxLehndMPbqFXE
5/lcPAgqiuDdDOj0uCgEsDPbBJ4FmCUMY2ooUh1m9JeykKtKhrc=
=8G6g
-----END PGP SIGNATURE-----
--=-=-=--

--===============1415973842==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1415973842==--
