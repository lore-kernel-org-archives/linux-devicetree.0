From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: BCM2836 (Raspberry Pi 2) port
Date: Tue, 12 May 2015 10:32:53 -0700
Message-ID: <87d2254s6y.fsf@eliezer.anholt.net>
References: <1429639796-2169-1-git-send-email-eric@anholt.net> <4137213.WVJY1et48u@kongar> <55516738.306@wwwdotorg.org> <1701192.WcfjCoBWQN@kongar> <55522468.3050606@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55522468.3050606-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:

> On 05/12/2015 09:39 AM, Alexander Stein wrote:
>> On Monday 11 May 2015, 20:36:40 wrote Stephen Warren:
>>> On 05/08/2015 10:14 AM, Alexander Stein wrote:
>>>> On Thursday 23 April 2015, 22:25:08 wrote Stephen Warren:
>>>>>> Hit any key to stop autoboot:  0
>>>>>> U-Boot> setenv fdt_high fffffff
>>>>
>>>> Any specific reason to set fdt_high to fffffff?
>>>
>>> Yes, it prevents U-Boot's annoying habit of moving the DTB from where it
>>> was loaded to some other place. This was especially important in this
>>> case since I was trying to find out exactly which piece of RAM being
>>> over-written caused the issues I was seeing.
>>
>> Shouldn't this then be part of the default raspberry (2 only?) environme=
nt?
>
> Eventually yes. So far, nobody seems to know which areas of RAM are=20
> off-limits (presumably since the RAM is used as a CPU1..3 pen), so I was=
=20
> experimenting to try and find that out.

If I'm reading this right, the CPU1-3 pen is in the bottom 8k of memory
(actually much less than 8k).

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVUjlGAAoJELXWKTbR/J7oKocP/Rqb2jaqJuNElrElchqnB3M8
2PjJQ0it+X7a3PkFYWqrk8dx5b7oI0JH/pOmFU6Xul6Pc5KSGRumCOyMxz4q6me9
EttMxE82W4S7NwlwabZy6qnWsz76ZZuW522iXTogvqnK7JGYhZnJ3kCVgv3uRRHP
cKZb+/l8z+2Budfg6mYDh/y6yPQSFcQH6ME92J3Z29ZsJhwP3cPB9lpfQzzt4zyC
RzkCZvrzZuNgETEDJT2PM3cmu46dKxWvx5PmUt4W0S/P+uTZ9olK0W+1AGwe9zie
TI849WnyRYGyuCeZDrp0F139HwS8cALRGyvM8eq9gz7SXPMvUDiPaELLmRPv+4c5
2pofziLILsJoBywoPhxe5rT2ksSdN7syAg/N04VwhJxJUhOu3juffpGfubvHFtLB
1odOq6n+FNpYPD6ykS2tL1W5AalMDyz8sbc471dAn1uUyG8TR6m3VKv2bis61DK8
EJE9k+/Eo9uZecMrllv8RgH0foSgR1PoFa1GbyDir0pvFtVJQfhDbW+FBJBTB0si
l4pSKxiR1Kv7UoIAJJd27utVL6Uxv/74o/QWfGMSYn3B+Yb4mnccZF1RkwVv0B2t
U+OlTCGFecJTrIenmaa/l6BpSUWYBzU1Lgk1FtccIsMpHMC2POZGNszu8xtlRMRv
YJ9FEDF3MS+YF5s0we8Z
=Ui0u
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
