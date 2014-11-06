From: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 0/2] mtd: hisilicon: add a new driver for NAND
 controller of hisilicon hip04 Soc
Date: Thu, 6 Nov 2014 11:05:46 +0800
Message-ID: <CAN1soZzW8UgHsqR89jKswbjkm9cO-LXUEQ+svc=68+A_avj0hw@mail.gmail.com>
References: <1415105221-7732-1-git-send-email-wangzhou.bry@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415105221-7732-1-git-send-email-wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, caizhiyong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, "xuwei (O)" <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 4, 2014 at 8:46 PM, Zhou Wang <wangzhou.bry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> This patchset adds the support for NAND controller of hisilicon hip04 Soc.
> The NAND controller IP was developed by hisilicon and needs a new driver to
> support it. This patchset is based on v3.18-rc1. I have tested that NAND flash
> controller works fine in Hip04 D01 board.
>
> Changes in v4:
> - add mtd->dev.parent = &pdev->dev, thanks Frans Klaver.
> Changes in v3:
> - Modify code to eliminate some code style warnings.
> - add ecc-bits input check.
> - avoid using waterfall style in hisi_nfc_cmdfunc().
> Changes in v2:
> - Remove the patch for device tree, now patchset only has the driver and its
>   device tree binding documentation.
> - Change the file name: hisi_nand.c to hisi504_nand.c.
> Changes in v1:
> - Remove callback functions out of struct hinfc_host, and call them directly
>   in relative functions.
> - Change hinfc_read and hinfc_write from macros to inline functions.
> - Instead of putting pointers, embed struct nand_chip and struct mtd_info in
>   struct hinfc_host directly.
> - rewrite some unclear lines in device tree binding document, correct some
>   code style error.
>
> Link on v3:
> - https://lkml.org/lkml/2014/10/28/386
> Link on v2:
> - https://www.mail-archive.com/linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg750071.html
> Link on v1:
> - https://lkml.org/lkml/2014/7/15/198
>
> Zhou Wang (2):
>   mtd: hisilicon: add a new NAND controller driver for hisilicon hip04 Soc
>   mtd: hisilicon: add device tree binding documentation
>
>  .../devicetree/bindings/mtd/hisi504-nand.txt       |   40 +
>  drivers/mtd/nand/Kconfig                           |    5 +
>  drivers/mtd/nand/Makefile                          |    1 +
>  drivers/mtd/nand/hisi504_nand.c                    |  846 ++++++++++++++++++++
>  4 files changed, 892 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/hisi504-nand.txt
>  create mode 100644 drivers/mtd/nand/hisi504_nand.c
>
> --
> 1.7.9.5
>

Acked-by: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
