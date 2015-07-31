From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v7 3/5] clk: Supply the critical clock {init, enable,
 disable} framework
Date: Fri, 31 Jul 2015 09:03:50 +0200
Message-ID: <20150731070350.GT2564@lukather>
References: <1437570255-21049-1-git-send-email-lee.jones@linaro.org>
 <1437570255-21049-4-git-send-email-lee.jones@linaro.org>
 <20150727072549.GP2564@lukather>
 <20150727085338.GW3436@x1>
 <20150728114022.GW2564@lukather>
 <20150728130055.GV14943@x1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sCERuZXRFShPQgLr"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150728130055.GV14943@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--sCERuZXRFShPQgLr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2015 at 02:00:55PM +0100, Lee Jones wrote:
> > > I don't think we can use reference counting, because we'd need as
> > > many critical clock owners as there are critical clocks.
> >=20
> > Which we can have if we replace the call to clk_prepare_enable you add
> > in your fourth patch in __set_critical_clocks.
>=20
> What should it be replaced with?

clk->critical_count++
clk_prepare_enable

?

>=20
> > > Cast your mind back to the reasons for this critical clock API.  One
> > > of the most important intentions of this API is the requirement
> > > mitigation for each of the critical clocks to have an owner
> > > (driver).
> > >=20
> > > With regards to your second point, that's what 'critical.enabled'
> > > is for.  Take a look at clk_enable_critical().
> >=20
> > I don't think this addresses the issue, if you just throw more
> > customers at it, the issue remain with your implementation.
> >=20
> > If you have three customers that used the critical API, and if on of
> > these calls clk_disable_critical, you're losing leave_on.
>=20
> That's the idea.  See my point above, the one you replied "Indeed"
> to.  So when a driver uses clk_disable_critical() it's saying, "I know
> why this clock is a critical clock, and I know that nothing terrible
> will happen if I disable it, as I have that covered".

We do agree on the semantic of clk_disable_critical :)

> So then if it's not the last user to call clk_disable(), the last
> one out the door will be allowed to finally gate the clock,
> regardless whether it's critical aware or not.

That's right, but what I mean would be a case where you have two users
that are aware that it is a critical clock (A and B), and one which is
not (C).

If I understood correctly your code, if A calls clk_disable_critical,
leave_on is set to false. That means that now, if C calls clk_disable
on that clock, it will actually be shut down, while B still considers
it a critical clock.

> Then, when we come to enable the clock again, the critical aware user
> then re-marks the clock as leave_on, so not critical un-aware user can
> take the final reference and disable the clock.
>=20
> > Which means that if there's one of the two users left that calls
> > clk_disable on it, the clock will actually be disabled, which is
> > clearly not what we want to do, as we have still a user that want the
> > clock to be enabled.
>=20
> That's not what happens (at least it shouldn't if I've coded it up
> right).  The API _still_ requires all of the users to give-up their
> reference.

Ah, right. So I guess it all boils down to the discussion you're
having with Mike regarding whether critical users should expect to
already have a reference taken or calling clk_prepare / clk_enable
themselves.

>=20
> > It would be much more robust to have another count for the critical
> > stuff, initialised to one by the __set_critical_clocks function.
>=20
> If I understand you correctly, we already have a count.  We use the
> original reference count.  No need for one of our own.
>=20
> Using your RAM Clock (Clock 4) as an example
> --------------------------------------------
>=20
> Early start-up:
>   Clock 4 is marked as critical and a reference is taken (ref =3D=3D 1)
>=20
> Driver probe:
>   SPI enables Clock 4 (ref =3D=3D 2)
>   I2C enables Clock 4 (ref =3D=3D 3)
>=20
> Suspend (without RAM driver's permission):
>   SPI disables Clock 4 (ref =3D=3D 2)
>   I2C disables Clock 4 (ref =3D=3D 1)
>   /*
>    * Clock won't be gated because:
>    *   .leave_on is True - can't dec final reference
>    */
>=20
> Suspend (with RAM driver's permission):
>   /* Order is unimportant */
>   SPI disables Clock 4 (ref =3D=3D 2)
>   RAM disables Clock 4 (ref =3D=3D 1) /* Won't turn off here (ref > 0)
>   I2C disables Clock 4 (ref =3D=3D 0) /* (.leave_on =3D=3D False) last re=
f can be taken */
>   /*
>    * Clock will be gated because:
>    *   .leave_on is False, so (ref =3D=3D 0)
>    */
>=20
> Resume:
>   /* Order is unimportant */
>   SPI enables Clock 4 (ref =3D=3D 1)
>   RAM enables Clock 4 and re-enables .leave_on (ref =3D=3D 2)
>   I2C enables Clock 4 (ref =3D=3D 3)
>=20
> Hopefully that clears things up.

It does indeed. I simply forgot to take into account the fact that it
would still need the reference to be set to 0. My bad.

Still, If we take the same kind of scenario:

Early start-up:
  Clock 4 is marked as critical and a reference is taken (ref =3D=3D 1, lea=
ve_on =3D true)

Driver probe:
  SPI enables Clock 4 (ref =3D=3D 2)
  I2C enables Clock 4 (ref =3D=3D 3)
  RAM enables Clock 4 (ref =3D=3D 4, leave_on =3D true )
  CPUIdle enables Clock 4 (ref =3D=3D 5, leave_on =3D true )

Suspend (with CPUIdle and RAM permissions):
  /* Order is unimportant */
  SPI disables Clock 4 (ref =3D=3D 4)
  CPUIdle disables Clock 4 (ref =3D=3D 3, leave_on =3D false )=20
  RAM disables Clock 4 (ref =3D=3D 2, leave_on =3D false )
  I2C disables Clock 4 (ref =3D=3D 1)

And even though the clock will still be running when CPUIdle calls
clk_disable_critical because of the enable_count, the status of
leave_on is off, as the RAM driver still considers it to be left on
(ie, hasn't called clk_disable_critical yet).

Or at least, that's what I understood of it.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--sCERuZXRFShPQgLr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVux3WAAoJEBx+YmzsjxAgOnoQAI+WUAFcwbccDsDmuTEVaS8o
ZEs8JB7iK43L2UcW+za6kwKOxjQftWGXYJpEnqZOqKxjOOVCTYzda5ktZQUjxIdP
9ITKPrOT8sZjzosoM1vcqMrnYWdjFBtgT5jz9VaV5d3aEop/r3jgB4dbZ01ckbSb
zmx3SJntwFTcCNlpme/QKsgdWEV4gpmOFluSIGJ6H1iPC4srSjC7ARmtXukOLOxj
mgGc7CJcO9HU2v/vfBMpVNgn4VnS1ZGGXO1wx7+8Uq2kQhXuy/jBi/85yHXq7zcB
rtuoIfocyPVciGGEvjMS0eMf8XAFJz5gVx+phQx1qHdvDj7FFLSDgYnLLoiImQbm
fXwz1nW5W0DpWUkLVdQLVuErOp9aizZFpa5AFTlKt4sPM/ZazauADpke+GuVQqAL
GmbxyTQzbCyQLwK9iXDh/bUT2BxQgPRO9q1pCoP7t//lFYfiAFoZJNTBDx5jdRys
lAYRQAswWFHbd2TO45d0ZX/QjZ9Dsn3htQgxVnuioBLKzBkQgRbWgr2k/68cUexx
TsfMtx+xMTmtxvaT72edTGlmpmsRCEDQconU2ADd7bk0nQ0UoVheORWPzB4aKSI9
8+YbNBmtFOVUNsjXOQLsitpAXlt9gED5QXMe9yh3l2SxhiMPoK6r0qWuVRxxxwWv
iNBLIKHJUqf+NIHRWNUy
=Cx2k
-----END PGP SIGNATURE-----

--sCERuZXRFShPQgLr--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
