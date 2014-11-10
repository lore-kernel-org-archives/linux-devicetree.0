From: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 0/2] preserve FDT blob and present as /sys/firmware/fdt
Date: Mon, 10 Nov 2014 19:47:00 +0100
Message-ID: <1415645222-14909-1-git-send-email-ard.biesheuvel@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, geoff.levand-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Meh, I am not necessarily a lot happier with this version, now split into a
generic and a arch specific part, but it addresses Grant's concerns with
respect to modification, without resorting to checksums.

Checksums only solve half of the problem, because /not/ presenting the
blob at all if the checksum is incorrect is not really an option imo.

Ard Biesheuvel (2):
  of/fdt: export fdt blob as /sys/firmware/fdt
  arm64: fdt: call preserve_fdt() before unflattening it

 arch/arm64/kernel/head.S  |  3 +++
 arch/arm64/kernel/setup.c |  1 +
 drivers/of/fdt.c          | 34 ++++++++++++++++++++++++++++++++++
 include/linux/of_fdt.h    |  2 ++
 4 files changed, 40 insertions(+)

-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
