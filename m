From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH 0/6] Introduce Juniper CBC FPGA
Date: Fri, 7 Oct 2016 21:53:29 +0300
Message-ID: <DD6D31CF-54E9-4A14-A9DD-C447D10006C9@konsulko.com>
References: <1475853614-22409-1-git-send-email-pantelis.antoniou@konsulko.com> <20161007153944.GA13519@kroah.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20161007153944.GA13519@kroah.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lee Jones <lee.jones@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, devel@driverdev.osuosl.org, devicetree <devicetree@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "<linux-kernel@vger.kernel.org>" <linux-kernel@vger.kernel.org>, JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Debjit Ghosh <dghosh@juniper.net>, Mohammad Kamil <mkamil@juniper.net>, Georgi Vlaev <gvlaev@juniper.net>, Frank Rowand <frowand.list@gmail.com>, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org

Hi Greg,

> On Oct 7, 2016, at 18:39 , Greg Kroah-Hartman =
<gregkh@linuxfoundation.org> wrote:
>=20
> On Fri, Oct 07, 2016 at 06:20:08PM +0300, Pantelis Antoniou wrote:
>> Add Juniper's PTX1K CBC FPGA driver. Those FPGAs
>> are present in Juniper's PTX series of routers.
>>=20
>> The MFD driver provices a gpio device and a special
>> driver for Juniper's board infrastucture.
>> The FPGA infrastucture driver is providing an interface
>> for user-space handling of the FPGA in those platforms.
>>=20
>> There are full device tree binding documents for the
>> master mfd driver and for the slave driver.
>>=20
>> This patchset is against mainline as of today: v4.8-9431-g3477d16
>> and is dependent on the "Juniper prerequisites" and
>> "Juniper infrastructure" patchsets sent earlier.
>>=20
>> Georgi Vlaev (5):
>>  mfd: Add support for the PTX1K CBC FPGA
>>  gpio: Add support for PTX1K CBC FPGA spare GPIOs
>>  gpio: gpio-cbc: Document bindings of CBC FPGA GPIO block
>>  gpio: cbc-presence: Add CBC presence detect as GPIO driver
>>  gpio: gpio-cbc-presense: Document bindings of CBC FPGA presence
>>=20
>> Tom Kavanagh (1):
>>  staging: jnx: CBD-FPGA infrastructure
>>=20
>> .../bindings/gpio/jnx,gpio-cbc-presense.txt        |  31 +
>> .../devicetree/bindings/gpio/jnx,gpio-cbc.txt      |  30 +
>> drivers/gpio/Kconfig                               |  23 +
>> drivers/gpio/Makefile                              |   2 +
>> drivers/gpio/gpio-cbc-presence.c                   | 460 ++++++++++
>> drivers/gpio/gpio-cbc.c                            | 236 +++++
>> drivers/mfd/Kconfig                                |  16 +
>> drivers/mfd/Makefile                               |   1 +
>> drivers/mfd/cbc-core.c                             | 971 =
+++++++++++++++++++++
>> drivers/staging/jnx/Kconfig                        |  34 +
>> drivers/staging/jnx/Makefile                       |   5 +
>> drivers/staging/jnx/jnx-cbc-ptx1k.c                | 242 +++++
>> drivers/staging/jnx/jnx-cbd-fpga-common.c          | 332 +++++++
>> drivers/staging/jnx/jnx-cbd-fpga-common.h          |  27 +
>> drivers/staging/jnx/jnx-cbd-fpga-core.c            | 540 ++++++++++++
>> drivers/staging/jnx/jnx-cbd-fpga-core.h            |  68 ++
>> drivers/staging/jnx/jnx-cbd-fpga-platdata.h        |  51 ++
>> drivers/staging/jnx/jnx-cbd-fpga-ptx1k.c           | 134 +++
>> drivers/staging/jnx/jnx-cbd-fpga-ptx21k.c          | 143 +++
>> drivers/staging/jnx/jnx-cbd-fpga-ptx3k.c           | 111 +++
>> drivers/staging/jnx/jnx-cbd-fpga-ptx5k.c           | 107 +++
>> include/linux/mfd/cbc-core.h                       | 181 ++++
>> 22 files changed, 3745 insertions(+)
>=20
> Please don't mix driver submissions like this.  Staging stuff needs to
> go to the staging maintainer, gpio to that one, mfd to that one, and =
so
> on.
>=20
> there's almost nothing anyone can do with this series as-is, sorry.
>=20
> please split it up.
>=20

Now I=E2=80=99m confused, this is a typical MFD submission:

https://lwn.net/Articles/587032/

Looks like it=E2=80=99s normal for a single patchset against multiple =
subsystems.

Do we have a definitive form for this?

> thanks,
>=20
> greg k-h

Regards

=E2=80=94 Pantelis

