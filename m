From: Michal Suchanek <hramrach@gmail.com>
Subject: Re: [PATCH 2/3] mtd: spi-nor: core code for the Altera Quadspi Flash
 Controller v2
Date: Tue, 4 Jul 2017 12:38:39 +0200
Message-ID: <CAOMqctTBK35P2mbRnp=CKWhDFniKdeHK_VVu9is1zU3gdoNMZQ@mail.gmail.com>
References: <1498493619-4633-1-git-send-email-matthew.gerlach@linux.intel.com>
 <1498493619-4633-3-git-send-email-matthew.gerlach@linux.intel.com> <54a6cd9d-8d4a-8d22-26e7-b5e0f8df0f5b@wedev4u.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54a6cd9d-8d4a-8d22-26e7-b5e0f8df0f5b@wedev4u.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: matthew.gerlach@linux.intel.com, vndao@altera.com, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, MTD Maling List <linux-mtd@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, David Miller <davem@davemloft.net>, mchehab@kernel.org
List-Id: devicetree@vger.kernel.org

On 4 July 2017 at 02:00, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr> wrote=
:
> Hi Matthew,
>
>
> Le 26/06/2017 =C3=A0 18:13, matthew.gerlach@linux.intel.com a =C3=A9crit =
:
>> From: Matthew Gerlach <matthew.gerlach@linux.intel.com>

>> +static int altera_quadspi_setup_banks(struct device *dev,
>> +                                   u32 bank, struct device_node *np)
>> +{
>> +     struct altera_quadspi *q =3D dev_get_drvdata(dev);
>> +     struct altera_quadspi_flash *flash;
>> +     struct spi_nor *nor;
>> +     int ret =3D 0;
>> +     char modalias[40] =3D {0};
>> +     struct spi_nor_hwcaps hwcaps =3D {
>> +             .mask =3D SNOR_HWCAPS_READ |
>> +                     SNOR_HWCAPS_READ_FAST |
>> +                     SNOR_HWCAPS_READ_1_1_2 |
>> +                     SNOR_HWCAPS_READ_1_1_4 |
>> +                     SNOR_HWCAPS_PP,
>> +     };
>
> since aletera_quadspi_{read|erase} just don't care about
> nor->read_opcode, nor->program_opcode and so on and anyway override all
> settings chosen by spi-nor.c, it means they will use Dual or Quad SPI
> controllers as they want, whether SNOR_HWCAPS_READ_1_1_{2|4} are set or n=
ot.
> Then I think it's risky to declare the READ_1_1_2 and READ_1_1_4 hwcaps
> because it may trigger additionnal calls of nor->read_reg() /
> nor->write_reg() from spi_nor_scan() with op codes not supported by
> altera_quadspi_{read|write}_reg().
>
>> +
>> +     if (bank > q->num_flashes - 1)
>> +             return -EINVAL;
>> +
>> +     altera_quadspi_chip_select(q, bank);
>> +
>> +     flash =3D devm_kzalloc(q->dev, sizeof(*flash), GFP_KERNEL);
>> +     if (!flash)
>> +             return -ENOMEM;
>> +
>> +     q->flash[bank] =3D flash;
>> +     nor =3D &flash->nor;
>> +     nor->dev =3D dev;
>> +     nor->priv =3D flash;
>> +     nor->mtd.priv =3D nor;
>> +     flash->q =3D q;
>> +     flash->bank =3D bank;
>> +     spi_nor_set_flash_node(nor, np);
>> +
>> +     /* spi nor framework*/
>> +     nor->read_reg =3D altera_quadspi_read_reg;
>> +     nor->write_reg =3D altera_quadspi_write_reg;
>> +     nor->read =3D altera_quadspi_read;
>> +     nor->write =3D altera_quadspi_write;
>> +     nor->erase =3D altera_quadspi_erase;
>> +     nor->flash_lock =3D altera_quadspi_lock;
>> +     nor->flash_unlock =3D altera_quadspi_unlock;
>
> nor->flash_lock and nor->flash_unlock are described as "FLASH SPECIFIC"
> in include/linux/mtd/spi-nor.h as opposed to "DRIVER SPECIFIC" functions
> like nor->read, nor->read_reg, ...
>
> It means the actual implementations should be provided by the spi-nor
> sub-system but not by each SPI controller driver.
>
>
>
> For me, it really sounds like a bad idea that this driver tries so much
> to mystify the spi-nor sub-system.
>
> I can understand that you have to cope with the hardware design and its
> limitations but clearly it looks the spi-nor API is not suited to this
> hardware. This driver ignores and by-passes any settings selected by
> spi_nor_scan().
> Duplicating code is generally a bad idea but in this case, I don't know
> if trying to reuse spi_nor_read() / spi_nor_write() and spi_nor_erase()
> from spi-nor.c is that helpful.
>
> Why not directly plug your driver into the above mtd layer implementing
> you own version of mtd->_read(), mtd->_write() and mtd->_erase() then
> registering the mtd device? It may be not the way to go but at least we
> should study this alternative.

AFAICT fsl-quadspi does just that preventing the use of the SPI
controller for non-flash devices.

There is at least one accelerated driver that is passed the opcodes to
program in the controller for read acceleration in spi_flash_read so
reusing that should be viable. If the opcodes can be programmed or
match what is hardcoded in the controller use the acceleration and
fallback to plain spi transfer if there is mismatch between what
m25p80_read requests and what the controller can do.

If this works and you can still use the plain SPI trnsfers the
controller will be much morer useful than fsl-quadspi.

Thanks

Michal
