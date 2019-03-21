From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RESEND PATCHv4 0/6] Add SOCFPGA System Manager
Date: Thu, 21 Mar 2019 09:03:48 +0100
Message-ID: <CAK8P3a2yH+6idKS-n=t+JkQRyUK0nU_2qiJaQktQP9p_3y_86w@mail.gmail.com>
References: <1552342688-6663-1-git-send-email-thor.thayer@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552342688-6663-1-git-send-email-thor.thayer@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thor.thayer@linux.intel.com
Cc: Lee Jones <lee.jones@linaro.org>, Dinh Nguyen <dinguyen@kernel.org>, Russell King - ARM Linux <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, Olof Johansson <olof@lixom.net>, David Miller <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Networking <netdev@vger.kernel.org>, soc@kernel
List-Id: devicetree@vger.kernel.org

On Mon, Mar 11, 2019 at 11:15 PM <thor.thayer@linux.intel.com> wrote:
>
> From: Thor Thayer <thor.thayer@linux.intel.com>
>
> Add MFD driver for SOCFPGA System Manager to handle
> System Manager calls differently for ARM32 vs ARM64.
> The SOCFPGA System Manager includes registers from several
> SOC peripherals.
>
> On ARM32, syscon handles this aggregated register grouping.
> Implement System Manager calls as regmap_mmio similar to syscon
> for ARM32 SOCFPGA systems.
>
> The ARM64 System Manager can only be accessed from priority
> level EL3 so this new MFD driver handles the calls to EL3.

(adding arm@kernel.org)
As discussed with Lee, let's keep the series together and merge it
through the mfd tree.

For all six patches:

Reviewed-by: Arnd Bergmann <arnd@arndb.de>


> Thor Thayer (6):
>   mfd: altera-sysmgr: Add SOCFPGA System Manager
>   Documentation: dt: socfpga: Add S10 System Manager binding
>   ARM: socfpga_defconfig: Enable CONFIG_MTD_ALTERA_SYSMGR
>   arm64: defconfig: Enable CONFIG_MTD_ALTERA_SYSMGR
>   net: stmmac: socfpga: Use shared System Manager driver
>   arm64: dts: stratix10: New System Manager compatible
>
>  .../bindings/arm/altera/socfpga-system.txt         |  12 ++
>  MAINTAINERS                                        |   6 +
>  arch/arm/configs/socfpga_defconfig                 |   1 +
>  arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  |   2 +-
>  arch/arm64/configs/defconfig                       |   1 +
>  drivers/mfd/Kconfig                                |  10 +
>  drivers/mfd/Makefile                               |   1 +
>  drivers/mfd/altera-sysmgr.c                        | 211 +++++++++++++++++++++
>  .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |   5 +-
>  include/linux/mfd/altera-sysmgr.h                  |  29 +++
>  10 files changed, 275 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/mfd/altera-sysmgr.c
>  create mode 100644 include/linux/mfd/altera-sysmgr.h
>
> --
> 2.7.4
>
