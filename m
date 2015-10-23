MIME-Version: 1.0
In-Reply-To: <CE8AEFC3-74F2-44B9-B7B6-EBDD1966FB3A@marvell.com>
References: <1445602986-3254-1-git-send-email-cuissard@marvell.com>
	<1445602986-3254-10-git-send-email-cuissard@marvell.com>
	<CAL_JsqJ7a+MNA8BPseGu_L+3yMr=jK-3YiSo+HZkoqJq2XpWgg@mail.gmail.com>
	<CE8AEFC3-74F2-44B9-B7B6-EBDD1966FB3A@marvell.com>
Date: Fri, 23 Oct 2015 16:34:01 -0500
Message-ID: <CAL_JsqL4YS0T7PiFa=9wNHfaRjkc1tLL7vGRqWcrr6QdQfPSpA@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] NFC: nfcmrvl: update device tree bindings for
 Marvell NFC
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Vincent Cuissard <cuissard@marvell.com>
Cc: "linux-nfc@lists.01.org" <linux-nfc@lists.01.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, Oct 23, 2015 at 8:47 AM, Vincent Cuissard <cuissard@marvell.com> wr=
ote:
> Hi Rob,
>
>> Le 23 oct. 2015 =C3=A0 15:18, Rob Herring <robh@kernel.org> a =C3=A9crit=
 :
>>
>>> On Fri, Oct 23, 2015 at 7:23 AM, Vincent Cuissard <cuissard@marvell.com=
> wrote:
>>> Align NFC bindgins to use marvell instead of mrvl.
>>>
>>> Signed-off-by: Vincent Cuissard <cuissard@marvell.com>
>>> ---
>>> Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt | 12 ++++++------
>>> drivers/nfc/nfcmrvl/i2c.c                             |  2 +-
>>> drivers/nfc/nfcmrvl/spi.c                             |  2 +-
>>> drivers/nfc/nfcmrvl/uart.c                            |  2 +-
>>> 4 files changed, 9 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt b/Do=
cumentation/devicetree/bindings/net/nfc/nfcmrvl.txt
>>> index 41058fc..0f95924 100644
>>> --- a/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt
>>> +++ b/Documentation/devicetree/bindings/net/nfc/nfcmrvl.txt
>>> @@ -2,9 +2,9 @@
>>>
>>> Required properties:
>>> - compatible: Should be:
>>> -  - "mrvl,nfc-uart" for UART devices
>>> -  - "mrvl,nfc-i2c" for I2C devices
>>> -  - "mrvl,nfc-spi" for SPI devices
>>> +  - "marvell,nfc-uart" for UART devices
>>> +  - "marvell,nfc-i2c" for I2C devices
>>> +  - "marvell,nfc-spi" for SPI devices
>>
>> There is no point in changing these and doing so breaks backwards compat=
ibility.
>
> There is no break since these 2 drivers are new. In the same patchset I f=
irst set mrvl and replace it to marvell since I figured out that this is th=
e name for all other Marvell drivers.


>
>> These bindings have a bigger issue in that it doesn't describe the
>> hardware, but rather just something to bind the Linux driver. The
>> compatible strings should be tied to what NFC chip you have (i.e. the
>> part number).
>
> Chips with same physical interface are compatible so I don't need to use =
a part number that's why I using a generic binding.

They=20

>
> Br,
> --
> Vincent
