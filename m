From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/5] clk: sunxi: Add USB clock register defintions
Date: Tue, 4 Feb 2014 10:40:51 +0100
Message-ID: <20140204094051.GL25625@lukather>
References: <1390426587-16287-1-git-send-email-hdegoede@redhat.com>
 <1390426587-16287-3-git-send-email-hdegoede@redhat.com>
 <20140127144349.GJ3867@lukather>
 <52E67316.5020906@redhat.com>
 <20140128094427.GZ3867@lukather>
 <52E77FCD.5050701@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RNGrj7vazCqBHNw7"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBH7NYKLQKGQEDXD4TVQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52E77FCD.5050701-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Roman Byshko <rbyshko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--RNGrj7vazCqBHNw7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Tue, Jan 28, 2014 at 11:00:45AM +0100, Hans de Goede wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Hi,
>=20
> On 01/28/2014 10:44 AM, Maxime Ripard wrote:
> > On Mon, Jan 27, 2014 at 03:54:14PM +0100, Hans de Goede wrote:
> >>>> "allwinner,sun5i-a13-usb-gates-clk" - for usb gates + resets on A13
> >>>=20
> >>> Maybe we can just remove the gates from there? Even though they
> >>> are gates, they are also (a bit) more than that.
> >>=20
> >> To be clear you mean s/usb-gates-clk/usb-clk/ right ?
> >=20
> > Yep, exactly
> >=20
> >>> I guess that means that we will have the OHCI0 gate declared
> >>> with <&...-gates-clk 6>, while it's actually the first gate for
> >>> this clock?
> >>=20
> >> Correct.
> >>=20
> >>> Maybe introducing an offset field in the gates_data would be a
> >>> good idea, so that we always start from indexing the gates from
> >>> 0 in the DT?
> >>=20
> >> Well for the other "gates" type clks we also have holes in the
> >> range, and we always refer to the clk with the bit number in the
> >> reg as the clock-cell value.
> >=20
> > Yes, we have holes, but I see two majors differences here: - the
> > other gates are just gates, while the usb clocks are a bit more
> > than that.
>=20
> The usb-clk registers contain more then that, but the bits we are
> talking about now are gates.
>=20
> > - the other gates' gating bits thus all start at bit 0, while
> > - here, since it's kind of a "mixed" clock, the gating bits start
> > - at bit 6 (on the A20 at least)
>=20
> Right, still I believe that the consistent thing to do is keeping
> the bit-number for the bit in the register controlling the gate as
> the specifier.  When adding new dts entries / reviewing existing
> ones I'm used to matching the specifier to the bit-nr in the
> data-sheet, I think making things different just for this one
> register is counter productive.

And if you turn it the other way around, it would be inconsistent that
all gates indices start at 0, and we would start at 6 here :)

Plus, this clock is already a special case, since it's the only gate
that is more than just a gate so far.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--RNGrj7vazCqBHNw7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJS8LWjAAoJEBx+YmzsjxAgP+kP/A87j7Vf7VWyEoWSeleLmPFx
rTMOfAA3f/gFkOvbKF3bY+clXcTRWlkxFRFyEKEFmrxGIHos1U8r/inwmCOccEDD
8AREAn5E2p7Rdx5lKneDY6IvJDoxIcuqiInLoBktDy2I7EOzUlCZir3N2BCzjDbK
gaHRSbAXqYYkigs9rqlqfWK3f/AhDBwWbAVfDlbwo3ei3kQ65iusVHiVRQAluWqx
LdwMP5Gmwf/RpjsEBQTvlrJvHOA6rLWnBHWOeaOlOMh/cRhdkIolfDSt+Hr8yLJ9
3B4OrFkYLMarNFHGql8mKwyVpAEeSMNI2inkJc2W0VYazMm2mbla7GXOqiUch26n
0bzzAFncMccmks38kaN8uvAYEO7azcsz/rJRYZK4fqIQMm6cnCbxHrmqqY3wB+Bp
bxrK1Esy4CrnAIMZUfuD3nvI/7GyONuev4pxc6x3NhY81TrQ/04q0S4SNM3aTyN5
od8hobDUGXGdWnWGJSlq8juaVErdNvOUNFenbH8go5hTTHzurmqcqAOGKhUp5VDJ
Wdwo57Zp+mx0hPPxPisaZpV7Joo6OZ981QKeaWcS2KDPsTfsBq2ylXwXmjnutO9p
goqeguCQA/tWjGx+3WtVRqwpQkkTGEbr64bakWYaj6sc1sCuwXTwPD1KEAfHFPG9
jtSiznfbN+n+KiHh7WE3
=NVkf
-----END PGP SIGNATURE-----

--RNGrj7vazCqBHNw7--
