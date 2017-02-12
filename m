From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v4 2/7] drm/tinydrm: Add helper functions
Date: Sun, 12 Feb 2017 16:33:04 +0100
Message-ID: <2ee54d47-ff7e-2f94-9eea-7d75788b3e1c@tronnes.org>
References: <20170211184858.26421-1-noralf@tronnes.org>
 <20170211184858.26421-3-noralf@tronnes.org>
 <CAHp75Vfc+2iUz=2ias5enwbTVd=unu3dEiRgiAwbGFS2KEW+2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHp75Vfc+2iUz=2ias5enwbTVd=unu3dEiRgiAwbGFS2KEW+2A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Den 12.02.2017 12.50, skrev Andy Shevchenko:
> On Sat, Feb 11, 2017 at 8:48 PM, Noralf Trønnes <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org> wrote:
>> Add common functionality needed by many tinydrm drivers.
>> +int tinydrm_enable_backlight(struct backlight_device *backlight)
>> +{
>> +       unsigned int old_state;
>> +       int ret;
>> +
>> +       if (!backlight)
>> +               return 0;
>> +
>> +       old_state = backlight->props.state;
>> +       backlight->props.state &= ~BL_CORE_FBBLANK;
>> +       DRM_DEBUG_KMS("Backlight state: 0x%x -> 0x%x\n", old_state,
>> +                     backlight->props.state);
> "%#x" ?
> (And elsewhere)
>
>> +#if IS_ENABLED(CONFIG_SPI)
>> +size_t tinydrm_spi_max_transfer_size(struct spi_device *spi, size_t max_len)
>> +{
>> +       size_t ret;
>> +
>> +       ret = min(spi_max_transfer_size(spi), spi->master->max_dma_len);
> I don't get why DMA constrain somehow affects this framework?

The reason is that spi-bcm2835 reverts to PIO on larger buffers.
Looking at __spi_map_msg() and spi_map_buf() it becomes clear that the
core breaks up the buffer into manageable parts. So this must be a bug
in spi-bcm2835 (and spi-pxa2xx) since no other drivers have a upper
limit in the .can_dma() callback.
So you're rightly confused, with drivers fixed, this limit can be lifted.

> What if max_dma_len is zero (imagine SPI master that works only by PIO
> by some reason)?

It can't be zero:

int spi_register_master(struct spi_master *master)
{
...
     if (!master->max_dma_len)
         master->max_dma_len = INT_MAX;

>> +       if (max_len)
>> +               ret = min(ret, max_len);
>> +       if (spi_max)
>> +               ret = min_t(size_t, ret, spi_max);
>> +       ret &= ~0x3;
> Why alignment is that? Why do we need it? Isn't a busyness of SPI
> framework to cope with it?

This minimum capping doesn't look good. I should probably put >16
instead, that would cover the minimum for the 9-bit emulation code.

The reason I let the user change the transfer size, is that some usb
audio card on Raspberry Pi stuttered with 4k fbtft transfers.

>> +       if (ret < 4)
> It's effectively check for 0.
>
>> +               ret = 4;
>> +
>> +       return ret;
>> +}
>> +EXPORT_SYMBOL(tinydrm_spi_max_transfer_size);
>> +static void
>> +tinydrm_dbg_spi_print(struct spi_device *spi, struct spi_transfer *tr,
>> +                     const void *buf, int idx, bool tx)
>> +{
>> +       u32 speed_hz = tr->speed_hz ? tr->speed_hz : spi->max_speed_hz;
>> +       char linebuf[3 * 32];
>> +
>> +       hex_dump_to_buffer(buf, tr->len, 16,
>> +                          DIV_ROUND_UP(tr->bits_per_word, 8),
>> +                          linebuf, sizeof(linebuf), false);
>> +
>> +       printk(KERN_DEBUG
>> +              "    tr(%i): speed=%u%s, bpw=%i, len=%u, %s_buf=[%s%s]\n", idx,
>> +              speed_hz > 1000000 ? speed_hz / 1000000 : speed_hz / 1000,
>> +              speed_hz > 1000000 ? "MHz" : "kHz", tr->bits_per_word, tr->len,
>> +              tx ? "tx" : "rx", linebuf, tr->len > 16 ? " ..." : "");
> I hope at some point we will have some extension to print speeds,
> sizes and so on based on algo in string_get_size().
>
>> +}
>> +int tinydrm_spi_transfer(struct spi_device *spi, u32 speed_hz,
>> +                        struct spi_transfer *header, u8 bpw, const void *buf,
>> +                        size_t len)
>> +{
>> +       struct spi_transfer tr = {
>> +               .bits_per_word = bpw,
>> +               .speed_hz = speed_hz,
>> +       };
>> +       struct spi_message m;
>> +       u16 *swap_buf = NULL;
>> +       size_t max_chunk;
>> +       size_t chunk;
>> +       int ret = 0;
>> +
>> +       if (WARN_ON_ONCE(bpw != 8 && bpw != 16))
>> +               return -EINVAL;
>> +
>> +       max_chunk = tinydrm_spi_max_transfer_size(spi, 0);
>> +
>> +       if (drm_debug & DRM_UT_DRIVER)
>> +               pr_debug("[drm:%s] bpw=%u, max_chunk=%zu, transfers:\n",
>> +                        __func__, bpw, max_chunk);
> For all of your dev_dbg() / pr_debug() __func__ argument might be
> redundant. Dynamic Debug may include this by request from user.
>
>> +/**
>> + * tinydrm_machine_little_endian - Machine is little endian
>> + *
>> + * Returns:
>> + * true if *defined(__LITTLE_ENDIAN)*, false otherwise
>> + */
>> +static inline bool tinydrm_machine_little_endian(void)
>> +{
>> +#if defined(__LITTLE_ENDIAN)
>> +       return true;
>> +#else
>> +       return false;
>> +#endif
>> +}
> Hmm... What is the typical code of a caller for this?

If the bus can't do 16-bit natively, it will have to swap the bytes on
little endian machines before transfer as 8-bit (Raspberry Pi can't do
16-bit SPI with it's DMA capable controller).
So this function is to avoid #ifdef's elsewhere.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
