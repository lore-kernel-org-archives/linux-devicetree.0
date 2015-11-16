From: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/4] nvmem: NXP LPC18xx EEPROM memory NVMEM driver
Date: Mon, 16 Nov 2015 15:37:58 +0000
Message-ID: <5649F856.9000101@linaro.org>
References: <1445275946-32653-1-git-send-email-ariel@vanguardiasur.com.ar> <1445275946-32653-3-git-send-email-ariel@vanguardiasur.com.ar> <CAGhQ9Vyg6sScq7yM=7judsMPHOc5VF2zf=7LPxmbmL7wF=vvgw@mail.gmail.com> <562E2CB1.80706@linaro.org> <563385B2.90403@vanguardiasur.com.ar> <5649F74A.9020706@vanguardiasur.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5649F74A.9020706-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 16/11/15 15:33, Ariel D'Alessandro wrote:
>>> >>-------------------------------->cut<----------------------------------
>>> >> From 8cae10eff8ea8da9c5a8058ff75abeeddd8a8224 Mon Sep 17 00:00:00 2001
>>> >>From: Srinivas Kandagatla<srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> >>Date: Mon, 26 Oct 2015 13:30:24 +0000
>>> >>Subject: [PATCH] nvmem: core: return error for non word aligned bytes
>>> >>
>>> >>nvmem providers have restrictions on register strides, so return error
>>> >>code when users attempt to read/write buffers with sizes which are not
>>> >>aligned to the word boundary.
>>> >>
>>> >>Without this patch the userspace would continue to try as it does not
>>> >>get any error from the nvmem core, resulting in a hang.
>>> >>
>>> >>Signed-off-by: Srinivas Kandagatla<srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> >>---
>>> >>  drivers/nvmem/core.c | 6 ++++++
>>> >>  1 file changed, 6 insertions(+)
>>> >>
>>> >>diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
>>> >>index 6fd4e5a..9d11d98 100644
>>> >>--- a/drivers/nvmem/core.c
>>> >>+++ b/drivers/nvmem/core.c
>>> >>@@ -70,6 +70,9 @@ static ssize_t bin_attr_nvmem_read(struct file *filp,
>>> >>struct kobject *kobj,
>>> >>      if (pos >= nvmem->size)
>>> >>          return 0;
>>> >>
>>> >>+    if (count < nvmem->word_size)
>>> >>+        return -EINVAL;
>>> >>+
>>> >>      if (pos + count > nvmem->size)
>>> >>          count = nvmem->size - pos;
>>> >>
>>> >>@@ -95,6 +98,9 @@ static ssize_t bin_attr_nvmem_write(struct file *filp,
>>> >>struct kobject *kobj,
>>> >>      if (pos >= nvmem->size)
>>> >>          return 0;
>>> >>
>>> >>+    if (count < nvmem->word_size)
>>> >>+        return -EINVAL;
>>> >>+
>>> >>      if (pos + count > nvmem->size)
>>> >>          count = nvmem->size - pos;
>>> >>
>> >
>> >Patch looks good to me. I think that it solves the issue.
>> >I don't have the board here right now, so I'll check it ASAP and give
>> >some feedback.
> Finally tested this. As it seemed, it solved the issue.
> Are you submitting a patch for this?
Yes, I will send a patch to the mailing list.

--srini
>
> Thanks again.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
