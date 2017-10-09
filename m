From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/4] nvmem: add a driver for the Amlogic
 Meson6/Meson8/Meson8b SoCs
Date: Mon, 9 Oct 2017 11:36:23 +0100
Message-ID: <dc3200f3-34cd-f531-0a0b-9b856a84cd52@linaro.org>
References: <20171001125700.1520-1-martin.blumenstingl@googlemail.com>
 <20171001125700.1520-4-martin.blumenstingl@googlemail.com>
 <cd1e7f9c-5aff-8f4c-82b0-c58c2de4c253@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cd1e7f9c-5aff-8f4c-82b0-c58c2de4c253-GANU6spQydw@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Moore <moore-GANU6spQydw@public.gmane.org>, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 03/10/17 05:48, Chris Moore wrote:
> Hi,
> 
> Sorry in advance if I am being extremely stupid here.
> 
> Le 01/10/2017 à 14:56, Martin Blumenstingl a écrit :
> 
> [snip]
> 
>> +static int meson_mx_efuse_read(void *context, unsigned int offset,
>> +                   void *buf, size_t bytes)
>> +{
>> +    struct meson_mx_efuse *efuse = context;
>> +    u32 tmp;
>> +    int err, i, addr;
>> +
>> +    err = meson_mx_efuse_hw_enable(efuse);
>> +    if (err)
>> +        return err;
>> +
>> +    meson_mx_efuse_mask_bits(efuse, MESON_MX_EFUSE_CNTL1,
>> +                 MESON_MX_EFUSE_CNTL1_AUTO_RD_ENABLE,
>> +                 MESON_MX_EFUSE_CNTL1_AUTO_RD_ENABLE);
>> +
>> +    for (i = offset; i < offset + bytes; i += efuse->config.word_size) {
>> +        addr = i / efuse->config.word_size;
>> +
>> +        err = meson_mx_efuse_read_addr(efuse, addr, &tmp);
>> +        if (err)
>> +            break;
>> +
>> +        memcpy(buf + i, &tmp, efuse->config.word_size);
>> +    }
> 
> This will not give the expected result if offset is not a multiple of 
> efuse->config.word_size.

Offset should be always multiple of stride which is enforced in nvmem core.

nvmem_cell would return an -EINVAL if that is not the case.


--srini

> This will cause buffer overflow if bytes is not a multiple of 
> efuse->config.word_size.
> Shouldn't there at least be some sort of test on offset and bytes?
> 
> Also this doesn't look endian-safe, but maybe it is.
> 
> Old-timer remarks:
> - I try to avoid divisions where possible but I suppose they are very 
> low-cost on recent hardware.
> - I don't like arithmetic on void pointers but I know it is supported by 
> gcc (and possibly by recent C standards too).
> 
> Sorry again for the noise if I am being stupid.
> 
> Cheers,
> Chris
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
