From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 15/15] drm/panel: Add Sharp LQ101R1SX01 support
Date: Fri, 31 Oct 2014 15:28:50 +0100
Message-ID: <20141031142845.GA18657@ulmo.nvidia.com>
References: <1413195395-3355-1-git-send-email-thierry.reding@gmail.com>
 <1413195395-3355-15-git-send-email-thierry.reding@gmail.com>
 <544530C9.1070105@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1349922555=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <544530C9.1070105@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org


--===============1349922555==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2014 at 05:56:57PM +0200, Andrzej Hajda wrote:
> On 10/13/2014 12:16 PM, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >
> > This panel requires dual-channel mode. The device accepts command-mode
> > data on 8 lanes and will therefore need a dual-channel DSI controller.
> > The two interfaces that make up this device need to be instantiated in
> > the controllers that gang up to provide the dual-channel DSI host.
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  .../bindings/panel/sharp,lq101r1sx01.txt           |  46 +++
> >  drivers/gpu/drm/panel/Kconfig                      |  13 +
> >  drivers/gpu/drm/panel/Makefile                     |   1 +
> >  drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c    | 426 +++++++++++++=
++++++++
> >  4 files changed, 486 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/panel/sharp,lq101=
r1sx01.txt
> >  create mode 100644 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
> >
> > diff --git a/Documentation/devicetree/bindings/panel/sharp,lq101r1sx01.=
txt b/Documentation/devicetree/bindings/panel/sharp,lq101r1sx01.txt
> > new file mode 100644
> > index 000000000000..4ab4380ddac8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/panel/sharp,lq101r1sx01.txt
> > @@ -0,0 +1,46 @@
> > +Sharp Microelectronics 10.1" WQXGA TFT LCD panel
> > +
> > +This panel requires a dual-channel DSI host to operate. It supports tw=
o modes:
> > +- left-right: each channel drives the left or right half of the screen
> > +- even-odd: each channel drives the even or odd lines of the screen
> > +
> > +Each of the DSI channels controls a separate DSI peripheral. The perip=
heral
> > +driven by the first link (DSI-LINK1), left or even, is considered the =
primary
> > +peripheral and controls the device. The 'link2' property contains a ph=
andle
> > +to the peripheral driven by the second link (DSI-LINK2, right or odd).
> > +
> > +Note that in video mode the DSI-LINK1 interface always provides the le=
ft/even
> > +pixels and DSI-LINK2 always provides the right/odd pixels. In command =
mode it
> > +is possible to program either link to drive the left/even or right/odd=
 pixels
> > +but for the sake of consistency this binding assumes that the same ass=
ignment
> > +is chosen as for video mode.
> > +
> > +Required properties:
> > +- compatible: should be "sharp,lq101r1sx01"
> > +- link2: phandle to the DSI peripheral on the secondary link. Note tha=
t the
> > +  presence of this property marks the containing node as DSI-LINK1.
> > +- power-supply: phandle of the regulator that provides the supply volt=
age
> > +
> > +Optional properties:
> > +- backlight: phandle of the backlight device attached to the panel
> > +
> > +Example:
> > +
> > +	dsi@54300000 {
> > +		panel: panel@0 {
> > +			compatible =3D "sharp,lq101r1sx01";
> > +			reg =3D <0>;
> > +
> > +			link2 =3D <&secondary>;
> > +
> > +			power-supply =3D <...>;
> > +			backlight =3D <...>;
> > +		};
> > +	};
> > +
> > +	dsi@54400000 {
> > +		secondary: panel@0 {
> > +			compatible =3D "sharp,lq101r1sx01";
> > +			reg =3D <0>;
> > +		};
> > +	};
>=20
> The example does not follow rules above, 2nd node does not contain
> required properties.
> Maybe it should be clearly stated that power-supply, link2 and backlight
> properties can
> be present only in LINK1 node; LINK2 node should contain nothing more
> than compatible and reg.

I've updated the binding documentation to clarify this.

> I guess if it wouldn't be better if different compatibles could be used
> to distinguish LINK1 and LINK2 nodes,
> this way you can provide different sets of required/optional properties
> for both nodes. As a bonus you can
> have different probe/remove/shutdown callback per link.

I think having separate compatibles isn't entirely accurate. They're
both really the same device. There's already the link2 property that
distinguishes both halves.

Having separate probe/remove/shutdown isn't something I consider a
bonus. It would mean that we need to register a second driver. That is,
the device will no longer be driven by a single driver, but rather two
drivers that then need to talk to one another again. And it's not like
there's a lot to do for DSI-LINK2 in the first place, as you point out
yourself.

I'd rather stick with just a single driver and handle the distinction
via the link2 property, which we need to get access to the second
peripheral anyway.

> > diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Mak=
efile
[...]
> > +static int sharp_panel_write(struct sharp_panel *sharp, u16 offset, u8=
 value)
> > +{
> > +	u8 payload[3] =3D { offset >> 8, offset & 0xff, value };
> > +	struct mipi_dsi_device *dsi =3D sharp->link1;
> > +	ssize_t err;
> > +
> > +	err =3D mipi_dsi_generic_write(dsi, payload, sizeof(payload));
> > +	if (err < 0)
> > +		dev_err(&dsi->dev, "failed to write %02x to %04x: %d\n",
> > +			value, offset, err);
> > +
> > +	err =3D mipi_dsi_dcs_nop(dsi);
> > +	if (err < 0)
> > +		dev_err(&dsi->dev, "failed to send DCS nop: %d\n", err);
> > +
>=20
> If mipi_dsi_generic_write fails and mipi_dsi_dcs_nop succeeds function
> return success, is it OK?

No, this should always return an error if it fails. If these writes
don't succeed the panel won't be usable anyway. Also returning an error
will actually allow us to decide what to do about the failure in the
caller, where more context exists to make a proper decision.

I've fixed this to propagate the error from mipi_dsi_generic_write() and
mipi_dsi_dcs_nop().

> > +	usleep_range(10, 20);
> > +
> > +	return err;
> > +}
> > +
> > +static __maybe_unused int sharp_panel_read(struct sharp_panel *sharp,
> > +					   u16 offset, u8 *value)
> > +{
> > +	ssize_t err;
> > +
> > +	cpu_to_be16s(&offset);
> > +
> > +	err =3D mipi_dsi_generic_read(sharp->link1, &offset, sizeof(offset),
> > +				    value, sizeof(*value));
> > +	if (err < 0)
> > +		dev_err(&sharp->link1->dev, "failed to read from %04x: %d\n",
> > +			offset, err);
> > +
> > +	return err;
> > +}
> > +
> > +static int sharp_panel_disable(struct drm_panel *panel)
> > +{
> > +	struct sharp_panel *sharp =3D to_sharp_panel(panel);
> > +
> > +	if (!sharp->enabled)
> > +		return 0;
>=20
> Shouldn't we assume disable callback can be called only on enabled panel?

That's not something the core does for us currently. We might want to
change that at some point, but until then we can simply do what all
other panels do.

> > +
> > +	if (sharp->backlight) {
> > +		sharp->backlight->props.power =3D FB_BLANK_POWERDOWN;
> > +		backlight_update_status(sharp->backlight);
> > +	}
> > +
> > +	sharp->enabled =3D false;
> > +
> > +	return 0;
> > +}
> > +
> > +static int sharp_panel_unprepare(struct drm_panel *panel)
> > +{
> > +	struct sharp_panel *sharp =3D to_sharp_panel(panel);
> > +	int err;
> > +
> > +	if (!sharp->prepared)
> > +		return 0;
>=20
> Shouldn't we assume unprepare callback can be called only on enabled pane=
l?

See above.

> > +static int sharp_setup_symmetrical_split(struct mipi_dsi_device *left,
> > +					 struct mipi_dsi_device *right,
> > +					 const struct drm_display_mode *mode)
> > +{
> > +	int err;
> > +
> > +	err =3D mipi_dsi_dcs_set_column_address(left, 0, mode->hdisplay / 2 -=
 1);
> > +	if (err < 0)
> > +		dev_err(&left->dev, "failed to set column address: %d\n", err);
> > +
> > +	err =3D mipi_dsi_dcs_set_page_address(left, 0, mode->vdisplay - 1);
> > +	if (err < 0)
> > +		dev_err(&left->dev, "failed to set page address: %d\n", err);
> > +
> > +	err =3D mipi_dsi_dcs_set_column_address(right, mode->hdisplay / 2,
> > +					      mode->hdisplay - 1);
> > +	if (err < 0)
> > +		dev_err(&right->dev, "failed to set column address: %d\n", err);
> > +
> > +	err =3D mipi_dsi_dcs_set_page_address(right, 0, mode->vdisplay - 1);
> > +	if (err < 0)
> > +		dev_err(&right->dev, "failed to set page address: %d\n", err);
> > +
> > +	return 0;
>=20
> It always returns 0, maybe it could be void?

I think this should also propagate all errors.

> > +static int sharp_panel_prepare(struct drm_panel *panel)
> > +{
[...]
> > +	sharp->prepared =3D true;
> > +
> > +	return err;
>=20
> You should return 0 here, or if you want to signal error to caller you
> should unwind
> changes, I guess regulator_disable should be enough.

Done.

> > +static int sharp_panel_probe(struct mipi_dsi_device *dsi)
> > +{
> > +	struct mipi_dsi_device *secondary =3D NULL;
> > +	struct sharp_panel *sharp;
> > +	struct device_node *np;
> > +	int err;
> > +
> > +	dsi->lanes =3D 4;
> > +	dsi->format =3D MIPI_DSI_FMT_RGB888;
> > +	dsi->mode_flags =3D 0;
> > +
> > +	/* Find DSI-LINK1 */
> > +	np =3D of_parse_phandle(dsi->dev.of_node, "link2", 0);
> > +	if (np) {
> > +		secondary =3D of_find_mipi_dsi_device_by_node(np);
> > +		of_node_put(np);
> > +
> > +		if (!secondary)
> > +			return -EPROBE_DEFER;
> > +	}
> > +
> > +	sharp =3D devm_kzalloc(&dsi->dev, sizeof(*sharp), GFP_KERNEL);
> > +	if (!sharp)
> > +		return -ENOMEM;
>=20
> Do we really need this for LINK2 device? You can just check if
> mipi_dsi_get_drvdata
> is not null to distinguish them, I suppose.

Done.

> > +static int sharp_panel_remove(struct mipi_dsi_device *dsi)
> > +{
> > +	struct sharp_panel *sharp =3D mipi_dsi_get_drvdata(dsi);
> > +	int err;
> > +
> > +	/* only detach from host for the DSI-LINK2 interface */
> > +	if (!sharp->link2) {
> > +		mipi_dsi_detach(dsi);
>=20
> There is no locking mechanism here, so it is possible that
> everything can crash if someone unbind driver from LINK2 and then try to
> enable the panel.

I don't think so. Since we're not doing anything with the DSI-LINK2
device anymore it's irrelevant whether it is bound to the driver or
not.

> > +		return 0;
> > +	}
> > +
> > +	err =3D sharp_panel_disable(&sharp->base);
> > +	if (err < 0)
> > +		dev_err(&dsi->dev, "failed to disable panel: %d\n", err);
>=20
> IMHO calling mipi_dsi_detach below should cause connector to call panel
> disable and unprepare so the call above seems to me unnecessary.

I don't think the connector has any business doing anything with the
panel on mipi_dsi_detach(). I suppose we could implement something like
that as part of drm_panel_detach(), but that's not the case today, so
this simply follows what every other panel has done so far.

> > +
> > +	err =3D mipi_dsi_detach(dsi);
> > +	if (err < 0)
> > +		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
> > +
> > +	drm_panel_detach(&sharp->base);
>=20
> drm_panel_attach is called from tegra_dsi_host_attach,
> wouldn't be more 'symmetrical' to call drm_panel_detach from
> tegra_dsi_host_detach :)

No, it's not called from tegra_dsi_host_attach(), it's called as part of
the DSI output initialization at DRM load time.

drm_panel_detach() really needs to be called from two places: when the
panel driver is unloaded and when the connector is unloaded. It seems
like this is another area where we may have to put more thought into how
to handle it more uniformly across drivers.

Thierry

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUU5ydAAoJEN0jrNd/PrOhULIP/iYDWmx1FhloywaC2t90hRVX
daWGWL7pP2Ap5byYJFUGqvkXzZuOoV1ea1r9SbP0OrEXfoTde+enmwUZ/X1A7U4y
SfqDDs++v7tSXqw894bKGCjSq1tjI6RbLB+hrFh14BWo2fPH2vap58+g8iGB3lhH
Ht0+j+QDX4h/KNgF3McKORW0MoB1XZ/Qhxu3P3MJIVPNyQ1s2B8cxqFqsYeqgvE7
kweYic9M5Op94SYesxiQO/qtakyWOwokSFpwfVYTxWD3SGZAilFXxorAqbw1JeW6
HXW+JHQWUfWKnISW9igrVjEXDYiSq9XwIu3EN1llrcuGKs0X0Jfa+ytkoA7Ktxzq
ogvQ7A2gds0nEyNU0d06S5sU2adQW6AOZR1GgJRoylj7zPiHLEGW5HIuvpI/Ekos
ZjKpef/zxeh0Q7CvJcynXMKj0aMFpvV62twMgfAYqvYM4d5imbLBrWa20DmpbfsW
eFGOBhqD24WUtWWfpn48n2TqNzJGIXE8n2S+TNCjZIbUK3Hx9ze7ZPYqde8mBfQF
PKB70Q55YaX+WyENhIHxeDr+R4QomRV0BO3R5hrrL6HrC/t2Y49DtPsTp3sEKmIw
0t+7kMC0kNG0tO09fqOnS7MY0ryGqf1r2/ow7ZXPdUqNA/II5E7WV4wy6/Mo5bmC
nbbWEUQRzrpMJuHgk3x4
=F7Zm
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--

--===============1349922555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============1349922555==--
