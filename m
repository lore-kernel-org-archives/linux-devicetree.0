From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v6 2/3] ARM: bcm2835: Add the Raspberry Pi firmware driver
Date: Mon, 01 Jun 2015 10:57:06 -0700
Message-ID: <87vbf75n2l.fsf@eliezer.anholt.net>
References: <1432928535-27522-1-git-send-email-eric@anholt.net> <1432928535-27522-2-git-send-email-eric@anholt.net> <1433148509.2361.35.camel@x220>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1433148509.2361.35.camel@x220>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Paul Bolle <pebolle@tiscali.nl> writes:

> On Fri, 2015-05-29 at 12:42 -0700, Eric Anholt wrote:
>> This gives us a function for making mailbox property channel requests
>> of the firmware, which is most notable in that it will let us get and
>> set clock rates.

>> v6: Drop the try_module_get/module_put stuff, since all clients will
>>     be referencing our symbols in order to call those functions,
>>     anyway.  Fix the kerneldoc comments for the changes in v5.
>
> (This style of commit explanation is getting quite common. I must say I
> rather dislike it. I think people should just update the entire commit
> explanation when needed, and not simply paste any changes at the end of
> it, thereby forcing the the reader to determine which older parts are
> actually overruled by newer parts. Besides, many, or maybe even most, of
> the changes are really not interesting enough to keep in the commit
> explanation.)

It was a slip-up that I didn't move it below the '---'this time (I
changed my workflow a bit, and missed the step).  I was assuming that
Lee would just trim them on pulling in the changes.

>> --- /dev/null
>> +++ b/drivers/firmware/raspberrypi.c
>
>> +EXPORT_SYMBOL_GPL(rpi_firmware_property_list);
>
>> +EXPORT_SYMBOL_GPL(rpi_firmware_property);
>
> A patch that uses these exports hit lkml recently:
> https://lkml.org/lkml/2015/5/28/596 .
>
>> +EXPORT_SYMBOL_GPL(rpi_firmware_get);
>
> But I didn't spot a (recent) patch that uses this export. Is it queued
> somewhere?

This is from the v5 changes due to review feedback, and the clients need
to be changed to use it.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVbJzyAAoJELXWKTbR/J7o6SkP/jDZ+S27+niAUbFk8U58N/0T
caIpROJiRi9Rpd1IaUeEYLFhny9MCxHBeF4NL7ytDKTFYbmJDHbQpNa0ozETiSJH
gus+B2L46ccy9ucUvy9NExbhCX6OZM/fLIo/Yq1ZKEZy11rkDZDIlk5/S2LTuUmG
mGxIUcA91G673RpTZfuxfjkdMRf2NZvErVHKWLn/eN/r92WPVtto/TFNusqLpcML
lqRiZUpdd20GWyh1FWCugjqAVPV9X6u7Ds30i/x5ZPMN0EtZ6ZlIfrXdCKmA61o4
03LRMwFGKjkJEdPXkZ2rOlaZo1W/eslwgZPeJpbZWoZat4OWWdWEYdm1lE7s70i3
aZNAxL6WUMEhbD5pbCsQ1FnsYX3eX4KN8hJHOT9hnCEOMaDVSpdUKQegzDmS3N5i
6xdkYFOOYwY3jUI6xth/aJ9FrBjLf1TbxCMg7G2AA1BUVZS863fulWRJIZdQOcjZ
mdmfReg/m913ZLBaL9rcQt9fsuBPHzlHM5y/AUgmJFmtSQucUevTbwCOZqS2RJcz
T3Th0qAon2dTOe6FMM3I0BK4fsnPSIl2CiQVs8Iqs9+KuEYEtfxLkz6XZnAaLfIM
JJu85pm9dC1VxUgkmXn789CnwfK1eYFtBcDwWBimjs76Xu7hhhIgG9xNHcP+Hhfo
WjDrzLz0x/CpQfNCufSW
=K5s1
-----END PGP SIGNATURE-----
--=-=-=--
