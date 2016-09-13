From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] mfd: Add HiSilicon Flash Memory Controller(FMC) driver
Date: Tue, 13 Sep 2016 13:08:50 +0100
Message-ID: <20160913120850.GB28894@dell>
References: <1473130643-12310-1-git-send-email-linshunquan1@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1473130643-12310-1-git-send-email-linshunquan1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linshunquan 00354166 <linshunquan1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, howell.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, jalen.hsu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, lvkuanliang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, raojun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, kevin.lixu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 06 Sep 2016, linshunquan 00354166 wrote:

> From: Shunquan Lin <linshunquan1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
> 
> This patch adds driver support for HiSilicon Flash Memory
> Controller(FMC). HiSilicon FMC is a multi-functions device which
> supports SPI Nor flash controller, SPI nand Flash controller and
> parallel nand flash controller.

MFDs are for devices which span multiple subsystems.

Please submit this to MTD.

> Signed-off-by: Shunquan Lin <linshunquan1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
> ---
>  .../devicetree/bindings/mfd/hisilicon,hisi-fmc.txt |  54 ++++++++++
>  drivers/mfd/Kconfig                                |  10 ++
>  drivers/mfd/Makefile                               |   1 +
>  drivers/mfd/hisi_fmc.c                             | 109 +++++++++++++++++++++
>  include/linux/mfd/hisi_fmc.h                       |  92 +++++++++++++++++
>  5 files changed, 266 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hisi-fmc.txt
>  create mode 100644 drivers/mfd/hisi_fmc.c
>  create mode 100644 include/linux/mfd/hisi_fmc.h

[...]

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
