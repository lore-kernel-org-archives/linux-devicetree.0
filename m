From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: BCM2836 (Raspberry Pi 2) port
Date: Wed, 13 May 2015 10:46:24 -0700
Message-ID: <87wq0c4bgv.fsf@eliezer.anholt.net>
References: <1429639796-2169-1-git-send-email-eric@anholt.net> <4137213.WVJY1et48u@kongar> <55516738.306@wwwdotorg.org> <1701192.WcfjCoBWQN@kongar> <55522468.3050606@wwwdotorg.org> <87d2254s6y.fsf@eliezer.anholt.net> <555278BA.50903@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <555278BA.50903-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:

> On 05/12/2015 11:32 AM, Eric Anholt wrote:
>> Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:
>>
>>> On 05/12/2015 09:39 AM, Alexander Stein wrote:
>>>> On Monday 11 May 2015, 20:36:40 wrote Stephen Warren:
>>>>> On 05/08/2015 10:14 AM, Alexander Stein wrote:
>>>>>> On Thursday 23 April 2015, 22:25:08 wrote Stephen Warren:
>>>>>>>> Hit any key to stop autoboot:  0
>>>>>>>> U-Boot> setenv fdt_high fffffff
>>>>>>
>>>>>> Any specific reason to set fdt_high to fffffff?
>>>>>
>>>>> Yes, it prevents U-Boot's annoying habit of moving the DTB from where=
 it
>>>>> was loaded to some other place. This was especially important in this
>>>>> case since I was trying to find out exactly which piece of RAM being
>>>>> over-written caused the issues I was seeing.
>>>>
>>>> Shouldn't this then be part of the default raspberry (2 only?) environ=
ment?
>>>
>>> Eventually yes. So far, nobody seems to know which areas of RAM are
>>> off-limits (presumably since the RAM is used as a CPU1..3 pen), so I was
>>> experimenting to try and find that out.
>>
>> If I'm reading this right, the CPU1-3 pen is in the bottom 8k of memory
>> (actually much less than 8k).
>
> Hmm. I wondered if that was the case. I don't think anything I was doing=
=20
> in U-Boot /should/ touch those pages, but there have been bugs before=20
> where some pointer was left at NULL, and some DM (U-Boot Device Model)=20
> code ended up putting structures in page 0 by mistake. Perhaps something=
=20
> like that has resurfaced. I'll try to find time to diff page 0=20
> before/after various U-Boot operations, and see if it's getting modified.=
..

How about on the Linux side?  What's reserving that memory for us, if
anything?  Weird things happen if I put "ARM: bcm2836: Add a DT binding
for the ARM local registers." and "ARM: bcm2835: Use a syscon regmap to
set up timer frequency." before the SMP support in the bcm2836-smp tree
(init crashes).

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVU43wAAoJELXWKTbR/J7o7Y0QAJwKymFmvnfmtuXF8ZFXMyfO
1SNFeozT+CjjVL+wiA7IfrkEcAdYZdQteab+bt7B6MvpO+8t4oDJOrD59rU/6fCb
GUm1NtNNvnrTvTF0ioAsVClgxKTRyyYxHRG1SE5C28OZhnu8g689T4NuywWyZCI0
2qgiQMQ2YqLMeV0Yrpp1atwJrNy/JR+XcyR7HYQk8GCJvWBhcUWKOVLwMzfeyKsh
TJiFjVqSNQAEcs7kI7Nmc37SKig8XyO7zMlBNFmlfhXkT00vA1VVi5sxXcRnua/Q
HY60M8QVmAq4TxYvWt/KbdjBXx+cr0fuuIkEf7zu8FJaBWnSHMR4Z2n3He3H4dr3
Rxxz13FcScZy7+W/eYf7e8VZv606EUiJ3kpFLjDkBZ9ZBtopZF+LVwNOm7XJGAYF
tfRDa+hXoRBP+QNPw+jl0vRK/ieEhHUhkbsRHcnTHLmNwg7X6Kamk769nkynM8hM
RauCP25spYPBJoqktGRi7nr1rm3Yf/L1p0bDa51HHdDnPVRQ1ok9VHn9SAZn6mTl
0LHk4t07AY8rXqgOw4w0zC3VuUaqHJjLlFN9IMf8rnkVhQsO1e/aaVPTLWMBfUkC
GluFvkNYa0vsKjLZFDq5Eh+IOGINULCDO9YALxijUwRBxS3yhlAu2YoYdExcGfmV
qsUYgEjQ0ojga26qOshO
=Uply
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
