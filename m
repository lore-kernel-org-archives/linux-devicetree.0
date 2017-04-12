From: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v4 2/3] Broadcom USB DRD Phy driver for Northstar2
Date: Wed, 12 Apr 2017 12:24:28 +0530
Message-ID: <CAEHZuqPMY+XKUDYK32-FGc9N=e_zsrexPo6nrLvFRE8QoVugMg@mail.gmail.com>
References: <1490704052-11314-1-git-send-email-raviteja.garimella@broadcom.com>
 <1490704052-11314-3-git-send-email-raviteja.garimella@broadcom.com>
 <8aa2cc42-6fdc-5574-4449-f05f6d5cbd38@ti.com> <CAEHZuqMpHMDMVL6XMxrSPC3zeXZ=-Wx=xTSON_CruXnVC5PsdA@mail.gmail.com>
 <5f6d688b-7bbc-7b3c-2be8-fcea7853aae3@ti.com> <CAEHZuqM7YUxtN9F+5qqZ6HHBqLP0DuwotQv9ZyaN5UtrsN7j5A@mail.gmail.com>
 <1727318a-7ef8-1ea7-a657-241bbc96bc89@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1727318a-7ef8-1ea7-a657-241bbc96bc89-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, BCM Kernel Feedback <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Apr 10, 2017 at 2:07 PM, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org> wrote:
> Hi,
>
> On Wednesday 05 April 2017 07:40 PM, Raviteja Garimella wrote:
>> Hi Kishon,
>>
>> On Wed, Apr 5, 2017 at 7:04 PM, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org> wrote:
>>> Hi Ravi,
>>>
>>> On Wednesday 05 April 2017 06:30 PM, Raviteja Garimella wrote:
>>>> Hi Kishon,
>>>>
>>>> On Wed, Apr 5, 2017 at 4:30 PM, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org> wrote:
>>>>> Hi,
>>>>>
>>>>> On Tuesday 28 March 2017 05:57 PM, Raviteja Garimella wrote:
>>>>>> This is driver for USB DRD Phy used in Broadcom's Northstar2
>>>>>> SoC. The phy can be configured to be in Device mode or Host
>>>>>> mode based on the type of cable connected to the port. The
>>>>>> driver registers to  extcon framework to get appropriate
>>>>>> connect events for Host/Device cables connect/disconnect
>>>>>> states based on VBUS and ID interrupts.
>>>>>
>>>>> $patch should be phy: phy-bcm-ns2-usbdrd: USB DRD Phy driver for Broadcoms
>>>>> Northstar2.
>>>>>
>>>>
>>>> Will do.
>>>>
>>>>> Sorry for not letting you know this earlier. But I feel the design of the
>>>>> driver should be changed. Extcon shouldn't be used here. The extcon
>>>>> notifications should be sent to the consumer driver and the consumer driver
>>>>> should be responsible for invoking the phy ops.
>>>>>
>>>>
>>>> The consumer drivers here would be a UDC driver (USB device
>>>> controller), EHCI and OHCI host controller drivers.
>>>> I was already suggested in UDC driver review to deal with extcon in Phy driver.
>>>>
>>>> This phy connects to 2 host controllers, and one device controller.
>>>> That's the design in Broadcom Northstar2
>>>> platform. The values of the VBUS and ID pins of this port are
>>>> determined based on the type of the cable (device cable
>>>> or host cable). And. phy has to be configured accordingly.
>>>>
>>>>> The phy ops being invoked during extcon events doesn't look right.
>>>>
>>>> Could you please elaborate on the concern, so that we can think of
>>>> mitigating those issues in this driver?
>>>> Since we are dealing with phy init/shutdown in this driver itself, are
>>>> you okay with moving the extcon handling code
>>>> out of phy ops ?
>>>
>>> yeah, For e.g., ns2_drd_phy_init is part of phy_ops and is being invoked from
>>> extcon events too. Can a phy which is initialized by a phy consumer (say your
>>> UDC invokes phy_init) can be shutdown by an extcon event?
>>>
>>> Maybe a clear explanation of when phy_ops here will be invoked and when it will
>>> set using extcon events might help.
>>>
>>
>> Say, we have a USB pendrive which is connected to the DRD port through
>> a host cable.
>> Now the PHY will be initialized to be in host mode.
>> When the pendrive is unplugged, and we now connect the NS2 device to
>> some linux PC,
>> now the PHY has to be shutdown, and re-initialized to be in Device mode.
>>
>> On unplug event, it is set neither to Host nor Device mode (basically
>> shutdown). Next time which ever cable is connected, the PHY is
>> initialized to the respective
>> mode.
>>
>> Please let me know if it's fine to do these initializations outside
>> phy ops, because those will
>> be irrelevant for phy consumers (the controllers) as it's anyways
>> dealt in the phy driver through
>> extcon.
>
> Yes. We shouldn't add phy_ops just for the sake of it. I think this should be
> made as a purely extcon driver (though there are a couple of bits that looks
> like initializing PHY) and keep it in drivers/extcon.
>

Actually phy_ops would be required when we want phy to be shutdown/init
during power management, where USB controllers would call them.

I reworked on this driver to address the concerns raised here. Please check
PATCH v5 that I will submit shortly.
If we want to dynamically change the mode of PHY either to be in host mode
or device mode or idle, we don't have to do a full PHY init/power on (that
earlier required doing a PHY PLL lock and other resets). We just have to
program couple of register bits that are dedicated for this purpose.
I made those changes, now we don't have to call phy ops in the driver.
Phy_ops will be called only by the consumer drivers.

Thanks,
Ravi

> Thanks
> Kishon
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
