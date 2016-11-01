From: Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 3/6] Documentation: devicetree: dwc3: Add interrupt moderation
Date: Tue, 01 Nov 2016 13:18:17 +0200
Message-ID: <87lgx3phxi.fsf@linux.intel.com>
References: <cover.1477424426.git.johnyoun@synopsys.com> <e7a864e5a2af12d5a8d97f2591065f4aa85f86cb.1477424426.git.johnyoun@synopsys.com> <87eg32t6fn.fsf@linux.intel.com> <911fcadd-b852-d9db-c733-2df7c106c8d1@synopsys.com> <87shrgss3f.fsf@linux.intel.com> <d2e54dd2-a400-39d4-3fc9-c41ba45bdb18@synopsys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d2e54dd2-a400-39d4-3fc9-c41ba45bdb18-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> writes:
>>>> John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org> writes:
>>>>> Add interrupt moderation interval binding for dwc3.
>>>>>
>>>>> Signed-off-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/usb/dwc3.txt | 1 +
>>>>>  1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documen=
tation/devicetree/bindings/usb/dwc3.txt
>>>>> index e3e6983..17de9fc 100644
>>>>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>>>>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>>>>> @@ -53,6 +53,7 @@ Optional properties:
>>>>>   - snps,quirk-frame-length-adjustment: Value for GFLADJ_30MHZ field =
of GFLADJ
>>>>>  	register for post-silicon frame length adjustment when the
>>>>>  	fladj_30mhz_sdbnd signal is invalid or incorrect.
>>>>> + - snps,imod_interval: the interrupt moderation interval.
>>>>
>>>> on top of all other comments, what's the unit here? nanoseconds? clock=
 cycles?
>>>>
>>>
>>> Number of 250 ns intervals. I'll update the description to clarify.
>>=20
>> it's probably better to add it in nanoseconds itself, then let driver
>> compute register value with DIV_ROUND_UP()
>>=20
>
> I'm fine with it either way, but I think "increments of 250 ns" is
> slightly cleaner in that it reflects the exact settings that are
> possible and documented, and also fits neatly into a u16.

I don't know, I'll leave this to Mark and the other devicetree folks,
but I remember there was a preference of not passing register values via
devicetree. What if a following HW revision decides to change 250ns
increments to 125ns increments?

Mark?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYGHn5AAoJEMy+uJnhGpkGJmUQANlo0qggXdZW0xxFTJZQoILR
Fwm9d48NvbmcSPDWQARYbYYBRrf+LoFTyO7kjPdjXojcp1rv3c/BplonpAcu5p2P
7ojRnBaTh1KIiCRRLl/KF/kECL6pKCXhEeVdrObBxIX87Bra2E5IiS/oj1Qc83jx
w6/vT7o1xIFBnhsbmmo5PvpSMMbeBftTgJJJphDP0mbXQ7MeD4W4ENYTvzPnR6Mp
l5zgoSLzdqCtKaRRvYygfOWb64GhY6f3J8kCaWzhAIySEBsR24tvSK2iHU1KAOlB
EPUz5WIxv1KyYlXGsFf0xN2gIKKyPm5seCvNTL9qCN6yXPvRqkvmjI0zyasCWHNy
27lQ8MyxErAS6FHrO1r3ca+2NXyB4MLcnVWutAJmvN3tZQMOugTpr0XRQ9j64msx
71IUlrSWZ9Lm7UhCwZq4JAtzvSnzEhVcBFsyZ1i3/1WeOO9kVRYBMA9y9Wu+4cqW
K+IQG4hRV4Pj3wrC5KZUf2+k5fnyQIHtRjJfBpi40uxF1F9CtfDOHSfr9rHOjHOk
c9rltV/KY3938q2XZMIYkp9DBMxReeFwcZMkBnm67YRiCWxqFJIjSC8HrLIsdJng
ZfCBB6Kc/DMXuWy8LosSvPjpSL47Jx9lW6jHHZDB9F/1Bke/VBw5Cs1K/JGRRq1d
NUTbZoHZBN8Zdt5alfaI
=lthC
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
