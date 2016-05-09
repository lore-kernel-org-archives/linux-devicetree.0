MIME-Version: 1.0
In-Reply-To: <CAHHoo-j7145vPFNmJH=CvPu-BRCgRe0WNKH8QDkSc+c3koxHAQ@mail.gmail.com>
References: <1462295611-49684-1-git-send-email-grundler@chromium.org>
	<20160504135123.GA4567@rob-hp-laptop>
	<CANEJEGt1Ri7Q-g25U8_KTAb9Z8MfVWH0N5QLaLcdnDuF_wwrtw@mail.gmail.com>
	<572C61B1.2040508@atmel.com>
	<CAHHoo-j7145vPFNmJH=CvPu-BRCgRe0WNKH8QDkSc+c3koxHAQ@mail.gmail.com>
Date: Mon, 9 May 2016 11:48:06 -0500
Message-ID: <CAL_Jsq+heaFryoekpzWVe3z0jP2-2u09umVC-kk4nWhBLUErpQ@mail.gmail.com>
Subject: Re: Input: add Atmel Atmegaxx captouch driver
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Daniel Hung-yu Wu <hywu@google.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, Grant Grundler <grundler@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input <linux-input@vger.kernel.org>, Grant Likely <grant.likely@linaro.org>, LKML <linux-kernel@vger.kernel.org>, Linux DeviceTree <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, May 6, 2016 at 10:14 AM, Daniel Hung-yu Wu <hywu@google.com> wrote:
> The register set is different, and this chip does not support calibration=
.
> The I2C protocol is not the same as well; there is an additional byte
> indicating data length.
>
> Atmega88PA is a general-purpose MCU. In the future, we will add more
> functionalities, such as firmware upgrade through I2C.


>
> On Fri, May 6, 2016 at 5:19 PM, Nicolas Ferre <nicolas.ferre@atmel.com>
> wrote:
>>
>> Le 05/05/2016 18:04, Grant Grundler a =C3=A9crit :
>> > On Wed, May 4, 2016 at 6:51 AM, Rob Herring <robh@kernel.org> wrote:
>> > ...
>> >>> +Required properties:
>> >>> +
>> >>> +     compatible:     Must be "atmel,atmegaxx_captouch".
>> >>
>> >> No wildcards in the compatible strings. Use the specific devices.
>> >>
>> >> Also, use hyphen rather than underscore. However, if the device is on=
ly
>> >> a touch controller, then '_captouch' is not needed. The part number i=
s
>> >> sufficient to identify the device.
>> >
>> > The primary part used on the board is AtMega88PA. Details of that SoC
>> > are public:
>> >     http://www.atmel.com/devices/ATMEGA88PA.aspx
>> >
>> > I don't see why the exact chip is relevant to the driver. The driver
>> > is just talking to an I2C device that reports button events.  The
>> > protocol across the I2C determines what this driver has to do and that
>> > protocol is implemented by the on-board firmware (supplied by Atmel).
>> > Any AVR CPU could implement this same protocol.
>> >
>> > Can we call this "atmel,qtouch-buttons-v2" or something like that?
>>
>> Is it different from the Atmel QT1070 or QT2160 which have drivers
>> already available in Linux:
>> drivers/input/keyboard/qt1070.c
>>
>> Bye,
>>
>> > I personally don't have anything invested in any particular name. Feel
>> > free to suggest a different one. I'm perfectly happy with any color
>> > paint on the shed.
>> >
>> > ...
>> >>> +Example:
>> >>> +
>> >>> +     atmegaxx_captouch@51 {
>> >>
>> >> atmegaxx@51 (with actual part number)
>> >
>> > Is "qtouch-buttons@51" ok?
>> >
>> >>
>> >>> +             compatible =3D "atmel,atmegaxx_captouch";
>> >>> +             reg =3D <0x51>;
>> >>> +             interrupt-parent =3D <&tlmm>;
>> >>> +             interrupts =3D <67 IRQ_TYPE_EDGE_FALLING>;
>> >>> +             linux,keycodes =3D <BTN_0>, <BTN_1>,
>> >>> +                     <BTN_2>, <BTN_3>,
>> >>> +                     <BTN_4>, <BTN_5>,
>> >>> +                     <BTN_6>, <BTN_7>;
>> >>> +             autorepeat;
>> >>> +     };
>> >
>> > cheers,
>> > grant
>> > --
>> > To unsubscribe from this list: send the line "unsubscribe devicetree" =
in
>> > the body of a message to majordomo@vger.kernel.org
>> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> >
>>
>>
>> --
>> Nicolas Ferre
>
>
