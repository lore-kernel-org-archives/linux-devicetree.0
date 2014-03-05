From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v5 5/7] [media] of: move common endpoint parsing to drivers/of
Date: Wed, 5 Mar 2014 12:05:33 +0200
Message-ID: <5316F6ED.8040204@ti.com>
References: <1393522540-22887-1-git-send-email-p.zabel@pengutronix.de>		 <1393522540-22887-6-git-send-email-p.zabel@pengutronix.de>		 <531595AB.4000001@ti.com>	 <1393932989.3917.62.camel@paszta.hi.pengutronix.de>	 <5315C535.2070303@ti.com> <1393948056.3917.120.camel@paszta.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="mGhrgJ7cfBIaic3fsUhOVhkmVp5XxcGKt"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393948056.3917.120.camel-+qGW7pzALmz7o/J7KWpOmN53zsg1cpMQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--mGhrgJ7cfBIaic3fsUhOVhkmVp5XxcGKt
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 04/03/14 17:47, Philipp Zabel wrote:
> Am Dienstag, den 04.03.2014, 14:21 +0200 schrieb Tomi Valkeinen:
>> On 04/03/14 13:36, Philipp Zabel wrote:
> [...]
>>>> Can port_node be NULL? Probably only if something is quite wrong, bu=
t
>>>> maybe it's safer to return error in that case.
>>>
>>> both of_property_read_u32 and of_node_put can handle port_node =3D=3D=
 NULL.
>>> I'll add a WARN_ONCE here as for of_graph_get_next_endpoint and conti=
nue
>>> on.
>>
>> Isn't it better to return an error?
>=20
> I am not sure. We can still correctly parse the endpoint properties of =
a
> parentless node. All current users ignore the return value anyway. So a=
s
> long as we still do the memset and and set local_node and id, returning=

> an error effectively won't change the current behaviour.

Is the parentless node case an error or not? If it's not, we can handle
it silently and return 0, no WARN needed. If it is an error, we should
return an error, even if nobody is currently handling that (which is a
bug in itself, as the function does return an error value, and callers
should handle it).

 Tomi



--mGhrgJ7cfBIaic3fsUhOVhkmVp5XxcGKt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJTFvbtAAoJEPo9qoy8lh71GJAP/1MfqyfTObudamAIR8RPgoSq
oFAnftU5j309N99ETx/xmjV2MaMD1heDNFIVcdKQTXFKxGhnhBxUB/JQuoPV4dt8
eayXMhYeiZ9sex+etLBI0eqVTj1PFrxQV4eOnC+zEaIxUgGajk8QFCSxwUww6MQg
oyy3+esFxiL8YkN2aPRKFn+DJoSluwg8pkLTXBhimYdXU5l6u6KIV7eWNRIo+STN
GOXfaBcOKlppKa0i6zqoapaJkxBn8guHWW1nuYU0LLGH/YzfiPLEs6WSGLnk8BgT
VFIA+lCEf977m3iN2VBcQ8wbeeOicAF/pA2pV2BKEH9VBANam/TWsIs6bdvGuKd/
vJwjjomQ6bZG3Exivaz9jCfC2t2ZjPPOO+fAM8Cfn72bbGfEOGyWFv99BxtDwOv8
XWRhsGoXTA0EEcpndY+aV0pm8rF9UKdt4tMrFKoAZX01pCS6lhPZXOlGerrYTvtD
zklwhghP4lR/6byzQLb3bu5dBsKyh0109TdH0fryGj+FKQK8N7HUac9CN2x3V0cq
Wx2aOgbvLNTwg8/bBZpScf9dw8fDhijiyoDclm0nWhig9P15V5SyT+mDvEvo6v72
NJ5ydjeKieF4x5PJJYMVQE43AzuDzugMn+ypqjssHk/c8C3DczB0SUtBymtuGsRg
/pgU6Ag+jOxvnXfPNQGn
=k9h/
-----END PGP SIGNATURE-----

--mGhrgJ7cfBIaic3fsUhOVhkmVp5XxcGKt--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
