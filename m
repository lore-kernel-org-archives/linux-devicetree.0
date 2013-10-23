From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Wed, 23 Oct 2013 22:35:50 +0200
Message-ID: <20131023203549.GE8828@mithrandir>
References: <52658EBC.8020800@wwwdotorg.org>
 <alpine.LFD.2.03.1310211632460.1951@syhkavp.arg>
 <20131022093923.GC15640@ulmo.nvidia.com>
 <20131022150426.GF29341@beef>
 <20131022171346.GE4061@obsidianresearch.com>
 <20131023080630.GA14413@netboy>
 <20131023094903.GD11954@ulmo.nvidia.com>
 <20131023171620.GA5208@netboy>
 <alpine.LFD.2.03.1310231355160.1951@syhkavp.arg>
 <20131023181328.GF5208@netboy>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FN+gV9K+162wdwwF"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131023181328.GF5208@netboy>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--FN+gV9K+162wdwwF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2013 at 08:13:55PM +0200, Richard Cochran wrote:
> On Wed, Oct 23, 2013 at 01:55:24PM -0400, Nicolas Pitre wrote:
> > On Wed, 23 Oct 2013, Richard Cochran wrote:
> > > I still don't understand why someone (linario?) can't host an
> > > arm-dt-devel tree that allows the freedom to change bindings and
> > > features the best source for supporting the latest ARM SoCs. I don't
> > > buy the argument that only Linus' tree gets enough testing. If another
> > > tree really is the best ARM tree, then it will get plenty of attention
> > > and testing.
> >=20
> > So you're basically saying that we should split the development effort=
=20
> > across multiple trees instead of encouraging people to converge on the=
=20
> > same tree?  This is completely contrary to all the efforts we've been=
=20
> > deploying to encourage people to submit their code upstream.
>=20
> No, just a single tree, please.

In that case, why not just go one step further and leave out that
intermediary tree in the first place? If only code that's completely
finished and never subject to change goes into the upstream kernel, then
it's very unlikely that we'll ever see any support at all for new SoCs
upstream. What would be the incentive for vendors to upstream code if
there's another canonical tree that users can pull from. How is that
different from any other vendor tree?

> > ii> As an end user, I don't mind waiting for a feature if that means
> > > stability and QA. If I get impatient, still I always have the choice
> > > to take a development version. But I do not want to be forced to take
> > > unfinished work in a released kernel.
> >=20
> > If as an end user you want full QA, you should go with a distro kernel.
>=20
> No, no, NO! I won't ship a distro kernel because they screw things
> up (at least, in my experience). I will ship a 3.x.y stable kernel,
> though.

If you want full QA and feature set, perhaps you should be using a
vendor kernel.

> > We're talking about the upstream kernel here, and given the current=20
> > development and release rate we hardly can guarantee you that it'll be=
=20
> > free of unfinished work (as long as it doesn't regress existing=20
> > features).
>=20
> I read a quote from a Big Cheese saying how the Linux kernel is a
> stable release cycle. There are bugs, to be sure, but, in my
> experience, each release is pretty stable on x86 (but not on arm).

I've already stated this elsewhere, but I'll gladly repeat it here: the
DT, whether with or without stable bindings, should not influence the
stability of the kernel as a whole. That's why I prefer to refer to
bindings that aren't finalized yet as "experimental" rather than
"unstable". Any driver using any binding should not crash if that
binding doesn't look like what it expects.

I also think it's accepted for things to not be perfect from the start.
Nobody expects support for an SoC to be rock-solid when merged. Often
you can't do very much with the initial SoC support when it is merged,
so whether it's stable or not is largely irrelevant.

Thierry

--FN+gV9K+162wdwwF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSaDMlAAoJEN0jrNd/PrOhQ28P/AjgBRrMf8OwLr+H9fV91QpX
t2wAT9DlqD4L9R0toGZ6sAA6dd/60F10JH75zD9GbFqZJWNOWz4so3nbru9t5vmR
mUuzzDCaTdKyFwwJAvWaEUEnglrrJygBhl620ZYm+T6Ggs4KT1S0Mz4/LY42j/fz
YdOENW9NUtjKrWUS8L1UDb9Q4D4MPGejR5Q2gom6d3a3U1bOxIZpg7WzNVYMH8L3
38GgMdH3Hs68A1MX+bymi8/K+li4b7Ai4MmO1W6w0329Zq0sdzLtUVyAE2QTmGUJ
5sxvUnxck14u6kwIOkvDvdJ8M074cBgPAELzm0YWWo82Ul/8Y3oQjWOIVMOd15oZ
fiFTNXFPQiiEQp7BLM/5IKlYBOamcwZLQ4nEM2tyv2lZBfyKy5AZkCZYu+Fq0plO
FhTy0HdT2Z+24kQjwnUgLqNbPGRkdjUE4/BWksGzFWnTFeo4GRPvut5kVa1P4ZAS
8JO4rssWIggteR8Aq9Z/gY2AXxCenrXdWEAhTX031EoP83G0F/l6ZvkPm89MZisw
05Yk8s9ORNywd3TsEw1BNmqycPE5JIJPLSX9eBPAvTzEWkEBghT8MEL2Tq2zcP5v
fKqYidy4cAUDx+P4wzqMo8Ngo8CwUirh6vpaj5fWAXUebK1WSzJmmw0PRPszIOr2
JxwEcurI9NFt8oxkHCZx
=O+cX
-----END PGP SIGNATURE-----

--FN+gV9K+162wdwwF--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
