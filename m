From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 5/5] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Sun, 23 Dec 2018 09:19:35 -0800
Message-ID: <9b55eb76-70d8-a53a-b7d2-985dfe7d6fed@infradead.org>
References: <1545577992-4013-1-git-send-email-pawell@cadence.com>
 <1545577992-4013-6-git-send-email-pawell@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545577992-4013-6-git-send-email-pawell@cadence.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>, devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, mark.rutland@arm.com, linux-usb@vger.kernel.org, hdegoede@redhat.com, heikki.krogerus@linux.intel.com, andy.shevchenko@gmail.com, robh+dt@kernel.org, rogerq@ti.com, linux-kernel@vger.kernel.org, adouglas@cadence.com, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, pjez@cadence.com, kurahul@cadence.com
List-Id: devicetree@vger.kernel.org

Hi,

Here are a few Kconfig text corrections.


On 12/23/18 7:13 AM, Pawel Laszczak wrote:
> diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
> new file mode 100644
> index 000000000000..4adfd87811e8
> --- /dev/null
> +++ b/drivers/usb/cdns3/Kconfig
> @@ -0,0 +1,44 @@
> +config USB_CDNS3
> +	tristate "Cadence USB3 Dual-Role Controller"
> +	depends on USB_SUPPORT && (USB || USB_GADGET) && HAS_DMA
> +	help
> +	  Say Y here if your system has a cadence USB3 dual-role controller.
> +	  It supports: dual-role switch, Host-only, and Peripheral-only.
> +
> +	  If you choose to build this driver is a dynamically linked

	                                     as

> +	  module, the module will be called cdns3.ko.
> +
> +if USB_CDNS3
> +
> +config USB_CDNS3_GADGET
> +        bool "Cadence USB3 device controller"
> +        depends on USB_GADGET
> +        help
> +          Say Y here to enable device controller functionality of the
> +          cadence USBSS-DEV driver.
> +
> +          This controller supports FF, HS and SS mode. It doesn't support
> +          LS and SSP mode

	                mode.

> +
> +config USB_CDNS3_HOST
> +        bool "Cadence USB3 host controller"
> +        depends on USB_XHCI_HCD
> +        help
> +          Say Y here to enable host controller functionality of the
> +          cadence driver.
> +
> +          Host controller is compliance with XHCI so it will use

	                        compliant

> +          standard XHCI driver.
> +
> +config USB_CDNS3_PCI_WRAP
> +	tristate "Cadence USB3 support on PCIe-based platforms"
> +	depends on USB_PCI && ACPI
> +	default USB_CDNS3
> +	help
> +	  If you're using the USBSS Core IP with a PCIe, please say
> +	  'Y' or 'M' here.
> +
> +	  If you choose to build this driver as module it will
> +	  be dynamically linked and module will be called cdns3-pci.ko
> +
> +endif


g'day.
-- 
~Randy
