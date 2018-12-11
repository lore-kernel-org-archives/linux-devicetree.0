From: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH v1 2/2] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Tue, 11 Dec 2018 11:39:48 +0200
Message-ID: <5C0F85E4.10609@ti.com>
References: <1544445555-17325-1-git-send-email-pawell@cadence.com>
 <1544445555-17325-3-git-send-email-pawell@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544445555-17325-3-git-send-email-pawell@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>, devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, balbi@kernel.org, linux-kernel@vger.kernel.org, adouglas@cadence.com, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, pjez@cadence.com, kurahul@cadence.com
List-Id: devicetree@vger.kernel.org

Pawel,

On 10/12/18 14:39, Pawel Laszczak wrote:
> This patch introduce new Cadence USBSS DRD driver
> to linux kernel.
> 
> The Cadence USBSS DRD Driver is a highly
> configurable IP Core which can be
> instantiated as Dual-Role Device (DRD),
> Peripheral Only and Host Only (XHCI)
> configurations.
> 
> The current driver has been validated with
> FPGA burned. We have support for PCIe
> bus, which is used on FPGA prototyping.
> 
> The host side of USBSS-DRD controller is compliance
> with XHCI specification, so it works with
> standard XHCI linux driver.
> 
> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
> ---
>  drivers/usb/Kconfig                |    2 +
>  drivers/usb/Makefile               |    2 +
>  drivers/usb/cdns3/Kconfig          |   44 +
>  drivers/usb/cdns3/Makefile         |   16 +
>  drivers/usb/cdns3/cdns3-pci-wrap.c |  157 +++
>  drivers/usb/cdns3/core.c           |  451 +++++++
>  drivers/usb/cdns3/core.h           |  108 ++
>  drivers/usb/cdns3/debug.h          |  346 ++++++
>  drivers/usb/cdns3/debugfs.c        |  168 +++
>  drivers/usb/cdns3/drd.c            |  315 +++++
>  drivers/usb/cdns3/drd.h            |  129 ++
>  drivers/usb/cdns3/ep0.c            |  864 +++++++++++++
>  drivers/usb/cdns3/gadget-export.h  |   28 +
>  drivers/usb/cdns3/gadget.c         | 1802 ++++++++++++++++++++++++++++
>  drivers/usb/cdns3/gadget.h         | 1177 ++++++++++++++++++
>  drivers/usb/cdns3/host-export.h    |   28 +
>  drivers/usb/cdns3/host.c           |   74 ++
>  drivers/usb/cdns3/trace.c          |   11 +
>  drivers/usb/cdns3/trace.h          |  343 ++++++

You went to the other extreme of combining everything (host/gadget/drd) together
which again makes this very hard to review.

I think what Felipe meant was to only combine the gadget driver code into one patch.

The series could be split into 6 patches like so.
-dt binding
-pci glue
-core driver
-host driver
-gadget driver
-drd driver

>  19 files changed, 6065 insertions(+)
>  create mode 100644 drivers/usb/cdns3/Kconfig
>  create mode 100644 drivers/usb/cdns3/Makefile
>  create mode 100644 drivers/usb/cdns3/cdns3-pci-wrap.c
>  create mode 100644 drivers/usb/cdns3/core.c
>  create mode 100644 drivers/usb/cdns3/core.h
>  create mode 100644 drivers/usb/cdns3/debug.h
>  create mode 100644 drivers/usb/cdns3/debugfs.c
>  create mode 100644 drivers/usb/cdns3/drd.c
>  create mode 100644 drivers/usb/cdns3/drd.h
>  create mode 100644 drivers/usb/cdns3/ep0.c
>  create mode 100644 drivers/usb/cdns3/gadget-export.h
>  create mode 100644 drivers/usb/cdns3/gadget.c
>  create mode 100644 drivers/usb/cdns3/gadget.h
>  create mode 100644 drivers/usb/cdns3/host-export.h
>  create mode 100644 drivers/usb/cdns3/host.c
>  create mode 100644 drivers/usb/cdns3/trace.c
>  create mode 100644 drivers/usb/cdns3/trace.h
> 
<snip>

cheers,
-roger

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
