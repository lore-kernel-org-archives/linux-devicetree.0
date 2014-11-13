From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/7] ARM: dts: sunxi: Add regulator-boot-on
 property to ahci-5v regulator
Date: Thu, 13 Nov 2014 17:49:30 +0100
Message-ID: <20141113164930.GP20972@lukather>
References: <1415871109-28332-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iq/fWD14IMVFWBCD"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBPWCSORQKGQEHI3QQBI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1415871109-28332-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons-ud5FBsm0p/xEiooADzr8i9i2O/JbrIOy@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--iq/fWD14IMVFWBCD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2014 at 10:31:43AM +0100, Hans de Goede wrote:
> This avoids it getting briefly turned off between when the regulator gett=
ing
> registered and the ahci driver turning it back on, thus avoiding the disk
> going into emergency head park mode.
>=20
> Cc: Bruno Pr=E9mont <bonbons-ud5FBsm0p/xEiooADzr8i9i2O/JbrIOy@public.gmane.org>
> Reported-and-tested-by: Bruno Pr=E9mont <bonbons-ud5FBsm0p/xEiooADzr8i9i2O/JbrIOy@public.gmane.org>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Applied, and split up the tags.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--iq/fWD14IMVFWBCD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUZOEaAAoJEBx+YmzsjxAgUsAQAI4y7FhjRpixo6vCOoBapNE1
TV5uLjuvbckr3dyk/PWxXPk5IUjpKXqnbw/dXYaf6I2F7eNu6rE04MPlf93cUv1z
x/JaN9eYviJyztow1Pf8M5WFQmapXKG6FE4Io2lYyqP0nLQbbUmTszKndqwUD6jk
K7KvXGqBQlU7JMSCdnjJbfSKymnzChp07pn/04w+pKZ3IHeKBgQ3avUuqaS8k07B
jsw1XTT3ZDqtcFy8QiZiQLVU+qtaqqY3HtaT0uei3NwPFRI+PNS6key63DDIqSPY
mKV9phyYmf99T6IL2oZJeCGQbeWc40FHwErNYkMzwLIE/c0tBauQqNoTc0dAbuU6
4mwncHYyUuJCJkbkwU21+EO6t3L5ioUgFVizD83taSKj1tr8xZnRBigHtBcyi+CD
LgAvCvUCl8zATgC8HhgwJ6XV/dl/AcibpG/b2GHVZ0qSbMWzV4FTyGfXWFFTYKmP
lJYSpX0Vk/ml3kdTzy1VqC6L/d42CPDR4D7KwIlzeBmucdgblGMdyEtxOFWfNmLH
nkHgaZwY7r5+c33UtU8a0IcceckSJXklzEMzMJp0DmAuWhwjzfvgPTgKUBxFR0V3
ad53x5U4A3i1ce/PGisTgjUX2Ljd3rpmsYdp6MQXzwLcyNr372JqH0oGk15d8Kg0
MH14iHNh4Q9tG/vPtcIz
=6a3R
-----END PGP SIGNATURE-----

--iq/fWD14IMVFWBCD--
