From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: ARM topic: Is DT on ARM the solution, or is there something
 better?
Date: Mon, 18 Nov 2013 16:37:51 +0100
Message-ID: <20131118153750.GM26046@ulmo.nvidia.com>
References: <52644A9E.3060007@wwwdotorg.org>
 <20131020231134.GR25034@n2100.arm.linux.org.uk>
 <20131021083242.GB30088@pengutronix.de>
 <20131021084854.GV25034@n2100.arm.linux.org.uk>
 <20131021092730.GF30088@pengutronix.de>
 <CAF6AEGtt_2sStiZCNBp9btxevWghSwLZZBdN6ir8eUpX1FXrCQ@mail.gmail.com>
 <20131024072811.GS30088@pengutronix.de>
 <CAF6AEGuEho9Ms7ifTE-EmBoQ-=_AXgvGcJxi5qEC0vsZ+H9C+A@mail.gmail.com>
 <20131118124518.GA16735@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="um2V5WpqCyd73IVb"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131118124518.GA16735-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--um2V5WpqCyd73IVb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2013 at 12:45:19PM +0000, Russell King - ARM Linux wrote:
> On Thu, Oct 24, 2013 at 05:21:54PM -0400, Rob Clark wrote:
> > ahh, ok.  Yeah, we do need some way to make this easier, as it is a
> > too-common pattern.  I do think we do need a way to know if something
> > is missing because it isn't there vs it hasn't been probed yet.  Ie.
> > late_initcall() is not the awesome solution.
>=20
> On this topic, I now have a solution to this which is not DRM specific,
> nor is it DT specific.
>=20
> It's a core piece of code which gathers up the struct device pointers,
> and a callback for the master device to assemble the components and
> indicate when the master is complete.
>=20
> Here's an example:
>=20
>         imx-drm {
>                 compatible =3D "fsl,drm";
>                 /* Both CRTCs (can't specify which here) */
>                 crtcs =3D <&ipu1>, <&ipu1>;
>                 connectors =3D <&hdmi>;
>         };
>=20
> &hdmi {
>         pinctrl-names =3D "default";
>         pinctrl-0 =3D <&pinctrl_carrier1_hdmi>;
>         ddc =3D <&i2c2>;
>         status =3D "okay";
>         crtcs =3D <&ipu1 0>;
> };
>=20
> The HDMI driver's probe and remove functions look like this:
>=20
> static int imx_hdmi_platform_probe(struct platform_device *pdev)
> {
>         return component_add(&pdev->dev, &hdmi_ops);
> }
>=20
> static int imx_hdmi_platform_remove(struct platform_device *pdev)
> {
>         component_del(&pdev->dev, &hdmi_ops);
>         return 0;
> }
>=20
> These register the device into the component layer, with a set of
> operations for binding and unbinding the device.
>=20
> The master device (imx-drm) does this:
>=20
> static const struct component_master_ops imx_drm_ops =3D {
>         .add_components =3D imx_drm_add_components,
>         .bind =3D imx_drm_bind,
>         .unbind =3D imx_drm_unbind,
> };
>=20
> static int imx_drm_platform_probe(struct platform_device *pdev)
> {
>         return component_master_add(&pdev->dev, &imx_drm_ops);
> }
>=20
> static int imx_drm_platform_remove(struct platform_device *pdev)
> {
>         component_master_del(&pdev->dev, &imx_drm_ops);
>         return 0;
> }
>=20
> so registering the master device.  imx_drm_add_components() gets called
> whenever something gets added, and this function is responsible for
> assembling the registered components and indicating when the master is
> complete:
>=20
> static int imx_drm_add_components(struct device *master, struct master *m)
> {
>         struct device_node *np =3D master->of_node;
>         unsigned i;
>         int ret;
>=20
>         for (i =3D 0; ; i++) {
>                 struct device_node *node;
>=20
>                 node =3D of_parse_phandle(np, "crtcs", i);
>                 if (!node)
>                         break;
>=20
>                 ret =3D component_master_add_child(m, compare_parent_of, =
node);
>                 of_node_put(node);
>=20
>                 if (ret)
>                         return ret;
>         }
>=20
>         for (i =3D 0; ; i++) {
>                 struct device_node *node;
>=20
>                 node =3D of_parse_phandle(np, "connectors", i);
>                 if (!node)
>                         break;
>=20
>                 ret =3D component_master_add_child(m, compare_of, node);
>                 of_node_put(node);
>=20
>                 if (ret)
>                         return ret;
>         }
>         return 0;
> }
>=20
> When it is complete (iow, this function returns zero), the master is
> bound:
>=20
> static int imx_drm_bind(struct device *dev)
> {
>         return drm_platform_init(&imx_drm_driver, to_platform_device(dev)=
);
> }
>=20
> This causes DRM to start the construction of a drm_device, and call the
> load callback.  In the load callback:
>=20
>         /* Now try and bind all our sub-components */
>         ret =3D component_bind_all(drm->dev, drm);
>         if (ret)
>                 goto err;
>=20
> which binds the previously assembled components, with the drm_device
> structure as their data - that's drm above:
>=20
> static int imx_hdmi_bind(struct device *dev, struct device *master, void =
*data)
> {
>         struct platform_device *pdev =3D to_platform_device(dev);
>         const struct of_device_id *of_id =3D
>                                 of_match_device(imx_hdmi_dt_ids, dev);
>         struct drm_device *drm =3D data;
> ...
> }
>=20
> This allows the HDMI driver to register with DRM using the passed
> struct drm_device pointer.  Other connectors do the same at this moment,
> CRTCs also use this same mechanism, but with a higher priority, so CRTCs
> get registered before connectors.
>=20
> Teardown is similar to the above, but it happens in reverse order: when
> any bound component or the master goes away, the master DRM device is
> unbound, which triggers DRM to call the unload callback.
>=20
> The unload callback unbinds the components, which triggers an unbind
> call to each component in reverse order.
>=20
> As I say, nothing in the above is specific to DRM; this can be re-used
> by any subsystem.  It can also be re-used by non-DT setups as well via
> appropriate .add_components callback and appropriate component matching
> functions.
>=20
> This addresses the componentised device problem in a completely generic
> way.

Very nice. This is in fact very similar to a skeleton I started to
implement locally. The names vary to some degree, but the general
approach is the same.

This also happens to be very similar to what Tegra DRM does, just as a
set of helpers rather than a bus type. I like it a lot.

In particular this gives every driver a good amount of flexibility to
implement the matching in a way that's appropriate. On hardware where
the relationships are hierarchical, a driver can use that to its
advantage. Whenever that's not possible it can be done using phandles
or any other meta data that fits the particular use-case.

Do you have a branch somewhere that I could use to test this with?

Thierry

--um2V5WpqCyd73IVb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSijROAAoJEN0jrNd/PrOhe1AP/iiP7n46LF9MdN0FEVl/QNq5
Pjb9P0QRa/vuuQTJycO5p67yX17jUm9UJFiO1UHCHHaEV2yFN2osRhL+QMXjzmZo
Z2XEd/DwKKoykg9EmxOaj178kPscgDYNXaJI3zJ39lWVHPXet9iD4edvDyypGEN8
JmImjppZTYfU79Y5hYTSUTRee8B6Lu/1p2ymuMPqyboGEAnDc8R90ErNS/yK0Euc
iznJsE9teCACR9F3g1jj49J73jSG9+fWXI7N2FAKBcbHWzp6gmYdDRaKCBEL+SsJ
LUjrrVLQiOVt0Wn1WptA11tiTAfJJdFT4iijn1hTg5zRLlI0zshcEJgb37HulWlu
tJOl5ByKDqD1uWWE2QagKqz+BCnXq2rckoU9qjxqRQ4pvxOT69keiC01RuEpR29x
vdH93N2P5/5nWicS05cIyaNRghaw4F5zCeuaT7UV6N0U9Ih9f3Tb81SI7giCcZbN
53oAFqrJCnjUDyJDP4TWoZWObMoCd8ekNWvbk+DW9JpA+K1CkEENoVo5StrlJRTQ
2PtEAA7+n+n4rf0Pj0UZ5PeLfmuSL9WuleN+XmnHFPKFHvhCpYmIFWV4xl26Kugw
kSy6sZjKWao31Bit5nBzIh68MlJqryyyjUNsyMZ4eaJ4fxaHVO6vUC3cE0VqbEV1
99NrooB8YiH0L7t6g6GK
=uVYN
-----END PGP SIGNATURE-----

--um2V5WpqCyd73IVb--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
