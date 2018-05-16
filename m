From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v6 2/3] gpio: pca953x: define masks for addressing common and extended registers
Date: Wed, 16 May 2018 21:57:36 +0200
Message-ID: <3E4522A9-A649-4D01-AE2A-57B9C8ED8851@goldelico.com>
References: <cover.1526490085.git.hns@goldelico.com> <314df7f911fda8f5584cc4384a26074848a2673b.1526490085.git.hns@goldelico.com> <CAHp75VcadghXsqu66NmrfbEPpgqusEUuzSkrE8PSJjAV0avntQ@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VcadghXsqu66NmrfbEPpgqusEUuzSkrE8PSJjAV0avntQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Kumar Gala <galak@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, devicetree <devicetree@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com
List-Id: devicetree@vger.kernel.org


> Am 16.05.2018 um 21:50 schrieb Andy Shevchenko =
<andy.shevchenko@gmail.com>:
>=20
> On Wed, May 16, 2018 at 8:01 PM, H. Nikolaus Schaller =
<hns@goldelico.com> wrote:
>> These mask bits are to be used to map the extended register
>> addreseses (which are defined for an unsupported 8-bit pcal chip)
>> to 16 and 24 bit chips (pcal6524).
>>=20
>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> drivers/gpio/gpio-pca953x.c | 4 ++++
>> 1 file changed, 4 insertions(+)
>>=20
>> diff --git a/drivers/gpio/gpio-pca953x.c =
b/drivers/gpio/gpio-pca953x.c
>> index 2b667166e855..c0eb679e60d4 100644
>> --- a/drivers/gpio/gpio-pca953x.c
>> +++ b/drivers/gpio/gpio-pca953x.c
>> @@ -56,6 +56,10 @@
>> #define PCAL6524_DEBOUNCE      0x2d
>>=20
>> #define PCA_GPIO_MASK          0x00FF
>> +
>> +#define PCAL_GPIO_MASK         GENMASK(4, 0)
>> +#define PCAL_PINCTRL_MASK      (~PCAL_GPIO_MASK)
>> +
>=20
> I give second thought about it, and think
> either plain values, or second converted to its own explicit GENMASK
> would be better.
>=20
> (most confusing part to me is unknowness of the side of PINCTRL part
> in the mask)

I see.

Then, I'd also prefer plain values.

If ok, I can send a v7 tomorrow.

BR,
Nikolaus
