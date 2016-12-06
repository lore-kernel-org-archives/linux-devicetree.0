From: "Thang Q. Nguyen" <tqnguyen-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: usb:xhci: support disable usb2 LPM Remote Wakeup
Date: Tue, 6 Dec 2016 13:59:00 +0700
Message-ID: <CAKrQpSvyYKSAXurDkQXkASd9ELOUUEQmd6VF5TOKPkitRTTmOw@mail.gmail.com>
References: <1480855321-5047-1-git-send-email-tqnguyen@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480855321-5047-1-git-send-email-tqnguyen-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thang Nguyen <tqnguyen-qTEPVZfXA3Y@public.gmane.org>, Phong Vo <pvo-qTEPVZfXA3Y@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Vu Nguyen <vnguyen-qTEPVZfXA3Y@public.gmane.org>, patches <patches-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,
Do you have any feedback on this?

Thanks,
Thang Q. Nguyen

On Sun, Dec 4, 2016 at 7:42 PM, Thang Q. Nguyen <tqnguyen-qTEPVZfXA3Y@public.gmane.org> wrote:
> From: Thang Nguyen <tqnguyen-qTEPVZfXA3Y@public.gmane.org>
>
> As per USB 2.0 link power management addendum ECN, table 1-2, page 4,
> device or host initiated via resume signaling; device-initiated resumes
> can be optionally enabled/disabled by software. This patch adds support
> to control enabling the USB2 RWE feature via DT/ACPI attribute.
>
> Signed-off-by: Vu Nguyen <vnguyen-qTEPVZfXA3Y@public.gmane.org>
> Signed-off-by: Thang Nguyen <tqnguyen-qTEPVZfXA3Y@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/usb-xhci.txt | 1 +
>  drivers/usb/host/xhci-plat.c                       | 3 +++
>  drivers/usb/host/xhci.c                            | 5 ++++-
>  drivers/usb/host/xhci.h                            | 1 +
>  4 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> index 966885c..9b4cd14 100644
> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> @@ -25,6 +25,7 @@ Required properties:
>
>  Optional properties:
>    - clocks: reference to a clock
> +  - usb2-rwe-disable: disable USB2 LPM Remote Wakeup capable
>    - usb3-lpm-capable: determines if platform is USB3 LPM capable
>
>  Example:
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index ed56bf9..15c540d 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -220,6 +220,9 @@ static int xhci_plat_probe(struct platform_device *pdev)
>                 goto disable_clk;
>         }
>
> +       if (device_property_read_bool(&pdev->dev, "usb2-rwe-disable"))
> +               xhci->quirks |= XHCI_RWE_DISABLE;
> +
>         if (device_property_read_bool(&pdev->dev, "usb3-lpm-capable"))
>                 xhci->quirks |= XHCI_LPM_SUPPORT;
>
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 1a4ca02..f804868 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -4183,7 +4183,10 @@ int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
>                 }
>
>                 pm_val &= ~PORT_HIRD_MASK;
> -               pm_val |= PORT_HIRD(hird) | PORT_RWE | PORT_L1DS(udev->slot_id);
> +               if ((xhci->quirks & XHCI_RWE_DISABLE) && (xhci->hci_version <= 0x100))
> +                       pm_val |= PORT_HIRD(hird) | PORT_L1DS(udev->slot_id);
> +               else
> +                       pm_val |= PORT_HIRD(hird) | PORT_RWE | PORT_L1DS(udev->slot_id);
>                 writel(pm_val, pm_addr);
>                 pm_val = readl(pm_addr);
>                 pm_val |= PORT_HLE;
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index f945380..2b9bc33 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1656,6 +1656,7 @@ struct xhci_hcd {
>  #define XHCI_SSIC_PORT_UNUSED  (1 << 22)
>  #define XHCI_NO_64BIT_SUPPORT  (1 << 23)
>  #define XHCI_MISSING_CAS       (1 << 24)
> +#define XHCI_RWE_DISABLE       (1 << 25)
>         unsigned int            num_active_eps;
>         unsigned int            limit_active_eps;
>         /* There are two roothubs to keep track of bus suspend info for */
> --
> 2.7.4
>



-- 

Thang Q. Nguyen    | Staff SW Eng.

C: +849.7684.7606 | O: +848.3770.0640

F: +848.3770.0641  | tqnguyen-qTEPVZfXA3Y@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
