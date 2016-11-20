From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: add rockchip serial flash controller
 driver
Date: Sun, 20 Nov 2016 22:11:24 +0100
Message-ID: <8f8213a1-f694-8159-fdbd-5e607c8aaaa2@gmail.com>
References: <1478855766-151673-1-git-send-email-shawn.lin@rock-chips.com>
 <1478855766-151673-3-git-send-email-shawn.lin@rock-chips.com>
 <b1420e9d-b6a1-7fe8-4381-e32e0bc7dd53@gmail.com>
 <775a8918-bc93-218a-808d-2a160137ad56@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <775a8918-bc93-218a-808d-2a160137ad56-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/16/2016 02:59 AM, Shawn Lin wrote:
> Hi Marek,

Hi,

[...]

>>> +static int rockchip_sfc_read_reg(struct spi_nor *nor, u8 opcode,
>>> +                 u8 *buf, int len)
>>> +{
>>> +    struct rockchip_sfc_priv *priv = nor->priv;
>>> +    struct rockchip_sfc *sfc = priv->sfc;
>>> +    int ret;
>>> +    u32 tmp;
>>> +    u32 i;
>>> +
>>> +    ret = rockchip_sfc_op_reg(nor, opcode, len, SFC_CMD_DIR_RD);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    while (len > 0) {
>>> +        tmp = readl_relaxed(sfc->regbase + SFC_DATA);
>>> +        for (i = 0; i < len; i++)
>>> +            *buf++ = (u8)((tmp >> (i * 8)) & 0xff);
>>
>> Won't this fail for len > 4 ?
> 
> nope, this loop will reduce 4 for each successful readl. And
> reading the remained bytes which isn't aligned to DWORD, isn't it?

Try for len = 8 ... it will write 8 bytes to the buf, but half of them
would be zero. I believe it should look like:

        for (i = 0; i < 4 /* was len */; i++)
            *buf++ = (u8)((tmp >> (i * 8)) & 0xff);

>>
>> Also, you can use ioread32_rep() here, but (!) that won't work for
>> unaligned reads, which I dunno if they can happen here, but please do
>> double-check.
> 
> yes, I have checked this API as well as others like memcpy_{to,from}io
> , etc. They will generate a external abort for arm core as the unaligned
> (DWORD) read/write via AHB aren't supported by Rockchip Socs. So I have
> to open code these stuff. This could be easily found for other
> upstreamed rockchip drivers. :)

This is normal, but you can still use the _rep variant if you handle the
corner cases.

>>
>>> +        len = len - 4;
>>> +    }
>>> +
>>> +    return 0;
>>> +}

[...]

>>> +static ssize_t rockchip_sfc_write(struct spi_nor *nor, loff_t to,
>>> +                  size_t len, const u_char *write_buf)
>>> +{
>>> +    struct rockchip_sfc_priv *priv = nor->priv;
>>> +    struct rockchip_sfc *sfc = priv->sfc;
>>> +    size_t offset;
>>> +    int ret;
>>> +    dma_addr_t dma_addr = 0;
>>> +
>>> +    if (!sfc->use_dma)
>>> +        goto no_dma;
>>
>> Seems like there's a lot of similarity between read/write .
> 
> I was thinking to combine read/write with a extra argument to
> indicate WR/RD. But as we could see still some differece between
> WR and RD and there are already some condiction checks. So it
> will make the code hard to read with stuffing lots of condition
> checks. So I splited out read and write strightforward. :)

Hrm, is it that bad ?

>>> +    for (offset = 0; offset < len; offset += SFC_DMA_MAX_LEN) {
>>> +        size_t trans = min_t(size_t, SFC_DMA_MAX_LEN, len - offset);
>>> +
>>> +        dma_addr = dma_map_single(NULL, (void *)write_buf,
>>> +                      trans, DMA_TO_DEVICE);
>>> +        if (dma_mapping_error(sfc->dev, dma_addr)) {
>>> +            dma_addr = 0;
>>> +            memcpy(sfc->buffer, write_buf + offset, trans);
>>> +        }
>>> +
>>> +        /* Fail to map dma, use pre-allocated area instead */
>>> +        ret = rockchip_sfc_dma_transfer(nor, to + offset,
>>> +                        dma_addr ? dma_addr :
>>> +                        sfc->dma_buffer,
>>> +                        trans, SFC_CMD_DIR_WR);
>>> +        if (dma_addr)
>>> +            dma_unmap_single(NULL, dma_addr,
>>> +                     trans, DMA_TO_DEVICE);
>>> +        if (ret) {
>>> +            dev_warn(nor->dev, "DMA write timeout\n");
>>> +            return ret;
>>> +        }
>>> +    }
>>> +
>>> +    return len;
>>> +no_dma:
>>> +    ret = rockchip_sfc_pio_transfer(nor, to, len,
>>> +                    (u_char *)write_buf, SFC_CMD_DIR_WR);
>>> +    if (ret) {
>>> +        dev_warn(nor->dev, "PIO write timeout\n");
>>> +        return ret;
>>> +    }
>>> +    return len;
>>> +}

[...]

>>> +static void rockchip_sfc_unregister_all(struct rockchip_sfc *sfc)
>>> +{
>>> +    int i;
>>> +
>>> +    for (i = 0; i < sfc->num_chip; i++)
>>> +        mtd_device_unregister(&sfc->nor[i]->mtd);
>>> +}
>>> +
>>> +static int rockchip_sfc_register_all(struct rockchip_sfc *sfc)
>>> +{
>>> +    struct device *dev = sfc->dev;
>>> +    struct device_node *np;
>>> +    int ret;
>>> +
>>> +    for_each_available_child_of_node(dev->of_node, np) {
>>> +        ret = rockchip_sfc_register(np, sfc);
>>> +        if (ret)
>>> +            goto fail;
>>> +
>>> +        if (sfc->num_chip == SFC_MAX_CHIP_NUM) {
>>> +            dev_warn(dev, "Exceeds the max cs limitation\n");
>>> +            break;
>>> +        }
>>> +    }
>>> +
>>> +    return 0;
>>> +
>>> +fail:
>>> +    dev_err(dev, "Failed to register all chip\n");
>>> +    rockchip_sfc_unregister_all(sfc);
>>
>> See cadence qspi where we only unregister the registered flashes.
>> Implement it the same way here.
>>
> 
> yup, but I'm afraid that rockchip_sfc_unregister_all confused you
> as it actually unregisters the registered ones, not for all.
> 
> static void rockchip_sfc_unregister_all(struct rockchip_sfc *sfc)
> {
>         int i;
> 
>         for (i = 0; i < sfc->num_chip; i++)
>                 mtd_device_unregister(&sfc->nor[i]->mtd);
> }
> 
> sfc->num_chip stands for how many flashes registered successfully.

Does it work if you have a hole in there ? Like if you have a flash on
chipselect 0 and chipselect 2 ?

>>> +    return ret;
>>> +}

[...]


-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
