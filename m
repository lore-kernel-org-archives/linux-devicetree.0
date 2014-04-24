From: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [GIT PULL] ARM: Updates for mmci driver for 3.16, take 1
Date: Thu, 24 Apr 2014 12:57:01 +0200
Message-ID: <CAPDyKFo07dqfqTtrGp3sHwf1ghzCj4BaBqJffRAs=cA1-HP2Tw@mail.gmail.com>
References: <CAPDyKFp0K=cijuAZox7_BsTk2UCyC7Dp9HQoO6eJzaHikRMVUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPDyKFp0K=cijuAZox7_BsTk2UCyC7Dp9HQoO6eJzaHikRMVUw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alessandro Rubini <rubini-9wsNiZum9E8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 14 April 2014 16:17, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Hi Russell,
>
> I have collected some patches which all relates to changes to the mmci driver.
>
> The SOC specific patches has been acked by the SOC maintainer Linus
> Walleij and the DT patches has been iterated a few times, due to
> comments from Rob Herring.
>
> Unless you have some concern with any of the patches, please pull them
> into your ARM tree.

Ping. :-)

Please, let me know if you prefer another setup than a pull request.

Kind regards
Ulf Hansson

>
> Kind regards
> Ulf Hansson
>
>
> The following changes since commit c9eaa447e77efe77b7fa4c953bd62de8297fd6c5:
>
>   Linux 3.15-rc1 (2014-04-13 14:18:35 -0700)
>
> are available in the git repository at:
>
>   git://git.linaro.org/people/ulf.hansson/linux-2.6.git
> mmci_for_russell_3.16_take1
>
> for you to fetch changes up to 724404ce84cbc3cb9a16dcc593bc4d07aa5b8b2e:
>
>   mmc: mmci: Enforce max frequency configuration through DT
> (2014-04-14 15:55:09 +0200)
>
> ----------------------------------------------------------------
> Ulf Hansson (22):
>       mmc: mmci: Mask IRQs for all variants during runtime suspend
>       mmc: mmci: Let runtime PM callbacks be available for CONFIG_PM
>       mmc: mmci: Put the device into low power state at system suspend
>       mmc: mmci: Convert to the mmc gpio API
>       mmc: mmci: Convert to devm functions
>       mmc: mmci: Update DT documentation
>       mmc: mmci: Add DT bindings for signal direction
>       mmc: mmci: Add DT bindings for feedback clock pin
>       mmc: mmci: Use the common mmc DT parser
>       ARM: ux500: Add mmci signal directions and feeback clock in DT for href
>       ARM: ux500: Convert to the common mmc DT bindings for highspeed mode
>       ARM: nomadik: Convert to the common mmc DT bindings for highspeed mode
>       ARM: u300: Convert to the common mmc DT bindings for highspeed mode
>       mmc: mmci: Mark the DT bindings for highspeed mode as deprecated
>       mmc: mmci: Enable MMC_CAP_CMD23
>       ARM: ux500: Add the mmc capabilities flags to DT
>       ARM: ux500: Add a vmmc regulator through DT for the poped eMMC for href
>       ARM: ux500: Remove redundant board file for mmci platform data
>       mmc: mmci: Enforce DT for signal direction and feedback clock
>       mmc: mmci: Enforce mmc capabilities through DT
>       mmc: mmci: Enforce DMA configuration through DT
>       mmc: mmci: Enforce max frequency configuration through DT
>
>  Documentation/devicetree/bindings/mmc/mmci.txt |   54 +++-
>  arch/arm/boot/dts/ste-ccu9540.dts              |    6 +-
>  arch/arm/boot/dts/ste-href.dtsi                |   19 +-
>  arch/arm/boot/dts/ste-nomadik-stn8815.dtsi     |    4 +-
>  arch/arm/boot/dts/ste-snowball.dts             |    4 +-
>  arch/arm/boot/dts/ste-u300.dts                 |    4 +-
>  arch/arm/mach-ux500/Makefile                   |    3 +-
>  arch/arm/mach-ux500/board-mop500-sdi.c         |  166 ------------
>  arch/arm/mach-ux500/board-mop500.h             |    5 -
>  arch/arm/mach-ux500/cpu-db8500.c               |    4 -
>  drivers/mmc/host/mmci.c                        |  324 ++++++------------------
>  drivers/mmc/host/mmci.h                        |   14 +-
>  include/linux/amba/mmci.h                      |   42 ---
>  13 files changed, 169 insertions(+), 480 deletions(-)
>  delete mode 100644 arch/arm/mach-ux500/board-mop500-sdi.c
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
