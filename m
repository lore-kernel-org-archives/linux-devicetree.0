From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2] iio: lps331ap: Add support for DT
Date: Sun, 4 Aug 2013 14:08:54 +0200
Message-ID: <20130804120854.GV2911@lukather>
References: <1374240981-13560-1-git-send-email-j.anaszewski@samsung.com>
 <1374240981-13560-2-git-send-email-j.anaszewski@samsung.com>
 <51FE4117.3040404@kernel.org>
 <51FE4267.2090409@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nSY6dmU9u4MMxp1o"
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51FE4267.2090409-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, denis.ciocca-qxv4g6HH51o@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, l.czerwinski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--nSY6dmU9u4MMxp1o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jonathan,

On Sun, Aug 04, 2013 at 01:00:39PM +0100, Jonathan Cameron wrote:
> On 08/04/13 12:55, Jonathan Cameron wrote:
> > On 07/19/13 14:36, Jacek Anaszewski wrote:
> >> This patch adds DT support for the lps331ap barometer
> >> sensor.
> >>
> >> Signed-off-by: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> >> Signed-off-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > This makes sense to me and looks similar to that in existing bindings
> > hence,
> >=20
> > Applied to the togreg branch of git://git.kernel.org/pub/scm/linux/kern=
el/git/jic23/iio.git
> Actually I've backed this change out as I've just read a few more emails =
down
> my backlog and found a long discussion of it when it got pulled into anot=
her
> patch set.  Will review that discussion before making any decisions on th=
is one.

Also, a new process begin to emerge, and now, every new bindings should
be acked by the new device tree maintainers. I'm not sure the discussion
on the exact process has been settled, so that's probably why not all
the maintainers are aware of that, but this ACK is (or will be) required
for every new binding that comes in, and this should be enforced by all
maintainers.

The underlying thinking is that DT bindings should be a stable ABI, and
as such be properly reviewed, instead of just being looked at by the
other maintainers that are often not interested or just don't really
know about DT at all.

You can see parts of this discussion here:
https://lists.ozlabs.org/pipermail/devicetree-discuss/2013-July/038275.html
https://lists.ozlabs.org/pipermail/devicetree-discuss/2013-July/038264.html
http://lists.infradead.org/pipermail/linux-arm-kernel/2013-July/186420.html

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--nSY6dmU9u4MMxp1o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJR/kRWAAoJEBx+YmzsjxAg8Y8QAMITL5VGbEGT2nSDmZpOc4S+
cagQfXKZElIgS/AoIyAE7oBZtAPu4oUPBCJlqLMVAA0VJd3l5XXjcuj8MbMEqiTW
1Mc5775rhlLfZZLEoi/JsB22zcx9As73McemQnK/HdfFQn5yVMzlQdyfooKRD9r6
ZVumO/6Y9fZUHM3Vd/NbIRN4pB4vSyxtqrzlxeSVnDenkIV5DqePG9jdWwrc75gu
+sSfnm83tvXSRPAiLsOfkZB2z+uPbFGsDpl44/WsQf/pn2mOIZeIkXtOUDNZCxD5
jkSjRvcFrGKw14TAkmCq5/p61Fq/FPDG40nTcRYP/fzd3aW6fTjasZDb60HciVUz
x//dTty1CZGiVdhSkcY56b5zBLzgcoVLYbeuNjObbk7AvJyRuvTkqbOQ0Bmjl8A/
KVtYrDbCOj8jC9dwBEiaU+fM1Fk0kIR855z0ohqsMaAiiZ2SPXSjxb6FsD+RvDVE
fJ145SHQJdehaiu1rYWAAng6xiTWv90M40n3N/NG6PYF2OPXiwrgzV75KvjKmtgM
/XhEGoffcotf5Cw51KOTGqdkFtVvg3hBspRfLBmQac+CTy1f58sdrSVMPQIDBYjb
AyD1liCZi98+NUUSWEYI1GZivPyyzV2xdjL+cMIMJlxtWgGboiw8zZ7Vpyi2T4wc
3Hsq2cbD6WfJ6ZbyyzIp
=a+5m
-----END PGP SIGNATURE-----

--nSY6dmU9u4MMxp1o--
