From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 1/2] iio: chemical: bme680: Add device-tree support
Date: Sat, 12 Jan 2019 18:25:44 +0000
Message-ID: <20190112182544.32ada9c9@archlinux>
References: <20190111205359.14158-1-sebastien.bourdelin@gmail.com>
        <20190112094226.GA910@himanshu-Vostro-3559>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190112094226.GA910@himanshu-Vostro-3559>
Sender: linux-kernel-owner@vger.kernel.org
To: Himanshu Jha <himanshujha199640@gmail.com>
Cc: Sebastien Bourdelin <sebastien.bourdelin@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, pmeerw@pmeerw.net, lars@metafoo.de, knaack.h@gmx.de
List-Id: devicetree@vger.kernel.org

On Sat, 12 Jan 2019 15:12:26 +0530
Himanshu Jha <himanshujha199640@gmail.com> wrote:

> On Fri, Jan 11, 2019 at 03:53:58PM -0500, Sebastien Bourdelin wrote:
> > This commit allow the driver to work with device-tree.
> >=20
> > Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@gmail.com>
> > --- =20
>=20
> I get the following compilation failure:
>=20
> Below I have `allyesconfig` except 'BME680' configure as [M]
> in case you wish to reproduce.
>=20
> himanshu@himanshu-Vostro-3559:~/linux-next$ grep -i -w 'CONFIG_BME680\|CO=
NFIG_ACPI\|CONFIG_OF' .config
> CONFIG_ACPI=3Dy
> CONFIG_OF=3Dy
> CONFIG_BME680=3Dm
> himanshu@himanshu-Vostro-3559:~/linux-next$ sudo make drivers/iio/chemica=
l/bme680_spi.o
> make[1]: Nothing to be done for 'all'.
>   CALL    scripts/checksyscalls.sh
>   DESCEND  objtool
>   CC [M]  drivers/iio/chemical/bme680_spi.o
> In file included from ./include/linux/acpi.h:41:0,
>                  from drivers/iio/chemical/bme680_spi.c:7:
> ./include/linux/module.h:213:1: error: expected =E2=80=98,=E2=80=99 or =
=E2=80=98;=E2=80=99 before =E2=80=98extern=E2=80=99
>  extern typeof(name) __mod_##type##__##name##_device_table  \
>  ^
> drivers/iio/chemical/bme680_spi.c:119:1: note: in expansion of macro =E2=
=80=98MODULE_DEVICE_TABLE=E2=80=99
>  MODULE_DEVICE_TABLE(of, bme680_of_spi_match);
>  ^~~~~~~~~~~~~~~~~~~

huh?  That one had me confused. Google however got me there quickly.
Missing semi colon on the line above MODULE_DEVICE_TABLE.

J

> scripts/Makefile.build:291: recipe for target 'drivers/iio/chemical/bme68=
0_spi.o' failed
> make[1]: *** [drivers/iio/chemical/bme680_spi.o] Error 1
> Makefile:1741: recipe for target 'drivers/iio/chemical/bme680_spi.o' fail=
ed
> make: *** [drivers/iio/chemical/bme680_spi.o] Error 2
>=20
> BUT if:
>=20
> himanshu@himanshu-Vostro-3559:~/linux-next$ make allyesconfig
> scripts/kconfig/conf  --allyesconfig Kconfig
> #
> # configuration written to .config
> #
>=20
> himanshu@himanshu-Vostro-3559:~/linux-next$ sudo make drivers/iio/chemica=
l/bme680_spi.o
> scripts/kconfig/conf  --syncconfig Kconfig
> make[1]: Nothing to be done for 'all'.
>   HOSTCC  scripts/dtc/dtc.o
>   HOSTCC  scripts/dtc/flattree.o
>   HOSTCC  scripts/dtc/fstree.o
>   HOSTCC  scripts/dtc/data.o
>   HOSTCC  scripts/dtc/livetree.o
>   HOSTCC  scripts/dtc/treesource.o
>   HOSTCC  scripts/dtc/srcpos.o
>   HOSTCC  scripts/dtc/checks.o
>   HOSTCC  scripts/dtc/util.o
>   LEX     scripts/dtc/dtc-lexer.lex.c
>   YACC    scripts/dtc/dtc-parser.tab.h
>   HOSTCC  scripts/dtc/dtc-lexer.lex.o
>   YACC    scripts/dtc/dtc-parser.tab.c
>   HOSTCC  scripts/dtc/dtc-parser.tab.o
>   HOSTLD  scripts/dtc/dtc
>   CC      scripts/mod/empty.o
>   MKELF   scripts/mod/elfconfig.h
>   HOSTCC  scripts/mod/modpost.o
>   CC      scripts/mod/devicetable-offsets.s
>   HOSTCC  scripts/mod/file2alias.o
>   HOSTCC  scripts/mod/sumversion.o
>   HOSTLD  scripts/mod/modpost
>   CC      kernel/bounds.s
>   CC      arch/x86/kernel/asm-offsets.s
>   CALL    scripts/checksyscalls.sh
>   DESCEND  objtool
>   CC      drivers/iio/chemical/bme680_spi.o
>=20
> Compiles without any issues.=20
>=20
> Also, wondering when is 0x77 i2c address used, since I tested
> this on 3 different boards with 0x76(when SDO is connected to GND)
>=20
> And why do I connect SDO to ground everytime ?
> It is because if SDO pin is left floating then I2C address will be
> undefined as said in datasheet + I have observed this while testing.
>=20
> Actallly, I don't understand what "VDIDO" is, as explained in the
> datasheet.
>=20
>=20
> Anyway, if the above compilation issue is not a problem, then
>=20
> 	Acked-by: Himanshu Jha <himanshujha199640@gmail.com>
>=20
>=20
> Thanks
