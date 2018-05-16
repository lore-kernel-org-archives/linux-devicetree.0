From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v5 0/7] pcal6524 extensions and fixes for pca953x driver
Date: Wed, 16 May 2018 15:32:19 +0200
Message-ID: <6AA622D1-DA8C-4C58-8EAE-555989E69149@goldelico.com>
References: <cover.1524933096.git.hns@goldelico.com> <CACRpkdbk0rNZ3cUN_noqVtNYgDrydGtCCn2fk7yqVRPoroYqpA@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbk0rNZ3cUN_noqVtNYgDrydGtCCn2fk7yqVRPoroYqpA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Kumar Gala <galak@codeaurora.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Alexandre Courbot <gnurou@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com
List-Id: devicetree@vger.kernel.org

Hi,

> Am 16.05.2018 um 13:53 schrieb Linus Walleij =
<linus.walleij@linaro.org>:
>=20
> On Sat, Apr 28, 2018 at 6:31 PM, H. Nikolaus Schaller =
<hns@goldelico.com> wrote:
>=20
>> V5:
>> * fix wrong split up between patches 1/7and 2/7.
>=20
> I applied patches 1, 2, 3 so we get some movement on the patch
> set and not too much for you to rebase.

thanks!

Well, I already had edited the commit messages for resending...

>=20
> It's fine to just resend the rest next time.

There is only one point open before resending:

what is the preferred style to be used for PCAL_GPIO_MASK?

* GENMASK(4, 0)
* or 0x1f

BR,
Nikolaus
