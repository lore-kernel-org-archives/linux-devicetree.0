From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 1/3 v2] dt/bindings: Add binding for the Raspberry Pi firmware driver
Date: Thu, 14 May 2015 02:57:43 -0700
Message-ID: <878ucrbhwo.fsf@eliezer.anholt.net>
References: <1431543609-19646-1-git-send-email-eric@anholt.net> <1431543609-19646-2-git-send-email-eric@anholt.net> <20150514084039.GC22418@x1>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150514084039.GC22418@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:

> On Wed, 13 May 2015, Eric Anholt wrote:
>
>> This driver will provide support for calls into the firmware that will
>> be used by other drivers like cpufreq and vc4.
>>=20
>> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
>> ---
>>=20
>> v2: Improve commit message, point to mailbox.txt for how mboxes work.
>>=20
>>  .../devicetree/bindings/arm/bcm/raspberrypi,firmware.txt | 16 +++++++++=
+++++++
>>  1 file changed, 16 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/arm/bcm/raspberryp=
i,firmware.txt
>>=20
>> diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,firmw=
are.txt b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,firmware.txt
>> new file mode 100644
>> index 0000000..33b0043
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,firmware.txt
>> @@ -0,0 +1,16 @@
>> +Raspberry Pi VideoCore firmware driver
>> +
>> +Required properties:
>> +
>> +- compatible:		Should be "rasbperrypi,firmware"
>> +- mboxes:		Single-entry list which specifies which mailbox
>> +			  controller and channel is used.  See
>> +			  Documentation/devicetree/bindings/mailbox/mailbox.txt
>> +			  for the semantics of this property
>
> That's not what it looks like to me.  There is no mention of channels
> in a 0 cell property.  Keep it simple.  How about:
>
> Phandle to the firmware device's Mailbox.
> (See: ../mailbox/mailbox.txt for more information)

Sounds good to me.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVVHGXAAoJELXWKTbR/J7okr0QAKu5sAJ2xzoskiTeMZGWNflc
UoLrJB4e+3hkgloIBU7+PqePuniHmr3bepB3FFnDrIG2DEh5mIcnOwJPMPTiG27z
mFojrI9YNh35X8D1AyKBuB6uUnJQ9qJOo3X21t60lzhJ8M9RgUp8TYBGhqNCnfxz
azTKYr2qOVXYoJ3uqmeYpSJZBN6rmNExAtoM+mkDAXE+XqpvtU7aVK8j+ddVy8jS
taYz2HJj1nOy/b8ivNfEqoMiPLCvwg0KBbixYb2ejodMoNdyB5oD5B0XaAlPqzMW
LZ7+9y02Sn2zdFw24vFyXeQamO7D/fcjT2q+FDbd0XfIJ7/UO5QHrettnIQKuG1Y
0n/vRYe3ow193JlxehALZnQJgitudrPXUuLHFariFuCrtJK7BzWN6oDUbBqqQXSd
SPuKarX2bvEqlORrHEX8MHTtX5XghWdH49TZCoIL1U58I2k0euP4xQCdbHa4srcA
6YUaGgEYFxqUqMDG9cZMTuT9583tnQDJ5741yLKXr553etEIthVSCyoZn3+m1KxZ
ptBZXy1izJVo2AyKVKoAS/xKjjJEnVfREwXdSiVyZArxd3gCUyy1rkEpqW5aQ+E6
lrWidQ2VcAPD8f1eZhipvB+fJQ71jsCG8Mli/7k5GsYYQqvRorYozqtS534+1lSF
zfxq5/vm2lOgBUAoD+1R
=tMF3
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
