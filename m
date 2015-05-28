From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 2/3 v4] ARM: bcm2835: Add the Raspberry Pi firmware driver
Date: Thu, 28 May 2015 15:38:02 -0700
Message-ID: <87r3q072gl.fsf@eliezer.anholt.net>
References: <20150528114500.GP11677@x1> <1432837987-22861-1-git-send-email-eric@anholt.net> <55678BBC.5090507@tronnes.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55678BBC.5090507-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Noralf Tr=C3=B8nnes <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org> writes:

> Den 28.05.2015 20:33, skrev Eric Anholt:
>> This gives us a function for making mailbox property channel requests
>> of the firmware, which is most notable in that it will let us get and
>> set clock rates.
>>
>> Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
> ...
>> +static int rpi_firmware_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev =3D &pdev->dev;
>> +	struct rpi_firmware *fw;
>> +
>> +	fw =3D devm_kzalloc(dev, sizeof(*fw), GFP_KERNEL);
>> +	if (!fw)
>> +		return -ENOMEM;
>> +
>> +	fw->cl.dev =3D dev;
>> +	fw->cl.rx_callback =3D response_callback;
>> +	fw->cl.tx_block =3D true;
>> +
>> +	fw->chan =3D mbox_request_channel(&fw->cl, 0);
>> +	if (IS_ERR(fw->chan)) {
>> +		int ret =3D PTR_ERR(fw->chan);
>> +		if (ret !=3D -EPROBE_DEFER)
>> +			dev_err(dev, "Failed to get mbox channel: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	init_completion(&fw->c);
>> +
>> +	platform_set_drvdata(pdev, fw);
>> +
>> +	rpi_firmware_print_firmware_revision(dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static int rpi_firmware_remove(struct platform_device *pdev)
>> +{
>> +	struct rpi_firmware *fw =3D platform_get_drvdata(pdev);
>> +
>> +	mbox_free_channel(fw->chan);
>
> I guess driver data has to be reset here:
> platform_set_drvdata(pdev, NULL);

Fixed.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJVZ5jKAAoJELXWKTbR/J7obhoQAKdslT1vZ2NzV2R98tWga37H
cwrLYqmDJpypgmPxn6xXCtrRWzESGVmV0F82ByxLhIUAM+AeoF2gx35/6u/pilUn
zxF5Xy9qV7N514InHddQMbWu1VjcdI7mRHcOSttPqaF+yQbUFxhB7uDJYEKlXD6q
S2AjA3gVzL/1FyDcSnFXpIBeLpovysz1ToGiXlt/maFt6u2S6FEMhX8cQJbRB2/Y
6wOokHd93EGC53dZ9+xmGGEyv/klgnw425Djw/DMSLASNDYeHByEaV+Z0GQWCK4k
2HYykSoYUdb60cVC9nqmLvMko4Ulaapq6mTFuG19RpQ66LPVwLMijoqrpx36UUyt
vbHLRZjCPztqkwwAvdSlVqtXuMKoCsptS3jlcqRNRjCSGr5+ndNzUr9TEJ7E2s2S
6g3kVHmCwQXGAnaERO2mZssXgfpFvOlkcBZ2n9ImBfOD7Fj74VJ52pbxil1b5yPw
WhzqITkCmrgLbMXXmHG4ysjINFdHIdJbGvqDY9pO0lwhzQL2G3U0eWg+U6sHOICq
a9/fWDrDL+PSH8y2SetmE36K2oTI3BKBjtdAjRtqmNNc9c+iU2GcJr6GHqtUzUkr
WaMy2Xt6AV8/O2MyGlYka/kwoVt8cmP/c6SQROAtcWIUrrUH3E9vTaBiIJPZEA/K
wHSRJ3mXM3asfJi3ZRG3
=pI9k
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
