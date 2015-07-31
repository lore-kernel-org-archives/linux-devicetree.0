From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v7 3/5] clk: Supply the critical clock {init, enable,
 disable} framework
Date: Fri, 31 Jul 2015 09:30:19 +0200
Message-ID: <20150731073019.GU2564@lukather>
References: <1437570255-21049-1-git-send-email-lee.jones@linaro.org>
 <1437570255-21049-4-git-send-email-lee.jones@linaro.org>
 <20150727072549.GP2564@lukather>
 <20150727085338.GW3436@x1>
 <20150728114022.GW2564@lukather>
 <20150728130055.GV14943@x1>
 <20150730011932.642.85168@quantum>
 <20150730095014.GD14642@x1>
 <20150730224720.23791.6722@quantum>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2+XEzv9QEhmMrrEN"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150730224720.23791.6722@quantum>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--2+XEzv9QEhmMrrEN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2015 at 03:47:20PM -0700, Michael Turquette wrote:
> > > >    */
> > > >=20
> > > > Resume:
> > > >   /* Order is unimportant */
> > > >   SPI enables Clock 4 (ref =3D=3D 1)
> > > >   RAM enables Clock 4 and re-enables .leave_on (ref =3D=3D 2)
> > > >   I2C enables Clock 4 (ref =3D=3D 3)
> > >=20
> > > Same again. As soon as RAM calls clk_enable_critical the ref count go=
es
> > > up. .leave_on does nothing as far as I can tell. The all works because
> > > of the reference counting, which already exists before this patch
> > > series.
> >=20
> > So fundamentally you're right in what you say.  All you really need to
> > disable a critical clock is write a knowledgeable driver, which is
> > intentionally unbalanced i.e. just calls clk_disable().  All this
>=20
> OK, the line above is helpful. What you really want is a formalized
> hand-off mechanism, whereby the clock is enabled at registration-time
> and it cannot be turned off until the right driver claims it and decides
> turning it off is OK (with a priori knowledge that the clock is already
> enabled).

There's two things that should be covered, and are related, yet can be
done in two steps:

  - Have a way to, no matter what (which configuration we have, if we
    have multiple users or not that might reparent or disable their
    clocks, etc.), make sure that a clock will always be running by
    default. This is done through the call in clk-conf, and we
    identify such clocks using critical-clocks in the DT.

  - Now, even though that information is true, some driver who are
    aware of that fact might want to disable those critical
    clocks. This is what the clk_disable_critical and
    clk_enable_critical functions are here for.

> Note that I don't think this implementation can really work in the near
> future. Today we do not catch unbalanced calls to clk_enable and
> clk_disable, but I have a patch that catches this and WARNs loudly in my
> private tree. More on that in the next stanza.
>=20
> What I don't understand is if there is ever a case for a clock consumer
> driver to ever call clk_enable_critical... I do not think there is. What
> you're trying to protect against is having the clock disabled BEFORE
> that "knowledgeable driver" has a chance to enable it.

It's really about what we want the API to look like in the second
case.

Do we want such drivers to still call clk_prepare_enable? Some other
function? Should they assume that the clock has already been enabled,
or do we want a handover, or a force disable, or whatever.

I guess we should discuss those questions, before starting to think
about how to implement it.

IMHO, I think that the existing way of doing should be used, or at
least with the same mindset to avoid confusion, errors, and
misinformed reviews.

So I'd expect the drivers to do something like:

probe:
  clk_get
  clk_critical_enable

remove / probe error path:
  clk_critical_disable
  clk_put

and use the clk_critical_enable and clk_critical_disable whenever
needed, and thing would just work as intended.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--2+XEzv9QEhmMrrEN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVuyQLAAoJEBx+YmzsjxAgNVcP/2D0z5VmyymbMhPxx59viffW
wwBmwZz2YmRsUx+6gIpKyXlZ2dwObmzQG5NVun6OIVBuxaPpK7HalQEPlsibwhoq
5H8E6apLJ1AVUvW2VmVw1sAZ3VoJdBHOG/wXS40ZybKFWbwW2guHmKGFANXaf0iL
te44G0yxgu8DCwUeNUdCGB7BC+q1RzK1VPu2Z70TjvPxiwupBPWGDbqyr8uHcMM7
4F3q4hSxWMqYwZYtc/ZT6Ep4vXhDBYKFijA/rF/jariGiTmE/jK6/8UlXPdANkxT
+kt+++IhGGcA8LWIBy+jhTNbvCAplW/P/RJm2l4/gSY7HYTPT02opB3UNMH+a69r
D2t+YpeBXx7dAY9k1ivgFt7B7kqTqHjl31SGp5aLmc8QQAubgbQXDW3rq0rrDLk4
qoEIJXFJMq6sBMT7Jra7Jt6uQ9TIYQDXknPjYg6p+RvzhL39jsr1S+j6xl5rd0tE
813pFzsnV/MEnttDay5NXy64hfi/oqxbCtsUoTBZKkI7ycAodlfzS7CKsVftHWqP
NuqaFj4EYPYzyyvohwK50pLcnP0MO+XJn2bhq3Z+IfwWS3SF60KCQSQCCxfL3aVR
Jw1azwn5h9281UIOpVDKO+c5WmzZWsiRqZrLYsNQL4q9qIqWJTq+pfvQ3/Dj9BBd
pjPFhX749cKS9FKYO5vs
=UrkE
-----END PGP SIGNATURE-----

--2+XEzv9QEhmMrrEN--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
