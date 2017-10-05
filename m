From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 00/12] of: overlay: clean up device tree overlay code
Date: Thu, 5 Oct 2017 09:46:03 -0500
Message-ID: <CAL_JsqJ7MG-0hoQmuPe4s9Pvtt3c1uC_Vf8JXRQBOeeh82X3uQ@mail.gmail.com>
References: <1507002826-16393-1-git-send-email-frowand.list@gmail.com>
 <CAL_JsqJFPHOxrOYNcJCmNvdTA+1RqZxNSZOq6byzDVygUwV0Ow@mail.gmail.com> <3eac16b0-fdd9-fd6c-e1ca-e0de49ce27cb@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3eac16b0-fdd9-fd6c-e1ca-e0de49ce27cb@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Jyri Sarha <jsarha@ti.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, David Airlie <airlied@linux.ie>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 5, 2017 at 1:53 AM, Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>
> On 04/10/17 17:56, Rob Herring wrote:
>> On Mon, Oct 2, 2017 at 10:53 PM,  <frowand.list@gmail.com> wrote:
>>> From: Frank Rowand <frank.rowand@sony.com>
>>>
>>> I have found the device tree overlay code to be difficult to read and
>>> maintain.  This patch series attempts to improve that situation.
>>>
>>> The cleanup includes some changes visible to users of overlays.  The
>>> only in kernel user of overlays is fixed up for those changes.  The
>>> in kernel user is:
>>>
>>>    drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
>>
>> At what point can we remove this? I'm assuming at some point users
>> will need to update their dtb's for other reasons and this becomes
>> obsolete.
>
> To be honest, I have no idea, or how to find that out.
>
> Do we need to get rid of it? Afaik, we haven't do much (or any?)
> maintenance on tilcdc_slave_compat.c since it was written, so from our
> perspective it's been a minimal burden. Is it creating burden for others?

Well, Frank had to deal with it. It's dealing with DT at a pretty low
level and impacts further clean-ups we want to do.

> Is the approach done with tilcdc_slave_compat.c something that's not
> recommended? I'm sure similar situations happen with other drivers too,
> and I think it's a good idea to have a recommended way of keeping
> compatibility.

If we do want this, I think we need some infrastructure to handle
these fixups and I don't really want to see dts files scattered around
the kernel. Most folks probably just break compatibility which I guess
for some platforms is fine. We do need to support maintaining
compatibility, but for how long depends on the platform.

This was added in 4.2. Looks like 2 boards used the old binding as of
4.1. Here's probably an incomplete list of changes since then:

$ git log v4.2.. --oneline -- arch/arm/boot/dts/am335x-base0033.dts
arch/arm/boot/dts/am335x-igep0033.dtsi
05e7d622f153 ARM: dts: omap: Add generic compatible string for I2C EEPROM
278cb79cc113 ARM: dts: am335x: Add missing unit name to memory nodes
c731abd99121 ARM: dts: am335x/437x/57xx: remove unneeded unit name for
gpio-leds nodes
4c049a5b7c89 ARM: dts: am335x/am437x: remove unneeded unit name for
fixed regulators
42647f947210 ARM: dts: am335x: Update elm phandle binding
63015d73f345 ARM: dts: am335x: Provide NAND ready pin
db0f68529a6a ARM: dts: am335x: Disable wait pin monitoring for NAND
037521483846 ARM: dts: am335x: Fix NAND device nodes
e9a267702d32 ARM: dts: am335x-base0033: Use IOPAD pinmux macro
8a3ecb217f11 ARM: dts: am335x-igep0033: Use IOPAD pinmux macro


And unfortunately, no one ever updated the am335x-base0033.dts to the
new binding. Though it doesn't have an nxp,tda998x node either, so
maybe it is not used? Otherwise, compatibility is probably still
needed since the clock has not even started on that board. Minimally,
this dts should be updated and the kernel should throw a WARN if the
dtb should be updated.


$ git log v4.1.. --oneline --no-merges
arch/arm/boot/dts/am335x-boneblack*
arch/arm/boot/dts/am335x-bone-common.dtsi
7e697ac3c4fb ARM: dts: tps65217: Add power button interrupt to the
common tps65217.dtsi file
6a80131e9dd2 ARM: dts: tps65217: Add charger interrupts to the common
tps65217.dtsi file
05e7d622f153 ARM: dts: omap: Add generic compatible string for I2C EEPROM
c2498af5c036 arm: dts: boneblack-wireless: add WL1835 Bluetooth device node
b9cb2ba71848 ARM: dts: Use - instead of @ for DT OPP entries for TI SoCs
bc4b1736f246 ARM: dts: am335x-boneblack: Enable 1GHz OPP for cpu
d680414d0f42 ARM: dts: Configure BeagleBone peripheral USB VBUS irq
fbb5850bd3c1 ARM: dts: Add am335x-boneblack-wireless
2876cc4a773c ARM: dts: Move most of am335x-boneblack.dts to
am335x-boneblack-common.dtsi
be53e38f0df2 dt-bindings: mfd: Remove TPS65217 interrupts
30aa2e48962c ARM: dts: am335x: Fix the interrupt name of TPS65217
a291b6b3d287 ARM: dts: am335x-boneblack: Add blue-and-red-wiring
-property to LCDC node
17fad5f3ab61 ARM: dts: AM335X-bone-common: Add the internal and
external clock nodes for rtc
eb3e4bbebac4 ARM: dts: am335x: Add the power button interrupt
1934e89a769b ARM: dts: am335x: Add the charger interrupt
2d63b9ce2136 ARM: dts: am335x: Support the PMIC interrupt
e3659351da09 Revert "ARM: dts: am335x-boneblack: Enable 1GHz OPP for cpu"
df0bd1e8f3c5 ARM: dts: am335x-boneblack: Add HDMI audio support
278cb79cc113 ARM: dts: am335x: Add missing unit name to memory nodes
c731abd99121 ARM: dts: am335x/437x/57xx: remove unneeded unit name for
gpio-leds nodes
4c049a5b7c89 ARM: dts: am335x/am437x: remove unneeded unit name for
fixed regulators
f03a881a8a8d ARM: dts: am335x-bone-common: use stdout-path in Beaglebone boards.
fd4eeada1bf1 ARM: dts: am335x-bone-common: Mark MAC as having only one PHY
c36e6ec90487 ARM: dts: am335x-boneblack: Enable 1GHz OPP for cpu
fb515b8e384d ARM: dts: am335x: Update MPU regulator range for TI boards
e327b3f56403 Revert "regulator: tps65217: remove tps65217.dtsi file"
8e6ebfaa9b38 regulator: tps65217: remove tps65217.dtsi file
df10eadfce35 ARM: dts: am335x-boneblack: Use pinctrl constants and
AM33XX_IOPAD macro
e03b2a26d6bf ARM: dts: am335x-bone-common: Use AM33XX_IOPAD pinmux macro
c7ce74bc921b ARM: dts: am335x: fix cd-gpios definition as per hardware
design and dt binding docs
34c900a60bb0 ARM: dts: am335x-boneblack: Use new binding for HDMI
5c250adb51ca Revert "ARM: dts: am335x-boneblack: disable RTC-only sleep"
5d1a2961adf9 ARM: dts: Beaglebone i2c definitions

Looks to me like any user would want to update and have some of these changes.

Rob
