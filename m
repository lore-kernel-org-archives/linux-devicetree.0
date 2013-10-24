From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] [RFC] of: Allow for experimental device
 tree bindings
Date: Thu, 24 Oct 2013 10:50:38 +0200
Message-ID: <20131024085037.GA10650@ulmo.nvidia.com>
References: <1382540779-6334-1-git-send-email-treding@nvidia.com>
 <5267FA58.9050002@wwwdotorg.org>
 <20131023172001.GA3379@katana>
 <20131024083459.48FE3C4039D@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131024083459.48FE3C4039D-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2013 at 09:34:59AM +0100, Grant Likely wrote:
> On Wed, 23 Oct 2013 18:20:02 +0100, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org> wrot=
e:
> >=20
> > > Do we really want to polute the drivers and DT files with a ! in the
> > > compatible values? I thought we'd considered that, but chosen having =
the
> > > drivers that use unstable bindings depend on a Kconfig option as an
> > > alternative, not an additional step?
> >=20
> > I'd even go further and use "unstable-" as the prefix instead of "!"
> > which is way more explicit.
> >=20
> >=20
> > > The one issue with doing this is that if a binding is thought to be
> > > unstable, but becomes stable later without any changes, we'll have to=
 do
> > > busy-work to remove the ! in all the DT files, thus artificially
> > > introducing an incompatibility. Perhaps that's fine though?
> >=20
> > I'd say yes. Going from unstable to stable is quite a step for a binding
> > and that should be visible and worth a patch IMO. Also, when looking at
> > a DTS file or some driver code, it will avoid
> > confusion/misinterpretation if one can see immediately the status of a
> > binding.
>=20
> No, it shouldn't. Going from unstable to stable is not a large step,
> rather it is coming to the point of looking around and realizing that
> the binding is working quite well.

Yes, the difference between the unstable binding before it is declared
stable and the stable one shouldn't be big. In fact it should be no
different at all.

However the decision is still a conscious one. And it is a big step,
because when you declare it stable you assert that it will never change
in an incompatible way.

> I don't think the solution is to put this into the kernel to be checked
> at runtime. The better solution is to put it into DTC and make it
> complain (either warn or error; depending on build config?) about usage
> of compatible strings that are marked in the binding documentation as
> unstable.

Perhaps. Doing it in the kernel seemed easier. Furthermore not every
user might generate their own DTB and whoever generates the DTB may not
make the same choice as every user might have made. Granted, that might
be a little far fetched.

I personally don't mind where exactly it is checked for, as long as we
can settle on something. What I'm primarily concerned about is that the
current situation hinders progress and early adoption, which I consider
both essential for upstream Linux development.

Thierry

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSaN9dAAoJEN0jrNd/PrOhxqEP/iRiQlOQOsHFBXa4ZnfnKoIu
0P/KemqXfCDkRnw8moXU/Ue+EbvZAq55M6dPtN1D1YzI4S4RE8p8c8P6jA0b8GBu
7Q9fdEJE2N+wpwt0Tpt+FS+Oos1x29xgF0tIZtKRcuC7p8o3JFMhlMWUfHnrRGow
LPcVPZ76qNqEJqaBgKLlQbr6ZSYwVplzCMRu1K7Vh6PbDrLVlus4xJRNwY7tMDuL
YRMnc5+ax2gi1ukGmOzH8aeKvt4tDFvp0wMBO9mLq3dGaDyccJ/nEOpCSRHid4u2
6CVx3Xl/FsLiHJh+hx8DiPlgOSvNTLaZlmiEtj2nq0to/hqtm6lM9DghS8nofmxm
vceaiHYlCsIgUylUm0a2f3ZKh4tHYHzcW1Pk7crgahquJfrGpr2wTuIhlLnJi6LC
CivdlA5kjTQ2LnZWxYissjPc7/4AQhXKA/m5+yyxnq7hgA04jrJsW2cic6Kon5C0
OAF3z35LyCUcZ2ZWmU42CuMsRb4Perp460lFntLgSyPLz/Q08y/UoHr3RpIT23Ec
lwt1xh/S7fkzZ114ytF/LDjCS6CvMrbBtNRLa3i69654WB5hgIgwUiyl8NkuR7IE
DUPK/l0tEe0qS6U63wGGXL7hGLUUMRrRVeDjpVfzcNjCZjV/Dfbc2b/SHMayHuWt
ZFz0VVWMZC7fyxMya0pK
=vfhU
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
