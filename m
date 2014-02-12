From: Kevin Hao <haokexin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Linux-3.14-rc2: Order of serial node compatibles in DTS files.
Date: Wed, 12 Feb 2014 18:31:53 +0800
Message-ID: <20140212103153.GC15434@pek-khao-d1.corp.ad.wrs.com>
References: <alpine.LRH.2.00.1402101056410.10318@ra8135-ec1.am.freescale.net>
 <20140211072606.GA26514@visitor2.iram.es>
 <OF6F6A0029.3B20EF5B-ONCA257C7C.0071BFDA-CA257C7C.00732AD3@csc.com>
 <63AEBD99-AA87-4FD7-BBDA-0CE419959F14@kernel.crashing.org>
 <52FAA97F.4060600@gmail.com>
 <1392162080.6733.404.camel@snotra.buserror.net>
 <52FAB65C.4090201@gmail.com>
 <OF9BA019D5.46DA1E29-ONCA257C7D.000089EA-CA257C7D.00020333@csc.com>
 <20140212052816.GA15434@pek-khao-d1.corp.ad.wrs.com>
 <52FB3108.3000202@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2JFBq9zoW8cOFH7v"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52FB3108.3000202-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen N Chivers <schivers-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>, Chris Proctor <cproctor-znpAAEhiOVUQrrorzV6ljw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--2JFBq9zoW8cOFH7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2014 at 09:30:00AM +0100, Sebastian Hesselbarth wrote:
> On 02/12/2014 06:28 AM, Kevin Hao wrote:
> >On Wed, Feb 12, 2014 at 10:21:58AM +1000, Stephen N Chivers wrote:
> >>But, the Interrupt Controller (MPIC)
> >>goes AWOL and it is down hill from there.
> >>
> >>The MPIC is specified in the DTS as:
> >>
> >>         mpic: pic@40000 {
> >>                         interrupt-controller;
> >>                         #address-cells =3D <0>;
> >>                         #interrupt-cells =3D <2>;
> >>                         reg =3D <0x40000 0x40000>;
> >>                         compatible =3D "chrp,open-pic";
> >>                         device_type =3D "open-pic";
> >>                         big-endian;
> >>                 };
> >>
> >>The board support file has the standard mechanism for allocating
> >>the PIC:
> >>
> >>         struct mpic *mpic;
> >>
> >>         mpic =3D mpic_alloc(NULL, 0, 0, 0, 256, " OpenPIC  ");
> >>         BUG_ON(mpic =3D=3D NULL);
> >>
> >>         mpic_init(mpic);
> >>
> >>I checked for damage in applying the patch and it has applied
> >>correctly.
> >
> >How about the following fix?
> >
> >diff --git a/drivers/of/base.c b/drivers/of/base.c
> >index ff85450d5683..ca91984d3c4b 100644
> >--- a/drivers/of/base.c
> >+++ b/drivers/of/base.c
> >@@ -730,32 +730,40 @@ out:
> >  }
> >  EXPORT_SYMBOL(of_find_node_with_property);
> >
> >+static int of_match_type_name(const struct device_node *node,
> >+				const struct of_device_id *m)
>=20
> I am fine with having a sub-function here, but it should rather be
> named of_match_type_or_name.

OK.

>=20
> >+{
> >+	int match =3D 1;
> >+
> >+	if (m->name[0])
> >+		match &=3D node->name && !strcmp(m->name, node->name);
> >+
> >+	if (m->type[0])
> >+		match &=3D node->type && !strcmp(m->type, node->type);
> >+
> >+	return match;
> >+}
> [...]
> >+	/* Check against matches without compatible string */
> >+	m =3D matches;
> >+	while (!m->compatible[0] && (m->name[0] || m->type[0])) {
>=20
> We shouldn't check for anything else than the sentinel here.
> Although I guess yours will not quit early as mine did but that
> way we don't have to worry about it.

Yes, this is still buggy. I will change something like this:

	m =3D matches;
	/* Check against matches without compatible string */
	while (m->name[0] || m->type[0] || m->compatible[0]) {
		if (m->compatible[0]) {
			m++;
			continue;
		}

		match =3D of_match_type_name(node, m);
		if (match)
			return m;
		m++;
	}

Thanks,
Kevin

--2JFBq9zoW8cOFH7v
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJS+02ZAAoJEJNY7TDerrFx6eEH/0c9N4fQc6JtK8IGHhWFnc1J
pispim0tMEah8kU8gXfLb4SLCZRz4pbu2BNduLAq0bQJe5131qaMTgeEyp2c+Cko
tBGSHdwGxYfDh0H4gwouGOORup+Pcm9MGN+wEpoiIkXwpjKPgifOYBqL46a3zMz/
LbNwcFnIVVoWmnjGwj+KJV+U7xaYe+HdoB98LPzE9JmhVD3R2n5zPxQGdpuFnqHn
mAAmTxILQJQV+ZY/HUfqTw/NDrEvqI234TbfqV2SModJ4ZCH/GC9J9uF+43KdFtN
2qPzNdJophfC284Lt1UXjwJZoMBkNoKQPRo6rOnjjIWR+baaD0tjYAA4yYQTA+0=
=qVT2
-----END PGP SIGNATURE-----

--2JFBq9zoW8cOFH7v--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
