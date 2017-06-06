From: "Thang Q. Nguyen" <tqnguyen-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [v2 1/1] usb:host:xhci support option to disable xHCI 1.0 USB2 HW LPM
Date: Tue, 6 Jun 2017 13:33:59 +0700
Message-ID: <CAKrQpSuqFNt5wHMbTOR4nDXXPiHdXv3So7bovos=Hrk_WccmAA@mail.gmail.com>
References: <1495265096-14851-1-git-send-email-tqnguyen@apm.com>
 <59353D0B.1070005@linux.intel.com> <CAKrQpSvWLE6Qb_o7XOvtUGOST8TT=vDyV=fUATNa0B3Cx_46-A@mail.gmail.com>
 <59356BCA.6@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <59356BCA.6-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Mathias Nyman <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Phong Vo <pvo-qTEPVZfXA3Y@public.gmane.org>, Loc Ho <lho-qTEPVZfXA3Y@public.gmane.org>, Duc Tran <dxtran-qTEPVZfXA3Y@public.gmane.org>, Quang Han <qhan-qTEPVZfXA3Y@public.gmane.org>, Tung Nguyen <tunguyen-qTEPVZfXA3Y@public.gmane.org>, patches <patches-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 5, 2017 at 9:33 PM, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
> On 05.06.2017 15:57, Thang Q. Nguyen wrote:
>>
>> On Mon, Jun 5, 2017 at 6:14 PM, Mathias Nyman
>> <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org> wrote:
>>>
>>> On 20.05.2017 10:24, Thang Q. Nguyen wrote:
>>>>
>>>>
>>>> XHCI specification 1.1 does not require xHCI 1.0 compliant controllers
>>>> to always enable hardware USB2 LPM.
>>>> However, the current xHCI driver always enable it by setting HLE=1 when
>>>> seeing HLC=1. This makes certain xHCI controllers that have broken USB2
>>>> HW LPM fail to work as there is no way to disable this feature.
>>>> This patch adds support to control disabling USB2 Hardware LPM via
>>>> DT/ACPI attribute.
>>>>
>>>
>>>   Wouldn't it be better to just keep  xhci->hw_lpm_support = 0 if the
>>> host
>>> doesn't support Hardware LPM Capability, (HLC)?
>>>
>>> This should prevent all those extra steps getting here just to do
>>> nothing.
>>
>> No, HLC = 0 means the host doesn't support Hardware LPM.
>> The problem here is the host support Hardware LPM but there is a bug
>> in host controller that make the LPM fail to work.
>>
>
> So the host support hw LPM, and has its HLC capability bit set,
> but in the end it just doesn't work at all, and should be prevented.
>
>> When debugging the host controller, we detect there are some holes in
>> the current usb specifications which can can result in inter-operating
>> problems between USB Host Controller and USB PHY. To be more specific,
>> the specs have not clarified the resume recovery timing after the port
>> has just waken up from L1. This can lead to different interpretations
>> of the specs by Host Controller and PHY. What happened in our case is
>> that a Host controller cannot work with a PHY right after resuming
>> from L1 because these two Vendors have different views of the specs
>> regarding LPM timing after L1. These views are contradictory and
>> cannot work together.
>>
>> If Host Controller and PHY are from the same vendor, they might have
>> some "internal handshake mechanisms" to avoid these holes of the USB
>> specs. However, these mechanisms are not standardized in USB specs;
>> and not all vendors follow these mechanisms. In fact, we have observed
>> this kind of "internal handshake mechanism" in HOST Controller and PHY
>> from SYNOPSYS DWC. So, we can say that if users use Host Controller
>> and PHY from different Vendors, the inteopering problems after waking
>> up from L1 are more likely to occur.
>
>
> Can you explain the reason why you prefer preventing hw lpm inside the
> xhci_set_usb2_hardware_lpm() function instead of preventing hw lpm usage
> all together for this platform -i.e. by not setting xhci->hw_lpm_support
The reason I don't change in the xhci_add_in_port() function inside
xhci-mem.c is because of the description for xhci->hw_lpm_support in
the drivers/usb/host/xhci.h header file: support xHCI 1.0 spec USB2
hardware LPM. Per my understanding, this attribute is used to indicate
if the host supports HW LPM and this can be checked via HLC.
My intension is to support an option for user to disable the HW LPM
because of some reasons (in my case because HW LPM is broken).
>
>
> Again, something like:
> if (temp & XHCI_HLC && !(xhci->quirks & XHCI_HW_LPM_BROKEN))
>         xhci->hw_lpm_support = 1;
This should work too. But the DT/ACPI attribute should change to
"usb2-lpm-broken".
>
>>> The HW LPM can also be disabled (per device) in sysfs if needed.
>>
>> This does not work. When the issue happens, the USB device is fail to
>> probe so no /sys interface created. Messages displayed when issue
>> happen is similar to:
>>
>> [ 2846.677903] usb 1-1: reset high-speed USB device number 2 using
>> xhci-hcd
>> [ 2882.037125] usb usb1-port1: Cannot enable. Maybe the USB cable is bad?
>> or
>> usb usb3-port1: disabled by hub (EMI?), re-enabling...
>> [   57.840237] usb 3-1: USB disconnect, device number 5
>
>
> Ok, the sysfs entry is not useful in this case.
>
> -Mathias
>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
