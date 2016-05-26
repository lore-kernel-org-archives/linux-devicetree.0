From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 13/20] drm/bridge: Add RGB to VGA bridge support
Date: Thu, 26 May 2016 10:53:30 +0200
Message-ID: <20160526085330.GM9232@lukather>
References: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
 <1463402840-17062-14-git-send-email-maxime.ripard@free-electrons.com>
 <1773896.kpi58ilqqm@avalon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DXTueXWT3Da08pik"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1773896.kpi58ilqqm@avalon>
Sender: linux-clk-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Boris Brezillon <boris.brezillon@free-electrons.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--DXTueXWT3Da08pik
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Mon, May 16, 2016 at 04:24:15PM +0300, Laurent Pinchart wrote:
> Hi Maxime,
>=20
> Thank you for the patch.
>=20
> On Monday 16 May 2016 14:47:13 Maxime Ripard wrote:
> > Some boards have an entirely passive RGB to VGA bridge, based on either
> > DACs or resistor ladders.
> >=20
> > Those might or might not have an i2c bus routed to the VGA connector in
> > order to access the screen EDIDs.
> >=20
> > Add a bridge that doesn't do anything but expose the modes available on=
 the
> > screen, either based on the EDIDs if available, or based on the XGA
> > standards.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > ---
> >  .../bindings/display/bridge/dumb-vga.txt           |  40 +++++
> >  drivers/gpu/drm/bridge/Kconfig                     |   6 +
> >  drivers/gpu/drm/bridge/Makefile                    |   1 +
> >  drivers/gpu/drm/bridge/dumb-vga.c                  | 186 +++++++++++++=
+++++
> >  4 files changed, 233 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/bridge/dumb-vga.txt create mo=
de
> > 100644 drivers/gpu/drm/bridge/dumb-vga.c
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/bridge/dumb-vga.=
txt
> > b/Documentation/devicetree/bindings/display/bridge/dumb-vga.txt new file
> > mode 100644
> > index 000000000000..757f04de97f3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/dumb-vga.txt
> > @@ -0,0 +1,40 @@
> > +Passive RGB to VGA bridge
> > +-------------------------
> > +
> > +This binding is aimed for entirely passive RGB to VGA bridges that do =
not
> > +require any configuration.
> > +
> > +Required properties:
> > +
> > +- compatible: Should be "dumb-vga-bridge"
> > +
> > +Optional properties:
> > +
> > +- ddc-i2c-bus: phandle to the i2c bus used to communicate with the mon=
itor
> > +
> > +Required nodes:
> > +
> > +This device has one video port. Its connection is modelled using the OF
> > +graph bindings specified in Documentation/devicetree/bindings/graph.tx=
t.
> > This +connection is meant to be the RGB input bus.
>=20
> Should the bridge have two ports, one input port connected to a display e=
ngine=20
> and one output port connected to a VGA connector ?

And a separate node for the VGA connector? As far as I can see, all
the other bridges are represented using a single node.

> +static int dumb_vga_get_modes(struct drm_connector *connector)
> > +{
> > +	struct dumb_vga *vga =3D drm_connector_to_dumb_vga(connector);
> > +	struct edid *edid;
> > +	int ret;
> > +
> > +	if (!vga->ddc)
> > +		goto fallback;
> > +
> > +	edid =3D drm_get_edid(connector, vga->ddc);
> > +	if (!edid) {
> > +		DRM_INFO("EDID readout failed, falling back to standard modes\n");
> > +		goto fallback;
> > +	}
> > +
> > +	drm_mode_connector_update_edid_property(connector, edid);
> > +	return drm_add_edid_modes(connector, edid);
> > +
> > +fallback:
> > +	/*
> > +	 * In case we cannot retrieve the EDIDs (broken or missing i2c
> > +	 * bus), fallback on the XGA standards
> > +	 */
> > +	ret =3D drm_add_modes_noedid(connector, 1920, 1200);
>=20
> The DRM core adds modes up to 1024x768 in=20
> drm_helper_probe_single_connector_modes(). I wonder if it really makes se=
nse=20
> to override that in drivers, compared to increasing the maximum resolutio=
n in=20
> the core. What we can reasonable expect from a VGA monitor doesn't really=
=20
> depend on which display engine it is connected to.

Actually, I would expect it to come from the connectors. Nowadays, the
core add modes that might not even be relevant at all for a given
connector. Take TV as an example, there's not a single TV output that
can reach 1024x768, but actually rely on very different resolutions.

>=20
> > +	/* And prefer a mode pretty much anyone can handle */
> > +	drm_set_preferred_mode(connector, 1024, 768);
> > +
> > +	return ret;
> > +}
> > +
> > +static struct drm_encoder *
> > +dumb_vga_best_encoder(struct drm_connector *connector)
> > +{
> > +	struct dumb_vga *vga =3D drm_connector_to_dumb_vga(connector);
> > +
> > +	return vga->bridge.encoder;
> > +}
> > +
> > +static struct drm_connector_helper_funcs dumb_vga_con_helper_funcs =3D=
 {
> > +	.get_modes	=3D dumb_vga_get_modes,
> > +	.best_encoder	=3D dumb_vga_best_encoder,
> > +};
> > +
> > +static enum drm_connector_status
> > +dumb_vga_connector_detect(struct drm_connector *connector, bool force)
> > +{
> > +	return connector_status_connected;
>=20
> Shouldn't that be connector_status_unknown if you have no information abo=
ut=20
> the connection status ?

Probably :)

What are the side effects from such a change? Does it change anything
related to how the fbdev emulation and how the rest of the display
stack detects and enables the outputs whose status are unknown?

> Would it make sense to add an optional GPIO-based connection detection to=
 this=20
> driver ?

I asked for it in our prototypes, and apparently, doing VGA cable
detection is really non-trivial, so I don't really expect it to be
found in a lot of designs.

I looked at three different designs done by different vendors, and
none of them have it, so I don't really expect anyone to have it, nor
do I have any hardware to test the code with. However, if there's an
i2c bus, we can always try to probe for the edid, and see if we have
an error. If there's none, then we know something is connected. If
there's an error, we can return connector_status_unknown.

On a set of three samples, only one has that i2c bus, so it might be
just a marginal improvement, but still.


> > +}
> > +
> > +static void
> > +dumb_vga_connector_destroy(struct drm_connector *connector)
> > +{
> > +	drm_connector_cleanup(connector);
> > +}
> > +
> > +static struct drm_connector_funcs dumb_vga_con_funcs =3D {
> > +	.dpms			=3D drm_atomic_helper_connector_dpms,
> > +	.detect			=3D dumb_vga_connector_detect,
> > +	.fill_modes		=3D drm_helper_probe_single_connector_modes,
> > +	.destroy		=3D dumb_vga_connector_destroy,
> > +	.reset			=3D drm_atomic_helper_connector_reset,
> > +	.atomic_duplicate_state	=3D drm_atomic_helper_connector_duplicate_sta=
te,
> > +	.atomic_destroy_state	=3D drm_atomic_helper_connector_destroy_state,
> > +};
> > +
> > +static int dumb_vga_attach(struct drm_bridge *bridge)
> > +{
> > +	struct dumb_vga *vga =3D drm_bridge_to_dumb_vga(bridge);
> > +	int ret;
> > +
> > +	if (!bridge->encoder) {
> > +		DRM_ERROR("Missing encoder\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	drm_connector_helper_add(&vga->connector,
> > +				 &dumb_vga_con_helper_funcs);
> > +	ret =3D drm_connector_init(bridge->dev, &vga->connector,
> > +				 &dumb_vga_con_funcs, DRM_MODE_CONNECTOR_VGA);
> > +	if (ret) {
> > +		DRM_ERROR("Failed to initialize connector\n");
> > +		return ret;
> > +	}
> > +
> > +	drm_mode_connector_attach_encoder(&vga->connector,
> > +					  bridge->encoder);
> > +
> > +	return 0;
> > +}
> > +
> > +static void dumb_vga_nop(struct drm_bridge *bridge) {};
> > +
> > +static struct drm_bridge_funcs dumb_vga_bridge_funcs =3D {
> > +	.attach		=3D dumb_vga_attach,
> > +	.enable		=3D dumb_vga_nop,
> > +	.disable	=3D dumb_vga_nop,
> > +	.pre_enable	=3D dumb_vga_nop,
> > +	.post_disable	=3D dumb_vga_nop,
> > +};
> > +
> > +static int dumb_vga_probe(struct platform_device *pdev)
> > +{
> > +	struct dumb_vga *vga;
> > +	struct device_node *ddc;
> > +
> > +	vga =3D devm_kzalloc(&pdev->dev, sizeof(*vga), GFP_KERNEL);
> > +	if (!vga)
> > +		return -ENOMEM;
> > +	platform_set_drvdata(pdev, vga);
> > +
> > +	ddc =3D of_parse_phandle(pdev->dev.of_node, "ddc-i2c-bus", 0);
> > +	if (ddc) {
> > +		vga->ddc =3D of_find_i2c_adapter_by_node(ddc);
>=20
> You're leaking the reference to the I2C adapter.
>=20
> Also, shouldn't you use of_get_i2c_adapter_by_node() ? Otherwise you won'=
t=20
> take a reference to the adapter module.

Indeed, I'll fix it.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--DXTueXWT3Da08pik
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXRrmKAAoJEBx+YmzsjxAg+aQQAJXNHOIsVX6y7LWeEL+OtLJb
0RUycLq0vKl3ozbHjew7ZamEH9ycPdXVcqp1HeHugsh7veJWiWyIUWYvv1cO1kpZ
VW8PAfvJEQSsn3PCUDTrYj+cBAxnyD4hjqD27OXfX5XyzPfotg7P58Imb1VDG3w1
pyNXiZaJ4vnIjT8yks7PY+VQ89JKdtPaHyvZZGG6kSt2TqDTUjHwFduSKarqvlLU
XWsotCksCHTOLIm6m78lZku//CS3lBSwsPeGCCfqn8AbiarTG/N8q/owviBVEi6P
7cPMt+tnE8kh5YedC1T0u7LrINkFWqCcWw/k/dkaihsOIPZlhIcx16Jzmr8GLFSr
4gm5Cmu3Watca5fF+yFxAodfYcxpl8ymkz/qFSHKtYsyf4X4cAlYGIrmousiN26I
8FNNU8kEKBZJ+Ay5nCoNiSwzwKy5EgiZ73uUI8qcuIBB8gtsrzqebq2+XuJT5VV8
TsWbVIKkNlLRZk7XicbLTe+Mj1EJdKj/l2xlUMS58/wEBFAnM3FCq63fmaNNONr0
upZ9+XEB5SZmaITeVOlj/unD5wMEpwqta0W+23lEX8M1GNpf5znEN9+e4xpHawRW
RoTbBw8a1oY80qAWlLLk/6sqGP3pIoRuf1kcCWwHIqj07ziiHAZcbBOUXhTm+wi2
N2uJmdQW1mFqfabhiB+v
=N4d8
-----END PGP SIGNATURE-----

--DXTueXWT3Da08pik--
