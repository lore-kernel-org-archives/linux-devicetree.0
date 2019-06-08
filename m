From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v7 2/6] usb:common Separated decoding functions from dwc3
 driver.
Date: Sat, 8 Jun 2019 15:40:08 +0200
Message-ID: <20190608134008.GB11489@kroah.com>
References: <1559729030-16390-1-git-send-email-pawell@cadence.com>
 <1559729030-16390-3-git-send-email-pawell@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1559729030-16390-3-git-send-email-pawell@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>
Cc: devicetree@vger.kernel.org, felipe.balbi@linux.intel.com, linux-usb@vger.kernel.org, hdegoede@redhat.com, heikki.krogerus@linux.intel.com, robh+dt@kernel.org, rogerq@ti.com, linux-kernel@vger.kernel.org, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, jpawar@cadence.com, kurahul@cadence.com
List-Id: devicetree@vger.kernel.org

On Wed, Jun 05, 2019 at 11:03:46AM +0100, Pawel Laszczak wrote:
> Patch moves some decoding functions from driver/usb/dwc3/debug.h driver
> to driver/usb/common/debug.c file. These moved functions include:
>     dwc3_decode_get_status
>     dwc3_decode_set_clear_feature
>     dwc3_decode_set_address
>     dwc3_decode_get_set_descriptor
>     dwc3_decode_get_configuration
>     dwc3_decode_set_configuration
>     dwc3_decode_get_intf
>     dwc3_decode_set_intf
>     dwc3_decode_synch_frame
>     dwc3_decode_set_sel
>     dwc3_decode_set_isoch_delay
>     dwc3_decode_ctrl
> 
> These functions are used also in inroduced cdns3 driver.
> 
> All functions prefixes were changed from dwc3 to usb.
> Also, function's parameters has been extended according to the name
> of fields in standard SETUP packet.
> Additionally, patch adds usb_decode_ctrl function to
> include/linux/usb/ch9.h file.i
> 
> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
> ---
>  drivers/usb/common/Makefile |   2 +-
>  drivers/usb/common/debug.c  | 273 ++++++++++++++++++++++++++++++++++++
>  drivers/usb/dwc3/debug.h    | 252 ---------------------------------
>  drivers/usb/dwc3/trace.h    |   2 +-
>  include/linux/usb/ch9.h     |  25 ++++
>  5 files changed, 300 insertions(+), 254 deletions(-)
>  create mode 100644 drivers/usb/common/debug.c
> 
> diff --git a/drivers/usb/common/Makefile b/drivers/usb/common/Makefile
> index 0a7c45e85481..02eb01666289 100644
> --- a/drivers/usb/common/Makefile
> +++ b/drivers/usb/common/Makefile
> @@ -4,7 +4,7 @@
>  #
>  
>  obj-$(CONFIG_USB_COMMON)	  += usb-common.o
> -usb-common-y			  += common.o
> +usb-common-y			  += common.o debug.o
>  usb-common-$(CONFIG_USB_LED_TRIG) += led.o
>  
>  obj-$(CONFIG_USB_OTG_FSM) += usb-otg-fsm.o
> diff --git a/drivers/usb/common/debug.c b/drivers/usb/common/debug.c
> new file mode 100644
> index 000000000000..f7218d794aa6
> --- /dev/null
> +++ b/drivers/usb/common/debug.c
> @@ -0,0 +1,273 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/**
> + * Common USB debugging functions
> + *
> + * Copyright (C) 2010-2011 Texas Instruments Incorporated - http://www.ti.com
> + *
> + * Authors: Felipe Balbi <balbi@ti.com>,
> + *	    Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> + */
> +
> +#ifndef __LINUX_USB_COMMON_DEBUG
> +#define __LINUX_USB_COMMON_DEBUG

Why are you doing thsi in a .c file?

thanks,

greg k-h
