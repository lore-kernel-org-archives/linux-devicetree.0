From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 6/6] ARM: sun8i: dts: Add Ippo-q8h v1.2 with A33 and
 1024x600 lcd support
Date: Wed, 3 Jun 2015 11:45:35 +0200
Message-ID: <20150603094535.GI23777@lukather>
References: <1432997706-20172-1-git-send-email-hdegoede@redhat.com>
 <1432997706-20172-7-git-send-email-hdegoede@redhat.com>
 <20150602081459.GO23777@lukather>
 <556D6955.8030708@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+HaDSJYnsYzHewVa"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <556D6955.8030708-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--+HaDSJYnsYzHewVa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2015 at 10:29:09AM +0200, Hans de Goede wrote:
> Hi,
>=20
> On 02-06-15 10:14, Maxime Ripard wrote:
> >On Sat, May 30, 2015 at 04:55:06PM +0200, Hans de Goede wrote:
> >>The Ippo-q8h is a tablet circuit board commonly found in cheap Android
> >>tablets. The v1.2 version can be used with either an A23 or A33 SoC.
> >>
> >>This adds a dts file for the v1.2 board with an A33 SoC and a 1024x600
> >>LCD screen (most of these tablets have a 800x480 screen).
> >
> >I think the difference between the resolution here is more of a case
> >for the DT quirks interface:
> >https://lkml.org/lkml/2015/2/18/258
>=20
> I would expect the only difference between the 2 dts files to be the
> node describing the lcd panel, so yes that makes somewhat sense.
>=20
> >Do you know if there's some way to autodetect the two board versions
> >(like a board id somewhere in an EEPROM)?
>=20
> No, AFAIK there is no way to tell the difference. There is no eeprom no
> the board, and we really cannot rely on the nand contents.

Ok.

> >If not, then maybe u-boot can simply add that board compatible to the
> >list, and we'll base our logic on that when we'll need it.
>=20
> That means extra logic in u-boot, and on the kernel side, for what
> benefit exactly? Such logic would make sense if there was one u-boot
> image which runtime adjusted itself, but that is not an option.

For what benefit? One kernel image which runtime adjusts itself. It's
especially possible if u-boot's image is not, which seems to be what
you're saying.

> And we can avoid copy and paste on the dts side by putting all
> the common stuff in a common file and including that, I believe
> that that is better (KISS =3D better) since we've no way to runtime
> do the right thing AFAICT.

My concern is about the ever-growing number of DTS that just are small
variations of one or the other. What about the time when we'll
discover that this board has a variant that has an emmc, and some that
don't have any button, or the i2c bus 2 not wired, and one other that
doesn't have any HDMI?

Do we really want to have a dts called
sun8i-a33-q8h-emmc-lcd800x600-nohdmi-noi2c2-nobuttons.dts?

Especially when we will have the one that we include here that will
not have followed this convention because it was introduced before
that, and that we have a way to deal with this nicely?

You chose to consider the DTS names an ABI, the best way to handle
this is to have a DTS as generic as possible, and leave all these
small variations outside of the name.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--+HaDSJYnsYzHewVa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVbsy/AAoJEBx+YmzsjxAg8zQP/A1NHpQRl4WRF0hWstLp39Qv
eHkqtZxG9JmX62+X4uVWnw7tFI6y9GQSnsWdmzORsTv+xdp4Z2IfnWZH9QWXUtBT
jwbrFp0w61trDZv3ulMRx0NSksvVp3ur+RIBhhsulEe6lx52gytvixHaFMQf/3NR
N6e+S6SmLunWgj7dbvj9AOId6II5JpbTpr0MVVQF8gJLCVJqUOFjBpVMNj4ukfZi
uaNAO1NbkTvHOClnXnMqyuzeq7wbCL3WtsA/31vZeuOXMkTMvGU5g224zXHSjUtV
caZVcwVDPxqRkhR2NkBPGpfXz9dLQaEkPiswJEUJ76jD32BaqU9NuUq1t74AkR7h
sVQfrcp7BVMXklaRkKHMMbLZtVw7p5KWC4HhoOIPiTHkBxb99fdYd5kxE8QjtsYf
zqRc/rHvkBLZnNZq9skF+vdi85cwSDdoHjv8ilgQ5dBAIyfUXWTdFW5A0p7YBz6o
zKKTOEz434p7z//2rBSCBNTH5eDM70a8sHSUAuhVsJaQpB04Voi5N/zVCTfPYiHd
FZTflssGNppvYJM63RKS/gRVvKkDk9XVgaaaTRoeXH81pC0Qn5ahA6nBAcav8tUR
RAIoZ533oN3qriwo+oHEMwbVvt1yMW3hG+zzvnLCxg+ttyyr/LuWdW2WhwjYwuL5
VAyr7wtzBvobjT8Y2J/Y
=1u8F
-----END PGP SIGNATURE-----

--+HaDSJYnsYzHewVa--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
