From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] [RFC] of: Allow for experimental device
 tree bindings
Date: Fri, 25 Oct 2013 10:22:30 +0200
Message-ID: <20131025082229.GD19622@ulmo.nvidia.com>
References: <1382540779-6334-1-git-send-email-treding@nvidia.com>
 <1382544332.8522.40.camel@shinybook.infradead.org>
 <20131023185114.GA7863@ulmo.nvidia.com>
 <52699E8B.3000305@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sXc4Kmr5FA7axrvy"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52699E8B.3000305-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--sXc4Kmr5FA7axrvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2013 at 11:26:19PM +0100, Stephen Warren wrote:
> On 10/23/2013 07:51 PM, Thierry Reding wrote:
> > On Wed, Oct 23, 2013 at 05:05:32PM +0100, David Woodhouse wrote:
> >> On Wed, 2013-10-23 at 17:06 +0200, Thierry Reding wrote:
> >>> +       /* check if binding is experimental */
> >>> +       if (dev !=3D device || drv !=3D driver) {
> >>> +               pr_warn("of: device %s (%s) uses an experimental bind=
ing\n",
> >>> +                       np->name, np->full_name);
> >>> +
> >>
> >> In the discussions earlier I think we decided that this should set a
> >> taint flag too.
> >=20
> > A taint flag seems somewhat drastic. It's not like using an experimental
> > binding should have an influence on the stability of the running kernel.
> > I always thought that taint flags were supposed to flag conditions where
> > code of unknown origin or code known to be broken was being executed
> > because they may destabilize the running kernel.
> >=20
> > The worst that should happen if you run an experimental binding is that
> > some part of the system will just not come up.
>=20
> IIRC, the purpose of the taint flag was to make it clear that the kernel
> or DT was not expected to function in the future, so don't be surpised
> if you upgrade it, and it stops working, without you taking explicit
> action, such as revising your DT to match the new kernel or vice-versa.

I understand that, but I was arguing that it doesn't match existing uses
of taint flags. The various flags that are currently defined all seem to
be set whenever some event occurs that could cause instability of the
currently running system, such as loading a proprietary or out-of-tree
module, forcing a module to be loaded, overriding firmware parameters...

All those seem to have the goal of appearing in crash logs, so that
whoever looks at the bug report can point users somewhere else since the
problem is likely to be caused by their own (bad) decision. Or ask users
to reproduce crashes or bugs without doing whatever they did to cause
the taint flag(s) to be set.

Experimental bindings shouldn't cause any crashes in the first place, or
not cause memory corruption or similar for that matter. If we don't want
to support an experimental binding, then all we should do is not support
any functionality that relies on them. That doesn't mean that runtime
stability is in any way affected.

Thierry

--sXc4Kmr5FA7axrvy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSaipFAAoJEN0jrNd/PrOhX4sQAL5RrPURiC4XW6hIl3v+5Xje
k6pPi0C2hXEZieQEYplbcEteVBRhoCBOqGnTLFmTVT9bkbm4JUdBfFnLL1yGfWr9
YqFHq6O8R/8hg7ACHr5W0EBOQ+nBlEVySTmSd3fwY5mJVfhGprKETzWBkZ+ZODVQ
csq/VVkGFOJYgcPHuKzmWa2Pnk3C00mm1K2KFAwE3wk/pdWwvO3QQxLUYYFz3Z35
QWJ9ydVopkOrC1cv+3gPIkIcypzysY0wStUl8h8ocRZzvAxO5dw+rQmh44ChQdE8
Qq17GvUf1Fvv3qsaC3PN85ES+jHtAPWgzENPKbkc27K8bGFQNCAT368R6/SU3VPg
nd+B1qE/lP+33Fc/z8Hiqk2lHot1GINAXY9Fn4bpP1e7WnGmkBcFvxBthHzPFL1A
m2+chh3ZmVXVceKCoAvDtUsb7iTpKfizGI6seCcyxGUqhmH89mh6i/nMapPI+N5j
cl2+Z6cSdqmIL//WXQhsjdmV/emF+KRxkQApoaWD0Q4I9qILzIvGHdopnvZCmn5O
teC1i5fASAnkIdqXJAgj7McYqk0MtPszlRZV9aZdqueZftXg/GX62BBWP8SxIbws
QsldjFScUjNC5MEKyIE7qt/q4DO6aYK23FKAFGGV33ckbiSynb5vC4WtmwHi/2Ch
FxFY8ldkqo9FxPw0g3Ic
=Efcb
-----END PGP SIGNATURE-----

--sXc4Kmr5FA7axrvy--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
