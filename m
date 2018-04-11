Return-Path: <SRS0=6eRS=HA=goldelico.com=hns@kernel.org>
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH v3 2/4] gpio: pca953x: add register definitions for pcal6524 and fix address calculation
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CAHp75VfYk1tSJ9PUshDvY2RaYrc+wR+hyrK8Ck1oQSUXPr-0fQ@mail.gmail.com>
Date: Wed, 11 Apr 2018 07:00:04 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <EDF7FA02-C79C-4ADF-A10C-F8C4DBFE5158@goldelico.com>
References: <cover.1523376423.git.hns@goldelico.com> <0e9bea79eae7504e61fabdb4a0311f8fdc2f6b25.1523376423.git.hns@goldelico.com> <CAHp75VfYk1tSJ9PUshDvY2RaYrc+wR+hyrK8Ck1oQSUXPr-0fQ@mail.gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, devicetree <devicetree@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com
List-ID: <devicetree@vger.kernel.org>

Hi Andy,

> Am 10.04.2018 um 20:06 schrieb Andy Shevchenko =
<andy.shevchenko@gmail.com>:
>=20
> On Tue, Apr 10, 2018 at 7:07 PM, H. Nikolaus Schaller =
<hns@goldelico.com> wrote:
>> PCAL chips ("L" seems to stand for "latched") have additional
>> registers starting at address 0x40 to control the latches,
>> interrupt mask, pull-up and pull down etc.
>>=20
>> The constants are so far defined in a way that they fit for
>> the pcal9555a when shifted by the number of banks, i.e. multiplied
>> by 2.
>>=20
>> Now the pcal6524 has 3 banks which means the relative offset
>> must be multiplied by 4 which gives a wrong result if not done
>> carefully, since the base offset is already included in the offset.
>>=20
>> For the basic registers shared with all pca93xx/tca64xx chips
>> there is no such offset.
>>=20
>> Therefore, we add code to adjust the register number for exended
>> registers to the 24 bit accessor functions.
>>=20
>> And we add additional register offset constants (not yet used by
>> the driver code) which are specific to the pcal6524.
>>=20
>=20
> First of all, as I said, please split this to two patches. Don't mix =
the things.

Ok. Queued for v4.

>=20
>=20
>> +       /* adjust register address for pcal6524 */
>> +       if (reg >=3D PCAL953X_OUT_STRENGTH)
>> +               reg -=3D PCAL953X_OUT_STRENGTH >> 1;
>> +
>=20
> Give me some days to think about it.

No problem. I'll wait with v4.

The only alternative I would see is to add new accessor function
pointers for the extended registers and have 0x00 based offsets,
but that is IMHO more ugly.

BR and thanks,
Nikolaus
