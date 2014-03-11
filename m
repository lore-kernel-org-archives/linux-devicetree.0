From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [RFC PATCH] [media]: of: move graph helpers from drivers/media/v4l2-core
 to drivers/of
Date: Tue, 11 Mar 2014 15:27:43 +0200
Message-ID: <531F0F4F.3070008@ti.com>
References: <1392119105-25298-1-git-send-email-p.zabel@pengutronix.de> <139468148.3QhLg3QYq1@avalon> <531F08A8.300@ti.com> <1883687.VdfitvQEN3@avalon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="0Q6TkmB7CV19g7QLgQpItgpNRphxUoJ7W"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1883687.VdfitvQEN3@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--0Q6TkmB7CV19g7QLgQpItgpNRphxUoJ7W
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 11/03/14 15:16, Laurent Pinchart wrote:

>> And if I gathered Grant's opinion correctly (correct me if I'm wrong),=

>> he thinks things should be explicit, i.e. the bindings for, say, an
>> encoder should state that the encoder's output endpoint _must_ contain=
 a
>> remote-endpoint property, whereas the encoder's input endpoint _must
>> not_ contain a remote-endpoint property.
>=20
> Actually my understand was that DT links would have the same direction =
as the=20
> data flow. There would be no ambiguity in that case as the direction of=
 the=20

Ok. At least at some point in the discussion the rule of thumb was to
have the "master" point at the "slave", which are a bit vague terms, but
I think both display and camera controllers were given as examples of
"master".

> data flow is known. What happens for bidirectional data flows still nee=
d to be=20
> discussed though. And if we want to use the of-graph bindings to descri=
be=20
> graphs without a data flow, a decision will need to be taken there too.=


Yep. My worry is that if the link direction is defined in the bindings
for the device, somebody will at some point have a complex board which
happens to use two devices in such a way, that either neither of them
point to each other, or both point to each other.

Maybe we can make sure that never happens, but I feel a bit nervous
about it especially for bi-directional cases. If the link has no clear
main-dataflow direction, it may be a bit difficult to say which way to li=
nk.

With double-linking all those concerns just disappear.

 Tomi



--0Q6TkmB7CV19g7QLgQpItgpNRphxUoJ7W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJTHw9PAAoJEPo9qoy8lh71xrIP/37RUXTwCDENqR3hT6yGCTh1
0yc5WhysNkn71ov48iYGQdHZyA9Qb/SAXaLcNegr/f+0URNcV9AdQijWP59GdnE2
G0qCzycaHdJDOP/r7GomjyI4gHn23oDpAGy+80JtWOEyRSQGwibgcxnouodJ6F71
E/ZSTnWlMG/m+EgWpfL7HySwVnKUD1uC2kqawqrG+3IlsV0Hjeu0CK9R184zBdwm
AiHmRdo+hgId0EP4xf27HovzkjT9U4OGPK6bqsEcgt7jTjp7D7PLWuzuo4RHZbic
gFGmrua6biFN6qmMdUTzzLR7fq6CCDov8YGjsKUZXbuURWJH4XviPoHtaVarr0jZ
C8AOM3bKwl4efSn/iAC/ms17wwfp0TxkoT06z44WhueLYMi+sKVh4xhiZErN63gZ
opOusNWEAX73IFmOV9RjPbAT0iJ022cFshM4L4kOH2enpHC552vfv/ctgIpiliDB
nSN2tc+ePjBDcHL+ygZ4iojydHKhChtOazcA0wd0qEyrcqoSvQsYzX+yagwxef34
R7Gh7Jz2jhqBQkdswPLYbioy8FEowOtEKRiZgRuf4duW4stBzrDCOUO1foCB5vAK
A+kxlcwnhMXyRSyF8uJ9/KDAnvm273Ohf2wfEvdcy85jLXr/AVHG79Xla+vYpLK6
Gih+a+PMZx1pUt3I2SXK
=Ze4i
-----END PGP SIGNATURE-----

--0Q6TkmB7CV19g7QLgQpItgpNRphxUoJ7W--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
