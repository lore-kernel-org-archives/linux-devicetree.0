From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCHv1] Add support for Intersil ISL12057 I2C RTC chip
Date: Mon, 18 Nov 2013 15:20:12 +0000
Message-ID: <20131118152012.GA3759@e106331-lin.cambridge.arm.com>
References: <87txfdcjqg.fsf@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87txfdcjqg.fsf@natisbad.org>
Sender: linux-doc-owner@vger.kernel.org
To: Arnaud Ebalard <arno@natisbad.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Kent Yoder <key@linux.vnet.ibm.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Pawel Moll <Pawel.Moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Rob Landley <rob@landley.net>, "rtc-linux@googlegroups.com" <rtc-linux@googlegroups.com>, Jason Cooper <jason@lakedaemon.net>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 15, 2013 at 11:45:27PM +0000, Arnaud Ebalard wrote:
>=20
> Intersil ISL12057 I2C RTC chip also supports two alarms. This patch
> only adds support for basic RTC functionalities (i.e. getting and
> setting time). Tests have been performed on NETGEAR ReadyNAS 102 w/
> startup/shutdown scripts, hwclock, ntpdate and openntpd.
>=20
> Signed-off-by: Arnaud Ebalard <arno@natisbad.org>
> ---
> Hi,
>=20
> In order to get at least some initial support for the chip available =
in
> mainline kernel (3.14 will have three users waiting for it: ReadyNAS
> 102, 104 and 2120), I decided to temporarily remove the alarm and IRQ
> related code I pushed earlier (see [1] below). I will submit a patch
> later to add back Alarm/IRQ support once I have understood how to
> correctly handle my use case described via existing RTC logic.
>=20
> Anyway, comments are welcome on the patch!
>=20
> Changes since previous v0:
>  - removed alarm and IRQ related code
>  - Switched to isl for intersil (no existing driver has any reference
>    to isil, even though this would be the recommended choice)
>  - Added intersil info in vendor-prefixes.txt file
>  - Added entry for ISL 12057 in I2C trivial-devices.txt file
>  - Added mutex protection for non atomic read/write
>=20
>=20
> Now, regarding later submission of Alarm/IRQ functionality, here is t=
he
> use case: on all 3 NETGEAR NAS above (102, 104 and RN2120), the Alarm
> interrupt pins of the ISL 12057 are not connected to the SoC, i.e. Li=
nux
> kernel never gets warned via an interrupt when the alarm goes off. Th=
e
> reason is that the alarm interrupt pin is connected to some regulator
> which will power up the (previously off) device when the alarm goes
> off. It raises some questions for which I am looking for some support=
s
> from RTC maintainer and people familiar w/ RTC framework:
>=20
>  - Are there no previous example of such need from existing platform?
>  - How can this use case be supported? Tested?
>  - in usual context, what is the purpose of having an IRQ handler for
>    such an alarm event: just acknowledge it and remove the alarm? Or
>    are there other reasons?
>=20
> As a side note, I want to repeat that previous code (the one I droppe=
d
> from current patch) worked fine to get alarm installed (i.e. once the
> device powered off, it woke up as expected using the alarm). I was ju=
st
> unable to test the interrupt handling part, for the reason described
> above.
>=20
> Cheers,
>=20
> a+
>=20
> [1]: http://thread.gmane.org/gmane.linux.drivers.devicetree/46581
>=20
>=20
>  .../devicetree/bindings/i2c/trivial-devices.txt    |   1 +
>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
>  drivers/rtc/Kconfig                                |   9 +
>  drivers/rtc/Makefile                               |   1 +
>  drivers/rtc/rtc-isl12057.c                         | 397 +++++++++++=
++++++++++
>  5 files changed, 409 insertions(+)
>  create mode 100644 drivers/rtc/rtc-isl12057.c
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/trivial-devices.tx=
t b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
> index ad6a738..b57c71e 100644
> --- a/Documentation/devicetree/bindings/i2c/trivial-devices.txt
> +++ b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
> @@ -37,6 +37,7 @@ fsl,mpr121            MPR121: Proximity Capacitive =
Touch Sensor Controller
>  fsl,sgtl5000           SGTL5000: Ultra Low-Power Audio Codec
>  infineon,slb9635tt     Infineon SLB9635 (Soft-) I2C TPM (old protoco=
l, max 100khz)
>  infineon,slb9645tt     Infineon SLB9645 I2C TPM (new protocol, max 4=
00khz)
> +isl,isl12057           Intersil ISL12057 I2C RTC Chip
>  maxim,ds1050           5 Bit Programmable, Pulse-Width Modulator
>  maxim,max1237          Low-Power, 4-/12-Channel, 2-Wire Serial, 12-B=
it ADCs
>  maxim,max6625          9-Bit/12-Bit Temperature Sensors with I=C2=B2=
C-Compatible Serial Interface
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/=
Documentation/devicetree/bindings/vendor-prefixes.txt
> index ce95ed1..507761a 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -38,6 +38,7 @@ ibm   International Business Machines (IBM)
>  idt    Integrated Device Technologies, Inc.
>  img    Imagination Technologies Ltd.
>  intercontrol   Inter Control Group
> +isl    Intersil
>  linux  Linux-specific binding
>  lsi    LSI Corp. (LSI Logic)
>  marvell        Marvell Technology Group Ltd.
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 15f166a..bcc0c17 100644

The binding additions look fine to me.

[...]

> +static int isl12057_i2c_read_regs(struct i2c_client *client, u8 reg,=
 u8 buf[],
> +                                 unsigned len)
> +{
> +       struct i2c_msg msgs[2] =3D {
> +               {
> +                       .addr =3D client->addr,
> +                       .flags =3D 0,
> +                       .len =3D sizeof(u8),
> +                       .buf =3D buf
> +               },
> +               {
> +                       .addr =3D client->addr,
> +                       .flags =3D I2C_M_RD,
> +                       .len =3D len,
> +                       .buf =3D buf
> +               }
> +       };
> +       int ret;
> +
> +       BUG_ON(reg > ISL12057_REG_SR);
> +       BUG_ON(reg + len > ISL12057_REG_SR + 1);
> +
> +       ret =3D i2c_transfer(client->adapter, msgs, 2);
> +       if (ret !=3D 2)
> +               return ret;

This might return 1.

Given that in isl12057_rtc_read_time you check if the return value is
negative (also indirectly via isl12057_i2c_validate_client), I think it
would make sense to always either return a negative error code or 0.

Thanks,
Mark.
