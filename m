From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v7 3/5] clk: Supply the critical clock {init, enable,
 disable} framework
Date: Fri, 31 Jul 2015 09:48:30 +0100
Message-ID: <20150731084830.GC3208@x1>
References: <1437570255-21049-1-git-send-email-lee.jones@linaro.org>
 <1437570255-21049-4-git-send-email-lee.jones@linaro.org>
 <20150727072549.GP2564@lukather>
 <20150727085338.GW3436@x1>
 <20150728114022.GW2564@lukather>
 <20150728130055.GV14943@x1>
 <20150731070350.GT2564@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150731070350.GT2564@lukather>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, mturquette@linaro.org, sboyd@codeaurora.org, devicetree@vger.kernel.org, geert@linux-m68k.org, s.hauer@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Fri, 31 Jul 2015, Maxime Ripard wrote:

> On Tue, Jul 28, 2015 at 02:00:55PM +0100, Lee Jones wrote:
> > > > I don't think we can use reference counting, because we'd need =
as
> > > > many critical clock owners as there are critical clocks.
> > >=20
> > > Which we can have if we replace the call to clk_prepare_enable yo=
u add
> > > in your fourth patch in __set_critical_clocks.
> >=20
> > What should it be replaced with?
>=20
> clk->critical_count++
> clk_prepare_enable
>=20
> ?

Ah, so not replace it then.  Just add a reference counter.

I'm with you, that's fine.

> > > > Cast your mind back to the reasons for this critical clock API.=
  One
> > > > of the most important intentions of this API is the requirement
> > > > mitigation for each of the critical clocks to have an owner
> > > > (driver).
> > > >=20
> > > > With regards to your second point, that's what 'critical.enable=
d'
> > > > is for.  Take a look at clk_enable_critical().
> > >=20
> > > I don't think this addresses the issue, if you just throw more
> > > customers at it, the issue remain with your implementation.
> > >=20
> > > If you have three customers that used the critical API, and if on=
 of
> > > these calls clk_disable_critical, you're losing leave_on.
> >=20
> > That's the idea.  See my point above, the one you replied "Indeed"
> > to.  So when a driver uses clk_disable_critical() it's saying, "I k=
now
> > why this clock is a critical clock, and I know that nothing terribl=
e
> > will happen if I disable it, as I have that covered".
>=20
> We do agree on the semantic of clk_disable_critical :)
>=20
> > So then if it's not the last user to call clk_disable(), the last
> > one out the door will be allowed to finally gate the clock,
> > regardless whether it's critical aware or not.
>=20
> That's right, but what I mean would be a case where you have two user=
s
> that are aware that it is a critical clock (A and B), and one which i=
s
> not (C).
>=20
> If I understood correctly your code, if A calls clk_disable_critical,
> leave_on is set to false. That means that now, if C calls clk_disable
> on that clock, it will actually be shut down, while B still considers
> it a critical clock.

Hmm... I'd have to think about this.

How would you mark a clock as critical twice?

> > Then, when we come to enable the clock again, the critical aware us=
er
> > then re-marks the clock as leave_on, so not critical un-aware user =
can
> > take the final reference and disable the clock.
> >=20
> > > Which means that if there's one of the two users left that calls
> > > clk_disable on it, the clock will actually be disabled, which is
> > > clearly not what we want to do, as we have still a user that want=
 the
> > > clock to be enabled.
> >=20
> > That's not what happens (at least it shouldn't if I've coded it up
> > right).  The API _still_ requires all of the users to give-up their
> > reference.
>=20
> Ah, right. So I guess it all boils down to the discussion you're
> having with Mike regarding whether critical users should expect to
> already have a reference taken or calling clk_prepare / clk_enable
> themselves.

Then we'd need a clk_prepare_enable_critical() :)

=2E.. which would be aware of the original reference (taken by
__set_critical_clocks).  However, if a second knowledgeable driver
were to call it, then how would it know that whether the original
reference was still present or not?  I guess that's where your
critical clock reference comes in.  If it's the first critical user,
it would decrement the original reference, it it's a subsequent user,
then it won't

> > > It would be much more robust to have another count for the critic=
al
> > > stuff, initialised to one by the __set_critical_clocks function.
> >=20
> > If I understand you correctly, we already have a count.  We use the
> > original reference count.  No need for one of our own.
> >=20
> > Using your RAM Clock (Clock 4) as an example
> > --------------------------------------------
> >=20
> > Early start-up:
> >   Clock 4 is marked as critical and a reference is taken (ref =3D=3D=
 1)
> >=20
> > Driver probe:
> >   SPI enables Clock 4 (ref =3D=3D 2)
> >   I2C enables Clock 4 (ref =3D=3D 3)
> >=20
> > Suspend (without RAM driver's permission):
> >   SPI disables Clock 4 (ref =3D=3D 2)
> >   I2C disables Clock 4 (ref =3D=3D 1)
> >   /*
> >    * Clock won't be gated because:
> >    *   .leave_on is True - can't dec final reference
> >    */
> >=20
> > Suspend (with RAM driver's permission):
> >   /* Order is unimportant */
> >   SPI disables Clock 4 (ref =3D=3D 2)
> >   RAM disables Clock 4 (ref =3D=3D 1) /* Won't turn off here (ref >=
 0)
> >   I2C disables Clock 4 (ref =3D=3D 0) /* (.leave_on =3D=3D False) l=
ast ref can be taken */
> >   /*
> >    * Clock will be gated because:
> >    *   .leave_on is False, so (ref =3D=3D 0)
> >    */
> >=20
> > Resume:
> >   /* Order is unimportant */
> >   SPI enables Clock 4 (ref =3D=3D 1)
> >   RAM enables Clock 4 and re-enables .leave_on (ref =3D=3D 2)
> >   I2C enables Clock 4 (ref =3D=3D 3)
> >=20
> > Hopefully that clears things up.
>=20
> It does indeed. I simply forgot to take into account the fact that it
> would still need the reference to be set to 0. My bad.
>=20
> Still, If we take the same kind of scenario:
>=20
> Early start-up:
>   Clock 4 is marked as critical and a reference is taken (ref =3D=3D =
1, leave_on =3D true)
>=20
> Driver probe:
>   SPI enables Clock 4 (ref =3D=3D 2)
>   I2C enables Clock 4 (ref =3D=3D 3)
>   RAM enables Clock 4 (ref =3D=3D 4, leave_on =3D true )
>   CPUIdle enables Clock 4 (ref =3D=3D 5, leave_on =3D true )
>=20
> Suspend (with CPUIdle and RAM permissions):
>   /* Order is unimportant */
>   SPI disables Clock 4 (ref =3D=3D 4)
>   CPUIdle disables Clock 4 (ref =3D=3D 3, leave_on =3D false )=20
>   RAM disables Clock 4 (ref =3D=3D 2, leave_on =3D false )
>   I2C disables Clock 4 (ref =3D=3D 1)
>=20
> And even though the clock will still be running when CPUIdle calls
> clk_disable_critical because of the enable_count, the status of
> leave_on is off, as the RAM driver still considers it to be left on
> (ie, hasn't called clk_disable_critical yet).
>=20
> Or at least, that's what I understood of it.

Right, I understood this problem when you suggested that two critical
clock users could be using the same clock.  Other than having them
call clock_prepare_enable[_critical](), I'm not sure if that's
possible.

As I mentioned above, we can handle this with reference counting and
I'm happy to code that up.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
