From: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: Re: [PATCH v2 2/4] nvmem: NXP LPC18xx EEPROM memory NVMEM driver
Date: Fri, 30 Oct 2015 11:58:58 -0300
Message-ID: <563385B2.90403@vanguardiasur.com.ar>
References: <1445275946-32653-1-git-send-email-ariel@vanguardiasur.com.ar>
 <1445275946-32653-3-git-send-email-ariel@vanguardiasur.com.ar>
 <CAGhQ9Vyg6sScq7yM=7judsMPHOc5VF2zf=7LPxmbmL7wF=vvgw@mail.gmail.com>
 <562E2CB1.80706@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <562E2CB1.80706-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Srinivas,

El 26/10/15 a las 10:37, Srinivas Kandagatla escribi=C3=B3:
>=20
>=20
> On 24/10/15 23:04, Joachim Eastwood wrote:
>> Hi Ariel,
>>
>> On 19 October 2015 at 19:32, Ariel D'Alessandro
>> <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org> wrote:
>>> This commit adds support for NXP LPC18xx EEPROM memory found in NXP
>>> LPC185x/3x and LPC435x/3x/2x/1x devices.
>>>
>>> EEPROM size is 16384 bytes and it can be entirely read and
>>> written/erased with 1 word (4 bytes) granularity. The last page
>>> (128 bytes) contains the EEPROM initialization data and is not writ=
able.
>>>
>>> Erase/program time is less than 3ms. The EEPROM device requires a
>>> ~1500 kHz clock (min 800 kHz, max 1600 kHz) that is generated divid=
ing
>>> the system bus clock by the division factor, contained in the divid=
er
>>> register (minus 1 encoded).
>>>
>>> Signed-off-by: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
>>> ---
>>>   drivers/nvmem/Kconfig          |   9 ++
>>>   drivers/nvmem/Makefile         |   2 +
>>>   drivers/nvmem/lpc18xx_eeprom.c | 266
>>> +++++++++++++++++++++++++++++++++++++++++
>>>   3 files changed, 277 insertions(+)
>>>   create mode 100644 drivers/nvmem/lpc18xx_eeprom.c
>>
>>> +static int lpc18xx_eeprom_gather_write(void *context, const void *=
reg,
>>> +                                      size_t reg_size, const void =
*val,
>>> +                                      size_t val_size)
>>> +{
>>> +       struct lpc18xx_eeprom_dev *eeprom =3D context;
>>> +       unsigned int offset =3D *(u32 *)reg;
>>> +
>>> +       /* 3 ms of erase/program time between each writing */
>>> +       while (val_size) {
>>> +               writel(*(u32 *)val, eeprom->mem_base + offset);
>>> +               usleep_range(3000, 4000);
>>> +               val_size -=3D eeprom->val_bytes;
>>> +               val +=3D eeprom->val_bytes;
>>> +               offset +=3D eeprom->val_bytes;
>>> +       }
>>
>> What happens here if 'val_size' is less than 4 or not dividable by 4=
?
>> Same thing for 'offset'.
>>
>> I tested the driver from sysfs by writing strings into the nvmem-fil=
e
>> with echo. Writing a string not dividable by 4 seems to hang the
>> system.
>>
>=20
> I think I know the issue here:
> Could you try this patch:
>=20
> -------------------------------->cut<--------------------------------=
--
> From 8cae10eff8ea8da9c5a8058ff75abeeddd8a8224 Mon Sep 17 00:00:00 200=
1
> From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Date: Mon, 26 Oct 2015 13:30:24 +0000
> Subject: [PATCH] nvmem: core: return error for non word aligned bytes
>=20
> nvmem providers have restrictions on register strides, so return erro=
r
> code when users attempt to read/write buffers with sizes which are no=
t
> aligned to the word boundary.
>=20
> Without this patch the userspace would continue to try as it does not
> get any error from the nvmem core, resulting in a hang.
>=20
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/nvmem/core.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 6fd4e5a..9d11d98 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -70,6 +70,9 @@ static ssize_t bin_attr_nvmem_read(struct file *fil=
p,
> struct kobject *kobj,
>      if (pos >=3D nvmem->size)
>          return 0;
>=20
> +    if (count < nvmem->word_size)
> +        return -EINVAL;
> +
>      if (pos + count > nvmem->size)
>          count =3D nvmem->size - pos;
>=20
> @@ -95,6 +98,9 @@ static ssize_t bin_attr_nvmem_write(struct file *fi=
lp,
> struct kobject *kobj,
>      if (pos >=3D nvmem->size)
>          return 0;
>=20
> +    if (count < nvmem->word_size)
> +        return -EINVAL;
> +
>      if (pos + count > nvmem->size)
>          count =3D nvmem->size - pos;
>=20

Patch looks good to me. I think that it solves the issue.
I don't have the board here right now, so I'll check it ASAP and give
some feedback.

Thanks!

--=20
Ariel D'Alessandro, VanguardiaSur
www.vanguardiasur.com.ar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
