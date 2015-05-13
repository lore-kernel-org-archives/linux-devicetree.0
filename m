From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: BCM2836 (Raspberry Pi 2) port
Date: Wed, 13 May 2015 11:59:39 -0700
Message-ID: <87y4ks9uck.fsf@eliezer.anholt.net>
References: <1429639796-2169-1-git-send-email-eric@anholt.net> <4137213.WVJY1et48u@kongar> <55516738.306@wwwdotorg.org> <1701192.WcfjCoBWQN@kongar> <55522468.3050606@wwwdotorg.org> <87d2254s6y.fsf@eliezer.anholt.net> <555278BA.50903@wwwdotorg.org> <87wq0c4bgv.fsf@eliezer.anholt.net> <555398DB.8050206@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <555398DB.8050206-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:

> On 05/13/2015 11:46 AM, Eric Anholt wrote:
>> Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:
>>
>>> On 05/12/2015 11:32 AM, Eric Anholt wrote:
>>>> Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:
>>>>
>>>>> On 05/12/2015 09:39 AM, Alexander Stein wrote:
>>>>>> On Monday 11 May 2015, 20:36:40 wrote Stephen Warren:
>>>>>>> On 05/08/2015 10:14 AM, Alexander Stein wrote:
>>>>>>>> On Thursday 23 April 2015, 22:25:08 wrote Stephen Warren:
>>>>>>>>>> Hit any key to stop autoboot:  0
>>>>>>>>>> U-Boot> setenv fdt_high fffffff
>>>>>>>>
>>>>>>>> Any specific reason to set fdt_high to fffffff?
>>>>>>>
>>>>>>> Yes, it prevents U-Boot's annoying habit of moving the DTB from whe=
re it
>>>>>>> was loaded to some other place. This was especially important in th=
is
>>>>>>> case since I was trying to find out exactly which piece of RAM being
>>>>>>> over-written caused the issues I was seeing.
>>>>>>
>>>>>> Shouldn't this then be part of the default raspberry (2 only?) envir=
onment?
>>>>>
>>>>> Eventually yes. So far, nobody seems to know which areas of RAM are
>>>>> off-limits (presumably since the RAM is used as a CPU1..3 pen), so I =
was
>>>>> experimenting to try and find that out.
>>>>
>>>> If I'm reading this right, the CPU1-3 pen is in the bottom 8k of memory
>>>> (actually much less than 8k).
>>>
>>> Hmm. I wondered if that was the case. I don't think anything I was doing
>>> in U-Boot /should/ touch those pages, but there have been bugs before
>>> where some pointer was left at NULL, and some DM (U-Boot Device Model)
>>> code ended up putting structures in page 0 by mistake. Perhaps something
>>> like that has resurfaced. I'll try to find time to diff page 0
>>> before/after various U-Boot operations, and see if it's getting modifie=
d...
>>
>> How about on the Linux side?  What's reserving that memory for us, if
>> anything?
>
> Likely nothing at present. I was starting to see what looked like=20
> SMP-pen-related issues just in U-Boot, before even attempting to boot a=20
> kernel at all. So, I didn't put any though into how to communicate this=20
> to the kernel.
>
>>  Weird things happen if I put "ARM: bcm2836: Add a DT binding
>> for the ARM local registers." and "ARM: bcm2835: Use a syscon regmap to
>> set up timer frequency." before the SMP support in the bcm2836-smp tree
>> (init crashes).
>
> This issue would probably explain that; if the kernel just happens to=20
> allocate a physical page of RAM that overlaps the SMP pen memory.
>
> A /memreserve/ in the DT would probably solve this. Adjusting the=20
> content of the /memory/reg property to remove the SMP pen would likely=20
> work too.
>
> Is there no way to disable CPU1..n other than using an SMP pen in=20
> memory? If the CPUs simply weren't executing anything at all, but could=20
> be unblocked/powered-up/... later, that'd simplify life.

Not that I can see -- looks like they all come up the same way, then 1-3
fall into the pen and 0 continues on to do interesting things.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVU58cAAoJELXWKTbR/J7oFb0P/RjN1I5yKdtzMj7yCvXvBIjM
n4LAHfMG9aIZIeiV0Dufd85uxobtq45fIAufgubM/EiKZP6D9zbjNRjx29gN9Uhf
MD8UrPqaeIQ6DE18gauvVA59dlaml2Sh5vxN37gzCu3OHmDDoQ2fljyTqdZroXZj
Pq6H6Kt/JYsAY1UFtQr47yGZuH1BYXZWlze/yNqEyPjL+tkZbb5bbhzy3fTtAq8P
ULecIYBL/Fe07EVI4zdHxvg/cslNSkGVF7JSjhOxtxR2PD/IEZYohfbtr29Mnene
LNIgT/QXd44gZNE29hxMQJ/gdEMhbOdkdWEx7opljNMXT2yudyeKanyhkgsICZqO
ikcL3yiNKfGe39o39D1KvJVIpFKIfipNnFFj1TUbYP/mbs8GO9EeikMM9frVr7FV
odOP0IA6CBK1PyIqMvUm36Fx8hximPqHkXR3oTaEoq6z9xY4n8p9MdDRGJeynGXl
g4IE9eeoWh4Ri829XByMp5bPyoT/vrhKRW31wz/pIrA3CGmy1RzOI2kqFd6UQNQ9
j0Mx3/efGtcYlE+tuy32yoCJm3vkTLWND3o81I7UQPbjEnYfgzmdqTEK7I5OZ6Bx
I//pB+xcghCZeE/PZHyEpQiczf697Rmw2kbh7MybxXvLiUjQFRvwGhVwyNRZhAnV
iL8R/5wh88Nlo7M7Sxoj
=4HRS
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
