From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/2] dt/bindings/usb: Add bindings for PIC32 MUSB
 driver.
Date: Thu, 7 Apr 2016 16:34:09 +0300
Message-ID: <570661D1.60808@cogentembedded.com>
References: <460027775-20729-2-git-send-email-purna.mandal@microchip.com>
 <1460032381-32677-1-git-send-email-purna.mandal@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460032381-32677-1-git-send-email-purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Purna Chandra Mandal <purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Joshua Henderson <digitalpeer-icZdIMMiY0PM6KjX8ROVJw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 4/7/2016 3:32 PM, Purna Chandra Mandal wrote:

> Document devicetree binding for the USB controller
> and USB Phy found on Microchip PIC32 class devices.
>
> Signed-off-by: Purna Chandra Mandal <purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
>
> ---
>
> Changes in v2: None
>
>   .../bindings/usb/microchip,pic32-musb.txt          | 67 ++++++++++++++++++++++
>   1 file changed, 67 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/usb/microchip,pic32-musb.txt
>
> diff --git a/Documentation/devicetree/bindings/usb/microchip,pic32-musb.txt b/Documentation/devicetree/bindings/usb/microchip,pic32-musb.txt
> new file mode 100644
> index 0000000..e1cec9d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/microchip,pic32-musb.txt
> @@ -0,0 +1,67 @@
> +Microchip PIC32 MUSB DRC/OTG controller
> +-------------------------------------------
> +
> +Required properties:
> + - compatible       : should be "microchip,pic32mzda-usb".
> + - reg              : offset and length of "MUSB Core Registers" and
> +                      "USB Clock & Reset Registers".
> + - reg-names        : should be "mc", and "usbcr" in order
> + - clocks           : clock specifier for the musb controller clock
> + - clock-names      : should be "usb_clk"
> + - interrupts       : interrupt number for MUSB Core General interrupt
> +                      and DMA interrupt
> + - interrupt-names  : must be "mc" and "dma" in order.
> + - phys             : phy specifier for the otg phy.
> + - dr_mode          : should be one of "host", "peripheral" or "otg".
> + - mentor,multipoint: Should be "1" indicating the musb controller supports
> +                      multipoint. This is MUSB configuration-specific setting.
> + - mentor,num-eps   : Specifies the number of endpoints. This is also a
> +                      MUSB configuration-specific setting. Should be set to "8".
> + - mentor,ram-bits  : Specifies the ram address size. Should be set to "11".
> + - mentor,power     : Should be "500". This signifies the controller can supply
> +                      up to 500mA when operating in host mode.
> + - phys             : phandle of the USB phy.

    Just noticed that "phys" is described twice. :-/

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
