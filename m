From: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: Re: [PATCH v4 0/4] Add support for NXP LPC18xx EEPROM using nvmem
Date: Mon, 11 Jan 2016 09:15:08 -0300
Message-ID: <56939CCC.1040508@vanguardiasur.com.ar>
References: <1447790576-29410-1-git-send-email-ariel@vanguardiasur.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447790576-29410-1-git-send-email-ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Srinivas,

I just realized that these patches (1/4, 2/4) didn't get picked up.
Could you please check this?

Thanks,

El 17/11/15 a las 17:02, Ariel D'Alessandro escribi=F3:
> This patch series adds support for NXP LPC18xx EEPROM memory found in
> NXP LPC185x/3x and LPC435x/3x/2x/1x devices.
>=20
> This patchset is based on tag next-20151116 of the linux-next
> repository. It has been successfully tested on a LPC4337 CIAA-NXP
> Board.
>=20
> EEPROM notes:
> ------------
>=20
> EEPROM size is 16384 bytes and it can be entirely read and=20
> written/erased with 1 word (4 bytes) granularity. The last page
> (128 bytes) contains the EEPROM initialization data and is not writab=
le.
>=20
> Erase/program time is less than 3ms. The EEPROM device requires a
> ~1500 kHz clock (min 800 kHz, max 1600 kHz) that is generated dividin=
g
> the system bus clock by the division factor, contained in the divider
> register (minus 1 encoded).
>=20
> EEPROM will be kept in Power Down mode except during read/write calls=
=2E
>=20
> Changeset:
> ---------
> v3 -> v4:
> * Added busywait polling for erase/program operation to finish.
>=20
> v2 -> v3:
> * Documented 'resets' property in devicetree bindings.
> * Added dynamic power on/off when writing/reading the EEPROM.
> * Added check for aligned offset in EEPROM writes.
> * Properly remove the driver in the reverse order of initialization.
> * Minor fixes.
>=20
> v1 -> v2:
> * Moved dt-bindings to be the first patch.
> * Changed compatible name from lpc1850 to lpc1857 as the former doesn=
't have EEPROM.
> * Fix hardware description which contained SoCs models without EEPROM=
=2E
> * Disabled fast_io and changed mdelay for msleep in regmap writes.
> * Replaced BUG_ON() in write function for an -EINVAL return.
> * Add patches for defconfig and devicetree files.
>=20
> Thanks,
>=20
> Ariel D'Alessandro (4):
>   DT: nvmem: Add NXP LPC18xx EEPROM memory binding documentation
>   nvmem: NXP LPC18xx EEPROM memory NVMEM driver
>   ARM: dts: lpc18xx: add EEPROM memory node
>   ARM: configs: lpc18xx: enable EEPROM NVMEM driver
>=20
>  .../devicetree/bindings/nvmem/lpc1857-eeprom.txt   |  28 ++
>  arch/arm/boot/dts/lpc18xx.dtsi                     |  12 +
>  arch/arm/configs/lpc18xx_defconfig                 |   2 +
>  drivers/nvmem/Kconfig                              |   9 +
>  drivers/nvmem/Makefile                             |   2 +
>  drivers/nvmem/lpc18xx_eeprom.c                     | 330 +++++++++++=
++++++++++
>  6 files changed, 383 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/lpc1857-e=
eprom.txt
>  create mode 100644 drivers/nvmem/lpc18xx_eeprom.c
>=20

--=20
Ariel D'Alessandro, VanguardiaSur
www.vanguardiasur.com.ar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
