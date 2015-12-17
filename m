From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH v2 0/8] Raspberry Pi 2 support.
Date: Wed, 16 Dec 2015 16:37:37 -0800
Message-ID: <874mfhsyem.fsf@eliezer.anholt.net>
References: <1450310115-22163-1-git-send-email-eric@anholt.net> <21040591.KakM5Gl6ZZ@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <21040591.KakM5Gl6ZZ@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> writes:

> On Wednesday 16 December 2015 15:55:07 Eric Anholt wrote:
>> This is a major rewrite of the previous Raspberry Pi 2 submission.
>> SMP support is now included, and the DT includes are cleaned up to
>> avoid massive duplication.
>>=20
>> The branch (based on 4.4-rc5, to get the USB regression fixes) can be
>> found at:
>>=20
>> https://github.com/anholt/linux/tree/bcm2836-4.4
>
> Looks all good to me, but when we get the pull request, I'd strongly
> prefer to have that based on -rc3 or earlier.
>
> What commit is the USB regression fix you refer to above? Is that in a
> branch that is -rc3 based? Maybe you can rebase the changes on top
> of that branch, to minimize the amount of backmerges?

Top 4 commits of drivers/usb/dwc2 for 4.4-rc5 (possibly not all of them
are required, but it's what I've been using).  I've been using
cherry-picks of them on top of my various branches for testing, but pi2
was going to be rebased so many times in the process of cleanup that I
put it underneath my development branch instead.

I've been doing pull requests for my stuff on -rc1 tags.  It sucks for
bisecting any breakage I produce when I can't boot that directly, but I
don't see a good way to avoid this kind of pain other than getting some
Pis into kernel-ci.org so we can catch regressions earlier.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWcgPRAAoJELXWKTbR/J7ozK4P/jq3vnSb1oJjfNhqCbDe8IPp
35BDIFGoYD72UKn7MNQ+7KyAb3thqRi2cU4fiXOND8gjTHvm9B+wIi493ZZuBpNu
tkxHihK8O6+wV/kFISNvZocZ9eRn0S2igpdTB4GI4tAepz1EfMPeE7nRnHIE4UwN
AJGkaWsAGHEWunGANuHUKKhoLZmRO2jSZhqt+y6G8ixuAUAtZ6s01Bvz6y9856r9
yV6ndnYAjaS57yQKzn4eJhT8DzLU+S8QNKNzEbX1qxHUNiXO/RLj9h+xJbeCbVIp
Lz9C8JoaCDiOT+yC3En0J40BeRMufjBiLEE747HhuzhaqkC8VZfgmuqhVCUVzse1
IjK7E30HanFDgZepRlTTy1Va3aap1OzAem0eOuKMOaBs4JQiabo84B9bKfbg7jOx
6Hr55nAYCfGXrwZp09Txrhz3Ewj69tHDFFZICXqQZViyWPHISLgp2npW3mNTInqU
bNqZ8OvvMJxfRwB13AzsKaqjU7UugvX8N4Nqd9T2VDdOfwPb1QAezVUwyiz1cvne
WzWvlNcTXCySk8oMiiQ7WHW+BC4aehjdx7+CLGQBahvfwQH+9PLwKW3S9s/Jm0+t
QfdAW0RYar8hoACf06/xtRGzqx3QN+3UjDbYHxvHZ0rttTDBALTmtJxMivy6wxx0
10HRzbmaLM//PxP+oatP
=+Zm1
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
