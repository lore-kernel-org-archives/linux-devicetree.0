From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] scripts/dtc: dt_to_config - report kernel config options
 for a devicetree
Date: Thu, 28 Apr 2016 16:31:19 -0700
Message-ID: <57229D47.6070704@gmail.com>
References: <572284AB.102@gmail.com> <CAL_JsqKGcc_wXV2_-3ZVS7gzfo2ao9z+eATdnKVsyRnW2O5e4A@mail.gmail.com>
Reply-To: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKGcc_wXV2_-3ZVS7gzfo2ao9z+eATdnKVsyRnW2O5e4A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 4/28/2016 3:32 PM, Rob Herring wrote:
> On Thu, Apr 28, 2016 at 4:46 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org=
> wrote:
>> From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
>>
>> Determining which kernel config options need to be enabled for a
>> given devicetree can be a painful process.  Create a new tool to
>> find the drivers that may match a devicetree node compatible,
>> find the kernel config options that enable the driver, and
>> optionally report whether the kernel config option is enabled.
>=20
> I would find this more useful to output a config fragment with all th=
e
> options enabled. The hard part there is enabling the options a given
> option is dependent on which I don't think kbuild takes care of.
>=20
>> Signed-off-by: Gaurav Minocha <gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Signed-off-by: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
>>
>> ---
>>  scripts/dtc/dt_to_config | 1061 +++++++++++++++++++++++++++++++++++=
++++++++++++
>>  1 file changed, 1061 insertions(+)
>>
>> Index: b/scripts/dtc/dt_to_config
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> --- /dev/null
>> +++ b/scripts/dtc/dt_to_config
>> @@ -0,0 +1,1061 @@
>> +#!/usr/bin/perl
>=20
> I don't do perl...
>=20
>> +
>> +#   Copyright 2016 by Frank Rowand
>> +# =C5=A0 Copyright 2016 by Gaurav Minocha
>      ^
> Is this supposed to be a copyright symbol?

Yes.  Gaurav, can we drop this symbol?


>> +#
>> +# This file is subject to the terms and conditions of the GNU Gener=
al Public
>> +# License v2.
>=20
> [...]
>=20
>> +# ----- magic compatibles, do not have a driver
>> +#
>> +# Will not search for drivers for these compatibles.
>> +
>> +%compat_white_list =3D (
>> +       'fixed-partitions'      =3D> '1',
>=20
> Enabling CONFIG_MTD would be useful.

Thanks!  I'll dig deeper, but it likes like maybe
CONFIG_MTD_OF_PARTS also.


>> +       'none'                  =3D> '1',
>=20
> Is this an actual string used somewhere?

Yes.  Looking at the output from running this against all .dts
files has led to some interesting information.

An example of compatible =3D "none" is node mct@10050000 from
arch/arm/boot/dts/exynos4210-universal_c210.dts

>=20
>> +       'pci'                   =3D> '1',
>=20
> ditto?

arch/x86/platform/ce4100/falconfalls.dts, node pci@3fc


>> +       'simple-bus'            =3D> '1',
>> +);
>> +
>> +# magic compatibles, have a driver
>> +#
>> +# Will not search for drivers for these compatibles.
>> +# Will instead use the drivers and config options listed here.
>> +#
>> +# If you add an entry to this hash, add the corresponding entry
>> +# to %driver_config_hard_code_list.
>> +#
>> +# These compatibles have a very large number of false positives.
>=20
> What does this mean?

That means that a _lot_ of garbage, bogus matches are reported,
creating a lot of noise in the report.


>> +#
>> +# 'hardcoded_no_driver' is a magic value.  Other code knows this
>> +# magic value.  Do not use 'no_driver' here!
>> +#
>> +# TODO: Revisit each 'hardcoded_no_driver' to see how the compatibl=
e
>> +#       is used.  Are there drivers that can be provided?
>> +
>> +%driver_hard_code_list =3D (
>> +       'cache'                 =3D> ['hardcoded_no_driver'],
>> +       'eeprom'                =3D> ['hardcoded_no_driver'],
>> +       'gpio'                  =3D> ['hardcoded_no_driver'],
>> +       'gpios'                 =3D> ['drivers/leds/leds-tca6507.c']=
,
>> +       'gpio-keys'             =3D> ['drivers/input/keyboard/gpio_k=
eys.c'],
>> +       'i2c-gpio'              =3D> ['drivers/i2c/busses/i2c-gpio.c=
'],
>> +       'isa'                   =3D> ['arch/mips/mti-malta/malta-dt.=
c',
>> +                                    'arch/x86/kernel/devicetree.c']=
,
>> +       'led'                   =3D> ['hardcoded_no_driver'],
>> +       'm25p32'                =3D> ['hardcoded_no_driver'],
>> +       'm25p64'                =3D> ['hardcoded_no_driver'],
>> +       'm25p80'                =3D> ['hardcoded_no_driver'],
>> +       'mtd_ram'               =3D> ['drivers/mtd/maps/physmap_of.c=
'],
>> +       'pwm-backlight'         =3D> ['drivers/video/backlight/pwm_b=
l.c'],
>> +       'spidev'                =3D> ['hardcoded_no_driver'],
>> +       'syscon'                =3D> ['drivers/mfd/syscon.c'],
>> +       'tlv320aic23'           =3D> ['hardcoded_no_driver'],
>> +       'wm8731'                =3D> ['hardcoded_no_driver'],
>> +);
>> +
>> +%driver_config_hard_code_list =3D (
>> +
>> +       # this one needed even if %driver_hard_code_list is empty
>> +       'no_driver'                             =3D> ['no_config'],
>> +       'hardcoded_no_driver'                   =3D> ['no_config'],
>> +
>> +       'drivers/leds/leds-tca6507.c'           =3D> ['CONFIG_LEDS_T=
CA6507'],
>> +       'drivers/input/keyboard/gpio_keys.c'    =3D> ['CONFIG_KEYBOA=
RD_GPIO'],
>> +       'drivers/i2c/busses/i2c-gpio.c'         =3D> ['CONFIG_I2C_GP=
IO'],
>> +       'arch/mips/mti-malta/malta-dt.c'        =3D> ['obj-y'],
>> +       'arch/x86/kernel/devicetree.c'          =3D> ['CONFIG_OF'],
>> +       'drivers/mtd/maps/physmap_of.c'         =3D> ['CONFIG_MTD_PH=
YSMAP_OF'],
>> +       'drivers/video/backlight/pwm_bl.c'      =3D> ['CONFIG_BACKLI=
GHT_PWM'],
>> +       'drivers/mfd/syscon.c'                  =3D> ['CONFIG_MFD_SY=
SCON'],
>=20
> I don't understand why some of these are not searchable by compatible=
 strings.

I will have to get back to you later on this question.


>> +
>> +       # drivers/usb/host/ehci-ppc-of.c
>> +       # drivers/usb/host/ehci-xilinx-of.c
>> +       #  are included from:
>> +       #    drivers/usb/host/ehci-hcd.c
>> +       #  thus the search of Makefile for the included .c files is =
incorrect
>> +       # ehci-hcd.c wraps the includes with ifdef CONFIG_USB_EHCI_H=
CD_..._OF
>> +       #
>> +       # similar model for ohci-hcd.c (but no ohci-xilinx-of.c)
>> +       #
>> +       # similarly, uhci-hcd.c includes uhci-platform.c
>> +
>> +       'drivers/usb/host/ehci-ppc-of.c'        =3D> ['CONFIG_USB_EH=
CI_HCD',
>> +                                                   'CONFIG_USB_EHCI=
_HCD_PPC_OF'],
>> +       'drivers/usb/host/ohci-ppc-of.c'        =3D> ['CONFIG_USB_OH=
CI_HCD',
>> +                                                   'CONFIG_USB_OHCI=
_HCD_PPC_OF'],
>> +
>> +       'drivers/usb/host/ehci-xilinx-of.c'     =3D> ['CONFIG_USB_EH=
CI_HCD',
>> +                                                   'CONFIG_USB_EHCI=
_HCD_XILINX'],
>> +
>> +       'drivers/usb/host/uhci-platform.c'      =3D> ['CONFIG_USB_UH=
CI_HCD',
>> +                                                   'CONFIG_USB_UHCI=
_PLATFORM'],
>> +
>> +       # scan_makefile will find only one of these config options:
>> +       #    ifneq ($(CONFIG_SOC_IMX6)$(CONFIG_SOC_LS1021A),)
>> +       'arch/arm/mach-imx/platsmp.c'           =3D> ['CONFIG_SOC_IM=
X6 && CONFIG_SMP',
>> +                                                   'CONFIG_SOC_LS10=
21A && CONFIG_SMP'],
>=20
> These will never get updated when the files or config options change.
> Conversely, how do I know if I need to add something here? Is this
> list complete or based on testing some set of dts files. IMO, this
> list has to go to merge this.

That is a concern that I have also.  I added a warning flag in the
flags field to indicate when one of these hard-coded values was used.
The flag does not solve the issue, but does make it more visible.

The list is a result of running against every dts file in the kernel
tree and looking at the reports.


>> +);
>> +
>> +
>> +# 'virt/kvm/arm/.*' are controlled by makefiles in other directorie=
s,
>> +# using relative paths, such as 'KVM :=3D ../../../virt/kvm'.  Do n=
ot
>> +# add complexity to find_kconfig() to deal with this.  There is a l=
ong
>> +# term intent to change the kvm related makefiles to the normal ker=
nel
>> +# style.  After that is done, this entry can be removed from the
>> +# driver_black_list.
>> +
>> +@driver_black_list =3D (
>> +       'virt/kvm/arm/.*',
>> +);
>=20
> A small number of exceptions like this I could stomach.
>=20
> The rest is just write-only language nonsense...
>=20
> Rob
>=20

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
