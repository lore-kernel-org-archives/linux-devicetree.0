From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Wed, 23 Oct 2013 11:02:29 +0200
Message-ID: <20131023090228.GB11954@ulmo.nvidia.com>
References: <20131020220839.GT2443@sirena.org.uk>
 <5264576F.6050307@wwwdotorg.org>
 <alpine.LFD.2.03.1310201911190.1951@syhkavp.arg>
 <52658EBC.8020800@wwwdotorg.org>
 <alpine.LFD.2.03.1310211632460.1951@syhkavp.arg>
 <20131022093923.GC15640@ulmo.nvidia.com>
 <20131022150426.GF29341@beef>
 <alpine.LFD.2.03.1310221333300.1951@syhkavp.arg>
 <20131022201228.GB8037@mithrandir>
 <alpine.LFD.2.03.1310221624390.1951@syhkavp.arg>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qcHopEYAB45HaUaB"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.03.1310221624390.1951-hIgblCxmbi8OMTOF05IoTw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--qcHopEYAB45HaUaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2013 at 04:41:23PM -0400, Nicolas Pitre wrote:
[...]
> I think it is best to establish any process around DT assuming no strong=
=20
> binding stability.  Eventually the DT binding update frequency will=20
> converge to zero while the kernel will continue to be developed.  But=20
> the DTB for a particular hardware might have to change from time to=20
> time.

A stable ABI certainly has its advantages in my opinion. That's why I'm
convinced that we should try and accomodate for both options. We should
try to come up with a good binding to begin with, as much is clear. But
there's little point in reviewing it to death because any number of
reviewers are unlikely to consider every single possible use-case.

So I propose that we mark such bindings unstable to allow us to put them
through some real world testing in mainline to find out if they work in
practice or not. If they do work reasonably well for a large number of
use-cases, we can decide to mark them stable, at which point they can
only be modified in a backwards-compatible way. That still gives us the
freedom to supersede it by a better binding if that ever becomes
necessary.

The reason why I propose to explicitly mark bindings unstable rather
than the other way around is that I still have hope that we'll reach
some level of stability eventually. It will probably still need some
time because most of us are learning as we go and just don't have the
experience to get things right from the start.

Having some visual marker, such as the exclamation mark I proposed, in
the compatible value is irritating enough to make it clear that it's not
"good". That's an incentive for people to actively work on making it
good or giving it the necessary testing to be able to declare it good.

Thierry

--qcHopEYAB45HaUaB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSZ5CkAAoJEN0jrNd/PrOhPBUQAK0J61/Xpb67bb9aV2hhyKI9
YUf8rs23cJ2j4eJm18bNYeaOGUDMy7dSMmPeMn13pUclKhPQnpECrqemIoKpBJYc
/wwqHhPwUkiCdTNeNS82UXUUXvlAz65Pv0y5AzZj/w9hJfbKzrZOw7TagOW4brXn
puC1GuJuCEXj60wbMNOIG+QXylrOCcoPrmjff6uTBIbFcZbQ6DfvEHKCRzXj7FGr
eZEpAn0M9hlOiWQ4izQKjhqbIxvy0kUOCya//zet41Pu0bWo3RxglwN+gPOMiKMP
G2IAMVXu7BlMxmcbKblkoA9UbZuaWUZ+/n+5CPFBj1iedfdnb/xmhyB7G2bj8eCK
zmxhCKr99/bf+oadj/loAFm7C1PbjbcUW35+yibQ6YfZxdo3LKvge97Ko5JawfEv
ruUegzehOPwEsvkTRVCeg+kxIr2bsa8q+qQuq+81oP9sfIZqUZr4DQHhe9zIcVWp
sYmBcZ5Qgk9EVlOK/dxcc3JQpsFbZo67kppZo1BLxROkNJj4ZO+7oA6l/z8cn/7m
qIGBwW002xclDiqDY7NG0fRXpUVegHlLUlS3s0HHz5yd/aVwLom+7bdjcuDqqsxI
3sd7dlRgCTQ4BIyhj9PPVX0p9hOz35McWKb1ScpSxFf8ChhiPeI4iR/LzPdcPHzq
NLSiB6YxD+v4N4n0zrhy
=bq4o
-----END PGP SIGNATURE-----

--qcHopEYAB45HaUaB--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
