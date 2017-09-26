From: Jon Mason <jon.mason@broadcom.com>
Subject: Re: [PATCH 00/10] ARM: bcm: Add support for Broadcom Hurricane 2 SoC
Date: Tue, 26 Sep 2017 11:00:59 -0400
Message-ID: <CAC3K-4rioegE+UGmOiTjiw=WqRPr7sYf23kap5gz=TvYKT+z5g@mail.gmail.com>
References: <20170926000931.670-1-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170926000931.670-1-f.fainelli@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, "maintainer:BROADCOM IPROC ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 25, 2017 at 8:09 PM, Florian Fainelli <f.fainelli@gmail.com> wrote:
> Hi all,
>
> This patch series adds basic (boot to prompt with essential peripherals
> working) support for Broadcom's Hurricane 2 SoC which is found in switching
> applications.
>
> This is also an iProc-family chip with a number of variations, including
> some in the clock controller that I have not been able to identify yet.
>
> Florian Fainelli (10):
>   MAINTAINERS: Update Broadcom iProc regexp with Hurricane 2
>   dt-bindings: Add documentation for Broadcom Hurricane 2 SoCs
>   ARM: bcm: Add support for Broadcom Hurricane 2 SoC
>   dt-bindings: Document Broadcom Hurricane 2 clocks
>   clk: bcm: Add Broadcom Hurricane 2 clock support
>   ARM: dts: Add Broadcom Hurricane 2 DTS include file
>   ARM: debug: Add Hurricane 2 UART2 debug addresses
>   dt-bindings: Add Ubiquiti Networks vendor prefix
>   ARM: dts: Hurricane 2: Add basic support for Ubiquiti UniFi Switch 8
>   ARM: multi_v7_defconfig: Enable CONFIG_ARCH_BCM_HR2
>
>  .../devicetree/bindings/arm/bcm/brcm,hr2.txt       |  14 +
>  .../bindings/clock/brcm,iproc-clocks.txt           |  14 +
>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
>  MAINTAINERS                                        |   1 +
>  arch/arm/Kconfig.debug                             |  10 +-
>  arch/arm/boot/dts/Makefile                         |   2 +
>  arch/arm/boot/dts/bcm-hr2.dtsi                     | 368 +++++++++++++++++++++
>  arch/arm/boot/dts/bcm53340-ubnt-unifi-switch8.dts  |  85 +++++
>  arch/arm/configs/multi_v7_defconfig                |   1 +
>  arch/arm/mach-bcm/Kconfig                          |   9 +
>  arch/arm/mach-bcm/Makefile                         |   3 +
>  arch/arm/mach-bcm/bcm_hr2.c                        |  25 ++
>  drivers/clk/bcm/Kconfig                            |   9 +
>  drivers/clk/bcm/Makefile                           |   1 +
>  drivers/clk/bcm/clk-hr2.c                          |  27 ++
>  15 files changed, 569 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,hr2.txt
>  create mode 100644 arch/arm/boot/dts/bcm-hr2.dtsi
>  create mode 100644 arch/arm/boot/dts/bcm53340-ubnt-unifi-switch8.dts
>  create mode 100644 arch/arm/mach-bcm/bcm_hr2.c
>  create mode 100644 drivers/clk/bcm/clk-hr2.c

The series looks good to me.  Please feel free to add
Acked-by: Jon Mason <jon.mason@broadcom.com>

Thanks,
Jon


> --
> 2.14.1
>
