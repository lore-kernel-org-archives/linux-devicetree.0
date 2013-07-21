From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: The future of DT binding maintainership
Date: Sun, 21 Jul 2013 20:49:40 +1000
Message-ID: <20130721104940.GC22475@voom.fritz.box>
References: <CACxGe6vtJPbbqwpH8Th5S36Hx50f39j1P4OpLb-Um9xQie6Lng@mail.gmail.com>
 <20130720034647.2B7B43E14BF@localhost>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1388187780579771979=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130720034647.2B7B43E14BF@localhost>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--===============1388187780579771979==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wxDdMuZNg1r63Hyj"
Content-Disposition: inline


--wxDdMuZNg1r63Hyj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 20, 2013 at 04:46:47AM +0100, Grant Likely wrote:
> A number of us had a face-to-face meeting in Dublin last week to talk
> about DT maintainership and the fact that it simply isn't working right
> now. Neither Rob nor I can keep up with the load and there are a lot of
> poorly designed bindings appearing in the tree.
>=20
> Device tree binding maintainership needs to be split off to a separate
> group, and we've started with a few people willing to help, Pawel Moll,
> Mark Rutland, Stephen Warren and Ian Campbell.
>=20
> (BTW, even though I've already sent a patch adding that group
> MAINTAINERS, this is not set in stone. Anyone else wanting to help
> maintain should volunteer)

Sounds good.

> Another thing discussed is that we need to start validating DT schema
> with an extension to dtc. Tomasz Figa has volunteered to do this work
> and has support from his employer to spend time on it. What I'm hoping
> to have is that the DT schema will get checked as part of the dts build
> process so that any DT file that doesn't match the documented schema
> will get flagged, and that the schema files will be human readable and
> will double as documentation.

Tomasz, please keep me in the loop on this.  This sounds like exactly
what the "checks" infrastructure in dtc was designed for, but I never
had time to implement very much there.  I'd definitely like to follow
progress here, though.

> There is not yet any process for binding maintainership. We talked about
> a few ideas, but they really need to be hashed out here on the mailing
> list. A couple of the questions:
>=20
> - How are bindings allowed to be merged? Through subsystem trees, or
>   only through the bindings tree?
>   - Through the bindings tree is more work but it will provide more
>     control.
>   - Through subsystem trees means drivers and bindings get merged
>     together.
>   - If we have a schema tool that reports errors on missing or
>     unapproved schema, then spliting the driver from the binding won't
>     matter that much.
> - Do we need to differentiate between 'staging' and 'stable' bindings?
> - What is the schedule for splitting the bindings and .dts files out of
>   the kernel?
>   - Ian Campbell is maintaining a DT bindings and .dts mirror tree which
>     should eventually become the 'master' for merging DT bindings.

It seems to me that the kernel tree has become the informal repository
for board dts files is in itself a problem.  It encourages people to
think the two are closely linked and that all that matters is that a
specific dts works with its corresponding kernel and vice versa,
rather than fdts being the general description they're supposed to be.

Not that I have much in the way of better ideas.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--wxDdMuZNg1r63Hyj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iEYEARECAAYFAlHrvMQACgkQaILKxv3ab8aEyQCgkNeBr0+qw2lclYuW0/47WTve
njwAn0uW3W5JVTqFeSHLm76TTwWglbGk
=8U6w
-----END PGP SIGNATURE-----

--wxDdMuZNg1r63Hyj--

--===============1388187780579771979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1388187780579771979==--
