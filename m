From: naidu.tellapati-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH RESEND v2 0/2] Initial support for IMG Generic eFuse Controller
Date: Sat, 22 Nov 2014 08:24:31 +0530
Message-ID: <1416624873-7823-1-git-send-email-Naidu.Tellapati@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, James.Hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, James.Hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, Ezequiel.Garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arul Ramasamy <Arul.Ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Arul Ramasamy <Arul.Ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>

The Pistachio SoC from Imagination Technologies includes a generic eFuse
controller which exposes 128 EFUSE bits to the Kernel drivers and the user
applications. EFUSE bits are non-reversible fusible links that are blown in
specific ways to enable / disable certain features on the Pistachio SoC.

This is based on v3.18-rc4.

I am re-sending the series with gmail SMTP as we had some problems with
the mail server we used in the previous rounds.

Please review and provide your comments.

Changes from v1:

 * Created drivers/soc/img/ instead of drivers/soc/pistachio/.

 * Changed name of the external oscillator clock reference.

 * Changed of_device_id compatible name.

 * Removed MAX_EFUSE_BYTE_OFFSET macro.

 * Added range check against efuse_dev->size inside 'img_efuse_readl' function.

 * Added 'efuse_dev' valid check inside 'img_efuse_readl' function before
   invoking 'readl'.

 * Removed 'THIS_MODULE' set.

 * Moved 'img_efuse' structure definition to driver source file from header
   file.

 * Added include guard in header file.

Arul Ramasamy (2):
  efuse: Imagination Technologies Generic eFuse Controller
  DT: eFuse: Add binding document for IMG Generic eFuse Controller

 .../devicetree/bindings/soc/img/img-efuse.txt      |  18 ++
 drivers/soc/Kconfig                                |   1 +
 drivers/soc/Makefile                               |   1 +
 drivers/soc/img/Makefile                           |   1 +
 drivers/soc/img/fuse/Kconfig                       |   9 +
 drivers/soc/img/fuse/Makefile                      |   1 +
 drivers/soc/img/fuse/img-efuse.c                   | 192 +++++++++++++++++++++
 include/soc/img/img-efuse.h                        |  15 ++
 8 files changed, 238 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/img/img-efuse.txt
 create mode 100644 drivers/soc/img/Makefile
 create mode 100644 drivers/soc/img/fuse/Kconfig
 create mode 100644 drivers/soc/img/fuse/Makefile
 create mode 100644 drivers/soc/img/fuse/img-efuse.c
 create mode 100644 include/soc/img/img-efuse.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
