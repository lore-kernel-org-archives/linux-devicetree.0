From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] PCI: iproc: Add Broadcom iProc PCIe driver
Date: Wed, 10 Dec 2014 10:46:57 -0800
Message-ID: <CAGVrzcbZ_f43Vf1mu2XErVi_Jehjggh2TREyrSs84ntSm98yvg@mail.gmail.com>
References: <1418169871-19232-3-git-send-email-rjui@broadcom.com>
 <9707535.Y78sV0TgX4@wuerfel> <54887901.8070501@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54887901.8070501-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2014-12-10 8:46 GMT-08:00 Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>:
> On 14-12-10 03:31 AM, Arnd Bergmann wrote:
>>
>> On Tuesday 09 December 2014 16:04:29 Ray Jui wrote:
>>>
>>> Add initial version of the Broadcom iProc PCIe driver. This driver
>>> has been tested on NSP and Cygnus and is expected to work on all iProc
>>> family of SoCs that deploys the same PCIe host controller
>>>
>>> The driver also supports MSI
>>>
>>> Signed-off-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>> Reviewed-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>
>>
>> The driver looks suspiciously like the one that Hauke already submitted a
>> while ago for bcm53xx. Please come up with a merged driver that works for
>> both.
>
> Could you please be a little more specific.  What driver did "Hauke already
> submitted"?  I do not see any driver in the kernel you are talking about.

https://www.marc.info/?l=linux-pci&m=141547043110684&w=2

>>
>>
>> Are you sure that iProc isn't based on the BCMA bus infrastructure after
>> all? Even the physical address of your PCI host falls into the address
>> range that is used for the internal BCMA bus on the other chips!
>
> BCMA seems to be for MIPS architectures.  It seems to be quite specific to
> those architectures using BCMA.  I see no use of it in bcm53xx code?

BCMA lives in its own directory in drivers/bcma/ and is not specific
to MIPS actually. Older BCM47xx/BCM53xx MIPS-based SoCs traditionally
started with a discoverable Silicon Sonics Backplane (drivers/ssb) and
progressively migrated to BCMA (drivers/bcma), both subsystems offer a
very similar bus/device/driver abstraction and discovery mechanism.
-- 
Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
