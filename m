From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: Userspace and Device-Tree
Date: Fri, 28 Aug 2015 18:57:42 +0100
Message-ID: <20150828175742.GG31748@leverpostej>
References: <01e601d0e0f9$614450d0$23ccf270$@gmail.com>
 <20150828101227.GD31748@leverpostej>
 <CAPiN7iV6LF6LtatzCQ5H6Nq=WivE+e4Z1OsA5cArkEZKqwPLBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPiN7iV6LF6LtatzCQ5H6Nq=WivE+e4Z1OsA5cArkEZKqwPLBQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Read <chrisrfq-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

Please reply in plain text rather than HTML in future, as the latter
makes conversation far more awkward than it needs to be.

On Fri, Aug 28, 2015 at 06:24:54PM +0100, Chris Read wrote:
>    On Fri, Aug 28, 2015 at 3:12 AM, Mark Rutland <[1]mark.rutland@arm=
=2Ecom>
>    wrote:

[...]

>    The issue I see is that drivers may want to expose something in on=
e case,
>    but not in another, in a very board-specific way.=C2=A0 For exampl=
e an I2C GPIO
>    expander has a driver that allows reading and writing the GPIOs th=
at it
>    provides.=C2=A0 In one system the GPIOs control power switches and=
 the DT
>    is used to connect them to regulators, and they are activated as d=
evice
>    files are opened.=C2=A0 There is no need to expose any GPIOs to us=
erspace.
>    On another board the GPIOs are attached to a connector that is int=
ended
>    for customization by an end user.=C2=A0 The same driver will want =
to expose
>    the GPIOs to userspace in one case, but not in another.=C2=A0 Thus=
 I see a
>    need for some kind of board-specific configuration mechanism--with=
out
>    a "board file". It doesn't need to be DT.

In the case described, the distinction of being exposed on an
externally-accessible connector is something that could be described in
DT, with labels for the external connector IDs to make it nice and
simple for the user. Note that this is a physical property of the board
(GPIO X is connected to an external pin, where it is known as
"GPIO_FOO") rather than a policy (allow the user to arbitrarily control
GPIO X), but could be used to drive policy decisions (e.g. anything
exposed external could be placed under the control of the user).

Generally, users may have reasons to want to fiddle with GPIOs (or othe=
r
resources) that were not intended for their use at hardware design time
or DTB creation time, in much the same way as they might want to fiddle
with /dev/mem. Which is one reason I believe that this is a policy
issue.

If you can capture a physical distinction, then I don't have a problem
with that distinction being described in DT. However, the policy applie=
d
to that is orthogonal to that.

>      > P.S. I had another (unrelated) thought about DT.=C2=A0 Since D=
T is used to
>      link
>      > HW components together, and HW drivers make queries of the DT =
to make
>      > bindings, would it make sense to have some kind of a DT templa=
te (i.e.
>      small
>      > .dtsi file) that corresponds to each driver reside in the dire=
ctory
>      with
>      > each driver.=C2=A0 Board device trees would reference these te=
mplates, and
>      > include references to relevant parameters that they specify.=C2=
=A0 This
>      might
>      > also help make board DT device instances more uniform between =
=2Edts
>      files.
>=20
>      As far as I can tell, all of this is simply applying a policy at=
op of
>      the hardware we have. We already have subsystems and udev for de=
aling
>      with that, and we should enhance those if necessary rather than =
trying
>      to place this in DT.
>=20
>    I don't see this as strictly a policy issue, because it's so
>    board-specific.
>    A policy would need to allow for features like GPIOs to be both ex=
posed or
>    to not be exposed, but in a board-specific way.
>    I see a strong need for board-specific configuration of drivers as=
 they
>    apply
>    to exposure to userspace, but that need does not yet seem well add=
ressed.
>    There are some kernel modules (such as userspace-consumer.c) that =
are
>    specifically designed to assist with this, but without some way to=
 specify
>    how to hook them up to other devices, they aren't available.

I disagree, and believe that this is very much a policy issue, just one
that's made worse by a lack of information allowing the kernel and/or
userspace to make any reasonable informed decision.

As above, if you can capture a distinction at the hardware level, I do
not have a problem with that being described in DT.=20

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
