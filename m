From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 1/5] mfd: max14577: Add max14577 MFD driver core
Date: Fri, 22 Nov 2013 09:31:18 +0000
Message-ID: <20131122093118.GH23067@lee--X1>
References: <1385109972-28059-1-git-send-email-k.kozlowski@samsung.com>
 <1385109972-28059-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1385109972-28059-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Anton Vorontsov <anton@enomsg.org>, David Woodhouse <dwmw2@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
List-Id: devicetree@vger.kernel.org

On Fri, 22 Nov 2013, Krzysztof Kozlowski wrote:

> From: Chanwoo Choi <cw00.choi@samsung.com>
>=20
> This patch adds max14577 core/irq driver to support MUIC(Micro USB IC=
)
> device and charger device and support irq domain method to control
> internal interrupt of max14577 device. Also, this patch supports DT
> binding with max14577_i2c_parse_dt().
>=20
> The MAXIM 14577 chip contains Micro-USB Interface Circuit and Li+ Bat=
tery
> Charger. It contains accessory and USB charger detection logic. It su=
pports
> USB 2.0 Hi-Speed, UART and stereo audio signals over Micro-USB connec=
tor.
>=20
> The battery charger is compliant with the USB Battery Charging Specif=
ication
> Revision 1.1. It has also SFOUT LDO output for powering USB devices.
>=20
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/mfd/Kconfig                  |   13 ++
>  drivers/mfd/Makefile                 |    1 +
>  drivers/mfd/max14577.c               |  241 ++++++++++++++++++++++++=
+
>  include/linux/mfd/max14577-private.h |  324 ++++++++++++++++++++++++=
++++++++++
>  include/linux/mfd/max14577.h         |   70 ++++++++
>  5 files changed, 649 insertions(+)
>  create mode 100644 drivers/mfd/max14577.c
>  create mode 100644 include/linux/mfd/max14577-private.h
>  create mode 100644 include/linux/mfd/max14577.h

<snip>

> +static struct mfd_cell max14577_devs[] =3D {
> +	{ .name =3D "max14577-muic", },
> +	{ .name =3D "max14577-regulator", },
> +	{ .name =3D "max14577-charger", },
> +};

If these all support device tree, shouldn't you be populating
max14577_devs[x].of_compatible too? That way the MFD core will
automatically setup your dev.of_node pointers for you?

<snip>

> +	max14577->vendor_id =3D (reg_data & 0x7);
> +	max14577->device_id =3D ((reg_data & 0xF8) >> 0x3);

I'm not too keen on these magic numbers, can you create #defines for
them please? If there are any other interesting address, it might be
worth creating some for those too.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
