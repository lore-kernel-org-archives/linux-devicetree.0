From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 0/3] Add PCIe support for i.MX6q
Date: Mon, 16 Sep 2013 17:11:01 +0800
Message-ID: <20130916091059.GM31147@S2101-09.ap.freescale.net>
References: <1379319655-20210-1-git-send-email-xobs@kosagi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1379319655-20210-1-git-send-email-xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Zhu Richard-R65037 <r65037-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 16, 2013 at 08:20:51AM +0000, Sean Cross wrote:
> Sean Cross (3):
>   ARM: imx: Add LVDS general-purpose clocks to i.MX6Q
>   ARM: imx6q: Add PCIe bits to GPR syscon definition
>   PCI: imx6: Add support for i.MX6 PCIe controller

The series looks good to me except that the devm_clk_get() should be
used in driver .probe function rather than clk_get().  I will wait for
another couple of days.  If there is no comments coming up, I can fix
it up and apply the series.

Shawn

> 
>  .../devicetree/bindings/clock/imx6q-clock.txt      |    4 +
>  .../devicetree/bindings/pci/designware-pcie.txt    |    7 +-
>  arch/arm/boot/dts/imx6qdl.dtsi                     |   16 +
>  arch/arm/mach-imx/Kconfig                          |    2 +
>  arch/arm/mach-imx/clk-imx6q.c                      |   24 +-
>  drivers/pci/host/Kconfig                           |    6 +
>  drivers/pci/host/Makefile                          |    1 +
>  drivers/pci/host/pci-imx6.c                        |  576 ++++++++++++++++++++
>  include/linux/mfd/syscon/imx6q-iomuxc-gpr.h        |    8 +
>  9 files changed, 642 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/pci/host/pci-imx6.c
> 
> -- 
> 1.7.9.5
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
