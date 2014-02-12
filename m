From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] ehci-platform: Change compatible string
 from usb-ehci to ehci-platform
Date: Wed, 12 Feb 2014 15:56:13 +0100
Message-ID: <20140212145613.GA9812@lukather>
References: <1392127826-31290-1-git-send-email-hdegoede@redhat.com>
 <1392127826-31290-3-git-send-email-hdegoede@redhat.com>
 <52FA3B2B.7050906@ti.com>
 <52FA4118.2030100@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBAUZ52LQKGQEEPZWR3I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52FA4118.2030100-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, jwboyer-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org
List-Id: devicetree@vger.kernel.org


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2014 at 04:26:16PM +0100, Hans de Goede wrote:
> > I'm even OK with removing "usb-ehci" and "usb-ohci" compatibles
> > from all OMAP dts files since they aren't really compatible with
> > the original PPC driver.
>=20
> I don't think that is necessary, as your grep has shown there are a
> lot of dts files using compatible =3D "foo", "usb-?hci"; and some may
> even have the dts in firmware, so we should simply make sure not to
> break such dts.

For these devices, we can't do much, but at least for the DT that are
in Linux, relying on the fact that there is no driver having a
compatible of "usb-ehci" to work looks very fragile. I'd be in favour
of removing it from the OMAP DTs, and every affected DTs.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJS+4uNAAoJEBx+YmzsjxAgByQP/1TofmnumMMH1t77RH25KgMM
HI6uy8IjxeO2KknFbKE1VDgZ2dcrpgQ/NYQMNLfJb4fPRO7d6Be0F3YpRmV6j6Uo
AH8sF8aYBcxrDD56Qne/TxBniouNrpPwX91ZYMU5Ne2Sjd6SuFVmG9eLMbuy84VK
/6ITFcQsknAaSMyqWr2ZR14rhnl9tr/a65uAy31+/VK/FbQIda5iRW9y7DlwrO+l
39LVd+vI0TRPmLVEI+eahPrwcs6tTxy+PX+GmhBQbeB+qw40dy0kJIny7u3arshi
Opmg3KoeLvvTVhTevCAKXncCBLLmhgW16MUTXjAVTLDWURtafqt6mlZVwxSSelJl
YptTrddd/rJruAROn5GnKQcXFwTu3XP99USgvlNa1bsYoXOE4YCwShBWzMBzAZDs
j5lu+2R3pa0wbfziUQFNPrWkDIe6kSPvra//BwSV70E4Jcic+oQ1s5xx5Z3v4ZEU
OJkOTcHNF47itgb8dAcir8KQFWq8hTbkX0YlQV+SNiB4lpT4/UUb3rqmGP5fHXaE
wqoAx6FDHzAbfQuroh/gz+LndWeOik1CgkBEcaI19nKqruoyR1Dm6ZYC5Q2vpR8d
luSEXtbv5dUJwvNQqrGDDIoAFOHDiWsgox4BHg7L7adYPoehl0LKKth5wWqE+XNW
y7Sn6gzjG34/CQvpEjJR
=YIcN
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--
