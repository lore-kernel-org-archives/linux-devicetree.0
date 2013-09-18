From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: "memory" binding issues
Date: Wed, 18 Sep 2013 11:25:57 +1000
Message-ID: <20130918012557.GA22725@voom.fritz.box>
References: <1379300274.4098.77.camel@pasglop>
 <1379371567.3721.46.camel@pasglop>
 <CAOesGMgE1jiF5OHsmPQz2z66Bcqu0HeAj=taE1vmFK-0-0s2TQ@mail.gmail.com>
 <1815499.tpfeUKmP6V@flatron>
 <20130917164307.GA31327@quad.lixom.net>
 <5238C4D1.6060500@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5238C4D1.6060500-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2013 at 02:08:33PM -0700, Frank Rowand wrote:
> On 9/17/2013 9:43 AM, Olof Johansson wrote:
> > On Tue, Sep 17, 2013 at 09:56:39AM +0200, Tomasz Figa wrote:
> >> I'm afraid that I must disagree. For consistency I'd rather go with wh=
at=20
> >> Ben said. Please see ePAPR chapter 2.2.1.1, which clearly defines how=
=20
> >> nodes should be named.
> >=20
> > 2.2.1.1 is there to point out that unit address _has_ to reflect reg.
> >=20
> > 2.2.3 says that unit addresses can be omitted.
>=20
> 2.2.3 is talking about path names.
>=20
> 2.2.1.1 is talking about node names.
>=20
> 2.2.1.1 _does_ require the unit address in the node name, 2.2.3 does not
> remove that requirement.

Certainly the recommendation I've been giving from the early days of
ePAPR has been that a node should have a unit address if and only if
it has a 'reg' property.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJSOQElAAoJEGw4ysog2bOS0wQQALnP5TvQEcyHQQE8hC5yTQPp
FoXt750ascj1bEI598dNXsCCQ4IvOHaaVYQld/DPNozLFORvF4noUq9riFw5Zbtz
JbpCgjSOmrrrhT8OGTkTFgaIrSvIv9ZR5zKFgmO4Yf7msg8O8K9g1NmlokoXny/r
1iNBdPL7o+YeiZaNKWSxjy1VQicZwz/NWYIbudUkfe2Wz7Em+EM3hKCmIYgGUFKB
aeNjwdLnlLJ9+QRK0fNw0o4HNfsuGYInIPTp1zha1r8PPVBl/QEt0IJCWiYXrtiB
mUgXroYG3mplkMEotQ94ny5MHSZ3lU3k0RvH+jrpn890qPukZxNHf6u+ScG/zXjs
HcuUi77ORFqKsmCP4JtLVndG2zuP2Mi+msFfaol+3k2HxYxeDhlUHhPC/gOkl278
DFATo2jSO2SjVlM4dDyP7c9JsqxEAzeTrNazcTMelDUEOSir8FHKbN+U1ZegBnEj
DToWhcAV/DlleUV4g4zx+sei2wWZLQrq+BtxxBC9BnoSI6w2+F9876abs0XF4G44
WYyaUMbXVisY2x+ZoXNzt8a+mNOBNWM7t4ejhRoBbbhn4fU8WszbN9gW4Ip6HfI8
UQ1L6XuSs6tPKAYlyt8KE+9CEH7WfsF4UkKojMGeUPir4x7xNqz+Ek1XVE5uU7XN
wFDEyOrG/DplJ2Yl+O13
=7HU7
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
