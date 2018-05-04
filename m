From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 2/6] drm/panel: Make of_drm_find_panel() return an
 ERR_PTR() instead of NULL
Date: Fri, 4 May 2018 12:18:52 +0200
Message-ID: <20180504101852.GG13459@ulmo>
References: <20180503164009.14395-1-boris.brezillon@bootlin.com>
 <20180503164009.14395-3-boris.brezillon@bootlin.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2145807850=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180503164009.14395-3-boris.brezillon@bootlin.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org


--===============2145807850==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4eRLI4hEmsdu6Npr"
Content-Disposition: inline


--4eRLI4hEmsdu6Npr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 03, 2018 at 06:40:05PM +0200, Boris Brezillon wrote:
> Right now, the DRM panel logic returns NULL when a panel pointing to
> the passed OF node is not present in the list of registered panels.
>=20
> Most drivers interpret this NULL value as -EPROBE_DEFER, but we are
> about to modify the semantic of of_drm_find_panel() and let the
> framework return -ENODEV when the device node we're pointing to has
> a status property that is not equal to "okay" or "ok".
>=20
> Let's first patch the of_drm_find_panel() implementation to return
> ERR_PTR(-EPROBE_DEFER) instead of NULL and patch all callers to replace
> the '!panel' check by an 'IS_ERR(panel)' one.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/cdns-dsi.c                   |  2 +-
>  drivers/gpu/drm/bridge/lvds-encoder.c               |  4 ++--
>  drivers/gpu/drm/drm_of.c                            |  8 ++++++--
>  drivers/gpu/drm/drm_panel.c                         |  6 ++++--
>  drivers/gpu/drm/exynos/exynos_dp.c                  |  9 ++++++---
>  drivers/gpu/drm/exynos/exynos_drm_dpi.c             |  9 ++++++---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c             |  6 ++++--
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c           |  8 +++++---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c   |  4 ++--
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c | 10 +++++++---
>  drivers/gpu/drm/msm/dsi/dsi_host.c                  |  2 +-
>  drivers/gpu/drm/rcar-du/rcar_lvds.c                 |  9 ++++++---
>  drivers/gpu/drm/rockchip/dw-mipi-dsi.c              |  2 +-
>  drivers/gpu/drm/sti/sti_dvo.c                       |  7 +++++--
>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c              |  4 ++--
>  drivers/gpu/drm/tegra/dsi.c                         |  6 ++++--
>  drivers/gpu/drm/tegra/output.c                      | 18 +++++++++++----=
---
>  include/drm/drm_panel.h                             |  2 +-
>  18 files changed, 74 insertions(+), 42 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/bridge/c=
dns-dsi.c
> index c255fc3e1be5..2c5991cf5397 100644
> --- a/drivers/gpu/drm/bridge/cdns-dsi.c
> +++ b/drivers/gpu/drm/bridge/cdns-dsi.c
> @@ -1152,7 +1152,7 @@ static int cdns_dsi_attach(struct mipi_dsi_host *ho=
st,
>  		np =3D of_node_get(dev->dev.of_node);
> =20
>  	panel =3D of_drm_find_panel(np);
> -	if (panel) {
> +	if (!IS_ERR(panel)) {
>  		bridge =3D drm_panel_bridge_add(panel, DRM_MODE_CONNECTOR_DSI);
>  	} else {
>  		bridge =3D of_drm_find_bridge(dev->dev.of_node);
> diff --git a/drivers/gpu/drm/bridge/lvds-encoder.c b/drivers/gpu/drm/brid=
ge/lvds-encoder.c
> index 75b0d3f6e4de..f56c92f7af7c 100644
> --- a/drivers/gpu/drm/bridge/lvds-encoder.c
> +++ b/drivers/gpu/drm/bridge/lvds-encoder.c
> @@ -68,9 +68,9 @@ static int lvds_encoder_probe(struct platform_device *p=
dev)
> =20
>  	panel =3D of_drm_find_panel(panel_node);
>  	of_node_put(panel_node);
> -	if (!panel) {
> +	if (IS_ERR(panel)) {
>  		dev_dbg(&pdev->dev, "panel not found, deferring probe\n");
> -		return -EPROBE_DEFER;
> +		return PTR_ERR(panel);
>  	}
> =20
>  	lvds_encoder->panel_bridge =3D
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index 1fe122461298..f413fae6f6dc 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -239,9 +239,13 @@ int drm_of_find_panel_or_bridge(const struct device_=
node *np,
>  		return -ENODEV;
> =20
>  	if (panel) {
> -		*panel =3D of_drm_find_panel(remote);
> -		if (*panel)
> +		struct drm_panel *tmp_panel;
> +
> +		tmp_panel =3D of_drm_find_panel(remote);
> +		if (!IS_ERR(tmp_panel)) {
> +			*panel =3D tmp_panel;
>  			ret =3D 0;
> +		}

I think the introduction of this temporary variable makes the code hard
to read and the diff difficult to understand. Why not just stick with
the original style and make this:

		*panel =3D of_drm_find_panel(remote);
		if (IS_ERR(*panel))
			*panel =3D NULL;
		else
			ret =3D 0;

?

>  	}
> =20
>  	/* No panel found yet, check for a bridge next. */
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index 308d442a531b..2d9e2684c6c8 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -135,7 +135,9 @@ EXPORT_SYMBOL(drm_panel_detach);
>   * tree node. If a matching panel is found, return a pointer to it.
>   *
>   * Return: A pointer to the panel registered for the specified device tr=
ee
> - * node or NULL if no panel matching the device tree node can be found.
> + * node or an ERR_PTR() if no panel matching the device tree node can be=
 found.
> + * The only error that can be reported is -EPROBE_DEFER, meaning that th=
e panel
> + * device has not been probed yet, and the caller should re-retry later.

I think you can drop the extra re- from re-retry.

>   */
>  struct drm_panel *of_drm_find_panel(const struct device_node *np)
>  {
> @@ -151,7 +153,7 @@ struct drm_panel *of_drm_find_panel(const struct devi=
ce_node *np)
>  	}
> =20
>  	mutex_unlock(&panel_lock);
> -	return NULL;
> +	return ERR_PTR(-EPROBE_DEFER);
>  }
>  EXPORT_SYMBOL(of_drm_find_panel);
>  #endif
> diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/=
exynos_dp.c
> index 86330f396784..962cad0276e5 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp.c
> @@ -231,10 +231,13 @@ static int exynos_dp_probe(struct platform_device *=
pdev)
>  	/* This is for the backward compatibility. */
>  	np =3D of_parse_phandle(dev->of_node, "panel", 0);
>  	if (np) {
> -		dp->plat_data.panel =3D of_drm_find_panel(np);
> +		struct drm_panel *panel =3D of_drm_find_panel(np);
> +
>  		of_node_put(np);
> -		if (!dp->plat_data.panel)
> -			return -EPROBE_DEFER;
> +		if (IS_ERR(panel))
> +			return PTR_ERR(panel);

I don't see the point in the extra variable here. dp is allocated using
devm_kzalloc(), so it will go away on the error return. You shouldn't
need to worry about keeping the dp->plat_data.panel untouched in case of
error.

> +
> +		dp->plat_data.panel =3D panel;
>  		goto out;
>  	}
> =20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_dpi.c
> index 66945e0dc57f..e9c7d1c1cf8f 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
> @@ -239,9 +239,12 @@ struct drm_encoder *exynos_dpi_probe(struct device *=
dev)
>  	}
> =20
>  	if (ctx->panel_node) {
> -		ctx->panel =3D of_drm_find_panel(ctx->panel_node);
> -		if (!ctx->panel)
> -			return ERR_PTR(-EPROBE_DEFER);
> +		struct drm_panel *panel =3D of_drm_find_panel(ctx->panel_node);
> +
> +		if (IS_ERR(panel))
> +			return ERR_CAST(panel);
> +
> +		ctx->panel =3D panel;

Same here.

>  	}
> =20
>  	return &ctx->encoder;
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_dsi.c
> index 7904ffa9abfb..96206deb86a0 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1520,6 +1520,7 @@ static int exynos_dsi_host_attach(struct mipi_dsi_h=
ost *host,
>  {
>  	struct exynos_dsi *dsi =3D host_to_dsi(host);
>  	struct drm_device *drm =3D dsi->connector.dev;
> +	struct drm_panel *panel;
> =20
>  	/*
>  	 * This is a temporary solution and should be made by more generic way.
> @@ -1538,8 +1539,9 @@ static int exynos_dsi_host_attach(struct mipi_dsi_h=
ost *host,
>  	dsi->lanes =3D device->lanes;
>  	dsi->format =3D device->format;
>  	dsi->mode_flags =3D device->mode_flags;
> -	dsi->panel =3D of_drm_find_panel(device->dev.of_node);
> -	if (dsi->panel) {
> +	panel =3D of_drm_find_panel(device->dev.of_node);
> +	if (!IS_ERR(panel)) {
> +		dsi->panel =3D panel;
>  		drm_panel_attach(dsi->panel, &dsi->connector);
>  		dsi->connector.status =3D connector_status_connected;
>  	}

It seems to be a potential problem here if dsi->panel is an ERR_PTR()-
encoded value, but I still think this becomes clearer if you do:

	dsi->panel =3D of_drm_find_panel(...);
	if (!IS_ERR(dsi->panel)) {
		...
	} else {
		dsi->panel =3D NULL;
	}

Or maybe even:

	dsi->panel =3D of_drm_find_panel(...);
	if (IS_ERR(dsi->panel))
		dsi->panel =3D NULL;

	if (dsi->panel) {
	}

That's more explicitly saying that the panel support is optional.

> diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c b/drivers/gpu/drm/=
fsl-dcu/fsl_dcu_drm_rgb.c
> index c54806d08dd7..7753b3093472 100644
> --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
> +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c
> @@ -146,10 +146,12 @@ int fsl_dcu_create_outputs(struct fsl_dcu_drm_devic=
e *fsl_dev)
>  	/* This is for backward compatibility */
>  	panel_node =3D of_parse_phandle(fsl_dev->np, "fsl,panel", 0);
>  	if (panel_node) {
> -		fsl_dev->connector.panel =3D of_drm_find_panel(panel_node);
> +		panel =3D of_drm_find_panel(panel_node);
>  		of_node_put(panel_node);
> -		if (!fsl_dev->connector.panel)
> -			return -EPROBE_DEFER;
> +		if (IS_ERR(panel))
> +			return PTR_ERR(panel);
> +
> +		fsl_dev->connector.panel =3D panel;

Same here, fsl_dev goes away after the error return.

>  		return fsl_dcu_attach_panel(fsl_dev, fsl_dev->connector.panel);
>  	}
> =20
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/=
gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> index 4a645926edb7..2bfb39082f54 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> @@ -341,7 +341,7 @@ static void mdp4_lcdc_encoder_disable(struct drm_enco=
der *encoder)
>  	mdp4_write(mdp4_kms, REG_MDP4_LCDC_ENABLE, 0);
> =20
>  	panel =3D of_drm_find_panel(mdp4_lcdc_encoder->panel_node);
> -	if (panel) {
> +	if (!IS_ERR(panel)) {
>  		drm_panel_disable(panel);
>  		drm_panel_unprepare(panel);
>  	}
> @@ -410,7 +410,7 @@ static void mdp4_lcdc_encoder_enable(struct drm_encod=
er *encoder)
>  		dev_err(dev->dev, "failed to enable lcdc_clk: %d\n", ret);
> =20
>  	panel =3D of_drm_find_panel(mdp4_lcdc_encoder->panel_node);
> -	if (panel) {
> +	if (!IS_ERR(panel)) {
>  		drm_panel_prepare(panel);
>  		drm_panel_enable(panel);
>  	}
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c b/driver=
s/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
> index e3b1c86b7aae..c7dd72b428f8 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
> @@ -34,9 +34,13 @@ static enum drm_connector_status mdp4_lvds_connector_d=
etect(
>  	struct mdp4_lvds_connector *mdp4_lvds_connector =3D
>  			to_mdp4_lvds_connector(connector);
> =20
> -	if (!mdp4_lvds_connector->panel)
> -		mdp4_lvds_connector->panel =3D
> -			of_drm_find_panel(mdp4_lvds_connector->panel_node);
> +	if (!mdp4_lvds_connector->panel) {
> +		struct drm_panel *panel;
> +
> +		panel =3D of_drm_find_panel(mdp4_lvds_connector->panel_node);
> +		if (!IS_ERR(panel))
> +			mdp4_lvds_connector->panel =3D panel;
> +	}

Huh... this is hacky to begin with. Seems like this driver doesn't care
about waiting for the panel, it'll just retry probing the panel
everytime ->detect() is called on the connector until the panel has
shown up. That's not really how this is supposed to work, but it's been
there before your patch, so should be addressed separately.

> =20
>  	return mdp4_lvds_connector->panel ?
>  			connector_status_connected :
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi=
/dsi_host.c
> index 7a03a9489708..fffc80b73966 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1881,7 +1881,7 @@ int msm_dsi_host_register(struct mipi_dsi_host *hos=
t, bool check_defer)
>  		 * output
>  		 */
>  		if (check_defer && msm_host->device_node) {
> -			if (!of_drm_find_panel(msm_host->device_node))
> +			if (IS_ERR(of_drm_find_panel(msm_host->device_node)))
>  				if (!of_drm_find_bridge(msm_host->device_node))
>  					return -EPROBE_DEFER;
>  		}

Again, pretty weird stuff going on here, prior to the patch. But I think
this needs to be changed to take the -ENODEV into account in the next
patch. As it is, this will continue to defer probe even if the panel
node is disabled.

> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-d=
u/rcar_lvds.c
> index 3d2d3bbd1342..d77b8f8bcf94 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -430,9 +430,12 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
>  		if (!lvds->next_bridge)
>  			ret =3D -EPROBE_DEFER;
>  	} else {
> -		lvds->panel =3D of_drm_find_panel(remote);
> -		if (!lvds->panel)
> -			ret =3D -EPROBE_DEFER;
> +		struct drm_panel *panel =3D of_drm_find_panel(remote);
> +
> +		if (IS_ERR(panel))
> +			ret =3D PTR_ERR(panel);
> +		else
> +			lvds->panel =3D panel;
>  	}

Similar to others above, I think this can easily be done without the
extra temporary variable.

> =20
>  done:
> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi.c b/drivers/gpu/drm/roc=
kchip/dw-mipi-dsi.c
> index d53d5a09547f..01642aaf6127 100644
> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi.c
> @@ -595,7 +595,7 @@ static int dw_mipi_dsi_host_attach(struct mipi_dsi_ho=
st *host,
>  	dsi->format =3D device->format;
>  	dsi->mode_flags =3D device->mode_flags;
>  	dsi->panel =3D of_drm_find_panel(device->dev.of_node);
> -	if (dsi->panel)
> +	if (!IS_ERR(dsi->panel))
>  		return drm_panel_attach(dsi->panel, &dsi->connector);
> =20
>  	return -EINVAL;
> diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
> index a5979cd25cc7..3579c0e1ca1c 100644
> --- a/drivers/gpu/drm/sti/sti_dvo.c
> +++ b/drivers/gpu/drm/sti/sti_dvo.c
> @@ -386,9 +386,12 @@ sti_dvo_connector_detect(struct drm_connector *conne=
ctor, bool force)
>  	DRM_DEBUG_DRIVER("\n");
> =20
>  	if (!dvo->panel) {
> -		dvo->panel =3D of_drm_find_panel(dvo->panel_node);
> -		if (dvo->panel)
> +		struct drm_panel *panel =3D of_drm_find_panel(dvo->panel_node);
> +
> +		if (!IS_ERR(panel)) {
> +			dvo->panel =3D panel;
>  			drm_panel_attach(dvo->panel, connector);
> +		}
>  	}

Same here.

> =20
>  	if (dvo->panel)
> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun=
4i/sun6i_mipi_dsi.c
> index bfbf761f0c1d..ce388d7cebaa 100644
> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> @@ -812,8 +812,8 @@ static int sun6i_dsi_attach(struct mipi_dsi_host *hos=
t,
> =20
>  	dsi->device =3D device;
>  	dsi->panel =3D of_drm_find_panel(device->dev.of_node);
> -	if (!dsi->panel)
> -		return -EINVAL;
> +	if (IS_ERR(dsi->panel))
> +		return PTR_ERR(dsi->panel);
> =20
>  	dev_info(host->dev, "Attached device %s\n", device->name);
> =20
> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> index 87c5d89bc9ba..0b1eee4b2fb1 100644
> --- a/drivers/gpu/drm/tegra/dsi.c
> +++ b/drivers/gpu/drm/tegra/dsi.c
> @@ -1409,9 +1409,11 @@ static int tegra_dsi_host_attach(struct mipi_dsi_h=
ost *host,
>  	 */
>  	if (!dsi->master) {
>  		struct tegra_output *output =3D &dsi->output;
> +		struct drm_panel *panel;
> =20
> -		output->panel =3D of_drm_find_panel(device->dev.of_node);
> -		if (output->panel && output->connector.dev) {
> +		panel =3D of_drm_find_panel(device->dev.of_node);
> +		if (!IS_ERR(panel) && output->connector.dev) {
> +			output->panel =3D panel;

And here.

>  			drm_panel_attach(output->panel, &output->connector);
>  			drm_helper_hpd_irq_event(output->connector.dev);
>  		}
> diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/outpu=
t.c
> index 676fd394836f..21d8737f8b49 100644
> --- a/drivers/gpu/drm/tegra/output.c
> +++ b/drivers/gpu/drm/tegra/output.c
> @@ -101,18 +101,22 @@ static irqreturn_t hpd_irq(int irq, void *data)
> =20
>  int tegra_output_probe(struct tegra_output *output)
>  {
> -	struct device_node *ddc, *panel;
> +	struct device_node *ddc, *panelnp;
>  	int err, size;
> =20
>  	if (!output->of_node)
>  		output->of_node =3D output->dev->of_node;
> =20
> -	panel =3D of_parse_phandle(output->of_node, "nvidia,panel", 0);
> -	if (panel) {
> -		output->panel =3D of_drm_find_panel(panel);
> -		of_node_put(panel);
> -		if (!output->panel)
> -			return -EPROBE_DEFER;
> +	panelnp =3D of_parse_phandle(output->of_node, "nvidia,panel", 0);
> +	if (panelnp) {
> +		struct drm_panel *panel =3D of_drm_find_panel(panelnp);
> +
> +		of_node_put(panelnp);
> +
> +		if (IS_ERR(panel))
> +			return PTR_ERR(panel);
> +
> +		output->panel =3D panel;
>  	}

And here.

>  	output->edid =3D of_get_property(output->of_node, "nvidia,edid", &size);
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index 14ac240a1f64..3bb91519462e 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -199,7 +199,7 @@ struct drm_panel *of_drm_find_panel(const struct devi=
ce_node *np);
>  #else
>  static inline struct drm_panel *of_drm_find_panel(const struct device_no=
de *np)
>  {
> -	return NULL;
> +	return ERR_PTR(-ENOTSUPP);
>  }
>  #endif

Maybe make this return ERR_PTR(-ENODEV) for consistency with the real
function? If we absolutely do need to differentiate, then you should
probably update the kerneldoc for of_drm_find_panel() to mention the
-ENOTSUPP case.

Thierry

--4eRLI4hEmsdu6Npr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlrsM4oACgkQ3SOs138+
s6G9lg/+O/ab8tys0+9mufXywwjzDpQDarwEBHEZ393D+55V5ItH5vw9AgZq5Ice
zedRNV7IHyw6SQt509vaJQmAqswtbl7tuPDoS7dVUMCzEre90ltPUBeZ3OX/+2zv
o7+F/pPUcYqy/mpL2Po2WAGYtsjJedXtTvBLz/zJ9D43vcePPrTXYMcCxHk16un0
Fl3NT1GlMrtrBdm78Wi1GzU5oUnJdOtXYPLe90lKv/UzkdwBhCNi3E8AybdYtYy+
iXUdcgCqCDkwEyTZYHau2zdCu2KJFHIyh/stm+LDx6+BKhamwb2q+t/UKHTNWG9m
Dd3l2nrlWwb99E6C2Uhu0Fl5IQVHhWVFx75xFiaZb+AKa2WG2N+UtfOzM4eLk6Zn
Z4uS3PHEWqyheEFUNVKi4ctr2mEPtZTzABA60qPTxXSeVgqhUAU0x+Cd6ob5vRNq
rNHmod4ix/XW3nqfRTxUXHGhhgNXeJE2zz89riL/1o5aJTixJBwsVyIaTzpZHiNN
TGlLMqVQUiQRwdoapGoTJo/cBOPFFf/rVpaXyjt/xhnXJnJ2QwT1icY99mW33iZw
w1pZaY68kCr7cV5OUXncM7j91h9TNrAoigkbeTY9neXq8U49vYeww4twhkaOy6qu
aYr4VsUt622LMUP+OswKas39MVj4a50FPUCdyKPw40UMXRDDrhg=
=hDli
-----END PGP SIGNATURE-----

--4eRLI4hEmsdu6Npr--

--===============2145807850==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2145807850==--
