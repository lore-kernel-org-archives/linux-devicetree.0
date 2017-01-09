From: "Thang Q. Nguyen" <tqnguyen@apm.com>
Subject: Re: usb:xhci: support disable usb2 LPM Remote Wakeup
Date: Mon, 9 Jan 2017 17:15:08 +0700
Message-ID: <CAKrQpSuz=YmwJCk-OMp3sKwFWxRmLnbfR9vQGdAEwwJbwqvF7g@mail.gmail.com>
References: <1480855321-5047-1-git-send-email-tqnguyen@apm.com>
 <20161209213629.76ixdmr24ln72uaw@rob-hp-laptop> <CAKrQpStd4+ZZjdYyq93zq-wnqQCiQmSi5jJrYbuiZX5kVH74YA@mail.gmail.com>
 <584E9F59.8080303@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <584E9F59.8080303@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Phong Vo <pvo@apm.com>, Loc Ho <lho@apm.com>, patches <patches@apm.com>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 12, 2016 at 8:00 PM, Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
> On 12.12.2016 06:00, Thang Q. Nguyen wrote:
>>
>> On Sat, Dec 10, 2016 at 4:36 AM, Rob Herring <robh@kernel.org> wrote:
>>>
>>> On Sun, Dec 04, 2016 at 07:42:01PM +0700, Thang Q. Nguyen wrote:
>>>>
>>>> From: Thang Nguyen <tqnguyen@apm.com>
>>>>
>>>> As per USB 2.0 link power management addendum ECN, table 1-2, page 4,
>>>> device or host initiated via resume signaling; device-initiated resumes
>>>> can be optionally enabled/disabled by software. This patch adds support
>>>> to control enabling the USB2 RWE feature via DT/ACPI attribute.
>>>>
>>>> Signed-off-by: Vu Nguyen <vnguyen@apm.com>
>>>> Signed-off-by: Thang Nguyen <tqnguyen@apm.com>
>>>> ---
>>>>   Documentation/devicetree/bindings/usb/usb-xhci.txt | 1 +
>>>>   drivers/usb/host/xhci-plat.c                       | 3 +++
>>>>   drivers/usb/host/xhci.c                            | 5 ++++-
>>>>   drivers/usb/host/xhci.h                            | 1 +
>>>>   4 files changed, 9 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt
>>>> b/Documentation/devicetree/bindings/usb/usb-xhci.txt
>>>> index 966885c..9b4cd14 100644
>>>> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
>>>> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
>>>> @@ -25,6 +25,7 @@ Required properties:
>>>>
>>>>   Optional properties:
>>>>     - clocks: reference to a clock
>>>> +  - usb2-rwe-disable: disable USB2 LPM Remote Wakeup capable
>>>
>>>
>>> Remote wakeup has been around since USB 1.0 days. Does this need to be
>>> USB2 or XHCI specific?
>>
>> This is XHCI specific. Per XHCI specification 1.1, remote wakeup is
>> optional for XHCI 1.0 and required for XHCI 1.1. This patch provides
>> ability for software to disable RWE for USB2 in XHCI1.0 controller.
>
>
> I think I understand what's going on.
>
> USB:
>   The good old USB2 suspend is called L2. Device enters it after 3ms if
> there is no link activity.
> If a device can remote wakeup (RWE) it's stated in the descriptor. RWE can
> be turned on
> of off using standard SET/CLEAR Fature requests
>
> The LPM L1 USB2 state again is entered with a LPM extended transaction to
> avoid the
> 3ms wait before powersaving. L1 state is exit can be done with a simialr RWE
> as L2 resume.
> The RWE from L1 can turned on/off using a bit in the LPM extended
> transaction.
>
> XHCI:
>
> Specs say that if the device supports RWE we should enable it for LPM L1
> exit as well.
> This is done by setting the RWE (LPM L1) bit in PORTPMSC register. This bit
> only affect LPM L1 remote
> wake. see 4.23.5.1.1.1
>
> The issue might be that xhci driver never check if the device actually
> supports RWE, we always
> set the PORTPMSC RWE  (for LPM L1) bit.
Yes, we should check if device support Remote Wakeup to enable or
disable RWE as noted in cases 1 (page 265) and 2 (page 266) from
4.23.5.1.1.1.
>
> How about checking something like udev->do_remote_wakeup and setting and
> setting the bit
> based on that.
>
> The function that you are changing,  xhci_set_usb2_hardware_lpm() should
> only be used if
> host has Hardware LPM Cabaility bit (HLC) set for that USB2 port in the
> USB 2.0 xHCI Supported Protocol Capability.
> Host that don't supprt LPM won't have that set. See xhci 7.2.2.1.3.2
When hosts support Hardware LPM (HLC), any problem if we add a DT/ACPI
attribute to support disable it (HLE=0)?
>  -Mathias
>
>
>
>
>
>
>
