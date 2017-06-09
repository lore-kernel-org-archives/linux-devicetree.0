From: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v8 0/3] Support for USB DRD PHY driver for NS2
Date: Fri, 9 Jun 2017 16:23:40 +0530
Message-ID: <CAEHZuqO3zquZokENqBLmcn1ZnSCYSYitCXmKrQ-v9HMB0gJrvg@mail.gmail.com>
References: <1496918103-14948-1-git-send-email-raviteja.garimella@broadcom.com>
 <a5344bd7-f7b1-90b5-cce1-d513370103e5@ti.com> <CAEHZuqNwPBgWM9mAeWTTQLQVJYjX8uNuUDRqsD_ZidgaSV9pcA@mail.gmail.com>
 <2f492d5a-9016-f965-8dc2-f669d785ba4d@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2f492d5a-9016-f965-8dc2-f669d785ba4d-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Kishon,

On Fri, Jun 9, 2017 at 2:36 PM, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org> wrote:
> Hi,
>
> On Friday 09 June 2017 02:30 PM, Raviteja Garimella wrote:
>> Hi,
>>
>> On Fri, Jun 9, 2017 at 2:25 PM, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org> wrote:
>>> Hi,
>>>
>>> On Thursday 08 June 2017 04:05 PM, Raviteja Garimella wrote:
>>>> Changes in v8:
>>>> =============
>>>> -Renamed phy shutdown routine
>>>> -Used devm_request_irq in stead of threaded irq
>>>
>>> That's not what I intended. Continue to use threaded irq but remove delayed work.
>>>
>>
>> Yes I get that. We see intermittent connection issues without delayed
>> work. Debounce delay matters there.
>
> All right!
>
> I'm unable to apply the series. Please rebase to linux-phy next (directory
> structure has changed)
>

Ok. They got applied to linux-phy next for me without issues.
I will resend the patchset anyways after rebasing to linux-phy next.

Thanks,
Ravi

> Thanks
> Kishon
>>
>> Thanks,
>> Ravi
>>
>>> Thanks
>>> Kishon
>>>> -Removed devm_unregister calls in probe routine
>>>>
>>>> Changes in v7:
>>>> =============
>>>> Cleaned up unused variables in phy private data structure that's
>>>> missed out in v6.
>>>> Setting of phy mode to device/host is removed from phy power on.
>>>> routine.
>>>>
>>>> Changes in v6:
>>>> =============
>>>> Removed spin locks which are not required as the references
>>>> to phy_ops in the same driver were removed in v5.
>>>>
>>>> Removed host/device 'notify' routines which are registered
>>>> using 'extcon_register_notifier'. The irq handler is sufficient
>>>> to deal with the change in extcon events within the same driver.
>>>>
>>>> Changes in v5:
>>>> =============
>>>> Removed references to phy_ops in the same driver by connect_work
>>>> event handler to change the phy modes.
>>>>
>>>> To support dynamically changing the mode of the phy, it does
>>>> not require doing a phy reset/programming of PHY PLL. Changes
>>>> are made to the connect_work routine to just program the required
>>>> register bits to achieve this purpose.
>>>>
>>>> Changes in v4:
>>>> =============
>>>> Remove references to edev->name in debug prints.
>>>>
>>>> Changes in v3:
>>>> =============
>>>> Remove unnecessary checks for poweron as suggested in review.
>>>>
>>>> Changes in v2:
>>>> =============
>>>> 1. Initialize file operations .owner field with THIS_MODULE.
>>>> 2. Remove unnecessary gpio example in DT bindings documentation.
>>>>    This is previously acked by Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>>>
>>>> Introduction for PATCH v1:
>>>>
>>>> This patch adds support for USB Dual Role Device Phy for Broadcom
>>>> Northstar2 SoC. Apart from the new phy driver, this patchset contains
>>>> changes to Kconfig, Makefile, and Device tree files.
>>>>
>>>> This patchset is tested on Broadcom NS2 BCM958712K reference board.
>>>>
>>>> Repo: https://github.com/Broadcom/arm64-linux.git
>>>> Branch: ns2_drdphy_v8
>>>>
>>>> Raviteja Garimella (3):
>>>>   dt-bindings: phy: Add DT bindings documentation for NS2 USB DRD PHY
>>>>   phy: phy-bcm-ns2-usbdrd: Broadcom USB DRD PHY driver for Northstar2
>>>>   arm64: dts: NS2: Add USB DRD PHY device tree node
>>>>
>>>>  .../devicetree/bindings/phy/brcm,ns2-drd-phy.txt   |  30 ++
>>>>  arch/arm64/boot/dts/broadcom/ns2.dtsi              |  14 +
>>>>  drivers/phy/Kconfig                                |  13 +
>>>>  drivers/phy/Makefile                               |   1 +
>>>>  drivers/phy/phy-bcm-ns2-usbdrd.c                   | 437 +++++++++++++++++++++
>>>>  5 files changed, 495 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/phy/brcm,ns2-drd-phy.txt
>>>>  create mode 100644 drivers/phy/phy-bcm-ns2-usbdrd.c
>>>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
