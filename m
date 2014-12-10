From: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/4] PCI: iproc: Add Broadcom iProc PCIe driver
Date: Wed, 10 Dec 2014 12:40:38 -0800
Message-ID: <5488AFC6.3000209@broadcom.com>
References: <1418169871-19232-3-git-send-email-rjui@broadcom.com> <9707535.Y78sV0TgX4@wuerfel> <54887901.8070501@broadcom.com> <CAGVrzcbZ_f43Vf1mu2XErVi_Jehjggh2TREyrSs84ntSm98yvg@mail.gmail.com> <5488AC64.9010306@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5488AC64.9010306-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 12/10/2014 12:26 PM, Hauke Mehrtens wrote:
> On 12/10/2014 07:46 PM, Florian Fainelli wrote:
>> 2014-12-10 8:46 GMT-08:00 Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>:
>>> On 14-12-10 03:31 AM, Arnd Bergmann wrote:
>>>>
>>>> On Tuesday 09 December 2014 16:04:29 Ray Jui wrote:
>>>>>
>>>>> Add initial version of the Broadcom iProc PCIe driver. This driver
>>>>> has been tested on NSP and Cygnus and is expected to work on all iProc
>>>>> family of SoCs that deploys the same PCIe host controller
>>>>>
>>>>> The driver also supports MSI
>>>>>
>>>>> Signed-off-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>>>> Reviewed-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>>>
>>>>
>>>> The driver looks suspiciously like the one that Hauke already submitted a
>>>> while ago for bcm53xx. Please come up with a merged driver that works for
>>>> both.
>>>
>>> Could you please be a little more specific.  What driver did "Hauke already
>>> submitted"?  I do not see any driver in the kernel you are talking about.
>>
>> https://www.marc.info/?l=linux-pci&m=141547043110684&w=2
>
> Yes it also looks similar to me. Your code also contains the same
> comments as the driver used on Northstar (BCM5301X).Your driver has
> some more features, but I just have access to the consumer SoC Northstar
> where the PCIe controller is only used to connect some Broadcom Wifi
> chips to the SoC. I do not know If this controller does not have these
> features or the driver I used as a reference does not implement them.
>
Right, I wrote this driver based on some old Broadcom internal PCIe 
driver from a 3.6 kernel and might have copied some of the comments 
(especially in the check link function). The 3.6 driver is probably what 
you received?

> When I find some time I will try this driver on a Northstar device. I
> think your driver is more advanced then the one I send to the mailing list.
>
Please do that. I tested this driver on Cygnus and one of my colleagues 
helped to test it on North Star Plus. We do expect the same driver to 
work on NorthStar as well.

> When you want to stay with pure device tree I will send a patch adding
> additional support for registering to bcma.
>
What exactly is bcma? I guess I'll need to look into it in more details 
myself.

> Does your SoC also have a third PCIe controller which shares the PHY
> with the USB 3 controller?
No. Cygnus has only two PCIe controllers, each has its own dedicated PHY.

>
> Why is this stuff in the iproc_pcie_check_link() function needed? I
> think it is strange that the controller driver has to check if the
> device is there and set the correct speed. When we do not check if the
> card is there on BCM5301X the device stops working.
>
I need to check with our ASIC engineer on this. In theory we should be 
able to support hot plug eventually, but maybe not in the initial 
version of this driver.

>>>> Are you sure that iProc isn't based on the BCMA bus infrastructure after
>>>> all? Even the physical address of your PCI host falls into the address
>>>> range that is used for the internal BCMA bus on the other chips!
>>>
>>> BCMA seems to be for MIPS architectures.  It seems to be quite specific to
>>> those architectures using BCMA.  I see no use of it in bcm53xx code?
>>
>> BCMA lives in its own directory in drivers/bcma/ and is not specific
>> to MIPS actually. Older BCM47xx/BCM53xx MIPS-based SoCs traditionally
>> started with a discoverable Silicon Sonics Backplane (drivers/ssb) and
>> progressively migrated to BCMA (drivers/bcma), both subsystems offer a
>> very similar bus/device/driver abstraction and discovery mechanism.
>
> With mainline kernel 3.18 you can boot Linux on a BCM5301X SoC and bcma
> will find all the cores.
>
> Hauke
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
