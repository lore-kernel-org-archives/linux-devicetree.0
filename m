From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Thu, 24 Oct 2013 16:57:16 +0200
Message-ID: <20131024145715.GC9044@ulmo.nvidia.com>
References: <20131024095232.27BBCC4039D@trevor.secretlab.ca>
 <1382614439.6040.16.camel@sakura.staff.proxad.net>
 <1382615278.8522.72.camel@shinybook.infradead.org>
 <20131024122346.GD11296@ulmo.nvidia.com>
 <1382619655.6040.52.camel@sakura.staff.proxad.net>
 <516bfc7f9366ff3ef9187c36dd160888.squirrel@twosheds.infradead.org>
 <1382621431.6040.66.camel@sakura.staff.proxad.net>
 <af289ef3cc80be8de26274ba1f598d54.squirrel@twosheds.infradead.org>
 <20131024141955.GB25061@ulmo.nvidia.com>
 <1382625219.6040.96.camel@sakura.staff.proxad.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O3RTKUHj+75w1tg5"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1382625219.6040.96.camel-MdnFuL0m/hCw+z8RR+d9WEZ2mhrpEnA6@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Bizon <mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--O3RTKUHj+75w1tg5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2013 at 04:33:39PM +0200, Maxime Bizon wrote:
>=20
> On Thu, 2013-10-24 at 16:19 +0200, Thierry Reding wrote:
>=20
> > We treated DT the same way we had treated platform data before, which
> > has inevitable lead to the current mess, which is only slightly better
> > than what we used to have.=20
>=20
> Side question, in your point of view, how is that better ?

The representation of the data may not be all that much better. But as a
side-effect of the whole DT shebang we've made improvements in many
other areas as well. Granted, we could've done that without DT too, but
DT was a pretty good motivator.

I also think that during the conversion of platform data to DT we've
made attempts to make the representation more generic and introduce
common or standard properties. So on the whole I think we have managed
to unify many things, which I think is a good thing.

> current DT tools are not able to validate a file wrt its schema, so for
> now we just moved platdata to DTS files and lost compiler type checking
> in between.

There's been talk about fixing that. I guess it might have been better
if we had had such a tool two years ago, but I certainly hadn't thought
about it before, so who am I to blame anyone else for not writing it.

> I respectfully understand people fighting for *stable* DT because I see
> the benefits behind this, even if IMO they absolutely do not outweigh
> the pain.
>=20
> But I fail to see any benefits of "forever unstable" DT, if you have to
> tie the kernel tree with a DTB file, the description could have been
> left in C code.

Well the longterm goal certainly is to separate both, and keeping both
in lockstep was a means of easing the initial conversion. There's
certainly a lot of pain, but I also think that whatever we had before
just didn't work out so well. If it had all been sunshine and lollipops
then there wouldn't have been a need to change anything, right?

Thierry

--O3RTKUHj+75w1tg5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSaTVLAAoJEN0jrNd/PrOhdukP/idZBrXuf9DQ+rXXpVxS4AnO
FxVpFFTaV1sz91asnLrDm5hdPlUZp4eBdo6/3X2YEIK3itjZuybX32ZJUW9rFrpG
xmHYynl8rDK0ugDBrLnYB4KtM41dJ6t+QkNrUDJ8mRzPz2rvPWSWJQCZ5AZMEjp3
GFq4FrDdagsEMEx6YsCOEK1lXcJQB/U7j2T9TLdijllobn4y9QYWQPoUN/uwbAz3
ZX1zbzzt36/7LeQmZOSL2J7jX/Pi3cLNoSFFNNAGW6QsP6KnQ4bq78JY283Zt9ZX
/+bg8hUyHZiDEfbAEKlbz7COqkQA8QBXD2PAgOSDm4qdXirk2e/Gr8wUPZd940T3
TuYEVbHMTDh7PqBMySxlBc6XVWTIJGQpbNAax+H4Z8QsqzfY8F62zmLPA836KXY0
MuWdzfwztuDByPslU0R0UaYrdsCU7feFbvL7Lj+hPlAYYp8YM+FV5CymWKsLSAT1
02spnidq55CSshZIut0dgoKJ8+GiMiVerxP8LcqhM/T61sXjSD682Bs8XcHnJicc
kCp5N0KCSuTKO5HYUFoM3jcVDcnznz/t6zlHJ0uXy/qPZfn/yg4K+ejD8Jrdynzm
/TmqNJ/U6e/wAvk0hlYEF5FRbq/q/YYcxJEvORazwgFEUVEEKRDStcAUYoC4pgQs
QLt/LuASlZsEaK29Nyhp
=IBGz
-----END PGP SIGNATURE-----

--O3RTKUHj+75w1tg5--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
