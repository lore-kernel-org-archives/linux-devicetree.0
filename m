From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dts: Remove leading 0x and 0s from bindings notation
Date: Wed, 13 Dec 2017 15:56:01 -0600
Message-ID: <CAL_JsqKe667S4jtoYWoThTRkV2U5irp=96XKQUO7dJCPcQ0Taw@mail.gmail.com>
References: <20171213210701.13311-1-malat@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171213210701.13311-1-malat@debian.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Malaterre <malat@debian.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, David Daney <ddaney@caviumnetworks.com>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 13, 2017 at 3:07 PM, Mathieu Malaterre <malat@debian.org> wrote:
> Improve the DTS files by removing all the leading "0x" and zeros to fix the
> following dtc warnings:
>
> Warning (unit_address_format): Node /XXX unit name should not have leading "0x"
>
> and
>
> Warning (unit_address_format): Node /XXX unit name should not have leading 0s
>
> Converted using the following command:
>
> find . -type f \( -iname *.dts -o -iname *.dtsi \) -exec sed -E -i -e "s/@0x([0-9a-fA-F\.]+)[[:space:]]?\{/@\L\1 \{/g" -e "s/@0+([0-9a-fA-F\.]+)([[:space:]]?\{)/@\L\1 \{/g" {} +
>
> For simplicity, two sed expressions were used to solve each warnings separately.
>
> To make the regex expression more robust a few other issues were resolved,
> namely setting unit-address to lower case, and adding a whitespace before the
> the opening curly brace:
>
> https://elinux.org/Device_Tree_Linux#Linux_conventions
>
> This is a follow up to commit 4c9847b7375a ("dt-bindings: Remove leading 0x from bindings notation")
>
> Reported-by: David Daney <ddaney@caviumnetworks.com>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> ---
>  arch/arc/boot/dts/abilis_tb10x.dtsi            |  4 +--
>  arch/arc/boot/dts/axc001.dtsi                  |  6 ++---
>  arch/arc/boot/dts/axc003.dtsi                  |  6 ++---
>  arch/arc/boot/dts/axc003_idu.dtsi              |  6 ++---
>  arch/arc/boot/dts/axs10x_mb.dtsi               | 22 ++++++++--------
>  arch/arc/boot/dts/vdk_axc003.dtsi              |  4 +--
>  arch/arc/boot/dts/vdk_axc003_idu.dtsi          |  4 +--
>  arch/arc/boot/dts/vdk_axs10x_mb.dtsi           | 14 +++++-----
>  arch/arm/boot/dts/am3517.dtsi                  |  4 +--
>  arch/arm/boot/dts/arm-realview-eb.dtsi         | 18 ++++++-------
>  arch/arm/boot/dts/arm-realview-pb1176.dts      | 18 ++++++-------
>  arch/arm/boot/dts/arm-realview-pb11mp.dts      | 18 ++++++-------
>  arch/arm/boot/dts/arm-realview-pbx.dtsi        | 18 ++++++-------
>  arch/arm/boot/dts/artpec6.dtsi                 |  2 +-
>  arch/arm/boot/dts/at91sam9261.dtsi             |  2 +-
>  arch/arm/boot/dts/at91sam9261ek.dts            |  2 +-
>  arch/arm/boot/dts/at91sam9263.dtsi             |  2 +-
>  arch/arm/boot/dts/at91sam9263ek.dts            |  2 +-
>  arch/arm/boot/dts/at91sam9g25ek.dts            |  2 +-
>  arch/arm/boot/dts/at91sam9g45.dtsi             |  2 +-
>  arch/arm/boot/dts/at91sam9m10g45ek.dts         |  2 +-
>  arch/arm/boot/dts/atlas7.dtsi                  | 12 ++++-----
>  arch/arm/boot/dts/bcm11351.dtsi                |  2 +-
>  arch/arm/boot/dts/bcm21664.dtsi                |  2 +-
>  arch/arm/boot/dts/bcm283x.dtsi                 |  2 +-
>  arch/arm/boot/dts/da850-lcdk.dts               |  4 +--
>  arch/arm/boot/dts/dm8148-evm.dts               |  8 +++---
>  arch/arm/boot/dts/dm8168-evm.dts               |  8 +++---
>  arch/arm/boot/dts/dra62x-j5eco-evm.dts         |  8 +++---
>  arch/arm/boot/dts/exynos5420.dtsi              | 36 +++++++++++++-------------
>  arch/arm/boot/dts/exynos5422-odroid-core.dtsi  |  2 +-
>  arch/arm/boot/dts/imx7d.dtsi                   |  2 +-
>  arch/arm/boot/dts/keystone-k2e-netcp.dtsi      |  2 +-
>  arch/arm/boot/dts/keystone-k2hk-netcp.dtsi     |  2 +-
>  arch/arm/boot/dts/keystone-k2l-netcp.dtsi      |  2 +-
>  arch/arm/boot/dts/omap3-cm-t3x.dtsi            |  8 +++---
>  arch/arm/boot/dts/omap3-evm-37xx.dts           |  8 +++---
>  arch/arm/boot/dts/omap3-lilly-a83x.dtsi        |  8 +++---
>  arch/arm/boot/dts/s3c2416.dtsi                 |  2 +-
>  arch/arm/boot/dts/sama5d3xmb.dtsi              |  2 +-
>  arch/arm/boot/dts/sama5d3xmb_cmp.dtsi          |  2 +-
>  arch/arm/boot/dts/socfpga.dtsi                 |  2 +-
>  arch/arm/boot/dts/spear300.dtsi                |  2 +-
>  arch/arm/boot/dts/spear310.dtsi                |  2 +-
>  arch/arm/boot/dts/spear320.dtsi                |  2 +-
>  arch/arm/boot/dts/versatile-ab.dts             | 16 ++++++------
>  arch/arm/boot/dts/zx296702.dtsi                | 20 +++++++-------
>  arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts |  2 +-
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi       |  2 +-
>  arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi   |  6 ++---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi          |  6 ++---
>  arch/c6x/boot/dts/dsk6455.dts                  |  2 +-
>  arch/c6x/boot/dts/tms320c6455.dtsi             |  2 +-
>  arch/metag/boot/dts/tz1090.dtsi                | 10 +++----
>  arch/mips/boot/dts/img/boston.dts              |  2 +-
>  arch/mips/boot/dts/ingenic/ci20.dts            |  8 +++---
>  arch/nios2/boot/dts/3c120_devboard.dts         | 16 ++++++------
>  arch/powerpc/boot/dts/a3m071.dts               | 10 +++----
>  arch/powerpc/boot/dts/akebono.dts              |  4 +--
>  arch/powerpc/boot/dts/c2k.dts                  |  6 ++---
>  arch/powerpc/boot/dts/currituck.dts            |  2 +-
>  arch/powerpc/boot/dts/fsl/mpc8568mds.dts       | 12 ++++-----
>  arch/powerpc/boot/dts/fsl/mpc8569mds.dts       | 20 +++++++-------
>  arch/powerpc/boot/dts/fsl/p1021mds.dts         |  6 ++---
>  arch/powerpc/boot/dts/fsl/p1025rdb.dtsi        |  8 +++---
>  arch/powerpc/boot/dts/fsl/p1025rdb_32b.dts     |  2 +-
>  arch/powerpc/boot/dts/fsl/p1025twr.dtsi        |  8 +++---
>  arch/powerpc/boot/dts/fsl/t1040rdb.dts         |  2 +-
>  arch/powerpc/boot/dts/fsl/t1042d4rdb.dts       | 10 +++----
>  arch/powerpc/boot/dts/fsl/t1042rdb.dts         |  2 +-
>  arch/powerpc/boot/dts/fsl/t104xrdb.dtsi        |  6 ++---
>  arch/powerpc/boot/dts/fsp2.dts                 |  6 ++---
>  arch/powerpc/boot/dts/gamecube.dts             | 14 +++++-----
>  arch/powerpc/boot/dts/haleakala.dts            |  2 +-
>  arch/powerpc/boot/dts/kilauea.dts              |  4 +--
>  arch/powerpc/boot/dts/kmeter1.dts              | 10 +++----
>  arch/powerpc/boot/dts/makalu.dts               |  4 +--
>  arch/powerpc/boot/dts/mpc832x_mds.dts          | 10 +++----
>  arch/powerpc/boot/dts/mpc832x_rdb.dts          |  8 +++---
>  arch/powerpc/boot/dts/mpc836x_mds.dts          |  8 +++---
>  arch/powerpc/boot/dts/sbc8548-altflash.dts     |  8 +++---
>  arch/powerpc/boot/dts/sbc8548.dts              |  8 +++---
>  arch/powerpc/boot/dts/wii.dts                  | 32 +++++++++++------------
>  arch/xtensa/boot/dts/csp.dts                   |  2 +-
>  arch/xtensa/boot/dts/xtfpga-flash-128m.dtsi    | 10 +++----
>  arch/xtensa/boot/dts/xtfpga-flash-16m.dtsi     | 10 +++----
>  arch/xtensa/boot/dts/xtfpga-flash-4m.dtsi      |  6 ++---
>  arch/xtensa/boot/dts/xtfpga.dtsi               | 10 +++----
>  88 files changed, 315 insertions(+), 315 deletions(-)

Thanks for doing this. It would be best to split this up by arch so
each arch maintainer can take each of their dts files. Otherwise,
looks good.

Rob
