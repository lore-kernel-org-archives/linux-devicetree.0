From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v5 0/7] pcal6524 extensions and fixes for pca953x driver
Date: Wed, 16 May 2018 16:37:23 +0200
Message-ID: <9213FFC0-3C2B-447D-AA2C-55D7F93CFA27@goldelico.com>
References: <cover.1524933096.git.hns@goldelico.com> <CACRpkdbk0rNZ3cUN_noqVtNYgDrydGtCCn2fk7yqVRPoroYqpA@mail.gmail.com> <6AA622D1-DA8C-4C58-8EAE-555989E69149@goldelico.com> <CACRpkda_nrL8HQL3y+tvHKff+5zKykd3Ym1waEm=JC1tFQbbcw@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkda_nrL8HQL3y+tvHKff+5zKykd3Ym1waEm=JC1tFQbbcw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kumar Gala <galak@codeaurora.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Alexandre Courbot <gnurou@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com
List-Id: devicetree@vger.kernel.org


> Am 16.05.2018 um 16:31 schrieb Linus Walleij =
<linus.walleij@linaro.org>:
>=20
> On Wed, May 16, 2018 at 3:32 PM, H. Nikolaus Schaller =
<hns@goldelico.com> wrote:
>>> Am 16.05.2018 um 13:53 schrieb Linus Walleij =
<linus.walleij@linaro.org>:
>>> On Sat, Apr 28, 2018 at 6:31 PM, H. Nikolaus Schaller =
<hns@goldelico.com> wrote:
>>>=20
>>>> V5:
>>>> * fix wrong split up between patches 1/7and 2/7.
>>>=20
>>> I applied patches 1, 2, 3 so we get some movement on the patch
>>> set and not too much for you to rebase.
>>=20
>> thanks!
>>=20
>> Well, I already had edited the commit messages for resending...
>>=20
>>>=20
>>> It's fine to just resend the rest next time.
>>=20
>> There is only one point open before resending:
>>=20
>> what is the preferred style to be used for PCAL_GPIO_MASK?
>>=20
>> * GENMASK(4, 0)
>> * or 0x1f
>=20
> No strong opinion... sorry. Whatever you & the other driver
> contributors are most convenient with.

Ok, then let's keep the GENMASK(4, 0) since nobody did complain
about it.

BR and thanks,
Nikolaus=
