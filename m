From: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [linux-nfc] [PATCH v2 5/9] NFC: nfcmrvl: add i2c driver
Date: Wed, 21 Oct 2015 08:54:07 +0000
Message-ID: <EF5A5C37-4C16-49A6-BF4E-1894C22CC111@marvell.com>
References: <1443443594-14353-1-git-send-email-cuissard@marvell.com>
 <1443443594-14353-6-git-send-email-cuissard@marvell.com>,<20151021060047.GH11271@zurbaran.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151021060047.GH11271-nKCvNrh56OoJmsy6czSMtA@public.gmane.org>
Content-Language: fr-FR
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: "linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org" <linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Samuel,

> Le 21 oct. 2015 =E0 08:00, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> a =E9=
crit :
>=20
> Hi Vincent,
>=20
>> On Mon, Sep 28, 2015 at 02:33:10PM +0200, Vincent Cuissard wrote:
>> +#ifdef CONFIG_OF
> Technically you don't need that as all of_* APIs are safe if CONFIG_O=
=46_*
> are not defined.

Ok.

>> diff --git a/drivers/nfc/nfcmrvl/main.c b/drivers/nfc/nfcmrvl/main.c
>> index bd8db3d..1104fa3 100644
>> --- a/drivers/nfc/nfcmrvl/main.c
>> +++ b/drivers/nfc/nfcmrvl/main.c
>> @@ -33,6 +33,9 @@ static int nfcmrvl_nci_open(struct nci_dev *ndev)
>>    if (test_and_set_bit(NFCMRVL_NCI_RUNNING, &priv->flags))
>>        return 0;
>>=20
>> +    /* Reset possible fault of previous session */
>> +    clear_bit(NFCMRVL_PHY_ERROR, &priv->flags);
>> +
> How is that related to this i2c driver ?

i2c driver is currently the only deiver that needs to set this error. B=
ut in the future other interfaces may need it too. That's why this clea=
r code was done in the main file to allow future code reuse.

>>    err =3D priv->if_ops->nci_open(priv);
>>=20
>>    if (err)
>> @@ -221,10 +224,8 @@ EXPORT_SYMBOL_GPL(nfcmrvl_nci_recv_frame);
>>=20
>> void nfcmrvl_chip_reset(struct nfcmrvl_private *priv)
>> {
>> -    /*
>> -     * This function does not take care if someone is using the dev=
ice.
>> -     * To be improved.
>> -     */
>> +    /* Reset possible fault of previous session */
>> +    clear_bit(NFCMRVL_PHY_ERROR, &priv->flags);

Same.

Br,
--=20
Vincent--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
