From: "Thang Q. Nguyen" <tqnguyen@apm.com>
Subject: Re: [v2 1/1] usb:host:xhci support option to disable xHCI 1.0 USB2 HW LPM
Date: Mon, 5 Jun 2017 19:57:56 +0700
Message-ID: <CAKrQpSvWLE6Qb_o7XOvtUGOST8TT=vDyV=fUATNa0B3Cx_46-A@mail.gmail.com>
References: <1495265096-14851-1-git-send-email-tqnguyen@apm.com> <59353D0B.1070005@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <59353D0B.1070005@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Phong Vo <pvo@apm.com>, Loc Ho <lho@apm.com>, Duc Tran <dxtran@apm.com>, Quang Han <qhan@apm.com>, Tung Nguyen <tunguyen@apm.com>, patches <patches@apm.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 5, 2017 at 6:14 PM, Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
> On 20.05.2017 10:24, Thang Q. Nguyen wrote:
>>
>> XHCI specification 1.1 does not require xHCI 1.0 compliant controllers
>> to always enable hardware USB2 LPM.
>> However, the current xHCI driver always enable it by setting HLE=1 when
>> seeing HLC=1. This makes certain xHCI controllers that have broken USB2
>> HW LPM fail to work as there is no way to disable this feature.
>> This patch adds support to control disabling USB2 Hardware LPM via
>> DT/ACPI attribute.
>>
>> Signed-off-by: Tung Nguyen <tunguyen@apm.com>
>> Signed-off-by: Thang Q. Nguyen <tqnguyen@apm.com>
>> ---
>> Changes since v1:
>>   - Update DT/ACPI attribute and corresponding codes from HLE to LPM to
>>    be consistent with other attribute names.
>> ---
>>   Documentation/devicetree/bindings/usb/usb-xhci.txt |    1 +
>>   drivers/usb/host/xhci-plat.c                       |    3 +++
>>   drivers/usb/host/xhci.c                            |    7 ++++++-
>>   drivers/usb/host/xhci.h                            |    1 +
>>   4 files changed, 11 insertions(+), 1 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt
>> b/Documentation/devicetree/bindings/usb/usb-xhci.txt
>> index 2d80b60..96f1ac0 100644
>> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
>> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
>> @@ -26,6 +26,7 @@ Required properties:
>>
>>   Optional properties:
>>     - clocks: reference to a clock
>> +  - usb2-lpm-disable: disable USB2 LPM for hardware does not support it
>>     - usb3-lpm-capable: determines if platform is USB3 LPM capable
>>     - quirk-broken-port-ped: set if the controller has broken port disable
>> mechanism
>>
>> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
>> index 7c2a9e7..950eaf0 100644
>> --- a/drivers/usb/host/xhci-plat.c
>> +++ b/drivers/usb/host/xhci-plat.c
>> @@ -267,6 +267,9 @@ static int xhci_plat_probe(struct platform_device
>> *pdev)
>>                 goto disable_clk;
>>         }
>>
>> +       if (device_property_read_bool(&pdev->dev, "usb2-lpm-disable"))
>> +               xhci->quirks |= XHCI_USB2_LPM_DISABLE;
>> +
>>         if (device_property_read_bool(sysdev, "usb3-lpm-capable"))
>>                 xhci->quirks |= XHCI_LPM_SUPPORT;
>>
>> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
>> index 2d13102..47d51d4 100644
>> --- a/drivers/usb/host/xhci.c
>> +++ b/drivers/usb/host/xhci.c
>> @@ -4055,6 +4055,7 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd
>> *hcd,
>>         unsigned long   flags;
>>         int             hird, exit_latency;
>>         int             ret;
>> +       int             usb2_lpm_disable = 0;
>>
>>         if (hcd->speed >= HCD_USB3 || !xhci->hw_lpm_support ||
>>                         !udev->lpm_capable)
>> @@ -4079,7 +4080,11 @@ static int xhci_set_usb2_hardware_lpm(struct
>> usb_hcd *hcd,
>>         xhci_dbg(xhci, "%s port %d USB2 hardware LPM\n",
>>                         enable ? "enable" : "disable", port_num + 1);
>>
>> -       if (enable) {
>> +       /* Check for optional disable USB2 LPM if XHCI 1.0 */
>> +       if ((xhci->quirks & XHCI_USB2_LPM_DISABLE) && (xhci->hci_version
>> == 0x100))
>> +               usb2_lpm_disable = 1;
>> +
>> +       if (enable && !usb2_lpm_disable) {
>
>  Wouldn't it be better to just keep  xhci->hw_lpm_support = 0 if the host
> doesn't support Hardware LPM Capability, (HLC)?
>
> This should prevent all those extra steps getting here just to do nothing.
No, HLC = 0 means the host doesn't support Hardware LPM.
The problem here is the host support Hardware LPM but there is a bug
in host controller that make the LPM fail to work.

When debugging the host controller, we detect there are some holes in
the current usb specifications which can can result in inter-operating
problems between USB Host Controller and USB PHY. To be more specific,
the specs have not clarified the resume recovery timing after the port
has just waken up from L1. This can lead to different interpretations
of the specs by Host Controller and PHY. What happened in our case is
that a Host controller cannot work with a PHY right after resuming
from L1 because these two Vendors have different views of the specs
regarding LPM timing after L1. These views are contradictory and
cannot work together.

If Host Controller and PHY are from the same vendor, they might have
some "internal handshake mechanisms" to avoid these holes of the USB
specs. However, these mechanisms are not standardized in USB specs;
and not all vendors follow these mechanisms. In fact, we have observed
this kind of "internal handshake mechanism" in HOST Controller and PHY
from SYNOPSYS DWC. So, we can say that if users use Host Controller
and PHY from different Vendors, the inteopering problems after waking
up from L1 are more likely to occur.
>
> the quirk check could be done in xhci-mem.c in xhci_add_in_port()
>
> if (temp & XHCI_HLC &&) {
>         xhci_dbg_trace(xhci, trace_xhci_dbg_init,
>                                         "xHCI 1.0: support USB2 hardware
> lpm");
>         xhci->hw_lpm_support = 1;
> }
>
> Sidenote, the only purpose of the HLC bit is to inform the driver that the
> host port
> is HLC (Hardware LPM Capable). No wonder driver sets HW LPM if HLC is set.
>
> The HW LPM can also be disabled (per device) in sysfs if needed.
This does not work. When the issue happens, the USB device is fail to
probe so no /sys interface created. Messages displayed when issue
happen is similar to:

[ 2846.677903] usb 1-1: reset high-speed USB device number 2 using xhci-hcd
[ 2882.037125] usb usb1-port1: Cannot enable. Maybe the USB cable is bad?
or
usb usb3-port1: disabled by hub (EMI?), re-enabling...
[   57.840237] usb 3-1: USB disconnect, device number 5
>
> -Mathias
