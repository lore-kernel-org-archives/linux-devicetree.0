From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 5/9] ARM: BCM2836: Add io map initialization for bcm2836.
Date: Tue, 21 Apr 2015 13:37:13 -0700
Message-ID: <87oamh9q12.fsf@eliezer.anholt.net>
References: <1429639796-2169-1-git-send-email-eric@anholt.net> <1429639796-2169-6-git-send-email-eric@anholt.net> <6559239.zHhRM8VZWD@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6559239.zHhRM8VZWD@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> writes:

> On Tuesday 21 April 2015 11:09:52 Eric Anholt wrote:
>> +static struct map_desc bcm2836_io_map __initdata =3D {
>> +       .virtual =3D BCM2835_PERIPH_VIRT,
>> +       .pfn =3D __phys_to_pfn(BCM2836_PERIPH_PHYS),
>> +       .length =3D BCM2835_PERIPH_SIZE,
>> +       .type =3D MT_DEVICE
>> +};
>> +
>>  static void __init bcm2835_map_io(void)
>>  {
>> -       iotable_init(&io_map, 1);
>> +       iotable_init(&bcm2835_io_map, 1);
>> +}
>> +
>> +static void __init bcm2836_map_io(void)
>> +{
>> +       iotable_init(&bcm2836_io_map, 1);
>>  }
>>=20
>
> Can you explain what this is needed for? Most platform ports don't
> do this any more.

Nope, I can't!  I'm not sure what the bcm2835 side of it does, and I was
just replicating that for 2836.

Should it be removed from 2835, too?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVNrT5AAoJELXWKTbR/J7o5rYP+QFKIe8jhtmaqiDQ8NUSnQIo
zIFU+ksh3hs6AeGw3ZiBLApqsAgVNsNSj7Pulpk0VBAmJ9CvEZRZG3njQNkCql3B
JecVgWY6f8xHFMbWEsgKcIXX1CthHeBJlOgHgnjfZecF1yJwKDgrRtjd7KNqLfkG
lXUtcy6l6DZ2pQeAgKftdJ3Sq3TW7gbifVm2UtKV8JL0fz0MRtvwBgNzyeI38SRm
N0I6BbfOoRY+3budtm72FSqPhwCtZuMewKiXvY9rq746wrzInn2/zyQbMLvABc1j
HVj1gaWa46CdwiCpkuBsKi8/ceSPmU60D/IBVpYpmvLxOdJvHaU8aX0edpGDjqGl
zeH2NKOF0nYzt592lmIFC+iucKb/9l/OAm7jroDoq5/IgntaoEKApYHl/WrQ6FSn
K6qWWkwH5+9W9iIelUEg1KNAuxlJsXcbDCVhZSU4pjGHYU5/P7yOigqNkvYVO7XO
42epadR7h4mYnEW1scCDriFlkUqW76TvglBPAwyiotxYCP278M2HPfqEUVSGxMtZ
kXYWN3ii2UcGT9UMBWtWOyNrnRj0X1pielXW/Spl+yxTheznffaXwpRFiqVDRXg9
DCMr3wW7gGBaj/kPOF9cf6Bpq96AUUNNdfbGS45OyvG2DsUDjtwUSBEbxwlMpdKl
5xUDKM2Jl5k8UvKw3KQe
=Yjb5
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
