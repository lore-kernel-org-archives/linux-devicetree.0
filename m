From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [v2 1/1] usb:host:xhci support option to disable xHCI 1.0 USB2 HW
 LPM
Date: Mon, 5 Jun 2017 14:14:19 +0300
Message-ID: <59353D0B.1070005@linux.intel.com>
References: <1495265096-14851-1-git-send-email-tqnguyen@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1495265096-14851-1-git-send-email-tqnguyen@apm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Thang Q. Nguyen" <tqnguyen@apm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Phong Vo <pvo@apm.com>, Loc Ho <lho@apm.com>, Duc Tran <dxtran@apm.com>, Quang Han <qhan@apm.com>, Tung Nguyen <tunguyen@apm.com>, patches@apm.com
List-Id: devicetree@vger.kernel.org

On 20.05.2017 10:24, Thang Q. Nguyen wrote:
> XHCI specification 1.1 does not require xHCI 1.0 compliant controllers
> to always enable hardware USB2 LPM.
> However, the current xHCI driver always enable it by setting HLE=1 when
> seeing HLC=1. This makes certain xHCI controllers that have broken USB2
> HW LPM fail to work as there is no way to disable this feature.
> This patch adds support to control disabling USB2 Hardware LPM via
> DT/ACPI attribute.
>
> Signed-off-by: Tung Nguyen <tunguyen@apm.com>
> Signed-off-by: Thang Q. Nguyen <tqnguyen@apm.com>
> ---
> Changes since v1:
>   - Update DT/ACPI attribute and corresponding codes from HLE to LPM to
>    be consistent with other attribute names.
> ---
>   Documentation/devicetree/bindings/usb/usb-xhci.txt |    1 +
>   drivers/usb/host/xhci-plat.c                       |    3 +++
>   drivers/usb/host/xhci.c                            |    7 ++++++-
>   drivers/usb/host/xhci.h                            |    1 +
>   4 files changed, 11 insertions(+), 1 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> index 2d80b60..96f1ac0 100644
> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> @@ -26,6 +26,7 @@ Required properties:
>
>   Optional properties:
>     - clocks: reference to a clock
> +  - usb2-lpm-disable: disable USB2 LPM for hardware does not support it
>     - usb3-lpm-capable: determines if platform is USB3 LPM capable
>     - quirk-broken-port-ped: set if the controller has broken port disable mechanism
>
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index 7c2a9e7..950eaf0 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -267,6 +267,9 @@ static int xhci_plat_probe(struct platform_device *pdev)
>   		goto disable_clk;
>   	}
>
> +	if (device_property_read_bool(&pdev->dev, "usb2-lpm-disable"))
> +		xhci->quirks |= XHCI_USB2_LPM_DISABLE;
> +
>   	if (device_property_read_bool(sysdev, "usb3-lpm-capable"))
>   		xhci->quirks |= XHCI_LPM_SUPPORT;
>
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 2d13102..47d51d4 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -4055,6 +4055,7 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
>   	unsigned long	flags;
>   	int		hird, exit_latency;
>   	int		ret;
> +	int		usb2_lpm_disable = 0;
>
>   	if (hcd->speed >= HCD_USB3 || !xhci->hw_lpm_support ||
>   			!udev->lpm_capable)
> @@ -4079,7 +4080,11 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
>   	xhci_dbg(xhci, "%s port %d USB2 hardware LPM\n",
>   			enable ? "enable" : "disable", port_num + 1);
>
> -	if (enable) {
> +	/* Check for optional disable USB2 LPM if XHCI 1.0 */
> +	if ((xhci->quirks & XHCI_USB2_LPM_DISABLE) && (xhci->hci_version == 0x100))
> +		usb2_lpm_disable = 1;
> +
> +	if (enable && !usb2_lpm_disable) {
  
Wouldn't it be better to just keep  xhci->hw_lpm_support = 0 if the host
doesn't support Hardware LPM Capability, (HLC)?

This should prevent all those extra steps getting here just to do nothing.

the quirk check could be done in xhci-mem.c in xhci_add_in_port()

if (temp & XHCI_HLC &&) {
         xhci_dbg_trace(xhci, trace_xhci_dbg_init,
	                                "xHCI 1.0: support USB2 hardware lpm");
         xhci->hw_lpm_support = 1;
}

Sidenote, the only purpose of the HLC bit is to inform the driver that the host port
is HLC (Hardware LPM Capable). No wonder driver sets HW LPM if HLC is set.

The HW LPM can also be disabled (per device) in sysfs if needed.

-Mathias   
