From: Scott Branden <scott.branden@broadcom.com>
Subject: Re: [PATCH v6 0/3] Stingray USB PHY driver support
Date: Tue, 19 Mar 2019 11:38:28 -0700
Message-ID: <7490f894-3c0b-c7cd-5ff0-4eea6ea2c199@broadcom.com>
References: <1552986944-3398-1-git-send-email-srinath.mannam@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552986944-3398-1-git-send-email-srinath.mannam@broadcom.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Srinath Mannam <srinath.mannam@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Tejun Heo <tj@kernel.org>, Jayachandran C <jnair@caviumnetworks.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Thanks Srinath and Rob - patch series looks good now.

patch series,

Acked-by: Scott Branden <scott.branden@broadcom.com>


On 2019-03-19 2:15 a.m., Srinath Mannam wrote:
> These patches add Stingray USB PHY driver and its corresponding
> DT nodes with documentation.
>
> This patch set is based on Linux-5.0-rc2.
>
> Changes from v5:
>    - Removed redundant address and size cells in DT nodes.
>
> Changes from v4:
>    - Addressed Rob Herring review comments
>       - Removed child nodes and added #phy-cells 1
>       - Added xlate function to get phy using phandle argument.
>
> Changes from v3:
>    - Addressed Rob Herring review comments
>       - Changed compatible strings.
>       - updated driver based on new compatible strings.
>
> Changes from v2:
>    - Addressed Kishon review comments
>    - Updated patchset to Linux-5.0-rc2
>
> Changes from v1:
>    - Addressed Kishon review comments
>    - phy init call return value handle
>    
> Srinath Mannam (3):
>    dt-bindings: phy: Add Stingray USB PHY binding document
>    phy: sr-usb: Add Stingray USB PHY driver
>    arm64: dts: Add USB DT nodes for Stingray SoC
>
>   .../bindings/phy/brcm,stingray-usb-phy.txt         |  32 ++
>   .../boot/dts/broadcom/stingray/stingray-usb.dtsi   |  72 ++++
>   .../arm64/boot/dts/broadcom/stingray/stingray.dtsi |   1 +
>   drivers/phy/broadcom/Kconfig                       |  11 +
>   drivers/phy/broadcom/Makefile                      |   1 +
>   drivers/phy/broadcom/phy-bcm-sr-usb.c              | 393 +++++++++++++++++++++
>   6 files changed, 510 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt
>   create mode 100644 arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi
>   create mode 100644 drivers/phy/broadcom/phy-bcm-sr-usb.c
>
