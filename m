From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH v2] mtd:spi-nor: Add Altera EPCQ Driver
Date: Mon, 9 Mar 2015 07:31:07 +0100
Message-ID: <CACna6ryC8TyxvvtztoSgZUXnE+tJdY6tefbXVkaZ60JoZ7ti7A@mail.gmail.com>
References: <CAN1oZWykZk13yCajiZc-xb5h372MrEP9iOWUqzhrt-feG6pkLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAN1oZWykZk13yCajiZc-xb5h372MrEP9iOWUqzhrt-feG6pkLQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Viet Nga Dao <vndao@altera.com>
Cc: Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, nga_chi86 <ngachi86@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Viet,

I'm not too active in mtd subsystem, so I didn't notice your patch
earlier. However I would like to share few comments.

On 11 February 2015 at 05:53, Viet Nga Dao <vndao@altera.com> wrote:
> From: Viet Nga Dao <vndao@altera.com>
>
> Altera EPCQ Controller is a soft IP which enables access to Altera EPCQ and
> EPCS flash chips. This patch adds driver for these devices.

First of all, your whole patch is white-space damaged. It can't be
applied, seems all tabs were replaced with spaces. It's what I got in
my GMail and what was also received by patchwork, see
https://patchwork.ozlabs.org/patch/438684/

You'll need to resend using some smarter e-mail client, you may e.g.
try git send-email.


> +#define EPCQ_INFO(_opcode_id, _ext_id, _sector_size, _n_sectors, _page_size) \
> +    ((kernel_ulong_t)&(struct flash_info) {                \
> +        .altera_flash_opcode_id = (_opcode_id),            \
> +        .ext_id = (_ext_id),                    \
> +        .sector_size = (_sector_size),                \
> +        .n_sectors = (_n_sectors),                \
> +        .page_size = (_page_size),                \
> +    })

Starting with kernel 3.19 we don't have ext_id in struct anymore, see:
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=d928a259385dc6fca3956b7775c588f21c0b50fc


>  /* NOTE: double check command sets and memory organization when you add
>   * more nor chips.  This current list focusses on newer chips, which
>   * have been converging on command sets which including JEDEC ID.
> @@ -637,6 +691,17 @@ static const struct spi_device_id spi_nor_ids[] = {
>      { "cat25c09", CAT25_INFO( 128, 8, 32, 2, SPI_NOR_NO_ERASE |
> SPI_NOR_NO_FR) },
>      { "cat25c17", CAT25_INFO( 256, 8, 32, 2, SPI_NOR_NO_ERASE |
> SPI_NOR_NO_FR) },
>      { "cat25128", CAT25_INFO(2048, 8, 64, 2, SPI_NOR_NO_ERASE |
> SPI_NOR_NO_FR) },
> +
> +    /* Altera EPCQ/EPCS Flashes */
> +    { "epcq16"  , EPCQ_INFO(2, 0x15, 0x10000, 32,   0x100) },
> +    { "epcq32"  , EPCQ_INFO(2, 0x16, 0x10000, 64,   0x100) },
> +    { "epcq64"  , EPCQ_INFO(2, 0x17, 0x10000, 128,  0x100) },
> +    { "epcq128" , EPCQ_INFO(2, 0x18, 0x10000, 256,  0x100) },
> +    { "epcq256" , EPCQ_INFO(2, 0x19, 0x10000, 512,  0x100) },
> +    { "epcq512" , EPCQ_INFO(2, 0x20, 0x10000, 1024, 0x100) },
> +    { "epcs16"  , EPCQ_INFO(1, 0x14, 0x10000, 32,   0x100) },
> +    { "epcs64"  , EPCQ_INFO(1, 0x16, 0x10000, 128,  0x100) },
> +    { "epcs128" , EPCQ_INFO(1, 0x18, 0x40000, 256,  0x100) },
>      { },
>  };
>
> @@ -666,6 +731,14 @@ static const struct spi_device_id
> *spi_nor_read_id(struct spi_nor *nor)
>          if (info->jedec_id == jedec) {
>              if (info->ext_id == 0 || info->ext_id == ext_jedec)
>                  return &spi_nor_ids[tmp];
> +
> +        /* altera epcq which is non jedec device
> +         * use id[4] as opcode id to differentiate
> +         * epcs and epcq devices
> +         */
> +        } else if (info->altera_flash_opcode_id == id[4] &&
> +              info->ext_id == id[3]) {
> +                return &spi_nor_ids[tmp];

This is the part I don't like. I think it's fishy, and that this check
may result in false positives. Looks too generic.

Also the logic of your behavior there seems unclear to me. On the one
hand you don't have JEDEC, so you provide chip name using DT. But in
place above you stop trusting DT info and you try to (kind of)
auto-detect used chip anyway.

I guess we should finally think about some more generic way of passing
flash info.
