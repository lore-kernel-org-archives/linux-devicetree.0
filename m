From: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: devicetree: avoid duplicated matching code (was: Re: [PATCH 1/3] xhci: plat: adapt to unified device property interface)
Date: Thu, 21 Apr 2016 14:20:46 +0300
Message-ID: <87fuuf9pip.fsf@intel.com>
References: <1461064246-27350-1-git-send-email-heikki.krogerus@linux.intel.com> <1461064246-27350-2-git-send-email-heikki.krogerus@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461064246-27350-2-git-send-email-heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mathias Nyman <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> writes:
> @@ -197,7 +196,7 @@ static int xhci_plat_probe(struct platform_device *pd=
ev)
>  	}
>=20=20
>  	xhci =3D hcd_to_xhci(hcd);
> -	match =3D of_match_node(usb_xhci_of_match, node);
> +	match =3D of_match_node(usb_xhci_of_match, pdev->dev.of_node);

Rob, it's weird that OF-based drivers have to redo the same matching
which was already done by drivers/base/platform.c::platform_match() just
to get match->data. If we know we matched, couldn't we just cache a
pointer to match->data in struct device_node.data ? Something like
below? (completely untested)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index b299de2b3afa..9b44caa38f7c 100644
=2D-- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -981,6 +981,8 @@ const struct of_device_id *of_match_node(const struct o=
f_device_id *matches,
=20
 	raw_spin_lock_irqsave(&devtree_lock, flags);
 	match =3D __of_match_node(matches, node);
+	if (match)
+		node->data =3D match->data;
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 	return match;
 }

I tried to find users of device_node.data but couldn't find any. If this
patch is acceptable, we can remove 160 occurences of of_match_node with
some variance of node->data.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXGLePAAoJEIaOsuA1yqREloUP/iFlhEfOWUryFj/diseMFVDl
s5Qln8VRuTzRvseq7+U1+3Umu9QXz1zdV9fjJt6g8SL2iHeOSc/oV4EQHet3itnT
L23KgjfgfhXORqA/GRNLBa94Ro5+viPAIDQsnkXnU22bMKQi1tyc3mnsqOUO0nCe
plQrZ4FU5qxMHXFhcqmKPCUbBEZUZ6RCOOpADl3eBGzIkeE7xp9KVzI3ZXZfrZJS
7tutXRX2OYefaPb98INnk1zeSDycPN8JgV7yZCx6T4B+ntuT309PblmBe6/mJZWp
mkPMFdgpe7iEwKGdBDaq8y+KmIiQKMzNaY+RrxQFIKsjLce5+OqFIsxkTppU1vSg
kq45IxIkcNcIiPWWqmVlpJE+8Rft6GxfH3p3/24IE9n7U7wZ1CaidPRipJWkNWMv
qEfnAPrY3n9ybm+9EPr4+BFw3zWSJp9XN0AQXlvFSPOX1KetaVXYMsi6oi5woiEP
4AlOVt9LV8MT586sb62q23nIGiR/3cuzItjaUWYuDFYr08P65850mmkoqgfSl6Ja
8yuiMlhBXLzf4cQ107EW1bPgNoI/Y4pZfcPYkxokrFLhy46ukAwvKR01tUIM/bIN
PPfPsDt7sAaZrsDNgLtPLTZR0zqt04Vy4aEkpv6Jcw0zF2Cul2R2DrORLHv/3uUw
lz7nErGJ9tp/0gML0Uxc
=cny4
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
