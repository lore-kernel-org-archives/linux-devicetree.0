From: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: Re: [PATCH v2 0/4] Reset xHCI port PHY on disconnect
Date: Tue, 3 Sep 2019 20:29:35 +0530
Message-ID: <CABe79T7=Kat6DjUDmOvfA79Ex0tzuU7ov4aoZodbeB=UO8DOZg@mail.gmail.com>
References: <1564568395-9980-1-git-send-email-srinath.mannam@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564568395-9980-1-git-send-email-srinath.mannam@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>
Cc: Linux USB List <linux-usb@vger.kernel.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
List-Id: devicetree@vger.kernel.org

Hi Mathias,

Could you please help to review this patch series?

Regards,
Srinath.

On Wed, Jul 31, 2019 at 3:50 PM Srinath Mannam
<srinath.mannam@broadcom.com> wrote:
>
> This patch set adds a quirk in xHCI driver to reset PHY of xHCI port on
> its disconnect event.
>
> This patch set is based on Linux-5.2-rc4.
>
> Changes from v1:
>   - Addressed Mathias's comments
>     - Modified mapping of HC ports and their corresponding PHYs
>   - Addressed Rob's comments
>     - Removed usb-phy-port-reset DT property.
>     - Added quirk in platform data using HCI compatible string.
>   - Add phy ports in phy attr structure to have enabled ports bitmask.
>   - Modified #phy-cells of sr-phy to pass phy ports bitmask.
>
> Srinath Mannam (4):
>   phy: Add phy ports in attrs
>   dt-bindings: phy: Modify Stingray USB PHY #phy-cells
>   phy: sr-usb: Set phy ports
>   dt-bindings: usb-xhci: Add platform specific compatible for Stingray
>     xHCI
>   drivers: xhci: Add quirk to reset xHCI port PHY
>
>  .../devicetree/bindings/phy/brcm,stingray-usb-phy.txt | 14 ++++++++------
>  Documentation/devicetree/bindings/usb/usb-xhci.txt    |  1 +
>  drivers/phy/broadcom/phy-bcm-sr-usb.c                 |  9 ++++++++-
>  drivers/usb/core/hcd.c                                |  6 ++++++
>  drivers/usb/core/phy.c                                | 19 +++++++++++++++++++
>  drivers/usb/core/phy.h                                |  1 +
>  drivers/usb/host/xhci-plat.c                          | 10 ++++++++++
>  drivers/usb/host/xhci-plat.h                          |  1 +
>  drivers/usb/host/xhci-ring.c                          |  9 ++++++---
>  drivers/usb/host/xhci.h                               |  1 +
>  include/linux/phy/phy.h                               | 10 ++++++++++
>  include/linux/usb/hcd.h                               |  1 +
>  12 files changed, 72 insertions(+), 10 deletions(-)
>
> --
> 2.7.4
>
