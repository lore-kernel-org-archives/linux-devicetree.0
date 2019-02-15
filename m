From: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: Re: [PATCH v3 0/3] Stingray USB PHY driver support
Date: Fri, 15 Feb 2019 10:00:22 +0530
Message-ID: <CABe79T6BpN1FN5Q=f1TYkFDO-yitR_Zjd1vf669POho-wDQRKw@mail.gmail.com>
References: <1549474347-7224-1-git-send-email-srinath.mannam@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549474347-7224-1-git-send-email-srinath.mannam@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Tejun Heo <tj@kernel.org>, Jayachandran C <jnair@caviumnetworks.com>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

Hi Kishon,

Could you please help to review and provide your comments to this
patch series when you have time?

Regards,
Srinath.

On Wed, Feb 6, 2019 at 11:03 PM Srinath Mannam
<srinath.mannam@broadcom.com> wrote:
>
> These patches add Stingray USB PHY driver and its corresponding
> DT nodes with documentation.
>
> This patch set is based on Linux-5.0-rc2.
>
> Changes from v2:
>   - Addressed Kishon review comments
>   - Updated patchset to Linux-5.0-rc2
>
> Changes from v1:
>   - Addressed Kishon review comments
>   - phy init call return value handle
>
> Srinath Mannam (3):
>   dt-bindings: phy: Add Stingray USB PHY binding document
>   phy: sr-usb: Add Stingray USB PHY driver
>   arm64: dts: Add USB DT nodes for Stingray SoC
>
>  .../bindings/phy/brcm,stingray-usb-phy.txt         |  62 ++++
>  .../boot/dts/broadcom/stingray/stingray-usb.dtsi   |  95 ++++++
>  .../arm64/boot/dts/broadcom/stingray/stingray.dtsi |   1 +
>  drivers/phy/broadcom/Kconfig                       |  11 +
>  drivers/phy/broadcom/Makefile                      |   1 +
>  drivers/phy/broadcom/phy-bcm-sr-usb.c              | 371 +++++++++++++++++++++
>  6 files changed, 541 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt
>  create mode 100644 arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi
>  create mode 100644 drivers/phy/broadcom/phy-bcm-sr-usb.c
>
> --
> 2.7.4
>
