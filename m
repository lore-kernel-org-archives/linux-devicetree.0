From: Gaurav Minocha <gaurav.minocha.os@gmail.com>
Subject: Re: [PATCH] scripts/dtc: dt_to_config - report kernel config options
 for a devicetree
Date: Thu, 28 Apr 2016 23:39:45 -0700
Message-ID: <CA+rpMbJkWM+bsvXT77eyLGewtKHjX1inc0vjsWxYQTCgzmpDGg@mail.gmail.com>
References: <572284AB.102@gmail.com>
	<CAL_JsqKGcc_wXV2_-3ZVS7gzfo2ao9z+eATdnKVsyRnW2O5e4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKGcc_wXV2_-3ZVS7gzfo2ao9z+eATdnKVsyRnW2O5e4A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel list <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Pavel Machek <pavel@ucw.cz>, Alison Chaiken <alison_chaiken@mentor.com>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 28, 2016 at 3:32 PM, Rob Herring <robh+dt@kernel.org> wrote=
:
> On Thu, Apr 28, 2016 at 4:46 PM, Frank Rowand <frowand.list@gmail.com=
> wrote:
>> From: Frank Rowand <frank.rowand@am.sony.com>
>>
>> Determining which kernel config options need to be enabled for a
>> given devicetree can be a painful process.  Create a new tool to
>> find the drivers that may match a devicetree node compatible,
>> find the kernel config options that enable the driver, and
>> optionally report whether the kernel config option is enabled.
>
> I would find this more useful to output a config fragment with all th=
e
> options enabled. The hard part there is enabling the options a given
> option is dependent on which I don't think kbuild takes care of.

Do you mean to generate something like .config? If yes, then IMO it wou=
ld
not be a correct configuration file.

>
>> Signed-off-by: Gaurav Minocha <gaurav.minocha.os@gmail.com>
>> Signed-off-by: Frank Rowand <frank.rowand@am.sony.com>
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
>
> I don't do perl...
>
>> +
>> +#   Copyright 2016 by Frank Rowand
>> +# =C5=A0 Copyright 2016 by Gaurav Minocha
>      ^
> Is this supposed to be a copyright symbol?
>
>> +#
>> +# This file is subject to the terms and conditions of the GNU Gener=
al Public
>> +# License v2.
>
> [...]
>
>> +# ----- magic compatibles, do not have a driver
>> +#
>> +# Will not search for drivers for these compatibles.
>> +
>> +%compat_white_list =3D (
>> +       'fixed-partitions'      =3D> '1',
>
> Enabling CONFIG_MTD would be useful.
>
>> +       'none'                  =3D> '1',
>
> Is this an actual string used somewhere?
>
>> +       'pci'                   =3D> '1',
>
> ditto?
>
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
>
> What does this mean?
>
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
>
> I don't understand why some of these are not searchable by compatible=
 strings.

do you mean - pwm-backlight, gpio-keys, i2c-gpio and isa?

these are being filtered by:
my $drivers =3D `git grep -l '"$compat"' -- $files`;

not,

git grep -l '\.compatible\s*=3D\s*"$compat"' -- $files

=46rank, please advise!

>
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
>
> These will never get updated when the files or config options change.
> Conversely, how do I know if I need to add something here? Is this
> list complete or based on testing some set of dts files. IMO, this
> list has to go to merge this.
>
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
>
> A small number of exceptions like this I could stomach.
>
> The rest is just write-only language nonsense...
>
> Rob
