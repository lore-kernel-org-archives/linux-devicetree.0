From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v4] extcon: Palmas Extcon Driver
Date: Tue, 07 May 2013 16:05:34 +0900
Message-ID: <5188A7BE.4080509@samsung.com>
References: <1362662506-14823-4-git-send-email-kishon@ti.com>
 <1367846225-15685-1-git-send-email-kishon@ti.com>
 <51889AD9.9030902@samsung.com> <51889E55.8090306@ti.com>
 <5188A5EC.8020705@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <5188A5EC.8020705@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: myungjoo.ham@samsung.com, balbi@ti.com, ldewangan@nvidia.com, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, grant.likely@linaro.org, rob.herring@calxeda.com, rob@landley.net, gg@slimlogic.co.uk, ruchika@ti.com, tony@atomide.com, sameo@linux.intel.com, broonie@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On 05/07/2013 03:57 PM, Chanwoo Choi wrote:
> diff --git a/include/linux/extcon/extcon_palmas.h b/include/linux/extcon/extcon_palmas.h
> new file mode 100644
> index 0000000..a5119c9
> --- /dev/null
> +++ b/include/linux/extcon/extcon_palmas.h
> @@ -0,0 +1,26 @@
> +/*
> + * extcon_palmas.h - palmas extcon driver to detect VBUS or ID events
> + *
> + * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * Author: Kishon Vijay Abraham I <kishon@ti.com>
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +#ifndef __EXTCON_PALMAS_H__
> +#define __EXTCON_PALMAS_H__
> +
> +#define    PALMAS_USB_STATE_DISCONNECT    0x0
> +#define    PALMAS_USB_STATE_VBUS        BIT(0)
> +#define    PALMAS_USB_STATE_ID        BIT(1)
> +
>>> The defined variable in extcon_palmas.h is used only on extcon-palmas.c.
>>> So, I would like to move definition from extcon_palmas.h to extcon-palmas.c
>>> and remove extcon_palmas.h header file.
>> Actually it has to be used in dwc3-omap.c (that was in a different patch).
>>
> Should detect the state of USB/USB-HOST on dwc3-omap driver?
>
> If yes, dwc3-omap driver can immediately detect the changed state of USB/USB-HOST
> by using excon_register_interest() function which is defined in extcon-class.c
>
> I explain simple usage of extcon_register_interest()
> to receive newly state of USB cable on dwc3-omap driver.
> -----------
>     struct extcon_specific_cable_nb extcon_notifier
>     struct notifier_block extcon_notifier;
>
>      /* ... */
>
>     extcon_notifier.notifier_call = omap_extcon_notifier;
>     ret = extcon_register_interest(&extcon_dev, "USB", &extcon_notifier);
    Fix usage of extcon_register_interest() as following:

    ret = extcon_register_interest(&extcon_dev, NULL, "USB", &extcon_notifier); or
    ret = extcon_register_interest(&extcon_dev, "palmas-usb", "USB", &extcon_notifier);
>     /* ... */
>
>     int omap_extcon_notifier(struct notifier_block *self,
>                                                 unsigned long event, void *ptr)
>     {
>             int usb_state;
>
>             usb_state = event;                                   
>
>             /* if usb_state is 1, PALMAS_USB_STATE_VBUS  */
>             /* if usb_state is 0, PALMAS_USB_STATE_DISCONNECT */
>
>             /* TODO */
>
>     }
> -----------
>
> If dwc3-omap driver use extcon_register_interest(), following defined variables
> are able to be removed.
>     PALMAS_USB_STATE_DISCONNECT
>     PALMAS_USB_STATE_VBUS
>     PALMAS_USB_STATE_ID
>
> Thanks,
> Chanwoo Choi
>
