From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: BCM2836 (Raspberry Pi 2) port
Date: Mon, 27 Apr 2015 10:19:58 -0700
Message-ID: <87vbghjxoh.fsf@eliezer.anholt.net>
References: <1429639796-2169-1-git-send-email-eric@anholt.net> <5539C5A4.5070409@wwwdotorg.org> <87pp6tweql.fsf@eliezer.anholt.net> <553A9201.3080308@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <553A9201.3080308-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:

> On 04/24/2015 12:41 PM, Eric Anholt wrote:
>> Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:
>>
>>> On 04/21/2015 12:09 PM, Eric Anholt wrote:
>>>> This is my first submission of a Raspberry Pi 2 port.  It can be found
>>>> at https://github.com/anholt/linux/tree/bcm2836
>>>>
>>>> I'm using the 2835 interrupt controller support, without adding the
>>>> checks for ARM local interrupts first.  That means no support for IPIs
>>>> (and thus no SMP), no PMU events, and no local timer (I'm using the
>>>> same 2835 peripheral one).
>>>>
>>>> It supports a similar featureset to Pi 1 at this point.  Serial and SD
>>>> cards work.  Just one CPU supported.  USB (ethernet) works if you use
>>>> U-Boot, or my mailbox series
>>>> (https://github.com/anholt/linux/tree/bcm2836-mbox).
>>>
>>> I can't quite get this to work. I think what's happening is that U-Boot
>>> is over-writing the location of the code/data that the CPU1..3 pin loop
>>> uses. Do you know what that address is so I can confirm that?
>>>
>>> I suspect this because when I load the kernel/DT in U-Boot, or when I
>>> jump to the kernel to boot it, I see lots of extra duplicated characters
>>> on the UART, like all 4 CPUs are booting Linux. For example:
>>
>> Oops, I was just extrapolating that U-Boot would work.  I've quit using
>> it because of the extra configuration work (particularly the compiled
>> text files for the boot scripts).
>
> You don't need any compiled text files if you create an extlinux.conf=20
> rather than a boot.scr. extlinux.conf is plain text.
>
> To boot without U-Boot: Could you say what's in your config.txt? I=20
> assume I can just copy the kernel zImage as kernel.img, and the DTB from=
=20
> the kernel build tree without renaming it?

I've been explicitly naming the DTB in config.txt, haven't tested otherwise.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIbBAEBCgAGBQJVPm++AAoJELXWKTbR/J7oDVoP+N104QIq3noRgUbfeLTN52Nx
xxdtcRy/jeCyh7jcVeBjMDbwo7ayoaiv5a/mwwoN3X7i6MwbpAfgaghJnb+WWt8w
8eFC9bp8uJVuZhvjCnV0VrvyWJHnY3dX68iJSEEC39s+TJBk1w0jzYwNgzUeJS2D
dkLyolvIY0K9B5sbJZQB0od2XFIkbDlMoK1j2ZHkU+gapg22051B27Z7xucSwlhN
CjxpEiQ11U289F51d0YR7XLM4ns2hqN4jPaFMBL1bXvRPSNxSivSB/4Q0HJ6LoCr
XPtHfY0qzCHnLN6iTuciNACkbStNgMpmLGGzQbU9gM2bXfPOuq8cfUwRZgPUeNDL
Ek6rmcqrtZvyH6L7qP0jY3NXUjX8Ce1GqgqhXRFLqQkrRsrtbHdxm7TE99VqcCGC
nBNb7nXeQsPM/jCVxsLz9xFhGuqEVa2A18a6Px69Fw/I+lQcFPfAEJdUnkdp0H0h
WY0fUOzp176Uk2Wm8imbTcd+QebAUDhaQk2pb35YcYjZIEdaVWeohNOGVZlTsvKZ
YaUxS2weKof5XD8kcgeXFmvM3Tc89UJTVzbs30otnHknLqBizfxbF5j0amjgUOJq
/jBZwR133VIUrec15Pz5e6jFyIdI9gYK79vKUubIjeCU31cmxGuivSA3NtD4h1wC
WP9FZlWVojostmhEUEY=
=bl3j
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
