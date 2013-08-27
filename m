From: yuhang wang <wangyuhang2014@gmail.com>
Subject: Re: [PATCH V2 1/2] spi: dual and quad support(device tree)
Date: Tue, 27 Aug 2013 15:56:16 +0800
Message-ID: <CAHSAbzMjLiY14bX-FLj0nsVg2fPge21jWPZBDUybC6YeGNk7Ow@mail.gmail.com>
References: <1377564603-4030-1-git-send-email-wangyuhang2014@gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9FAEF9@DBDE04.ent.ti.com>
 <CAHSAbzMFJMav4VrBEmMx1bsmDXs4pW0wPg9B212aVnDy9p+gtQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <CAHSAbzMFJMav4VrBEmMx1bsmDXs4pW0wPg9B212aVnDy9p+gtQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: "Gupta, Pekon" <pekon@ti.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Poddar,
 Sourav" <sourav.poddar@ti.com>, "broonie@kernel.org" <broonie@kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi, Pekon

What about the comment below, do I still need to check the mode before setting.

>> You missed out comments provided earlier..
>> http://lists.infradead.org/pipermail/linux-mtd/2013-August/048374.html
>>
>> Remember .. this compatibility check is between spi_device->mode
>> v/s spi_master->mode_bits. This is different from ur V3 patch
>> which checks for spi_transfer->tx_nbits v/s spi_device->mode.
>>
>> + if ((xfer->tx_nbits == SPI_NBITS_DUAL) &&
>> + !(spi->mode & (SPI_TX_DUAL | SPI_TX_QUAD)))
>> + return -EINVAL;
>> + if ((xfer->tx_nbits == SPI_NBITS_QUAD) &&
>> + !(spi->mode & SPI_TX_QUAD))
>> + return -EINVAL;
>>
>>
> Sorry for my mis-understanding. But here I want to regard DUAL / QUAD
> mode just as other mode, such as CPHA, CPOL and so on. To other mode,
> spi framework didn't do such check, example:
> ---------------------------------------------------------------------------------
> /* Mode (clock phase/polarity/etc.) */
> if (of_find_property(nc, "spi-cpha", NULL))
>     spi->mode |= SPI_CPHA;
> if (of_find_property(nc, "spi-cpol", NULL))
>     spi->mode |= SPI_CPOL;
> ---------------------------------------------------------------------------------
>
> Spi framework do this check in spi_setup as follow:
> ---------------------------------------------------------------------------------
> bad_bits = spi->mode & ~spi->master->mode_bits;
> if (bad_bits) {
>     dev_err(&spi->dev, "setup: unsupported mode bits %x\n",
>           bad_bits);
>     return -EINVAL;
> }
> ---------------------------------------------------------------------------------
> So to keep that consistant, I don't think it is necessary to add the
> check when setting the mode.
>
> Best regards

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
