From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] OF: base: match each node compatible against all
 given matches first
Date: Wed, 4 Dec 2013 15:04:59 +0100
Message-ID: <20131204140457.GA2272@ulmo.nvidia.com>
References: <1385663785-8643-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <1386078720-8756-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <alpine.SOC.1.00.1312032210480.25191@math.ut.ee>
 <529E614B.3070307@gmail.com>
 <20131204094010.GO19943@ulmo.nvidia.com>
 <alpine.SOC.1.00.1312041506010.8902@math.ut.ee>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.SOC.1.00.1312041506010.8902-ptEonEWSGqKptlylMvRsHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Meelis Roos <mroos-Y27EyoLml9s@public.gmane.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2013 at 03:08:39PM +0200, Meelis Roos wrote:
> > I added Meelis on Cc because he found a regression with my original
> > proposal (107a84e61cdd "of: match by compatible property first"). That
> > got later reverted in commit bc51b0c22ceb (Revert "of: match by
> > compatible property first"). Here's the commit message for reference:
> >=20
> > commit bc51b0c22ceb
> > Author: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
> > Date:   Tue Jul 10 12:49:32 2012 -0700
> >=20
> >     Revert "of: match by compatible property first"
> >=20
> >     This reverts commit 107a84e61cdd3406c842a0e4be7efffd3a05dba6.
> >=20
> >     Meelis Roos reports a regression since 3.5-rc5 that stops Sun Fire =
V100
> >     and Sun Netra X1 sparc64 machines from booting, hanging after enabl=
ing
> >     serial console.  He bisected it to commit 107a84e61cdd.
> >=20
> >     Rob Herring explains:
> >      "The problem is match combinations of compatible plus name and/or =
type
> >       fail to match correctly.  I have a fix for this, but given how la=
te it
> >       is for 3.5 I think it is best to revert this for now.  There coul=
d be
> >       other cases that rely on the current although wrong behavior.  I =
will
> >       post an updated version for 3.6."
> >=20
> >     Bisected-and-reported-by: Meelis Roos <mroos-Y27EyoLml9s@public.gmane.org>
> >     Requested-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> >     Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> >     Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> >     Signed-off-by: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
> >=20
> > So if Meelis still has access to the Sun Fire V100 and Sun Netra X1
> > machines that regressed last time around, it'd be great to get this
> > patch tested on them to verify that it indeed fixes the problem and
> > doesn't regress.
>=20
> OK, I had forgotten about that.

Yeah, I had always meant to come back to it, but that never quite
happened, so I'm all the more glad that Sebastian took over.

> Tested successfully on the same Sun Fire V100 and Sun Netra X1, on top=20
> of 3.13-rc2. The sunsu console is detected fine and I see no problem for=
=20
> now.

Excellent. Thanks for testing!

Rob, I guess this should be reasonable safe then to take for a spin in
linux-next?

Thierry

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSnzaJAAoJEN0jrNd/PrOhvm4QAIpXTYGYgwUTzndgfiMOx1Ax
j34bf4q2SJSyqxp6TY/7lHpNd3epqsAyK0r5AKh4YX2adJMt6Z4o2WKouP3eAzNa
9fPvLWSh7j5TKf6KDAAJAuM6SI6X3yH6H6mNn95yz3MyE4aieB7hziXPfRACYWLc
NO4mmApG5pO7F5+JiMLI81vbfRae23lp/swg1/OSCjc2Cvvw8mQlt3hT7QV8nOMt
+X125WK0WPstc4ERy3EyUHv5rFpJPQWeuN92j1AIcgOn01tXZFzdJP3oWqmbiFEE
2BM2ufZaqVpqE8SdMSobNTU5Y+kJJ1yY2uFjGSYq2rlzphwhr6RPJn+qtK2RV95I
SQLeQVrra6WYtNsN2IDx6vvJL6xmCCBmmGDcWdwFB/MupksPe6NzKLoQlqO/0u7y
GB9rYSP2dNship0o4TzIcXeg+vA+45kYwCbx2UtTuhX8T39ZJtxZwnW1dorymKsN
DnxdAEQHJ/GgpKJvkAKKSp/ixsXiZ0uJyIPL5MxOkUeMQdvrJAduO5iyxvN2bc8V
JRkJyCjDd7MF68XxsQLp14ELwEjujzarPOgGb5SfZnX6hLUb9xqZXS8yNSzALQYk
hWjkTEh0W7EAZmahu3H2Tm3b63fv6PdQanJk4fDt0K34Z7MsS7kUXyzInQiiRWz6
dOoqEwHi1vUQXiItKGNZ
=R4EY
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
