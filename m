From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [linux-sunxi] Re: [PATCH v3 1/2] phy-sun4i-usb: Use
 of_match_node to get model specific config data
Date: Fri, 27 Nov 2015 09:53:32 +0100
Message-ID: <20151127085332.GU32142@lukather>
References: <1448470202-3628-1-git-send-email-hdegoede@redhat.com>
 <CAGb2v64XL=bptxoCwiVkf8u-EfckpuASS3Foo=Q3i4a_6CaJYA@mail.gmail.com>
 <5656F6F4.1040801@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7QTDVAgpgOXqPYyV"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5656F6F4.1040801-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, "Reinder E.N. de Haan" <reinder-I1/eAgTnXDYAvxtiuMwx3w@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--7QTDVAgpgOXqPYyV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2015 at 01:11:32PM +0100, Hans de Goede wrote:
> >>+enum sun4i_usb_phy_type {
> >>+       sun4i_a10_phy,
> >>+       sun8i_a33_phy,
> >>+};
> >>+
> >>+struct sun4i_usb_phy_cfg {
> >>+       int num_phys;
> >>+       u32 disc_thresh;
> >>+       enum sun4i_usb_phy_type type;
> >>+       bool dedicated_clocks;
> >>+};
> >>+
> >>  struct sun4i_usb_phy_data {
> >>         void __iomem *base;
> >>+       const struct sun4i_usb_phy_cfg *cfg;
> >>         struct mutex mutex;
> >>-       int num_phys;
> >>-       u32 disc_thresh;
> >>-       bool has_a33_phyctl;
> >>         struct sun4i_usb_phy {
> >>                 struct phy *phy;
> >>                 void __iomem *pmu;
> >>@@ -164,12 +174,15 @@ static void sun4i_usb_phy_write(struct sun4i_usb_=
phy *phy, u32 addr, u32 data,
> >>
> >>         mutex_lock(&phy_data->mutex);
> >>
> >>-       if (phy_data->has_a33_phyctl) {
> >>+       switch (phy_data->cfg->type) {
> >>+       case sun4i_a10_phy:
> >>+               phyctl =3D phy_data->base + REG_PHYCTL_A10;
> >
> >Any reason why this offset isn't incorporated into phy_data?
>=20
> You mean in phy_data->cfg I assume, the difference needed for
> the "sun4i_usb_phy_write" functionality are not just the phyctl
> register offset...
>=20
> >
> >>+               break;
> >>+       case sun8i_a33_phy:
> >>                 phyctl =3D phy_data->base + REG_PHYCTL_A33;
> >>                 /* A33 needs us to set phyctl to 0 explicitly */
> >>                 writel(0, phyctl);
>=20
> e.g. the A33 needs this extra write, and on the H3 we need to do
> similar bitbanging, but slightly different, see:
>=20
> https://github.com/allwinner-zh/linux-3.4-sunxi/blob/master/drivers/usb/h=
ost/sunxi_hci.c#L899
>=20
> Notice how it uses different addr and write register addresses
> their through the usb_phy_csr_add and usb_phy_csr_write helper
> functions as well as directly poking offset 0x20.

Then it easy to support: one u8 for each register that changes, one
bool to tell if you need to clear the phyctl register or not, And you
don't have to duplicate the switch everywhere, and basically just
reimplement of_device_is_compatible without an actual compatible to
workaround the review ;)

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--7QTDVAgpgOXqPYyV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWWBoMAAoJEBx+YmzsjxAgRmYP+wbtlLdOAET+PiKj2ESF0KdY
qmQRZ4LWPQFXgZ8TLEePrZfjOweZyIS9H7ij4214j1o7OErf20N3PDSbPtbQv01a
QQ2/1M9uW7649CrdkJQOYhebME5LnL0c/Ky22YVBEEmYEvjFS16VPlQiECaM+NuC
11S3LIJtqjj4oIBOkk9RBp/n9HZlaPzXrAj/u26km0MLdOK660/zNA6EP5CzIfU2
y3DuQH/L5ubI+fsdKk12XHY2Q0TF0afivE/KBQEI1OeBEvjOOvOhV+gt7VfPxktu
wx9CuxTpiFoFdLSJSzO8sbevwVMLNjfcyfpcRzB0blvHi1PMTUu7QZDxOClN/o/n
4QfsDXEDAsH5AbfmwXlk657mawGiNW6T5udWiROoJVS2gFFi7DBWDVxeLUmKMhOQ
XOufWXhauNzYi7eWL0tk4g8XkdBC3Vc/gRdjDvUASKlLHMkUcapcPcq80suF/N1O
UJbm3/rzLTAgilFy80iYfnkB0pcwAfbuIQQ8VKARxMVq10Fv8H9D2x4pnvy6ffwp
YHpREQ66VnMIRI4ZBufPVdLtR0LmgHkn8Oub+822gSBiVX8yIVyvaWiW1W5Pd4I6
JMrER6s8Ldji7zjq6lE2OmmLxDdte0V1BpVTBHoRGaMX1qRrku+og5hP6twmgGAQ
eHH6bQSVlq0y5YUTiehI
=vPoR
-----END PGP SIGNATURE-----

--7QTDVAgpgOXqPYyV--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
