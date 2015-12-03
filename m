From: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: Re: [PATCH v2 2/4] nvmem: NXP LPC18xx EEPROM memory NVMEM driver
Date: Thu, 3 Dec 2015 15:39:55 -0300
Message-ID: <CAAEAJfAqqni1UKiyftBE5kW-TegnuYvJrTvPkHm2gDbOuk4=Bw@mail.gmail.com>
References: <1445275946-32653-1-git-send-email-ariel@vanguardiasur.com.ar>
	<1445275946-32653-3-git-send-email-ariel@vanguardiasur.com.ar>
	<CAGhQ9Vyg6sScq7yM=7judsMPHOc5VF2zf=7LPxmbmL7wF=vvgw@mail.gmail.com>
	<562E2CB1.80706@linaro.org>
	<563385B2.90403@vanguardiasur.com.ar>
	<5649F74A.9020706@vanguardiasur.com.ar>
	<5649F856.9000101@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5649F856.9000101-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Srinivas,

On 16 November 2015 at 12:37, Srinivas Kandagatla
<srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
>
> On 16/11/15 15:33, Ariel D'Alessandro wrote:
>>>>
>>>>
>>>> >> >>-------------------------------->cut<------------------------=
----------
>>>> >> From 8cae10eff8ea8da9c5a8058ff75abeeddd8a8224 Mon Sep 17 00:00:=
00
>>>> >> 2001
>>>> >>From: Srinivas Kandagatla<srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>> >>Date: Mon, 26 Oct 2015 13:30:24 +0000
>>>> >>Subject: [PATCH] nvmem: core: return error for non word aligned =
bytes
>>>> >>
>>>> >>nvmem providers have restrictions on register strides, so return=
 error
>>>> >>code when users attempt to read/write buffers with sizes which a=
re not
>>>> >>aligned to the word boundary.
>>>> >>
>>>> >>Without this patch the userspace would continue to try as it doe=
s not
>>>> >>get any error from the nvmem core, resulting in a hang.
>>>> >>
>>>> >>Signed-off-by: Srinivas Kandagatla<srinivas.kandagatla-QSEj5FYQhm5QFI55V6+gNQ@public.gmane.org=
g>
>>>> >>---
>>>> >>  drivers/nvmem/core.c | 6 ++++++
>>>> >>  1 file changed, 6 insertions(+)
>>>> >>
>>>> >>diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
>>>> >>index 6fd4e5a..9d11d98 100644
>>>> >>--- a/drivers/nvmem/core.c
>>>> >>+++ b/drivers/nvmem/core.c
>>>> >>@@ -70,6 +70,9 @@ static ssize_t bin_attr_nvmem_read(struct file
>>>> >> *filp,
>>>> >>struct kobject *kobj,
>>>> >>      if (pos >=3D nvmem->size)
>>>> >>          return 0;
>>>> >>
>>>> >>+    if (count < nvmem->word_size)
>>>> >>+        return -EINVAL;
>>>> >>+
>>>> >>      if (pos + count > nvmem->size)
>>>> >>          count =3D nvmem->size - pos;
>>>> >>
>>>> >>@@ -95,6 +98,9 @@ static ssize_t bin_attr_nvmem_write(struct fil=
e
>>>> >> *filp,
>>>> >>struct kobject *kobj,
>>>> >>      if (pos >=3D nvmem->size)
>>>> >>          return 0;
>>>> >>
>>>> >>+    if (count < nvmem->word_size)
>>>> >>+        return -EINVAL;
>>>> >>+
>>>> >>      if (pos + count > nvmem->size)
>>>> >>          count =3D nvmem->size - pos;
>>>> >>
>>>
>>> >
>>> >Patch looks good to me. I think that it solves the issue.
>>> >I don't have the board here right now, so I'll check it ASAP and g=
ive
>>> >some feedback.
>>
>> Finally tested this. As it seemed, it solved the issue.
>> Are you submitting a patch for this?
>
> Yes, I will send a patch to the mailing list.
>

Ping? It would be good to have that patch and be able to merge this
lpc18xx-nvmem driver in time for the next merge window.

Thanks!
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
