From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: arm/marvell: ABI unstability warning
 about Marvell 7K/8K
Date: Thu, 25 Feb 2016 13:09:06 -0800
Message-ID: <20160225210906.GS4736@lukather>
References: <1456327007-31008-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1456327007-31008-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160224172545.GC9137@leverpostej>
 <20160224211045.379352d3@free-electrons.com>
 <CAL_JsqLevrujSeYNBvSJA-5T0Ho8y7c0fKid7QvVm8LLvYLotw@mail.gmail.com>
 <20160225090927.13492cfb@free-electrons.com>
 <20160225161642.GC10593@leverpostej>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BuGwuXnZwGGQ9GEc"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160225161642.GC10593@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Neta Zur Hershkovits <neta-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--BuGwuXnZwGGQ9GEc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 25, 2016 at 04:16:47PM +0000, Mark Rutland wrote:
> On Thu, Feb 25, 2016 at 09:09:27AM +0100, Thomas Petazzoni wrote:
> > Hello Rob,
> >=20
> > On Wed, 24 Feb 2016 16:07:04 -0600, Rob Herring wrote:
> >=20
> > > You should fix the incomplete information problem. I pushed back on
> > > this, you got more information and already the binding is closer to
> > > reality.
> >=20
> > "You should fix the incomplete information problem". You seem to think
> > that it is a simple thing that can be fixed with a magic wand. But it's
> > not.
> >=20
> > Either because the internal processes are complicated, or simply
> > because the Linux kernel support is done without cooperation from the
> > HW vendor (it's not the case of this Marvell platform, but it's the
> > case of many other platforms).
>=20
> Yes, this is a problem in some cases, and that should be considered in
> those cases. There are always shades of grey.
>=20
> Per the above, that isn't relevant in this case. This is a pretty
> black-and-white stand against the usual rules.

Unless your stance, at least on the sunxi discussion was pretty much
black-and-white too. You basically said that we were supposed to
maintain a stable ABI starting right now, even though we know for a
fact that we have bindings that are simply not working.

> > > Mark didn't say don't submit. First, there is value in submitting even
> > > if not accepted immediately and you have to carry some patches for
> > > some time. It was also suggested that you err on the side of less
> > > information in DT if things are uncertain and you have not done that.
> >=20
> > Submitting without merging is useless. The point of submitting is to
> > get the code merged, to reduce the amount of out-of-tree patches we
> > have to carry, and to allow users of the platform to simply run
> > mainline on their platform.
>=20
> Submitting prototypes and RFCs is the usual way we get things reviewed
> early, and to allow maintainers and others to get a feel for things
> earlier. Submitting patches _for merging_ when you're not sure about
> things and don't want to agree to support them is what's being pushed
> back on.

Just to make sure we're on the same page, are you saying that we must
not merge code unless we're 100% sure of how it works, in its
entirety?

> > So this proposal really doesn't make any sense. Just like Mark initial
> > statement of not submitting code so early.
>=20
> As what I said was evidently ambiguous, I'm on about code being _merged_
> prior to being ready. Code and bindings should certainly be posted for
> review as soon as possible. However, it should be recognised when things
> aren't quite ready for mainline.
>=20
> Even if something's unclear about a device, you can highlight more
> general issues (e.g. problematic edge cases in common subsystem code),
> and that's possible to have merged even if the binding isn't ready.
>=20
> If you're unsure about something, but still want it merged, then you
> have to commit to maintaining that as far as reasonably possible, even
> if it turns out to not be quite right.

Except that *you* are forcing us to maintain code to deal with a use
case that simply doesn't happen, which is the definition of dead code.

Would you be ok to be forced to maintain dead code?

You've been talking about theorical use-cases, do you have any real
world one where someone actually made a case for this DT as an ABI
non-sense?

I mean, we've had the U-Boot sunxi maintainer saying they didn't care,
and actually arguing against it.

As it turns out, he's also involved in the Fedora port. If it was a
pain point for them, don't you think he would have raised it?

The only ones that seem to have a problem with it are the one not
involved in it in any way.

>=20
> > > > So please get to an agreement between DT binding maintainers. And s=
top
> > > > saying this ridiculous statement that HW vendors should stop submit=
ting
> > > > their code to the mainline.
> > >=20
> > > You want us to agree, then you won't like the answer. Bindings must be
> > > stable. I'll allow exceptions to that, but not without push back.
> > >=20
> > > In general, if there is disagreement about whether stability is
> > > required, then it is required. See the recent sunxi discussion. That's
> > > more between users and platform maintainers though.
> >=20
> > Do you realize that this all DT binding stuff is today the *biggest* to
> > getting HW support in the Linux kernel? It has become more complicated
> > to merge a 4 properties DT binding than to merge multiple thousands of
> > lines of driver code.=20
>=20
> As times have changed, pain points have moved around.
>=20
> To some extent that is unavoidable; more up-front effort is required
> where crutches we previously relied on are not applicable.
>=20
> Elsewhere we can certainly do better.
>=20
> Throwing your hands up and stating "this is unstable, it might change"
> is a crutch. It prevents any real solution to the pain points you
> encounter, and creates pain points for others. It only provides the
> _illusion_ of support.

https://kernelci.org/soc/mvebu/
https://kernelci.org/soc/sunxi/

I guess we should become magicians.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--BuGwuXnZwGGQ9GEc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWz21yAAoJEBx+YmzsjxAgDikP/RPlrRB+aBGyih/sTKjyWbcy
1QrE9oEEFdFi8oAn5ZeKdKvF8sMzudcIKdx7fTcAFNoZURvV/JZf63lYskzqUTSE
oom7ehMnheQJS5loREOyCPTu6ovcHWw6AuqM68saZALH+gN7h6znw8YJNBVPuAbv
xX+4Ed7LA/zwljCwmQ/+BiCz4zeVC1VdWqF9RQislKP9nLSC4EkKr6A48LY734hY
rvUdKYK0cy/YRMtq5Ckxqd4SKxCBJ7x6eGqm9SUgN6YgcNeFsILwtvU3krWrq7mm
HrJVjWREQVqTN/iIEXEoatioP0e5G6VMimHT7nf+oufyunS6l8BLi88J19KGYy9V
+sMfxCeJxHHJYOEtBhF6jLjAOpZear46e6ESOmBtU+XczVD7rUHAna1+ivLiMTNu
OXocdVEUbCm97XHpmI4WeSWTm+X1+QCPFMTLQ1RpJ+yCOde3pk8rlA+ESLb8Awgr
N1Wi49G3O0/Kzi0S6UOTlYdQuAvztAYP0vNRAeiW0ftxpGmwHndl+pqAZ/tEhDPg
vwyafVAPip5psxIlXEoZA71XHWwQhnasp7ooUlNuIm5GMA2q8ouIYJRutoN2sVff
enQShpBu+DIqbrzCvqytBnRI6sK7H8u8+4F5CS5QqMzsjqHOYcWF1+fA5LZDejOy
tcWAr4EwB+qHnYnkA1WF
=43KT
-----END PGP SIGNATURE-----

--BuGwuXnZwGGQ9GEc--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
