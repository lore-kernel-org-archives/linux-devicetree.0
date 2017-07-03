From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/2] fdt: Allow stacked overlays phandle references
Date: Mon, 3 Jul 2017 19:06:48 +1000
Message-ID: <20170703090648.GV13989@umbus.fritz.box>
References: <1497451946-15443-1-git-send-email-pantelis.antoniou@konsulko.com>
 <1497451946-15443-2-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wfgmFf0LjPE7xkRl"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1497451946-15443-2-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Tom Rini <trini-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Tero Kristo <t-kristo-l0cyMroinI0@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--wfgmFf0LjPE7xkRl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 14, 2017 at 05:52:25PM +0300, Pantelis Antoniou wrote:
> This patch enables an overlay to refer to a previous overlay's
> labels by performing a merge of symbol information at application
> time.

This seems to be doing things the hard way.

You're essentially extending the semantics of overlay application to
add the symbol merging.  You've implemented these extended semantics
in libfdt, which is all very well, but that's not the only overlay
application implementation.


It seems to me a better approach would be to change dtc's -@
implementation, so that in /plugin/ mode instead of making a global
__symbols__ node, it puts it into the individual fragments.  That way
the existing overlay application semantics will update the __symbols__
node.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--wfgmFf0LjPE7xkRl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZWgklAAoJEGw4ysog2bOSoVkQALIXhdKuBWzar8T8lnWEePdE
oqc6jBtKgcMaSatYa3m1hlkOUv5GL8TmC+XsGTw6VwHiiZvXv39M5ZbBmMlOBbF6
BIY7RQ1bjcICF/2HNwojzhWqGk9nFdxbeo0ub7Dg1mXhbnkN7GOFBZVsE7P2EwfZ
25qcbsQcqsg72LhQ7Ky88sG4h8J9YSAmbcKMcWIltcc0gdFHmkvKaZpnacl4IWOT
0Cnk989+cOZ8J8tz/63CqSB8ZjADLg9koiwS9CH3tg8NY+rwU1+wqCgO9s/Qt9g7
4QwWhjZ7EGeVJpnOlfXskKgxMJf3Vhk5WDCmL0dt8wnxGxTnpMhgsQ6CQNGmvIOg
fFd/KWJiBJrcDCMOIvXKluIZrOCSXdocMra85mlG6MzxtPXijgqq+CRMSFWC7yhd
U02QyF9nY39v5jeV17FwVqrUJhvpBXbu3wBDumUqpIVazRw6syVtpPK1vpucyBeY
Y1T0Tmi6EfXlLZXX9xzd6/TUQOI2EsuaHKWQi0aam1UY3p1t0Z42+ovs2HVnI5Oy
WJeW1ILoDkeZExyHC6yY57ho/CcJKWa2ahOJU76rANeQgvNjtXfynmz3BjR1KwHY
r4dhnwoh3t8os0J6/ecIDERfbZA7OZNAYWlGPr+2+ufDuIN0UeYlFN4ED7hnyIn5
lMuPLtK9z/3Hgk0v33kV
=yz45
-----END PGP SIGNATURE-----

--wfgmFf0LjPE7xkRl--
