From: Alex Elder <alex.elder@linaro.org>
Subject: Re: [PATCH v2 0/3] clk: bcm281xx: define Broadcom kona clocks
Date: Tue, 10 Dec 2013 15:11:36 -0600
Message-ID: <52A78388.90904@linaro.org>
References: <529F4B0F.2020801@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <529F4B0F.2020801@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Daudt <bcm@fixthebug.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Mike Turquette <mturquette@linaro.org>
Cc: "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 12/04/2013 09:32 AM, Alex Elder wrote:
> This series adds support for Kona clock control units (CCUs) and
> clocks, used by Broadcom BCM281xx family SoCs.  Kona CCUs are
> represented by nodes in the device tree, and the names of the clocks
> provided by a CCU are included in its node.  Implementation details
> of those clocks are defined in a C file separate from the code that
> implements the functionality used by most of the common clock
> framework.

Ping?

If you need me to re-send the series as separate messages, say
so and I'll gladly do it.

Thank you.

					-Alex

> This series depends on:
>     "Update Kona drivers to use clocks"
>     https://lkml.org/lkml/2013/11/14/450
> 
> This series (along with a version of those prerequisite patches) is
> available in the "review/bcm-kona-clocks-v2" branch of this git
> repository:
>     git://git.linaro.org/people/elder/linux.git
> 
> Updates:
> v2: - Address all issues raised by Mark Rutland.
> 
> 					-Alex
> 
> Alex Elder (3):
>   clk: bcm281xx: define kona clock binding
>   clk: bcm281xx: add initial clock framework support
>   ARM: dts: bcm281xx: define real clocks
> 
>  .../devicetree/bindings/clock/bcm-kona-clock.txt   |   93 ++
>  arch/arm/boot/dts/bcm11351.dtsi                    |  240 +++--
>  drivers/clk/Kconfig                                |    1 +
>  drivers/clk/Makefile                               |    1 +
>  drivers/clk/bcm/Kconfig                            |    8 +
>  drivers/clk/bcm/Makefile                           |    3 +
>  drivers/clk/bcm/clk-bcm281xx.c                     |  416 ++++++++
>  drivers/clk/bcm/clk-kona-setup.c                   |  769 +++++++++++++++
>  drivers/clk/bcm/clk-kona.c                         | 1033
> ++++++++++++++++++++
>  drivers/clk/bcm/clk-kona.h                         |  414 ++++++++
>  include/dt-bindings/clock/bcm281xx.h               |   65 ++
>  11 files changed, 2967 insertions(+), 76 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/clock/bcm-kona-clock.txt
>  create mode 100644 drivers/clk/bcm/Kconfig
>  create mode 100644 drivers/clk/bcm/Makefile
>  create mode 100644 drivers/clk/bcm/clk-bcm281xx.c
>  create mode 100644 drivers/clk/bcm/clk-kona-setup.c
>  create mode 100644 drivers/clk/bcm/clk-kona.c
>  create mode 100644 drivers/clk/bcm/clk-kona.h
>  create mode 100644 include/dt-bindings/clock/bcm281xx.h
> 
