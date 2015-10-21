From: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [linux-nfc] [PATCH v2 9/9] NFC: nfcmrvl: update device tree
 bindings for Marvell NFC
Date: Wed, 21 Oct 2015 08:55:04 +0000
Message-ID: <BB521FE3-00DB-4C29-9AAD-B1B67320CA5A@marvell.com>
References: <1443443594-14353-1-git-send-email-cuissard@marvell.com>
 <1443443594-14353-10-git-send-email-cuissard@marvell.com>,<20151021055734.GD11271@zurbaran.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151021055734.GD11271-nKCvNrh56OoJmsy6czSMtA@public.gmane.org>
Content-Language: fr-FR
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: "linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org" <linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Samuel,

> Le 21 oct. 2015 =E0 07:58, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> a =E9=
crit :
>=20
> Hi Vincent,
>=20
>> On Mon, Sep 28, 2015 at 02:33:14PM +0200, Vincent Cuissard wrote:
>> diff --git a/drivers/nfc/nfcmrvl/i2c.c b/drivers/nfc/nfcmrvl/i2c.c
>> index b48c3ee..aa022e3 100644
>> --- a/drivers/nfc/nfcmrvl/i2c.c
>> +++ b/drivers/nfc/nfcmrvl/i2c.c
>> @@ -273,7 +273,7 @@ static int nfcmrvl_i2c_remove(struct i2c_client =
*client)
>>=20
>>=20
>> static const struct of_device_id of_nfcmrvl_i2c_match[] =3D {
>> -    { .compatible =3D "mrvl,nfc-i2c", },
>> +    { .compatible =3D "marvell,nfc-i2c", },
> You can't just replace the old one with the new one as we already
> released kernels with the old compatible string. This is an ABI and w=
e
> have to be backward compatible.
> Please keep both strings.

Ok.

Br,
--=20
Vincent--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
