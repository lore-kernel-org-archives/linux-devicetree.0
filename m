From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4 2/6] usb:common Separated decoding functions from dwc3
 driver.
Date: Tue, 19 Feb 2019 14:14:02 +0100
Message-ID: <20190219131402.GB20719@kroah.com>
References: <1550173514-23573-1-git-send-email-pawell@cadence.com>
 <1550173514-23573-3-git-send-email-pawell@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1550173514-23573-3-git-send-email-pawell@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>
Cc: devicetree@vger.kernel.org, felipe.balbi@linux.intel.com, mark.rutland@arm.com, linux-usb@vger.kernel.org, hdegoede@redhat.com, heikki.krogerus@linux.intel.com, andy.shevchenko@gmail.com, robh+dt@kernel.org, rogerq@ti.com, linux-kernel@vger.kernel.org, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, kurahul@cadence.com
List-Id: devicetree@vger.kernel.org

On Thu, Feb 14, 2019 at 07:45:10PM +0000, Pawel Laszczak wrote:
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
> include/linux/usb/ch9.h file.
> 
> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
> ---
>  drivers/usb/common/Makefile |   2 +-
>  drivers/usb/common/debug.c  | 270 ++++++++++++++++++++++++++++++++++++
>  drivers/usb/dwc3/debug.h    | 249 ---------------------------------
>  drivers/usb/dwc3/trace.h    |   2 +-
>  include/linux/usb/ch9.h     |  25 ++++
>  5 files changed, 297 insertions(+), 251 deletions(-)
>  create mode 100644 drivers/usb/common/debug.c
> 
> diff --git a/drivers/usb/common/Makefile b/drivers/usb/common/Makefile
> index fb4d5ef4165c..3d3d2962ea4b 100644
> --- a/drivers/usb/common/Makefile
> +++ b/drivers/usb/common/Makefile
> @@ -4,7 +4,7 @@
>  #
>  
>  obj-$(CONFIG_USB_COMMON)	  += usb-common.o
> -usb-common-y			  += common.o
> +usb-common-y			  += common.o debug.o

It's nice to have these in a common place, but you just bloated all of
the USB-enabled systems in the world for the use of 2 odd-ball system
controllers that almost no one has :)

So, any way to only pull in this file if you actually need these
functions?

thanks,

greg k-h
