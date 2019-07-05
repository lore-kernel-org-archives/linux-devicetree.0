From: Felipe Balbi <felipe.balbi@linux.intel.com>
Subject: Re: [PATCH v9 2/6] usb:gadget Separated decoding functions from dwc3 driver.
Date: Fri, 05 Jul 2019 14:39:24 +0300
Message-ID: <87tvc0lngz.fsf@linux.intel.com>
References: <1562324238-16655-1-git-send-email-pawell@cadence.com> <1562324238-16655-3-git-send-email-pawell@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1562324238-16655-3-git-send-email-pawell@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, hdegoede@redhat.com, heikki.krogerus@linux.intel.com, robh+dt@kernel.org, rogerq@ti.com, linux-kernel@vger.kernel.org, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, jpawar@cadence.com, kurahul@cadence.com, Pawel Laszczak <pawell@cadence.com>
List-Id: devicetree@vger.kernel.org


Hi,

Pawel Laszczak <pawell@cadence.com> writes:
> diff --git a/include/linux/usb/ch9.h b/include/linux/usb/ch9.h
> index da82606be605..d388a3a5ab7e 100644
> --- a/include/linux/usb/ch9.h
> +++ b/include/linux/usb/ch9.h
> @@ -70,4 +70,29 @@ extern enum usb_device_speed usb_get_maximum_speed(struct device *dev);
>   */
>  extern const char *usb_state_string(enum usb_device_state state);
>  
> +/**
> + * usb_decode_ctrl - Returns human readable representation of control request.
> + * @str: buffer to return a human-readable representation of control request.
> + *       This buffer should have about 200 bytes.
> + * @size: size of str buffer.
> + * @bRequestType: matches the USB bmRequestType field
> + * @bRequest: matches the USB bRequest field
> + * @wValue: matches the USB wValue field (CPU byte order)
> + * @wIndex: matches the USB wIndex field (CPU byte order)
> + * @wLength: matches the USB wLength field (CPU byte order)
> + *
> + * Function returns decoded, formatted and human-readable description of
> + * control request packet.
> + *
> + * The usage scenario for this is for tracepoints, so function as a return
> + * use the same value as in parameters. This approach allows to use this
> + * function in TP_printk
> + *
> + * Important: wValue, wIndex, wLength parameters before invoking this function
> + * should be processed by le16_to_cpu macro.
> + */
> +extern const char *usb_decode_ctrl(char *str, size_t size, __u8 bRequestType,
> +				   __u8 bRequest, __u16 wValue, __u16 wIndex,
> +				   __u16 wLength);
> +

where's the stub when !TRACING?

-- 
balbi
