From: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Subject: Re: [PATCH 2/2] doc: dt: add documentation for alphascale,asm9260-rtc
Date: Tue, 2 Feb 2016 09:46:02 +0100
Message-ID: <56B06CCA.4060208@rempel-privat.de>
References: <1454056802-23386-1-git-send-email-linux@rempel-privat.de>
 <1454056802-23386-3-git-send-email-linux@rempel-privat.de>
 <20160201152750.GA17595@rob-hp-laptop> <20160201155527.GR20165@piout.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Xe087KlWbvSL1W982wrjADLqXjVn2aqou"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160201155527.GR20165-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Xe087KlWbvSL1W982wrjADLqXjVn2aqou
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 01.02.2016 um 16:55 schrieb Alexandre Belloni:
> On 01/02/2016 at 09:27:50 -0600, Rob Herring wrote :
>> On Fri, Jan 29, 2016 at 09:40:02AM +0100, Oleksij Rempel wrote:
>>> Document Alphascale asm9260 RTC bindings
>>>
>>> Signed-off-by: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
>>> ---
>>>  .../bindings/rtc/alphascale,asm9260-rtc.txt        | 25 ++++++++++++=
++++++++++
>>>  1 file changed, 25 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/rtc/alphascale,=
asm9260-rtc.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/rtc/alphascale,asm9260=
-rtc.txt b/Documentation/devicetree/bindings/rtc/alphascale,asm9260-rtc.t=
xt
>>> new file mode 100644
>>> index 0000000..2c0ff3c
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/rtc/alphascale,asm9260-rtc.tx=
t
>>> @@ -0,0 +1,25 @@
>>> +* Alphascale asm9260 SoC Real Time Clock
>>> +
>>> +Required properties:
>>> +- compatible: Should be "alphascale,asm9260-rtc"
>>> +- reg: Physical base address of the controller and length
>>> +       of memory mapped region.
>>> +- interrupts: IRQ line for the RTC.
>>> +- clocks: Reference to the clock entry.
>>> +- clock-names: should contain:
>>> +  * "ahb" for the SoC RTC clock
>>> +
>>> +Optional:
>>> +- calibration: calibration value for 1 sec period.
>>> +		Max value for forward calibration is 0x1ffff (131071),
>>> +		Min value for backward calibration is 0xfffe0001 (-131071).
>>
>> This should be prefixed with 'alphascale,'
>>
>> How is this value determined?
>>
>=20
> I think this should stay in userspace, see that series:
> https://groups.google.com/forum/#!topic/rtc-linux/HGQqiHnMiuw
>=20
> It quite often depends on environmental things like temperature so it m=
ay be updated at runtime.
>=20

I partially agree. IMO default configuration should work properly by
20C. My devkit provide terrible results without default offset.

--=20
Regards,
Oleksij


--Xe087KlWbvSL1W982wrjADLqXjVn2aqou
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EAREIAAYFAlawbMoACgkQHwImuRkmbWlwogD5ARDoAS4OCp+gEAe3sA49rdDF
b0jwWtHomClXT8JNYxwA+wYK7L+A+05WKTPDuXJCUgcBreUyBzVvH3IVjLKCwC0H
=yWng
-----END PGP SIGNATURE-----

--Xe087KlWbvSL1W982wrjADLqXjVn2aqou--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
