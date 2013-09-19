From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: "memory" binding issues
Date: Thu, 19 Sep 2013 10:29:57 +1000
Message-ID: <20130919002957.GA3551@voom.redhat.com>
References: <1379300274.4098.77.camel@pasglop>
 <1379371567.3721.46.camel@pasglop>
 <CAOesGMgE1jiF5OHsmPQz2z66Bcqu0HeAj=taE1vmFK-0-0s2TQ@mail.gmail.com>
 <1815499.tpfeUKmP6V@flatron>
 <20130917164307.GA31327@quad.lixom.net>
 <5238C4D1.6060500@gmail.com>
 <CAOesGMh0F09OAR4bepGSCE5Z5OZ56fBmDPBSfwZ+NB9RgcE0Vw@mail.gmail.com>
 <5239D4BC.3030600@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cWoXeonUoKmBZSoM"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5239D4BC.3030600-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2013 at 10:28:44AM -0600, Stephen Warren wrote:
> On 09/17/2013 03:15 PM, Olof Johansson wrote:
> > On Tue, Sep 17, 2013 at 2:08 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> =
wrote:
> >> On 9/17/2013 9:43 AM, Olof Johansson wrote:
> >>> On Tue, Sep 17, 2013 at 09:56:39AM +0200, Tomasz Figa wrote:
> >>>> I'm afraid that I must disagree. For consistency I'd rather go with =
what
> >>>> Ben said. Please see ePAPR chapter 2.2.1.1, which clearly defines how
> >>>> nodes should be named.
> >>>
> >>> 2.2.1.1 is there to point out that unit address _has_ to reflect reg.
> >>>
> >>> 2.2.3 says that unit addresses can be omitted.
> >>
> >> 2.2.3 is talking about path names.
> >>
> >> 2.2.1.1 is talking about node names.
> >>
> >> 2.2.1.1 _does_ require the unit address in the node name, 2.2.3 does n=
ot
> >> remove that requirement.
> >=20
> > Sigh, that's horrible. OF clearly doesn't require it.
> >=20
> > I guess people prefer to follow ePAPR even though it's broken? That
> > means someone needs to cleanup the current dts files. Any takers?
>=20
> FWIW, I investigated enhancing dtc to enforce this rule. Here are the
> results:
>=20
> ********** TEST SUMMARY
> *     Total testcases:	1446
> *                PASS:	1252
> *                FAIL:	58
> *   Bad configuration:	136
> * Strange test result:	0
> **********
>=20
> That's just in dtc itself, and not any of the *.dts in the kernel or
> U-Boot source trees...

Uh.. yeah.  The trees in the dtc testsuite are rather contrived and
not good examples of device trees in general.  They're really purely
examples of dts syntax, and don't at all resemble typical dt contents.

> I'll see how much of patch it takes to fix up all the test-cases in dtc.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--cWoXeonUoKmBZSoM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJSOkWFAAoJEGw4ysog2bOSI10QAKzRG3vFvtyoOj/cGovp/Xkv
NC6BNfAZRVN0Ky3lX/e93EaGRo5DK/l1+7nFizDHNm1J8PUR+v2R3rZCdodQ136f
gOyyEONI+s3Q1kdnGT9Zk+Y1aCtAZx+g//aAPf7O886b8oR/6CrCcciFz11EgjYn
ZG6X8Xu0BOlSZjb1X54PzTJcZiNudcdMsRuwgfTHFeV5urzp7cvZKnx+dE+07Ymi
p7SQld3GljrM8h9FRDKjbVpTS7RKNvzriY7PaVRUdRGDLEMz2xDclt7GJA8lMvkD
vny24kljhk561KhR2OyD2YPgtC7GL0nIqGxIayVwT1UMiHpB7mgtebSS0tMSwiy2
QP3BIcAzrZMASNFGfxmvRR8eZ8Pra9Eq3pgjnK78zPYkQp1XCra8f40R/eRB4GTm
QE9mDdSO1TsnwnL+XcjeQHBtyz+yPRc3p7gijaQ9BWhzxJHBqk3eyfMiZmr1YRTb
W3YfrsFdo7txX+D6lVOUafFrxzcgt1e8MEfxE2/vrw0tbLPArdOwGIliRrMspiZ4
0m98EZQDehHlHM2mBJ5kURz2nrz0WjOAX0bA5ASm3Sx7r36DxZ7YRACWhZxTKYji
AektCHbMPESZeUS0WRLQzywri7JqQEOttM92ZuapBsEnIbPOacQmd5R8RPJQflUD
8uj2MTnvnm+EHFinG6OM
=ql/g
-----END PGP SIGNATURE-----

--cWoXeonUoKmBZSoM--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
