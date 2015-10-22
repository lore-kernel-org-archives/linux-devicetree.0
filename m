From: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [linux-nfc] [PATCH v2 3/9] NFC: nfcmrvl: add firmware download
 support
Date: Thu, 22 Oct 2015 19:25:14 +0000
Message-ID: <3BF442B6-EE61-439E-9D6E-FAEFF45968A1@marvell.com>
References: <1443443594-14353-1-git-send-email-cuissard@marvell.com>
 <1443443594-14353-4-git-send-email-cuissard@marvell.com>
 <20151021060021.GF11271@zurbaran.home>
 <5B945DE3-A26C-4E4B-B1B6-DF52BEA0A567@marvell.com>,<20151022154323.GB7633@zurbaran.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151022154323.GB7633-nKCvNrh56OoJmsy6czSMtA@public.gmane.org>
Content-Language: fr-FR
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: "linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org" <linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Samuel,

> Le 22 oct. 2015 =E0 17:44, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> a =E9=
crit :
>=20
=2E..

>>>> +enum nfcmrvl_phy {
>>>> +    NFCMRVL_PHY_USB        =3D 0,
>>>> +    NFCMRVL_PHY_UART    =3D 1,
>>>> +    NFCMRVL_PHY_I2C        =3D 2,
>>>> +    NFCMRVL_PHY_SPI        =3D 3,
>>>> +};
>>> Why is that part of the fw_dld header ?
>>=20
>> Because this information is given by the FW header inside the firmwa=
re binary. This is used to ensure that the firmaware used was configure=
d for the current phy interface.
> Sure. But can we keep it in the nfcmrvl.h header ?

Ok.

>>>> @@ -185,6 +202,11 @@ int nfcmrvl_nci_recv_frame(struct nfcmrvl_pri=
vate *priv, struct sk_buff *skb)
>>>>       }
>>>>   }
>>>>=20
>>>> +    if (priv->ndev->nfc_dev->fw_download_in_progress) {
>>> Who's setting that flag to true ?
>>=20
>> This is done by core code (check nfc_fw_download function in net/nfc=
/core.c).
> Duh. Sorry for the brain fart...

No problem

Br,
--=20
Vincent--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
