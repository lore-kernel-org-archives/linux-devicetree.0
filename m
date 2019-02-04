From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 2/6] usb:common Separated decoding functions from dwc3
 driver.
Date: Mon, 4 Feb 2019 12:45:02 +0100
Message-ID: <20190204114502.GA28608@kroah.com>
References: <1548935553-452-1-git-send-email-pawell@cadence.com>
 <1548935553-452-3-git-send-email-pawell@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548935553-452-3-git-send-email-pawell@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>
Cc: devicetree@vger.kernel.org, mark.rutland@arm.com, linux-usb@vger.kernel.org, hdegoede@redhat.com, heikki.krogerus@linux.intel.com, andy.shevchenko@gmail.com, robh+dt@kernel.org, rogerq@ti.com, linux-kernel@vger.kernel.org, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, pjez@cadence.com, kurahul@cadence.com
List-Id: devicetree@vger.kernel.org

On Thu, Jan 31, 2019 at 11:52:29AM +0000, Pawel Laszczak wrote:
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

Ick, why?

> Also, function's parameters has been extended according to the name
> of fields in standard SETUP packet.
> Additionally, patch adds usb_decode_ctrl function to
> include/linux/usb/ch9.h file.

Why ch9.h?  It's not something that is specified in the spec, it's a
usb-specific thing :)

Also, the api for that function is not ok.  If you are going to make
this something that the whole kernel can call, you have to fix it up:

> +/**
> + * usb_decode_ctrl - Returns human readable representation of control request.
> + * @str: buffer to return a human-readable representation of control request.
> + *       This buffer should have about 200 bytes.

"about 200 bytes" is not very specific.

Pass in the length so we know we don't overflow it.

> + * @bRequestType: matches the USB bmRequestType field
> + * @bRequest: matches the USB bRequest field
> + * @wValue: matches the USB wValue field (CPU byte order)
> + * @wIndex: matches the USB wIndex field (CPU byte order)
> + * @wLength: matches the USB wLength field (CPU byte order)
> + *
> + * Function returns decoded, formatted and human-readable description of
> + * control request packet.
> + *
> + * Important: wValue, wIndex, wLength parameters before invoking this function
> + * should be processed by le16_to_cpu macro.
> + */
> +const char *usb_decode_ctrl(char *str, __u8 bRequestType, __u8 bRequest,
> +			    __u16 wValue,  __u16 wIndex, __u16 wLength);

Why are you returning a value, isn't the data stored in str?  Why not
just return an int saying if the call succeeded or not?

thanks,

greg k-h
