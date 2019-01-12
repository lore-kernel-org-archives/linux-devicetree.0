From: Himanshu Jha <himanshujha199640@gmail.com>
Subject: Re: [PATCH v2 1/2] iio: chemical: bme680: Add device-tree support
Date: Sat, 12 Jan 2019 15:12:26 +0530
Message-ID: <20190112094226.GA910@himanshu-Vostro-3559>
References: <20190111205359.14158-1-sebastien.bourdelin@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190111205359.14158-1-sebastien.bourdelin@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastien Bourdelin <sebastien.bourdelin@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, pmeerw@pmeerw.net, lars@metafoo.de, knaack.h@gmx.de, jic23@kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 11, 2019 at 03:53:58PM -0500, Sebastien Bourdelin wrote:
> This commit allow the driver to work with device-tree.
> 
> Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@gmail.com>
> ---

I get the following compilation failure:

Below I have `allyesconfig` except 'BME680' configure as [M]
in case you wish to reproduce.

himanshu@himanshu-Vostro-3559:~/linux-next$ grep -i -w 'CONFIG_BME680\|CONFIG_ACPI\|CONFIG_OF' .config
CONFIG_ACPI=y
CONFIG_OF=y
CONFIG_BME680=m
himanshu@himanshu-Vostro-3559:~/linux-next$ sudo make drivers/iio/chemical/bme680_spi.o
make[1]: Nothing to be done for 'all'.
  CALL    scripts/checksyscalls.sh
  DESCEND  objtool
  CC [M]  drivers/iio/chemical/bme680_spi.o
In file included from ./include/linux/acpi.h:41:0,
                 from drivers/iio/chemical/bme680_spi.c:7:
./include/linux/module.h:213:1: error: expected ‘,’ or ‘;’ before ‘extern’
 extern typeof(name) __mod_##type##__##name##_device_table  \
 ^
drivers/iio/chemical/bme680_spi.c:119:1: note: in expansion of macro ‘MODULE_DEVICE_TABLE’
 MODULE_DEVICE_TABLE(of, bme680_of_spi_match);
 ^~~~~~~~~~~~~~~~~~~
scripts/Makefile.build:291: recipe for target 'drivers/iio/chemical/bme680_spi.o' failed
make[1]: *** [drivers/iio/chemical/bme680_spi.o] Error 1
Makefile:1741: recipe for target 'drivers/iio/chemical/bme680_spi.o' failed
make: *** [drivers/iio/chemical/bme680_spi.o] Error 2

BUT if:

himanshu@himanshu-Vostro-3559:~/linux-next$ make allyesconfig
scripts/kconfig/conf  --allyesconfig Kconfig
#
# configuration written to .config
#

himanshu@himanshu-Vostro-3559:~/linux-next$ sudo make drivers/iio/chemical/bme680_spi.o
scripts/kconfig/conf  --syncconfig Kconfig
make[1]: Nothing to be done for 'all'.
  HOSTCC  scripts/dtc/dtc.o
  HOSTCC  scripts/dtc/flattree.o
  HOSTCC  scripts/dtc/fstree.o
  HOSTCC  scripts/dtc/data.o
  HOSTCC  scripts/dtc/livetree.o
  HOSTCC  scripts/dtc/treesource.o
  HOSTCC  scripts/dtc/srcpos.o
  HOSTCC  scripts/dtc/checks.o
  HOSTCC  scripts/dtc/util.o
  LEX     scripts/dtc/dtc-lexer.lex.c
  YACC    scripts/dtc/dtc-parser.tab.h
  HOSTCC  scripts/dtc/dtc-lexer.lex.o
  YACC    scripts/dtc/dtc-parser.tab.c
  HOSTCC  scripts/dtc/dtc-parser.tab.o
  HOSTLD  scripts/dtc/dtc
  CC      scripts/mod/empty.o
  MKELF   scripts/mod/elfconfig.h
  HOSTCC  scripts/mod/modpost.o
  CC      scripts/mod/devicetable-offsets.s
  HOSTCC  scripts/mod/file2alias.o
  HOSTCC  scripts/mod/sumversion.o
  HOSTLD  scripts/mod/modpost
  CC      kernel/bounds.s
  CC      arch/x86/kernel/asm-offsets.s
  CALL    scripts/checksyscalls.sh
  DESCEND  objtool
  CC      drivers/iio/chemical/bme680_spi.o

Compiles without any issues. 

Also, wondering when is 0x77 i2c address used, since I tested
this on 3 different boards with 0x76(when SDO is connected to GND)

And why do I connect SDO to ground everytime ?
It is because if SDO pin is left floating then I2C address will be
undefined as said in datasheet + I have observed this while testing.

Actallly, I don't understand what "VDIDO" is, as explained in the
datasheet.


Anyway, if the above compilation issue is not a problem, then

	Acked-by: Himanshu Jha <himanshujha199640@gmail.com>


Thanks
-- 
Himanshu Jha
Undergraduate Student
Department of Electronics & Communication
Guru Tegh Bahadur Institute of Technology
