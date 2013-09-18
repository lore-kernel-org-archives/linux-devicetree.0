From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] usb: gadget: Add UDC driver for Aeroflex Gaisler GRUSBDC
Date: Tue, 17 Sep 2013 20:46:17 -0500
Message-ID: <20130918014617.GC19817@radagast>
References: <1376316310-27989-1-git-send-email-andreas@gaisler.com>
 <521DBC9E.9080001@gaisler.com>
 <522D5DAB.2060707@gaisler.com>
 <20130909152424.GA26404@kroah.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p2kqVDKq5asng8Dg"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130909152424.GA26404-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, software-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--p2kqVDKq5asng8Dg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 09, 2013 at 08:24:24AM -0700, Greg Kroah-Hartman wrote:
> On Mon, Sep 09, 2013 at 07:33:31AM +0200, Andreas Larsson wrote:
> > On 2013-08-28 11:02, Andreas Larsson wrote:
> > > On 2013-08-12 16:05, Andreas Larsson wrote:
> > >> This adds an UDC driver for GRUSBDC USB Device Controller cores
> > >> available in the
> > >> GRLIB VHDL IP core library. The driver only supports DMA mode.
> > >
> > > Any comments? It would be great to get feedback soon in case some thi=
ngs
> > > need to be changed for this driver to be accepted. Thanks!
> >=20
> > Anyone?
> >=20
> > Is there anything holding it back from being accepted into mainline?
>=20
> This is the middle of the merge window, nothing can be accepted at the
> moment, please wait until 3.12-rc1 comes out and our trees open up again
> to expect a response.

I'll review this one tomorrow or day after.

--=20
balbi

--p2kqVDKq5asng8Dg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJSOQXpAAoJEIaOsuA1yqRE35gP/i8mb0uxntUaAOVhoK/pYWCD
pjZBRPYVpn0xBk6lYiO0udME9rdsWjRsONudytqE7qRxMKRDuNnsCeIsmSshfrzO
D6OufFE983dMqyYZxCwnM17b27B2Z17BH+TZ9o1FR2KL1MLSMd05BUoeKjSehYAc
Csn7pvhdogwoTiGjC0TIwlqAs9VUAG94+LBx1ovFmlAukDhA/s6xsWgaNarsZmGW
bXick3Y6ISDfBXVKw9udrKou5NDKdXh0a8RPxiUsLGg/9qnm2iLS+XZKpa7bM9jX
aTCLTt7PYFTGDKm+fw6TZzL//FzrhFIKtyekoKQHykoiQcuzSePeKi9eDGD9upyH
67FUWwDpQypkrQ4JKiNokDX/fzeOZnHo6L4aRsnGnSTdUfhIxcVaumQFdPSdJff2
yrM5yqxX0h0OllL4qzjmH+rEdM6PT7QcbLrwWAPbl4hUJI9UqkaYeQ5QyyGtjbEX
A6HgIICwoeKbXEhAB7Py91RNQ/6MX9Ck+sguDxm+o9V//NJdtIoo+cYmgBDoc8Yt
ztMcJ7XSoQowjG5v02oMgmpE0GkdQyX+A38yWnvOzlKtedx8g5EpQ/7g8je38a4k
eZ2oy2KuwBkTcsDWCcBVJxevXmPsm14N1Qu3sHVlLv0xeJjr36UCjfRXxAUa7M7O
clRQQchqD+UaKucudRqk
=xx2L
-----END PGP SIGNATURE-----

--p2kqVDKq5asng8Dg--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
