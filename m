From: Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: [PATCH v8 0/2] mtd: hisilicon: add a new driver for NAND controller of hisilicon hip04 Soc
Date: Sun, 25 Jan 2015 18:53:12 +0800
Message-ID: <1422183194-10148-1-git-send-email-wangzhou1@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, caizhiyong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, yubingxu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds the support for NAND controller of hisilicon hip04 Soc.
The NAND controller IP was developed by hisilicon and needs a new driver to
support it. This patchset is based on l2-mtd/master.

I have tested this NAND flash controller driver in Hip04 D01 board using MTD
test modules. All testes passed except mtd_nandbiterrs. The reason is that this
NAND controller doesn't support to write raw page in ECC mode. In the test of
mtd_nandbiterrs, when rewriting raw page(with some bits changed) back, this NAND
controller will also produce ECC codes and write into NAND flash OOB area. As
ECC codes in OOB area have been broken, read error comes out as follow.

Hi Brian,

As the patch have been reviewed for some time, could you consider to take this
driver for v3.20? If there is something still not good, please let me know.

Thanks,
Zhou Wang

Changes in v8:
- Remove 1bit ECC support for hardware problem.

Changes in v7:
- Add error check for dmam_alloc_coherent,
  delete error print after devm_ioremap_resource.
- Directly get value in memory instead of using readb/w.
- Use a private pointer stored in host to access hardware buffer instead
  of using IO_ADDR_R/W.
- Use cond_resched to replace _cond_resched.
- Initialize stat_max in hisi_nand_read_page_hwecc to avoid WARNING when compiling.
- Remove of_match_ptr macro in struct platform_driver hisi_nfc_driver.

Changes in v6:
- Change E-mail address in signed-off-by to "wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org"

Changes in v5:
- Make modifications according to the comments from Brian, thanks a lot.
- Add hisi_nand_read_oob callback function.

Changes in v4:
- Add mtd->dev.parent = &pdev->dev, thanks Frans Klaver.  

Changes in v3:
- Modify code to eliminate some code style warnings.
- Add ecc-bits input check.
- Avoid using waterfall style in hisi_nfc_cmdfunc().

Changes in v2:
- Remove the patch for device tree, now patchset only has the driver and its
  device tree binding documentation.
- Change the file name: hisi_nand.c to hisi504_nand.c.

Changes in v1:
- Remove callback functions out of struct hinfc_host, and call them directly
  in relative functions.
- Change hinfc_read and hinfc_write from macros to inline functions.
- Instead of putting pointers, embed struct nand_chip and struct mtd_info
  in struct hinfc_host directly.
- rewrite some unclear lines in device tree binding document, correct
  some code style error.

Link on v7:
- http://www.spinics.net/lists/devicetree/msg65380.html
Link on v6:
- http://spinics.net/lists/arm-kernel/msg390124.html
Link on v5:
- http://spinics.net/lists/arm-kernel/msg387244.html
Link on v4:
- https://lkml.org/lkml/2014/11/4/377
Link on v3:
- https://lkml.org/lkml/2014/10/28/386
Link on v2:
- https://www.mail-archive.com/linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg750071.html
Link on v1:
- https://lkml.org/lkml/2014/7/15/198


Zhou Wang (2):
  mtd: hisilicon: add a new NAND controller driver for hisilicon hip04 Soc
  mtd: hisilicon: add device tree binding documentation

 .../devicetree/bindings/mtd/hisi504-nand.txt       |  47 ++
 drivers/mtd/nand/Kconfig                           |   5 +
 drivers/mtd/nand/Makefile                          |   1 +
 drivers/mtd/nand/hisi504_nand.c                    | 891 +++++++++++++++++++++
 4 files changed, 944 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/hisi504-nand.txt
 create mode 100644 drivers/mtd/nand/hisi504_nand.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
