From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 1/2] Warn on node name unit-address presence/absence
 mismatch
Date: Fri, 19 Feb 2016 16:02:29 +1100
Message-ID: <20160219050229.GA15224@voom.fritz.box>
References: <1455223619-16052-1-git-send-email-robh@kernel.org>
 <1455223619-16052-2-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qD80nKKiJWXm4UaL"
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455223619-16052-2-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--qD80nKKiJWXm4UaL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2016 at 02:46:58PM -0600, Rob Herring wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> ePAPR 1.1 section 2.2.1.1 "Node Name Requirements" specifies that any
> node that has a reg property must include a unit address in its name
> with value matching the first entry in its reg property. Conversely, if
> a node does not have a reg property, the node name must not include a
> unit address. Also allow ranges property as it is deemed valid, but ePAPR
> is not clear about it.
>=20
> Implement a check for this. The code doesn't validate the format of the
> unit address; ePAPR implies this may vary from (containing bus) binding
> to binding, so doing so would be much more complex.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> [robh: also allow non-empty ranges]
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

I've applied this to master.

[snip]
> @@ -654,8 +678,8 @@ TREE_WARNING(obsolete_chosen_interrupt_controller, NU=
LL);
> =20
>  static struct check *check_table[] =3D {
>  	&duplicate_node_names, &duplicate_property_names,
> -	&node_name_chars, &node_name_format, &property_name_chars,
> -	&name_is_string, &name_properties,
> +	&node_name_chars, &node_name_format, &unit_address_vs_reg,
> +	&property_name_chars, &name_is_string, &name_properties,
> =20

However, I've moved the new test around in check_table.  It's original
test placed it next to very basic structural tests, further down with
more semantic tests makes more sense.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--qD80nKKiJWXm4UaL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWxqHlAAoJEGw4ysog2bOSmbIP/jUcdAek/EsSRYZOHURK7DxW
qovW6BXukiK11u1sb7GjPwHONQpI2g44QYZ0c9sl4w91h23ud98r9y2pKYB+bxcz
QigK1tlLdyni/ypdO5V8DH/GeZY2ywRoKzCpOqkjdwejeOSd0X+jS5BAX0BOVKdZ
UgY3dd7fEFccOrxggcbT6VmKVCchTlHwUjA+h9SXVpYGSCQSXni1n5b7NTnxDSSO
aQ5WCDieWHM3Ydkp2q1wEVqQT6RrLadRRjY4w2Qdbq7Vo8mNkKR6Af7UT+XDVrc8
+QdujIOp/y4SMwSfYUwqtuU8PUPx9DQlbfoC3BsfvNro5fd0IeWMoPE7yV/BBKMc
AwWn/MoMz10ptGUQuRvz60v406x+c676sPjYJvz8lDC0Bs/6ER0MzjLGCec0GE5y
ixV+DAGMftMcuBFM4ATHl3nu2ei+oCYWMiLLBDTP+cPQFaHNjCwWiMDjxJcSUFKM
K0nyWmHCpLgyjZzDY5phbgKVLHh3UjVphgabste3i14u9dhDDJGEuUCCN03k/cRM
+jXdZGV12/mo8amgI4L5cj/f82ahlHsVa6ixcRWiZrgHZaAwjW5k1YXRpvUWCZYZ
4yPDbidmGVn229/1c6ZKsVUmwPtRVbsZ3pFn8RdJLaRavUTwyyRqFGujbBnsWxCO
pBVb+Uequ54CED7Qq4z2
=asW+
-----END PGP SIGNATURE-----

--qD80nKKiJWXm4UaL--
