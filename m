From: Ariel D'Alessandro <ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: Re: [PATCH v3 0/4] Add support for NXP LPC18xx EEPROM using nvmem
Date: Mon, 16 Nov 2015 14:11:55 -0300
Message-ID: <564A0E5B.7090105@vanguardiasur.com.ar>
References: <1447690798-14641-1-git-send-email-ariel@vanguardiasur.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447690798-14641-1-git-send-email-ariel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org


El 16/11/15 a las 13:19, Ariel D'Alessandro escribi=F3:
> This patch series adds support for NXP LPC18xx EEPROM memory found in
> NXP LPC185x/3x and LPC435x/3x/2x/1x devices.
>=20
> This patchset is based on tag next-20151116 of the linux-next
> repository. It has been successfully tested on a LPC4337 CIAA-NXP
> Board.

=46orgot to say that there's a known issue related to the nvmem core. I=
t
will be solved when the following patch gets submitted and applied.

-------------------------------->cut<----------------------------------
=46rom 8cae10eff8ea8da9c5a8058ff75abeeddd8a8224 Mon Sep 17 00:00:00 200=
1
=46rom: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Date: Mon, 26 Oct 2015 13:30:24 +0000
Subject: [PATCH] nvmem: core: return error for non word aligned bytes

nvmem providers have restrictions on register strides, so return error
code when users attempt to read/write buffers with sizes which are not
aligned to the word boundary.

Without this patch the userspace would continue to try as it does not
get any error from the nvmem core, resulting in a hang.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/nvmem/core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 6fd4e5a..9d11d98 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -70,6 +70,9 @@ static ssize_t bin_attr_nvmem_read(struct file *filp,
struct kobject *kobj,
     if (pos >=3D nvmem->size)
         return 0;

+    if (count < nvmem->word_size)
+        return -EINVAL;
+
     if (pos + count > nvmem->size)
         count =3D nvmem->size - pos;

@@ -95,6 +98,9 @@ static ssize_t bin_attr_nvmem_write(struct file *filp=
,
struct kobject *kobj,
     if (pos >=3D nvmem->size)
         return 0;

+    if (count < nvmem->word_size)
+        return -EINVAL;
+
     if (pos + count > nvmem->size)
         count =3D nvmem->size - pos;

--=20
1.9.1

-------------------------------->cut<----------------------------------

--=20
Ariel D'Alessandro, VanguardiaSur
www.vanguardiasur.com.ar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
