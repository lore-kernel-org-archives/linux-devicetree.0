From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [v2 1/1] usb:host:xhci support option to disable xHCI 1.0 USB2 HW
 LPM
Date: Tue, 13 Jun 2017 16:12:28 +0300
Message-ID: <593FE4BC.4020709@linux.intel.com>
References: <1495265096-14851-1-git-send-email-tqnguyen@apm.com>
 <59353D0B.1070005@linux.intel.com>
 <CAKrQpSvWLE6Qb_o7XOvtUGOST8TT=vDyV=fUATNa0B3Cx_46-A@mail.gmail.com>
 <59356BCA.6@intel.com>
 <CAKrQpSuqFNt5wHMbTOR4nDXXPiHdXv3So7bovos=Hrk_WccmAA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKrQpSuqFNt5wHMbTOR4nDXXPiHdXv3So7bovos=Hrk_WccmAA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Thang Q. Nguyen" <tqnguyen@apm.com>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Phong Vo <pvo@apm.com>, Loc Ho <lho@apm.com>, Duc Tran <dxtran@apm.com>, Quang Han <qhan@apm.com>, Tung Nguyen <tunguyen@apm.com>, patches <patches@apm.com>
List-Id: devicetree@vger.kernel.org

On 06.06.2017 09:33, Thang Q. Nguyen wrote:
> On Mon, Jun 5, 2017 at 9:33 PM, Mathias Nyman <mathias.nyman@intel.com> wrote:
>> On 05.06.2017 15:57, Thang Q. Nguyen wrote:
>>>
>>> On Mon, Jun 5, 2017 at 6:14 PM, Mathias Nyman
>>> <mathias.nyman@linux.intel.com> wrote:
>>>>
>>>> On 20.05.2017 10:24, Thang Q. Nguyen wrote:
>>>>>
>>>>>
>>>>> XHCI specification 1.1 does not require xHCI 1.0 compliant controllers
>>>>> to always enable hardware USB2 LPM.
>>>>> However, the current xHCI driver always enable it by setting HLE=1 when
>>>>> seeing HLC=1. This makes certain xHCI controllers that have broken USB2
>>>>> HW LPM fail to work as there is no way to disable this feature.
>>>>> This patch adds support to control disabling USB2 Hardware LPM via
>>>>> DT/ACPI attribute.
>>>>>
>>>>
>>>>    Wouldn't it be better to just keep  xhci->hw_lpm_support = 0 if the
>>>> host
>>>> doesn't support Hardware LPM Capability, (HLC)?
>>>>
>>>> This should prevent all those extra steps getting here just to do
>>>> nothing.
>>>
>>> No, HLC = 0 means the host doesn't support Hardware LPM.
>>> The problem here is the host support Hardware LPM but there is a bug
>>> in host controller that make the LPM fail to work.
>>>
>>
>> So the host support hw LPM, and has its HLC capability bit set,
>> but in the end it just doesn't work at all, and should be prevented.
>>
>>> When debugging the host controller, we detect there are some holes in
>>> the current usb specifications which can can result in inter-operating
>>> problems between USB Host Controller and USB PHY. To be more specific,
>>> the specs have not clarified the resume recovery timing after the port
>>> has just waken up from L1. This can lead to different interpretations
>>> of the specs by Host Controller and PHY. What happened in our case is
>>> that a Host controller cannot work with a PHY right after resuming
>>> from L1 because these two Vendors have different views of the specs
>>> regarding LPM timing after L1. These views are contradictory and
>>> cannot work together.
>>>
>>> If Host Controller and PHY are from the same vendor, they might have
>>> some "internal handshake mechanisms" to avoid these holes of the USB
>>> specs. However, these mechanisms are not standardized in USB specs;
>>> and not all vendors follow these mechanisms. In fact, we have observed
>>> this kind of "internal handshake mechanism" in HOST Controller and PHY
>>> from SYNOPSYS DWC. So, we can say that if users use Host Controller
>>> and PHY from different Vendors, the inteopering problems after waking
>>> up from L1 are more likely to occur.
>>
>>
>> Can you explain the reason why you prefer preventing hw lpm inside the
>> xhci_set_usb2_hardware_lpm() function instead of preventing hw lpm usage
>> all together for this platform -i.e. by not setting xhci->hw_lpm_support
> The reason I don't change in the xhci_add_in_port() function inside
> xhci-mem.c is because of the description for xhci->hw_lpm_support in
> the drivers/usb/host/xhci.h header file: support xHCI 1.0 spec USB2
> hardware LPM. Per my understanding, this attribute is used to indicate
> if the host supports HW LPM and this can be checked via HLC.
> My intension is to support an option for user to disable the HW LPM
> because of some reasons (in my case because HW LPM is broken).

I think we should keep supporting new options separate from workarounds
for broken HW.

>>
>>
>> Again, something like:
>> if (temp & XHCI_HLC && !(xhci->quirks & XHCI_HW_LPM_BROKEN))
>>          xhci->hw_lpm_support = 1;
> This should work too. But the DT/ACPI attribute should change to
> "usb2-lpm-broken".

This would be more clear for future developers and prevent them from
enabling hw lpm for this host to gain some powersaving.

A new feature allowing optional host hw lpm disabling can then be written separately,
preferable without using the quirk bits.

-Mathias
