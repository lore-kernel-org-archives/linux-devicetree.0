From: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 2/4] PCI: iproc: Add Broadcom iProc PCIe driver
Date: Mon, 15 Dec 2014 11:16:31 -0800
Message-ID: <548F338F.9030203@broadcom.com>
References: <1418351817-14898-3-git-send-email-rjui@broadcom.com> <2190666.DfrpWiLTCc@wuerfel> <548B2120.4080207@broadcom.com> <1790462.K12S5vem48@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1790462.K12S5vem48@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 12/12/2014 9:21 AM, Arnd Bergmann wrote:
> On Friday 12 December 2014 09:08:48 Ray Jui wrote:
>>
>> On 12/12/2014 4:29 AM, Arnd Bergmann wrote:
>> Doesn't Hauke's driver depends on BCMA? In that case, how does it work
>> on the SoCs that do not have the IP block to support BCMA?
>
> I hadn't realized that there are some SoCs that are not BCMA based.
> As the host controller implementation is closely related, we will
> have to come up with some solution.
>
I agree with you that we should have a common PCIe host driver which 
supports all iProc SoCs, BCM4708, BCM5301X, and some other similar SoCs.

> One way to solve this would be by turning the driver into a library
> the same way as the pcie-dw driver, and have separate front-ends
> for it for platform_device and bcma_device.
>
I'm fine with this solution, i.e., to introduce a common pcie-iproc core 
driver (just like pcie-designware) and have different front-ends 
depending on the device/bus type. If we end up deciding to go with this 
solution, I need to discuss with Hauke to come up with a plan to 
collaborate.

But before we choose to go with that route, may I ask, what is the 
purpose of tying a PCIe host driver to BCMA? What benefit does BCMA give 
us? If we have a generic platform based PCIe driver that can work on all 
iProc SoCs + BCM4708 and BCM5301X with all HW specific configurations 
taken care of by device tree, why do we still need to use BCMA?

I thought all a BCMA device here does is to auto-instantiate based on 
some register readings?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
