From: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
Subject: Re: [PATCH 2/2] doc: dt: add documentation for alphascale,asm9260-rtc
Date: Tue, 2 Feb 2016 09:42:09 +0100
Message-ID: <56B06BE1.3030100@rempel-privat.de>
References: <1454056802-23386-1-git-send-email-linux@rempel-privat.de>
 <1454056802-23386-3-git-send-email-linux@rempel-privat.de>
 <20160201152750.GA17595@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="hxt77e8X61KOILwMShKObndQr7P7d0mRb"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160201152750.GA17595@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--hxt77e8X61KOILwMShKObndQr7P7d0mRb
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 01.02.2016 um 16:27 schrieb Rob Herring:
> On Fri, Jan 29, 2016 at 09:40:02AM +0100, Oleksij Rempel wrote:
>> Document Alphascale asm9260 RTC bindings
>>
>> Signed-off-by: Oleksij Rempel <linux-YEK0n+YFykbzxQdaRaTXBw@public.gmane.org>
>> ---
>>  .../bindings/rtc/alphascale,asm9260-rtc.txt        | 25 +++++++++++++=
+++++++++
>>  1 file changed, 25 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/rtc/alphascale,a=
sm9260-rtc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/rtc/alphascale,asm9260-=
rtc.txt b/Documentation/devicetree/bindings/rtc/alphascale,asm9260-rtc.tx=
t
>> new file mode 100644
>> index 0000000..2c0ff3c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/rtc/alphascale,asm9260-rtc.txt=

>> @@ -0,0 +1,25 @@
>> +* Alphascale asm9260 SoC Real Time Clock
>> +
>> +Required properties:
>> +- compatible: Should be "alphascale,asm9260-rtc"
>> +- reg: Physical base address of the controller and length
>> +       of memory mapped region.
>> +- interrupts: IRQ line for the RTC.
>> +- clocks: Reference to the clock entry.
>> +- clock-names: should contain:
>> +  * "ahb" for the SoC RTC clock
>> +
>> +Optional:
>> +- calibration: calibration value for 1 sec period.
>> +		Max value for forward calibration is 0x1ffff (131071),
>> +		Min value for backward calibration is 0xfffe0001 (-131071).
>=20
> This should be prefixed with 'alphascale,'

ok,

> How is this value determined?

To each second the counter value will be increased to decreased by
calibration value - if google translated it correctly from chinese :)

It is RAW value which will be written to register. Since DT compiler do
not support signed values i converted it to HEX.

--=20
Regards,
Oleksij


--hxt77e8X61KOILwMShKObndQr7P7d0mRb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EAREIAAYFAlawa+cACgkQHwImuRkmbWkFqwD/e3wVBFQ/EEfcym8gNWf45iwp
6vvNV+kp1rEqmeuATDkA/2tUIOMoslHu9LN6X3NHUOteeMuxuxJiNhBEUeS58JP+
=foKL
-----END PGP SIGNATURE-----

--hxt77e8X61KOILwMShKObndQr7P7d0mRb--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
