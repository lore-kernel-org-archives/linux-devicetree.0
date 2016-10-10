From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] mfd: Add HiSilicon Flash Memory Controller(FMC)
 driver
Date: Sun, 9 Oct 2016 19:55:38 -0500
Message-ID: <20161010005538.GA32227@rob-hp-laptop>
References: <1475225971-30152-1-git-send-email-linshunquan1@hisilicon.com>
 <1475225971-30152-2-git-send-email-linshunquan1@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1475225971-30152-2-git-send-email-linshunquan1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linshunquan 00354166 <linshunquan1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, howell.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, jalen.hsu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, raojun-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, kevin.lixu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, lvkuanliang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 30, 2016 at 04:59:30PM +0800, linshunquan 00354166 wrote:
> From: Shunquan Lin <linshunquan1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
> 
> This patch adds driver support for HiSilicon Flash Memory
> Controller(FMC). HiSilicon FMC is a multi-functions device which
> supports SPI Nor flash controller, SPI nand Flash controller and
> parallel nand flash controller.

I still have unanswered questions from the last version.

> 
> Signed-off-by: Shunquan Lin <linshunquan1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
> ---
>  .../devicetree/bindings/mfd/hisilicon,hisi-fmc.txt |  62 ++++++++++++
>  drivers/mfd/Kconfig                                |  10 ++
>  drivers/mfd/Makefile                               |   1 +
>  drivers/mfd/hisi_fmc.c                             | 109 +++++++++++++++++++++
>  include/linux/mfd/hisi_fmc.h                       |  92 +++++++++++++++++
>  5 files changed, 274 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hisi-fmc.txt
>  create mode 100644 drivers/mfd/hisi_fmc.c
>  create mode 100644 include/linux/mfd/hisi_fmc.h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
