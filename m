From: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: randconfig build error with next-20140909, in drivers/usb/dwc2/platform.c
Date: Tue, 09 Sep 2014 10:32:11 -0700
Message-ID: <540F399B.4070304@infradead.org>
References: <CA+r1Zhj_jPHoYvGTdqYMpGNfzm9EkvqG-kBE2yTpfJVNK4xygQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+r1Zhj_jPHoYvGTdqYMpGNfzm9EkvqG-kBE2yTpfJVNK4xygQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jim Davis <jim.epost-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/09/14 07:46, Jim Davis wrote:
> Building with the attached random configuration file,
> 
> drivers/usb/dwc2/platform.o: In function `dwc2_platform_driver_init':
> platform.c:(.init.text+0x0): multiple definition of `init_module'
> drivers/usb/dwc2/gadget.o:gadget.c:(.init.text+0x0): first defined here
> drivers/usb/dwc2/platform.o: In function `dwc2_platform_driver_exit':
> platform.c:(.exit.text+0x0): multiple definition of `cleanup_module'
> drivers/usb/dwc2/gadget.o:gadget.c:(.exit.text+0x0): first defined here
> make[3]: *** [drivers/usb/dwc2/dwc2.o] Error 1
> 

There are other issues as well.

1.  On i386, with these configs:

CONFIG_USB_DWC2=m
# CONFIG_USB_DWC2_HOST is not set

#
# Gadget mode requires USB Gadget support to be enabled
#
CONFIG_USB_DWC2_PERIPHERAL=y
# CONFIG_USB_DWC2_DUAL_ROLE is not set
CONFIG_USB_DWC2_DEBUG=y
CONFIG_USB_DWC2_VERBOSE=y
# CONFIG_USB_DWC2_TRACK_MISSED_SOFS is not set
# CONFIG_USB_DWC2_DEBUG_PERIODIC is not set

ERROR: "dwc2_hcd_get_frame_number" [drivers/usb/dwc2/dwc2.ko] undefined!
ERROR: "dwc2_hcd_disconnect" [drivers/usb/dwc2/dwc2.ko] undefined!
ERROR: "dwc2_hcd_start" [drivers/usb/dwc2/dwc2.ko] undefined!

2.  on x86_64, with these configs:

CONFIG_USB_DWC2=y
# CONFIG_USB_DWC2_HOST is not set

#
# Gadget mode requires USB Gadget support to be enabled
#
CONFIG_USB_DWC2_PERIPHERAL=y
# CONFIG_USB_DWC2_DUAL_ROLE is not set
CONFIG_USB_DWC2_PLATFORM=y
CONFIG_USB_DWC2_DEBUG=y
CONFIG_USB_DWC2_VERBOSE=y
CONFIG_USB_DWC2_TRACK_MISSED_SOFS=y
# CONFIG_USB_DWC2_DEBUG_PERIODIC is not set

drivers/built-in.o: In function `dwc2_hc_set_even_odd_frame':
core.c:(.text+0x1aff55): undefined reference to `dwc2_hcd_get_frame_number'
drivers/built-in.o: In function `dwc2_handle_common_intr':
(.text+0x1b3a48): undefined reference to `dwc2_hcd_start'
drivers/built-in.o: In function `dwc2_handle_common_intr':
(.text+0x1b3b05): undefined reference to `dwc2_hcd_disconnect'
drivers/built-in.o: In function `dwc2_handle_common_intr':
(.text+0x1b3b38): undefined reference to `dwc2_hcd_start'
drivers/built-in.o: In function `dwc2_handle_common_intr':
(.text+0x1b3e38): undefined reference to `dwc2_hcd_start'
drivers/built-in.o: In function `dwc2_driver_remove':
platform.c:(.text+0x1b7b35): undefined reference to `dwc2_hcd_remove'
drivers/built-in.o: In function `dwc2_driver_probe':
platform.c:(.text+0x1b7b72): undefined reference to `dwc2_set_all_params'
platform.c:(.text+0x1b7c66): undefined reference to `dwc2_hcd_init'



-- 
~Randy
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
