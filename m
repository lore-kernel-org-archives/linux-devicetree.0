From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v2 0/5] Add SATA3 support for Broadcom NS2 SVK
Date: Fri, 29 Apr 2016 14:06:34 +0530
Message-ID: <57231D12.9080605@ti.com>
References: <1459140510-5317-1-git-send-email-anup.patel@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459140510-5317-1-git-send-email-anup.patel@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anup Patel <anup.patel@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, Device Tree <devicetree@vger.kernel.org>, Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Herring <robh@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jon.mason@broadcom.com>, Linux Kernel <linux-kernel@vger.kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

Hi,

On Monday 28 March 2016 10:18 AM, Anup Patel wrote:
> The Broadcom NS2 SoC has a AHCI compliant SATA3 controller with
> two ports.
> 
> This patchset adds common Broadcom SATA3 PHY driver and related
> DT bindings document. It also adds appropriate DT nodes in NS2 DT.
> 
> The patchset is based on v4.6-rc1 tag and is available in branch
> ns2_sata3_v2 of https://github.com/Broadcom/arm64-linux.git
> 
> All patches have been tested on Broadcom NS2 SVK.

merged the first 3 patches to linux-phy tree.

Thanks
Kishon

> 
> Changes since v1:
>  - Added ACKed by Rob for DT bindings related patches
> 
> Anup Patel (5):
>   phy: Rename phy-brcmstb-sata driver to phy-brcm-sata driver
>   phy: Add support for NS2 SATA3 PHY in Broadcom SATA3 PHY driver
>   dt-bindings: phy: bindings document for common Broadcom SATA3 PHY
>     driver
>   dt-bindings: ata: add compatible string for iProc AHCI controller
>   arm64: dts: Add SATA3 AHCI and SATA3 PHY DT nodes for NS2
> 
>  .../devicetree/bindings/ata/ahci-platform.txt      |   1 +
>  ...brcm,brcmstb-sata-phy.txt => brcm-sata-phy.txt} |  15 +-
>  arch/arm64/boot/dts/broadcom/ns2-svk.dts           |  12 +
>  arch/arm64/boot/dts/broadcom/ns2.dtsi              |  43 +++
>  drivers/phy/Kconfig                                |  18 +-
>  drivers/phy/Makefile                               |   2 +-
>  drivers/phy/phy-brcm-sata.c                        | 412 +++++++++++++++++++++
>  drivers/phy/phy-brcmstb-sata.c                     | 250 -------------
>  8 files changed, 487 insertions(+), 266 deletions(-)
>  rename Documentation/devicetree/bindings/phy/{brcm,brcmstb-sata-phy.txt => brcm-sata-phy.txt} (69%)
>  create mode 100644 drivers/phy/phy-brcm-sata.c
>  delete mode 100644 drivers/phy/phy-brcmstb-sata.c
> 
