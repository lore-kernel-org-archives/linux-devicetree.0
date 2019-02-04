From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 5/6] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Mon, 4 Feb 2019 12:48:41 +0100
Message-ID: <20190204114841.GD28608@kroah.com>
References: <1548935553-452-1-git-send-email-pawell@cadence.com>
 <1548935553-452-6-git-send-email-pawell@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548935553-452-6-git-send-email-pawell@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>
Cc: devicetree@vger.kernel.org, mark.rutland@arm.com, linux-usb@vger.kernel.org, hdegoede@redhat.com, heikki.krogerus@linux.intel.com, andy.shevchenko@gmail.com, robh+dt@kernel.org, rogerq@ti.com, linux-kernel@vger.kernel.org, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, pjez@cadence.com, kurahul@cadence.com
List-Id: devicetree@vger.kernel.org

On Thu, Jan 31, 2019 at 11:52:32AM +0000, Pawel Laszczak wrote:
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

Please line-wrap this properly at 72 columns, like your editor asks you
to when you run git :)

> 
> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
> ---
>  drivers/usb/Kconfig                |    2 +
>  drivers/usb/Makefile               |    2 +
>  drivers/usb/cdns3/Kconfig          |   44 +
>  drivers/usb/cdns3/Makefile         |   14 +
>  drivers/usb/cdns3/cdns3-pci-wrap.c |  155 +++
>  drivers/usb/cdns3/core.c           |  403 ++++++
>  drivers/usb/cdns3/core.h           |  116 ++
>  drivers/usb/cdns3/debug.h          |  168 +++
>  drivers/usb/cdns3/debugfs.c        |  164 +++
>  drivers/usb/cdns3/drd.c            |  365 +++++
>  drivers/usb/cdns3/drd.h            |  162 +++
>  drivers/usb/cdns3/ep0.c            |  907 +++++++++++++
>  drivers/usb/cdns3/gadget-export.h  |   28 +
>  drivers/usb/cdns3/gadget.c         | 1985 ++++++++++++++++++++++++++++
>  drivers/usb/cdns3/gadget.h         | 1207 +++++++++++++++++
>  drivers/usb/cdns3/host-export.h    |   28 +
>  drivers/usb/cdns3/host.c           |   72 +
>  drivers/usb/cdns3/trace.c          |   23 +
>  drivers/usb/cdns3/trace.h          |  404 ++++++
>  19 files changed, 6249 insertions(+)
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

This is way too big to try to review all at once.  You need to break
this up into logical chunks, each one adding a single functionality to
make it possible to actually review it.

thanks,

greg k-h
