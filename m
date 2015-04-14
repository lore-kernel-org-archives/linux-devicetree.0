From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun7i: Add Goodix GT911 nodes for Wexler
 TAB7200
Date: Tue, 14 Apr 2015 18:32:32 +0200
Message-ID: <20150414163232.GD15807@lukather>
References: <1427789897-4085-1-git-send-email-mamlinav@gmail.com>
 <20150331144338.GG23664@lukather>
 <20150331221420.3b65d2540c7dbe1d12611e12@gmail.com>
 <20150402092259.GK23664@lukather>
 <20150411191816.cdc5ec802b01028eb2913906@gmail.com>
 <20150413160951.GJ29832@lukather>
 <20150413220100.8666a3d121fce581ba836fe6@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9crTWz/Z+Zyzu20v"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150413220100.8666a3d121fce581ba836fe6-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aleksei Mamlin <mamlinav-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--9crTWz/Z+Zyzu20v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2015 at 10:01:00PM +0300, Aleksei Mamlin wrote:
> On Mon, 13 Apr 2015 18:09:51 +0200
> Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>=20
> > On Sat, Apr 11, 2015 at 07:18:16PM +0300, Aleksei Mamlin wrote:
> > > On Thu, 2 Apr 2015 11:22:59 +0200
> > > Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > >=20
> > > > On Tue, Mar 31, 2015 at 10:14:20PM +0300, Aleksei Mamlin wrote:
> > > > > On Tue, 31 Mar 2015 07:43:38 -0700
> > > > > Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > > > >=20
> > > > > > Hi,
> > > > > >=20
> > > > > > On Tue, Mar 31, 2015 at 11:18:17AM +0300, Aleksei Mamlin wrote:
> > > > > > > This patch adds nodes for the Goodix GT911 touchscreen contro=
ller found
> > > > > > > on the Wexler TAB7200 tablet. Controller uses one of followin=
g I2C
> > > > > > > addresses: 0x5d or 0x14, so just add two nodes.
> > > > > >=20
> > > > > > In which case are these different addresses encountered? Differ=
ent
> > > > > > revisions of the same board?
> > > > >
> > > > > According to the datasheet it is a feature of the controller.=20
> > > > > The address(0x5d or 0x14) can be configured using a reset sequenc=
e,
> > > > > which has not yet been implemented in the driver.
> > > >=20
> > > > Which address is set up by the bootloader then?
> > >
> > > I assume that bootloader(u-boot) didn't sets up any address, but touc=
hscreen
> > > controller usually uses 0x5d. Sometimes, after hard reset, it uses 0x=
14.
> > > For this we need nodes on both adresses.
> >=20
> > I'm confused, who changes that address then?
> >=20
> > The controller itself?
> >=20
> If I understood correctly, when device starts it sets reset pin (PB13) to
> high level and int pin(PH21) to low level. After this int pin sets up as
> external interrupt. This sequence triggers controller to use 0x5d address.
>=20
> After hard reset both pins may be hight level and it triggers controller
> to use 0x14 address.
>=20
> Please see datasheets at pages 8-10.
>=20
> https://drive.google.com/file/d/0BxCVOQS3ZymGdEE0cHI3bnp5WVE
> https://drive.google.com/file/d/0BxCVOQS3ZymGbDAzVnZwZ2lOZ1E

If so, then the driver should be fixed to handle that power sequence
correctly and make sure that the device is using the 0x5d address,
whatever the previous state was.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--9crTWz/Z+Zyzu20v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVLUEgAAoJEBx+YmzsjxAg9xoP/itnxBZrQWgv2+p2EWVxkisG
darXo4ZO1id85qnlbVa0irImfUXhYDKyebRpod/gDOAS5yVVj7NKj6WeGmnUFQTE
x28ai6BiPkNgXnrngNxZ/4QcaWzO4KwRnoBCred5EroS5NYg0bMXPsOrUvNHKIfP
aFe7Y8x4NJ2szzssupjBc8Bz1ySEwjO0JfUsYaHz3Ax8vBXcczy/pLmedFElmDCC
3iyllBKRXtzuXF41ssmIZLGy0jLbCDe8vhLHWJcgvTIHrqpnsbUsEx5FiG6P5Ff7
tL9H25sGIK3a1m2S10MhdN/BkcYsqUjFCVPzyGKjZlxzXeHNf6joR6W3xNcGs3XY
kU0YKRdl+3nHDsIZE5NMMTwTw5ce9pC2w0SekIU0fQ4OMk8SDOFHWGFxAZdNKNwK
cWqW8aum+TKgTpHA7C7Obe+Gx28y6osEi4hB2hqq0l/2K5Dgv44vmMZZhneF7Xlx
yToSCkBl42sP1TqHryZBn8xtmt6KhzeEOEQLw8beFyGYvIxoQs0edRafQgx2wTsq
fAcrmYA3OpD0Q8fEOTnA4XxAqcjqYuaahOKPlArlN8FmZBgMY5p4BrMjcMUkOIEr
o/wLyiQNct90wZ47aXgfziQtQNASilxyyMWi2DGXSFJUGnJV7+hZpUJ1A2CzF5wg
D/SUvsGpMcdFWrXA0BVi
=74Ct
-----END PGP SIGNATURE-----

--9crTWz/Z+Zyzu20v--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
