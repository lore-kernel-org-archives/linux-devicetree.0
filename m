From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 0/5] clk: bcm2835: add flags for mash and parent clocks
Date: Tue, 10 May 2016 10:45:43 -0700
Message-ID: <877ff1yfg8.fsf@eliezer.anholt.net>
References: <1462463608-22940-1-git-send-email-kernel@martin.sperl.org> <87h9e6yb6i.fsf@eliezer.anholt.net> <57319C89.7040705@martin.sperl.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <57319C89.7040705@martin.sperl.org>
Sender: linux-clk-owner@vger.kernel.org
To: Martin Sperl <kernel@martin.sperl.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Martin Sperl <kernel@martin.sperl.org> writes:

> On 10.05.2016 03:05, Eric Anholt wrote:
>> kernel@martin.sperl.org writes:
>>
>>> From: Martin Sperl <kernel@martin.sperl.org>
>>>
>>> Allow flags to be set on a per clock index basis, which control:
>>> * the parent clocks selected when not setting clocks explicitly
>>
>> I don't think we need this other than avoiding PLLC.  What else do you
>> want to filter, and why?
> What about potentially disabling PLLA_per or PLLH_aux?
> Under some circumstances it may make sense to avoid those clocks.
> (or testdebug for that matter).

PLLH and its descendents are only used by vc4, and the parent choice
done by this driver for pllh is correct.

I don't know what you mean by "potentially disabling PLLA_PER".

We don't expose the testdebug parents, because they're of no use to us.

>>> * the clock mode with regards to integer only or higher order mash
>>
>> Please provide justification in the commit message explaining why there
>> is no obvious mash setting to just implement in clk-bcm2835.c, but that
>> that a better policy can be encoded in the DT.
>
> The normal fractional divider will vary the effective period length
> between int(div)/Fparent and (int(div)+1)/Fparent.
>
> So the device (say DAC or other) connected needs to support in
> principle Fparent/int(div) as a clock.
>
> But for higher order mash the HW will spread the period length between:
> (int(div)-3)/Fparent and (int(div)+4)/Fparent.
>
> This value may be outside of the frequencies supported by the attached
> HW. That is why mash is not enabled by default for mash clocks - only
> div.
>
> That is also why we need to have this configurable.
>
> Also obviously higher parent clock frequencies result in higher dividers
> for the same target-frequency. So the above effect is less dramatic
> when using plld_per (or pllc for that matter) compared to the main
> 19.2MHz oscillator, as for 32bit stereo audio at 96kHz (equivalent to
> 6144000Hz) in the first case we have a divider of 81.38 while for the
> second (osc) case we have a divider of 3.125.
>
> The use of mash3 is impossible for osc but the use of mash 2 would
> spread the frequencies between 9.6MHz (div=2) and 3.84MHz (div=5).
>
> For plld_per as parent using mash3 instead we get the range:
> 6410256.4Hz (div=78) and 5882352.9Hz (div=85), which is a much more
> acceptable range and should not impact the device that much.
>
> So enabling mash 3 by default is not in the best interest hence it is
> not done.

It sounds like you're optimizing for reducing frequency spread.  That
sounds fairly easy to do in the parent-choice function.

> As a side note: selection of parent oscillator and corresponding mash
> may have distinct noise behavior on the same device, where for
> 32bit*2@48k it is the main oscillator with mash3 while the second best
> match would be pllc with mash2 - not mash3, which has the worsted SN
> from all tested!

But PLLC continues to be unusable, since it's changed at runtime, and
evaluating its noise characteristics based on a snapshot of its
frequency doesn't make any sense.

> This behavior obviously changes with different "target frequencies"
> so it may even be necessary to account for the different target
> frequencies.

This is why encoding mash in the DT doesn't make any sense to me.  You
need a runtime policy for choosing the mash setting based on the
frequency requested, so let's figure out what policy we actually want.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJXMh5HAAoJELXWKTbR/J7ozw8P/iSujUtrkI2jyJtYcW2YDNw5
m2L4QKl1OYwZYkU0EyTXBcCXzdS9t2biitoJSEREbN0zXEfTIwoAPKtwZLbDeBlA
L2uXporjhUwuouphJFB4x4bqccmHGMJF1qPLzbRAavPA3Knd98qjcI6FWWo8TWYU
t1zA6SXx+1lULHyVtS1N9dHFm7C3qEvsS87jG7upE2wL0w0HGKCnXIvNouPScjR9
blGmnYKwmfyeOsb48Ssf3v8W7s8N1R42e1up6NPGk1xRZKlZQ/ijJhlahsBiH87h
J1ZDKCnuiScTJcIp9qVkbbEefBNRWh/ednJyVfv+I3YssJ/JpEEzQjKcI6b0L+Jv
4s4nmcjpn4Dxzret9HTgRK84pijLLPHx6LrHJotI1NpmaYl4VMGvTcDcYoV1J5Pw
USzDQqGNFn8fAwE84ef5g3eClK9Gp2ArqiN9WVkDOEoChNu5yjIw5yQVhrfLWQz1
JJBTnXnrvlfJbr9qaLqJjsGdU4hykzHS7IjTs9MMpp80F9rpk7BPWplhl0+OIuUb
2Cfns3XA0lVUyHxyP3H8oFmpcA/XLflwByDktZ6eZOCu/sXfsE6eE9kHQOoYoBGu
Eph9Pchg6TXURHnB/jiA+67kl6cb0ROhyQZpDIRFahU231Fbx+EDLXHL7z+YKoYd
lKdcvdRCkdSKlVf6FsaW
=MNZ9
-----END PGP SIGNATURE-----
--=-=-=--
