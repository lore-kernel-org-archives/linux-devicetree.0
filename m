From: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 9/9] NFC: nfcmrvl: update device tree bindings for
 Marvell NFC
Date: Fri, 23 Oct 2015 13:47:56 +0000
Message-ID: <CE8AEFC3-74F2-44B9-B7B6-EBDD1966FB3A@marvell.com>
References: <1445602986-3254-1-git-send-email-cuissard@marvell.com>
 <1445602986-3254-10-git-send-email-cuissard@marvell.com>,<CAL_JsqJ7a+MNA8BPseGu_L+3yMr=jK-3YiSo+HZkoqJq2XpWgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJ7a+MNA8BPseGu_L+3yMr=jK-3YiSo+HZkoqJq2XpWgg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: fr-FR
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org" <linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

> Le 23 oct. 2015 =E0 15:18, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> a =E9crit :
>=20
>> On Fri, Oct 23, 2015 at 7:23 AM, Vincent Cuissard <cuissard@marvell.=
com> wrote:
>> Align NFC bindgins to use marvell instead of mrvl.
>>=20
>> Signed-off-by: Vincent Cuissard <cuissard-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
>> ---
>> Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt | 12 ++++++---=
---
>> drivers/nfc/nfcmrvl/i2c.c                             |  2 +-
>> drivers/nfc/nfcmrvl/spi.c                             |  2 +-
>> drivers/nfc/nfcmrvl/uart.c                            |  2 +-
>> 4 files changed, 9 insertions(+), 9 deletions(-)
>>=20
>> diff --git a/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt b=
/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt
>> index 41058fc..0f95924 100644
>> --- a/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt
>> +++ b/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt
>> @@ -2,9 +2,9 @@
>>=20
>> Required properties:
>> - compatible: Should be:
>> -  - "mrvl,nfc-uart" for UART devices
>> -  - "mrvl,nfc-i2c" for I2C devices
>> -  - "mrvl,nfc-spi" for SPI devices
>> +  - "marvell,nfc-uart" for UART devices
>> +  - "marvell,nfc-i2c" for I2C devices
>> +  - "marvell,nfc-spi" for SPI devices
>=20
> There is no point in changing these and doing so breaks backwards com=
patibility.

There is no break since these 2 drivers are new. In the same patchset I=
 first set mrvl and replace it to marvell since I figured out that this=
 is the name for all other Marvell drivers.

> These bindings have a bigger issue in that it doesn't describe the
> hardware, but rather just something to bind the Linux driver. The
> compatible strings should be tied to what NFC chip you have (i.e. the
> part number).

Chips with same physical interface are compatible so I don't need to us=
e a part number that's why I using a generic binding.

Br,
--=20
Vincent--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
