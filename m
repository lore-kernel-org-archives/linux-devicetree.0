From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: enable gpio for pin groups
Date: Wed, 27 Sep 2017 01:52:45 +0200
Message-ID: <CACRpkdZn=DogDy8-iXavmrkd1d=FoeL94jb-Sb4iPwb-s+GJjA@mail.gmail.com>
References: <20170921062808.fde5bpvn3wfau67h@pengutronix.de>
 <CACRpkdacz+oC_8J5VHSsKXHGqxn96ETziu+ifUp4XHHrwcqbtA@mail.gmail.com> <20170922180219.chvjuxmrharnw332@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170922180219.chvjuxmrharnw332@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 22, 2017 at 8:02 PM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Fri, Sep 22, 2017 at 03:23:05PM +0200, Linus Walleij wrote:
>> On Thu, Sep 21, 2017 at 8:28 AM, Uwe Kleine-K=C3=B6nig
>> <u.kleine-koenig@pengutronix.de> wrote:
>>
>> > on an i.MX25 machine on my desk a UART RX line is guarded by a transis=
tor
>> > like this:
>> >
>> >         ,------------------------.
>> >         | ,---------.            |
>> >         | |  imx25  o--RX----=E2=97=81---o---
>> >         | |         o--GPIO--'   |
>> >         | `---------'            |
>> >         `------------------------'
>>
>> This is inside the SoC, right, not outside it?
>>
>> In the rest of my answer I assume this.
>
> No, that's on the board. So your reply unfortunately doesn't match the
> problem :-|

OK sorry for my stupid and pointless assumption about this being
inside the SoC, I should ask before I talk.

>> If this is on the board, using enable-gpios is proper.
>
> enable-gpios as I suggested below that is? If so I assume you will be
> open for a generic approach to implement this?

So the enable-gpios as part of the pin control state like below:

>> > My first idea was to make this a property of the UART and added a
>> > enable-gpios property for it[1]. But now I wonder if this is better
>> > abstracted as an enable-gpios property in the pinctrl node. Something
>> > like:
>> >
>> >         pinctrl_uart5: uart5 {
>> >                 fsl,pins =3D <
>> >                         MX25_PAD_ECB__UART5_TXD                 0x0000=
2080 /* TXD */
>> >                         MX25_PAD_LBA__UART5_RXD                 0x0000=
0000 /* RXD */
>> >                         MX25_PAD_CS4__UART5_CTS                 0x0000=
2001 /* RTS */
>> >                         MX25_PAD_CS5__GPIO_3_21                 0x0000=
2001 /* #RXD_EN */
>> >                 >;
>> >                 enable-gpios =3D <&gpio3 21 GPIO_ACTIVE_LOW>;
>> >         };
>> >
>> > Would this make sense? Maybe with a more intuitive name?

I would nominally make it part of the UART node and picked up by the
UART driver. Unless there is compelling reasons to believe that this is
something we will see a lot and not a particular oddity.

Yours,
Linus Walleij
