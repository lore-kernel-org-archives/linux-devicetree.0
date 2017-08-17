From: "Thang Q. Nguyen" <tqnguyen-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [PATCH v5 1/1] usb:host:xhci support option to disable the xHCI
 USB2 HW LPM
Date: Thu, 17 Aug 2017 10:19:06 +0700
Message-ID: <CAKrQpSt_JuiXPFxTT7ApYFN+6u5AmreJB4PFAGzMRh12FpcnHA@mail.gmail.com>
References: <1502166477-23897-1-git-send-email-tqnguyen@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502166477-23897-1-git-send-email-tqnguyen-qTEPVZfXA3Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thang Nguyen <tqnguyen-qTEPVZfXA3Y@public.gmane.org>, Phong Vo <pvo-qTEPVZfXA3Y@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Tung Nguyen <tunguyen-qTEPVZfXA3Y@public.gmane.org>, patches <patches-qTEPVZfXA3Y@public.gmane.org>, Iyappan Subramanian <isubramanian-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 8, 2017 at 11:27 AM, Thang Q. Nguyen <tqnguyen-qTEPVZfXA3Y@public.gmane.org> wrote:
> XHCI specification 1.1 does not require xHCI-compliant controllers
> to always enable hardware USB2 LPM. However, the current xHCI
> driver always enable it when seeing HLC=1.
> This patch supports an option for users to control disabling
> USB2 Hardware LPM via DT/ACPI attribute.
> This option is needed in case user would like to disable this
> feature. For example, their xHCI controller has its USB2 HW LPM
> broken.
>
> Signed-off-by: Tung Nguyen <tunguyen-qTEPVZfXA3Y@public.gmane.org>
> Signed-off-by: Thang Q. Nguyen <tqnguyen-qTEPVZfXA3Y@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
> Changes since v4:
>  - When HW LPM is optionally disabled, explicitly disable HLE, RWE, ...
>  - Update codes to work with kernel 4.13-rc4
>  - Add Acked-By from Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Changes since v3:
>  - Bypass updating LPM parameters when HW LPM is optionally disabled.
> Changes since v2:
>  - Change code to disable HW LPM as an option for user which
>    is set via ACPI/DT.
> Changes since v1:
>  - Update DT/ACPI attribute and corresponding codes from HLE to LPM to
>    be consistent with other attribute names.
> ---
>  Documentation/devicetree/bindings/usb/usb-xhci.txt |    1 +
>  drivers/usb/host/xhci-plat.c                       |    3 +++
>  drivers/usb/host/xhci.c                            |    2 +-
>  drivers/usb/host/xhci.h                            |    1 +
>  4 files changed, 6 insertions(+), 1 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> index 2d80b60..ae6e484 100644
> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> @@ -26,6 +26,7 @@ Required properties:
>
>  Optional properties:
>    - clocks: reference to a clock
> +  - usb2-lpm-disable: indicate if we don't want to enable USB2 HW LPM
>    - usb3-lpm-capable: determines if platform is USB3 LPM capable
>    - quirk-broken-port-ped: set if the controller has broken port disable mechanism
>
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index c04144b..9028fb5 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -267,6 +267,9 @@ static int xhci_plat_probe(struct platform_device *pdev)
>                 goto disable_clk;
>         }
>
> +       if (device_property_read_bool(sysdev, "usb2-lpm-disable"))
> +               xhci->quirks |= XHCI_HW_LPM_DISABLE;
> +
>         if (device_property_read_bool(sysdev, "usb3-lpm-capable"))
>                 xhci->quirks |= XHCI_LPM_SUPPORT;
>
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index b2ff1ff..3a8e75f 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -4087,7 +4087,7 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
>         xhci_dbg(xhci, "%s port %d USB2 hardware LPM\n",
>                         enable ? "enable" : "disable", port_num + 1);
>
> -       if (enable) {
> +       if (enable && !(xhci->quirks & XHCI_HW_LPM_DISABLE)) {
>                 /* Host supports BESL timeout instead of HIRD */
>                 if (udev->usb2_hw_lpm_besl_capable) {
>                         /* if device doesn't have a preferred BESL value use a
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index e3e9352..5d89c51 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1821,6 +1821,7 @@ struct xhci_hcd {
>  #define XHCI_LIMIT_ENDPOINT_INTERVAL_7 (1 << 26)
>  #define XHCI_U2_DISABLE_WAKE   (1 << 27)
>  #define XHCI_ASMEDIA_MODIFY_FLOWCONTROL        (1 << 28)
> +#define XHCI_HW_LPM_DISABLE    (1 << 29)
>
>         unsigned int            num_active_eps;
>         unsigned int            limit_active_eps;
> --
> 1.7.1
>

Do you have any comments about this patch? Thanks.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
