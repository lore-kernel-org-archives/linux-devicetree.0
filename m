From: Sebastien Bourdelin <sebastien.bourdelin@gmail.com>
Subject: Re: [PATCH v2 1/2] iio: chemical: bme680: Add device-tree support
Date: Wed, 16 Jan 2019 17:31:12 -0500
Message-ID: <34cd2fc4-3ce3-7ada-de7b-2954c905dc21@gmail.com>
References: <20190111205359.14158-1-sebastien.bourdelin@gmail.com>
 <20190112094226.GA910@himanshu-Vostro-3559>
 <2522efda-2762-01a6-7597-38c086779b74@gmail.com>
 <20190115184117.GA10186@himanshu-Vostro-3559>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190115184117.GA10186@himanshu-Vostro-3559>
Content-Language: fr-classic
Sender: linux-kernel-owner@vger.kernel.org
To: Himanshu Jha <himanshujha199640@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, pmeerw@pmeerw.net, lars@metafoo.de, knaack.h@gmx.de, jic23@kernel.org
List-Id: devicetree@vger.kernel.org

Hi Himanshu,

On 1/15/19 1:41 PM, Himanshu Jha wrote:
> ...
> himanshu@himanshu-Vostro-3559:~/linux-next$ sudo make drivers/iio/chemical/bme680_spi.o
> scripts/kconfig/conf  --syncconfig Kconfig
> make[1]: Nothing to be done for 'all'.
>     HOSTCC  scripts/dtc/dtc.o
>     HOSTCC  scripts/dtc/flattree.o
>     HOSTCC  scripts/dtc/fstree.o
>     HOSTCC  scripts/dtc/data.o
>     HOSTCC  scripts/dtc/livetree.o
>     HOSTCC  scripts/dtc/treesource.o
>     HOSTCC  scripts/dtc/srcpos.o
>     HOSTCC  scripts/dtc/checks.o
>     HOSTCC  scripts/dtc/util.o
>     LEX     scripts/dtc/dtc-lexer.lex.c
>     YACC    scripts/dtc/dtc-parser.tab.h
>     HOSTCC  scripts/dtc/dtc-lexer.lex.o
>     YACC    scripts/dtc/dtc-parser.tab.c
>     HOSTCC  scripts/dtc/dtc-parser.tab.o
>     HOSTLD  scripts/dtc/dtc
>     CC      scripts/mod/empty.o
>     MKELF   scripts/mod/elfconfig.h
>     HOSTCC  scripts/mod/modpost.o
>     CC      scripts/mod/devicetable-offsets.s
>     HOSTCC  scripts/mod/file2alias.o
>     HOSTCC  scripts/mod/sumversion.o
>     HOSTLD  scripts/mod/modpost
>     CC      kernel/bounds.s
>     CC      arch/x86/kernel/asm-offsets.s
>     CALL    scripts/checksyscalls.sh
>     DESCEND  objtool
>     CC      drivers/iio/chemical/bme680_spi.o
>
> Compiles without any issues.
>> Hum, weird it compiles actually :s
> I think this behavior is observed due to:
>
> include/linux/module.h +212
>
> #ifdef MODULE
>   /* Creates an alias so file2alias.c can find device table. */
>   #define MODULE_DEVICE_TABLE(type, name)                                 \
>   extern typeof(name) __mod_##type##__##name##_device_table               \
>     __attribute__ ((unused, alias(__stringify(name))))
>   #else  /* !MODULE */
>   #define MODULE_DEVICE_TABLE(type, name)
>   #endif
>
> So, when we build the driver as a module[M] then macro expansion
> takes place giving us the compiler warning.
>
> OTOH, if the driver is built as builtin[*] then marco expands
> to nothing or simply goes away. And `;' completes the struct
> declaration while silencing the warning.
>
>   static const struct of_device_id bme680_of_spi_match[] = {
>           { .compatible = "bosch,bme680", },
>           {},
>   }
>   MODULE_DEVICE_TABLE(of, bme680_of_spi_match);
>
> converts to:
>
>   static const struct of_device_id bme680_of_spi_match[] = {
>           { .compatible = "bosch,bme680", },
>           {},
>   }
> 					     ;
> 					    ^^^	
>
> Amazing!
> Correct me if I'm wrong somewhere, took me 2 hours to figure
> that out :D

Ahah, nice!

Thanks a lot for the explanation!

> Also, I some additional interesting observations:
>
> When buitin[*] ->  no symbol tables in the RO segment of object file
>
> himanshu@himanshu-Vostro-3559:~/linux-next$ nm drivers/iio/chemical/bme680_spi.o
> 0000000000000000 d __addressable_bme680_spi_driver_init130
> 00000000000001a0 r bme680_acpi_match
>                   U bme680_core_probe
> 0000000000000000 r bme680_of_spi_match
> 00000000000000a0 d bme680_regmap_bus
>                   U bme680_regmap_config
> 0000000000000000 t bme680_regmap_spi_read
> 0000000000000010 t bme680_regmap_spi_write
> 0000000000000000 d bme680_spi_driver
> 0000000000000000 t bme680_spi_driver_exit
> 0000000000000000 t bme680_spi_driver_init
> 00000000000001e0 r bme680_spi_id
> 0000000000000070 t bme680_spi_probe
>                   U _dev_err
>                   U __devm_regmap_init
>                   U driver_unregister
> 0000000000000000 d __exitcall_bme680_spi_driver_exit
> 0000000000000000 t __initcall_bme680_spi_driver_init6
>                   U regmap_read
>                   U regmap_update_bits_base
>                   U regmap_write
>                   U spi_get_device_id
>                   U __spi_register_driver
>                   U spi_setup
>                   U spi_write_then_read
>                   U __stack_chk_fail
>
>
> While when [M] -> we can see the symbol tables in the RO segment
>
> himanshu@himanshu-Vostro-3559:~/linux-next$ nm drivers/iio/chemical/bme680_spi.o
> 00000000000001a0 r bme680_acpi_match
>                   U bme680_core_probe
> 0000000000000000 r bme680_of_spi_match
> 00000000000000a0 d bme680_regmap_bus
>                   U bme680_regmap_config
> 0000000000000000 t bme680_regmap_spi_read
> 0000000000000010 t bme680_regmap_spi_write
> 0000000000000000 d bme680_spi_driver
> 0000000000000000 t bme680_spi_driver_exit
> 0000000000000000 t bme680_spi_driver_init
> 00000000000001e0 r bme680_spi_id
> 0000000000000070 t bme680_spi_probe
> 0000000000000000 T cleanup_module
>                   U _dev_err
>                   U __devm_regmap_init
>                   U driver_unregister
> 0000000000000000 T init_module
> 00000000000001a0 R __mod_acpi__bme680_acpi_match_device_table   <---
> 0000000000000000 R __mod_of__bme680_of_spi_match_device_table   <---
> 00000000000001e0 R __mod_spi__bme680_spi_id_device_table        <---
>                   U regmap_read
>                   U regmap_update_bits_base
>                   U regmap_write
>                   U spi_get_device_id
>                   U __spi_register_driver
>                   U spi_setup
>                   U spi_write_then_read
>                   U __stack_chk_fail
>                   U __this_module
> 0000000000000033 r __UNIQUE_ID_author38
> 000000000000000f r __UNIQUE_ID_description39
> 0000000000000000 r __UNIQUE_ID_license40
>
>
> Thanks!
Thanks to you :)
