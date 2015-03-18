From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 2/4 v3] dt/bindings: Add binding for BCM2835 mailbox driver
Date: Tue, 17 Mar 2015 18:34:01 -0700
Message-ID: <87r3snytpy.fsf@eliezer.anholt.net>
References: <1426213936-4139-1-git-send-email-eric@anholt.net> <1426213936-4139-2-git-send-email-eric@anholt.net> <20150317172758.GC3318@x1> <5508A75A.4070203@broadcom.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5508A75A.4070203-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> writes:

> Hi Lubomir,
>
>
> On 15-03-17 10:27 AM, Lee Jones wrote:
>> On Thu, 12 Mar 2015, Eric Anholt wrote:
>>> diff --git a/Documentation/devicetree/bindings/mailbox/bcm2835-mbox.txt=
 b/Documentation/devicetree/bindings/mailbox/bcm2835-mbox.txt
>>> new file mode 100644
>>> index 0000000..0bb2b9d
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/mailbox/bcm2835-mbox.txt
> I am trying to standarize all broadcom device tree bindings in the=20
> format "brcm,binding.txt".
>
> Could you please rename this file to brcm,bcm2835-mbox.txt for=20
> consistency in bindings?

The filename was at the request of Lee Jones, to match the convention of
the other mailbox drivers.  I don't care what the filename is as long as
people can get agreement on what it should be.

(Right now it seems to be 2:1 in favor of using the compatible string?)

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVCNYJAAoJELXWKTbR/J7okx4P/Rd0dq6/TqvRfBN7Z8edVL/X
b90+/NV1lkgkv6D0sHhv1bOV2DeB/v6nlU3I35BrrlHjydDDkLg+4mE2MxkLTFpI
GjQyqjxSyFlPIR3Yjp8Dy+Pggd5b6g1X6PzljQUqrijLbZAytUBylR7mTrdjpdfZ
fenovKbojxYUaq7zrCM1KkaJZjrWa6royutVWh4h6tx/UBmcPhuPwvmblHylXOR+
KmGFsIxlvMzMIHbMRPIgYp44dTqoX87sgpL4TEiu7Vd3TZsKx5KBpF6Bnyz20SPP
GfKCLJUAdi7SHfqpV2jGfUAL9G+yeaneZjFCqQCjEZbKBfp/IEj9HpAmzmjNLxt9
o3Wlpm/pyQamXOdrQgqtYmk0kVV/Bu5LJg3fjvrNp/QzFexL89PzPcQo3V1QVZ8e
SG00e96YjQwFTehd1bMkdA6/JvNn7rjeBrNzWEK9O09T5sn4sGKO0VglABVSq06y
1tIngXN1WEJocpOe84UQpRun9jIg1i3pypGcguclDkdvsWLJN9yxrZd0CmffW1xD
4dqj3MAQpxABRWoCMXgblwQTH9te3K+1BM+SI+ouLUln+Ta2U6Dc19U0LWHRBSp2
/KpH5Qjw8TjxutZTfO/TClesbix2a1fkssq+p3etSTlqcP1TiUDuz1K9NQWs6Xh9
G3y/VUp2XpahAYseHXia
=8mIr
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
