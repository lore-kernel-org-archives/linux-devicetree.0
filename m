From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v5 4/7] gpio: pca953x: define masks for addressing common and extended registers
Date: Fri, 4 May 2018 09:33:57 +0200
Message-ID: <71415CEC-6763-4658-A0C4-7AD4E3C1746D@goldelico.com>
References: <cover.1524933096.git.hns@goldelico.com> <3df974ea890116d759844e56362dc0786388869a.1524933096.git.hns@goldelico.com> <CAHp75Ve37aARbNZ8qu5W9C-fFG5Kf9GRE_VR4aRLFpX61zviyg@mail.gmail.com> <FA9DBCAF-2EA5-4317-BBA3-E2D6A9EAC5D4@goldelico.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <FA9DBCAF-2EA5-4317-BBA3-E2D6A9EAC5D4@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, kernel@pyra-handheld.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Linus,

> Am 02.05.2018 um 14:36 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
>=20
>> Am 02.05.2018 um 14:29 schrieb Andy Shevchenko =
<andy.shevchenko@gmail.com>:
>>=20
>> On Sat, Apr 28, 2018 at 7:31 PM, H. Nikolaus Schaller =
<hns@goldelico.com> wrote:
>>> These mask bits are to be used to map the extended register
>>> addreseses (which are defined for an unsupported 8-bit pcal chip)
>>> to 16 and 24 bit chips (pcal6524).
>>>=20

>>>=20
>>> +#define PCAL_GPIO_MASK         GENMASK(4, 0)
>>> +#define PCAL_PINCTRL_MASK      (~PCAL_GPIO_MASK)
>>=20
>> I'm not sure which would be better here
>>=20
>> 1) to follow existing style
>> 0x1F
>> 0xE0
>>=20
>> 2) to use GENMASK() in both definitions
>>=20
>> 3) as it in this patch.
>>=20
>>=20
>> Whatever Linus prefers.
>=20
> Ok, waiting for his suggestion.

Any advice if we should change or keep this?

(Please do not merge before I submit a v6 because there are
some more suggested-by and reviewed-by).

BR and thanks,
Nikolaus
