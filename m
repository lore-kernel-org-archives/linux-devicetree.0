From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 2/3] mtd: mtk-nor: mtk serial flash controller driver
Date: Fri, 30 Oct 2015 11:15:18 -0700
Message-ID: <20151030181518.GG13239@google.com>
References: <1445866839-31063-1-git-send-email-bayi.cheng@mediatek.com>
 <1445866839-31063-3-git-send-email-bayi.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1445866839-31063-3-git-send-email-bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bayi Cheng <bayi.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Bayi,

In reviewing your updated instructions on how to read 6 bytes of ID, I
have one more question about how the PRGDATA and SHREG registers are
supposed to work.

On Mon, Oct 26, 2015 at 09:40:38PM +0800, Bayi Cheng wrote:
[...]
> +static void mt8173_nor_set_read_mode(struct mt8173_nor *mt8173_nor)
> +{
> +	struct spi_nor *nor = &mt8173_nor->nor;
> +
> +	writeb(nor->read_opcode, mt8173_nor->base + MTK_NOR_PRGDATA3_REG);

So far, I've generalized your code to say that except for a few commands
that are treated specially by your controller, all other opcodes are
queued up in the program/shift register this:

(1) total number of bits to send/receive goes in the COUNT register (so
    far, as many as 7*8=56?)
(2) opcode is written to PRGDATA5
(3) other "transmit" data (like addresses), if any, are placed on PRGDATA4..0
(4) command is sent (execute_cmd())
(5) data is read back in SHREG{X..0}, if needed

However, I see that

(a) here in mt8173_nor_set_read_mode(), you use only PRGDATA3 (i.e.,
this is different than step (2) above). Why is that different? Is this
just a quirk of the read mode, which is different than the other
arbitrary opcodes (like READ ID)?

(b) it's really unclear how to determine 'X' in step (5). It seems like
it might just be the number of bytes minus 1, since the first byte
aligns with the "opcode" cycle. But I'm not really sure, since in one
case (the 'default' in mt8173_nor_read_reg()) you seemingly randomly
chose to read *only* from SHREG2. That looks wrong to me, but I don't
actually know, because your SoC is very unclear.

My patch at the end of this [1] tries to encapsulate (1)-(5) as best as
I could, but it's really missing out on the answer to (b).

Anyway, I'd really appreciate a good answer to these questions. We
really need to get this stuff right, so your driver can handle NOR flash
opcodes as generically as possible. Right now, your driver mostly looks
like a series of cobbled together switch/case statements to handle the
couple of opcodes you've tested.

Regard,
Brian

[1] http://lists.infradead.org/pipermail/linux-mtd/2015-October/062919.html

> +	switch (nor->flash_read) {
> +	case SPI_NOR_FAST:
> +		writeb(MTK_NOR_FAST_READ, mt8173_nor->base +
> +		       MTK_NOR_CFG1_REG);
> +		break;
> +	case SPI_NOR_DUAL:
> +		writeb(MTK_NOR_DUAL_READ_EN, mt8173_nor->base +
> +		       MTK_NOR_DUAL_REG);
> +		break;
> +	case SPI_NOR_QUAD:
> +		writeb(MTK_NOR_QUAD_READ_EN, mt8173_nor->base +
> +		       MTK_NOR_DUAL_REG);
> +		break;
> +	default:
> +		writeb(MTK_NOR_DUAL_DISABLE, mt8173_nor->base +
> +		       MTK_NOR_DUAL_REG);
> +		break;
> +	}
> +}
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
