From: Michal Simek <monstr@monstr.eu>
Subject: Re: [RFCv2 3/3] reset: reset-zynq: Adding support for Xilinx Zynq
 reset controller.
Date: Tue, 28 Jul 2015 07:43:09 +0200
Message-ID: <55B7166D.4040503@monstr.eu>
References: <1437783682-13632-1-git-send-email-moritz.fischer@ettus.com>
 <1437783682-13632-4-git-send-email-moritz.fischer@ettus.com>
 <55B5D9C2.60509@monstr.eu>
 <CAAtXAHcN3YS+k9HH4WaPusg+sidU_a=-RWZ+D43bWe1pH60G0w@mail.gmail.com>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="ifBlX5lXUHrDNVx9p8lDtmcvVtmo20d85"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAtXAHcN3YS+k9HH4WaPusg+sidU_a=-RWZ+D43bWe1pH60G0w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: p.zabel@pengutronix.de, mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kumar Gala <galak@codeaurora.org>, =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann@xilinx.com>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ifBlX5lXUHrDNVx9p8lDtmcvVtmo20d85
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 07/28/2015 06:59 AM, Moritz Fischer wrote:
> Hi Michal,
>=20
> On Mon, Jul 27, 2015 at 12:12 AM, Michal Simek <monstr@monstr.eu> wrote=
:
>> On 07/25/2015 02:21 AM, Moritz Fischer wrote:
>>> This adds a reset controller driver to control the Xilinx Zynq
>>> SoC's various resets.
>>>
>>> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
>>> ---
>>>  drivers/reset/Makefile     |   1 +
>>>  drivers/reset/reset-zynq.c | 142 +++++++++++++++++++++++++++++++++++=
++++++++++
>>>  2 files changed, 143 insertions(+)
>>>  create mode 100644 drivers/reset/reset-zynq.c
>>>
>>> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
>>> index 157d421..3fe50e7 100644
>>> --- a/drivers/reset/Makefile
>>> +++ b/drivers/reset/Makefile
>>> @@ -3,3 +3,4 @@ obj-$(CONFIG_ARCH_SOCFPGA) +=3D reset-socfpga.o
>>>  obj-$(CONFIG_ARCH_BERLIN) +=3D reset-berlin.o
>>>  obj-$(CONFIG_ARCH_SUNXI) +=3D reset-sunxi.o
>>>  obj-$(CONFIG_ARCH_STI) +=3D sti/
>>> +obj-$(CONFIG_ARCH_ZYNQ) +=3D reset-zynq.o
>>> diff --git a/drivers/reset/reset-zynq.c b/drivers/reset/reset-zynq.c
>>> new file mode 100644
>>> index 0000000..05e37f8
>>> --- /dev/null
>>> +++ b/drivers/reset/reset-zynq.c
>>> @@ -0,0 +1,142 @@
>>> +/*
>>> + * Copyright (c) 2015, National Instruments Corp.
>>> + *
>>> + * Xilinx Zynq Reset controller driver
>>> + *
>>> + * This program is free software; you can redistribute it and/or mod=
ify
>>> + * it under the terms of the GNU General Public License as published=
 by
>>> + * the Free Software Foundation; version 2 of the License.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
>>> + * GNU General Public License for more details.
>>> + */
>>> +
>>> +#include <linux/err.h>
>>> +#include <linux/io.h>
>>> +#include <linux/module.h>
>>> +#include <linux/mfd/syscon.h>
>>> +#include <linux/of.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/reset-controller.h>
>>> +#include <linux/regmap.h>
>>> +#include <linux/types.h>
>>> +
>>> +/* Offsets into SLCR regmap */
>>> +#define SLCR_RST_CTRL_OFFSET 0x200 /* FPGA Software Reset Control */=

>>> +
>>> +#define NBANKS       18
>>> +
>>> +struct zynq_reset_data {
>>> +     struct regmap *slcr;
>>> +     struct reset_controller_dev rcdev;
>>> +};
>>> +
>>> +#define to_zynq_reset_data(p)                \
>>> +     container_of((p), struct zynq_reset_data, rcdev)
>>> +
>>> +static int zynq_reset_assert(struct reset_controller_dev *rcdev,
>>> +                          unsigned long id)
>>> +{
>>> +     struct zynq_reset_data *priv =3D to_zynq_reset_data(rcdev);
>>> +
>>> +     int bank =3D id / BITS_PER_LONG;
>>> +     int offset =3D id % BITS_PER_LONG;
>>> +
>>
>> Personally me I would also add debug message here to be simply enabled=

>> for easier tracking.
> See below
>>
>>> +     regmap_update_bits(priv->slcr,
>>> +                        SLCR_RST_CTRL_OFFSET + (bank * 4),
>>> +                        BIT(offset),
>>> +                        BIT(offset));
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int zynq_reset_deassert(struct reset_controller_dev *rcdev,
>>> +                            unsigned long id)
>>> +{
>>> +     struct zynq_reset_data *priv =3D to_zynq_reset_data(rcdev);
>>> +
>>> +     int bank =3D id / BITS_PER_LONG;
>>> +     int offset =3D id % BITS_PER_LONG;
>>> +
>>
>> debug message here too.
> is:
> pr_debug("%s: bank: %u offset %u\n", __func__, bank, offset);
> accetable? Otherwise I'd have to carry around a struct dev* to use dev_=
dbg()

It is fine for me.

Thanks,
Michal

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--ifBlX5lXUHrDNVx9p8lDtmcvVtmo20d85
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.14 (GNU/Linux)

iEYEARECAAYFAlW3Fm4ACgkQykllyylKDCFKfACfRDjDrepaxPXe6/GkGgaI/vC0
yPUAn1Eq9NBKR9lYHEw7UFeVEYUk8+L8
=I9r9
-----END PGP SIGNATURE-----

--ifBlX5lXUHrDNVx9p8lDtmcvVtmo20d85--
