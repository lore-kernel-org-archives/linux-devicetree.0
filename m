From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] clocksource: Do not drop unheld reference on device node
Date: Fri, 22 Nov 2013 20:22:57 +0100
Message-ID: <20131122192257.GX28642@pengutronix.de>
References: <1382136588-15320-1-git-send-email-treding@nvidia.com>
 <20131122161607.GA5088@ulmo.nvidia.com>
 <528F86F2.40706@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <528F86F2.40706-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 22, 2013 at 05:31:46PM +0100, Daniel Lezcano wrote:
> On 11/22/2013 05:16 PM, Thierry Reding wrote:
> >On Sat, Oct 19, 2013 at 12:49:48AM +0200, Thierry Reding wrote:
> >>When booting a recent kernel on ARM with OF_DYNAMIC enabled, the ke=
rnel
> >>warns about the following:
> >>
> >>	[    0.000000] ERROR: Bad of_node_put() on /timer@50004600
> >>	[    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 3.12.0-rc=
5-next-20131017-00077-gedfd827-dirty #406
> >>	[    0.000000] [<c0015b68>] (unwind_backtrace+0x0/0xf4) from [<c00=
117e4>] (show_stack+0x10/0x14)
> >>	[    0.000000] [<c00117e4>] (show_stack+0x10/0x14) from [<c055f734=
>] (dump_stack+0x9c/0xc8)
> >>	[    0.000000] [<c055f734>] (dump_stack+0x9c/0xc8) from [<c03b47d4=
>] (of_node_release+0x90/0x9c)
> >>	[    0.000000] [<c03b47d4>] (of_node_release+0x90/0x9c) from [<c03=
b5084>] (of_find_matching_node_and_match+0x78/0xb4)
> >>	[    0.000000] [<c03b5084>] (of_find_matching_node_and_match+0x78/=
0xb4) from [<c07887c8>] (clocksource_of_init+0x60/0x70)
> >>	[    0.000000] [<c07887c8>] (clocksource_of_init+0x60/0x70) from [=
<c076e99c>] (start_kernel+0x1f4/0x33c)
> >>	[    0.000000] [<c076e99c>] (start_kernel+0x1f4/0x33c) from [<8000=
8074>] (0x80008074)
> >>
> >>This is caused by clocksource_of_init() dropping a reference on the
> >>device node that it never took. The reference taken by the loop is
> >>implicitly dropped on subsequent iterations. See the implementation=
 of
> >>and the comment on top of the of_find_matching_node_and_match()
> >>function for reference (no pun intended).
I only saw the end of the comment saying:

	Returns a node pointer with refcount incremented, use
	of_node_put() on it when done.

Maybe that could be improved to something like:

/**
 * of_find_matching_node_and_match - Find a node based on an of_device_=
id
 *                                   match table
 * @from: The node to start searching from or NULL, the node you pass
 *        will not be searched, only the next one will; typically, you
 *        pass what the previous call returned.
 * @matches: ...
 * @match: ...
 *
 * Reference counting: Puts a reference on @from and increases the
 * reference count of the returned node.
 */

> >>
> >>Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>---
> >>  drivers/clocksource/clksrc-of.c | 1 -
> >>  1 file changed, 1 deletion(-)
> >
> >Can someone look at this?
>=20
> Yes. Sounds like I missed it.
>=20
> This regression has been introduced by:
>=20
> commit 326e31eebe61dc838e031ea16968b2cfb43443e3
> Author: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Date:   Tue Oct 1 11:00:53 2013 +0200
>=20
>     clocksource: Put nodes passed to CLOCKSOURCE_OF_DECLARE
> callbacks centrally
>=20
>     Instead of letting each driver call of_node_put do it centrally i=
n the
>     loop that also calls the CLOCKSOURCE_OF_DECLARE callbacks. This i=
s less
>     prone to error and also moves getting and putting the references
> into the
>     same function.
>=20
>     Consequently all respective of_node_put calls in drivers are remo=
ved.
>=20
>     Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org=
>
>     Signed-off-by: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>     Acked-by: David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Still all but the hook in clocksource_of_init of this commit was
correct, right? (Well, but this buggy hunk makes the commit log wrong.)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
