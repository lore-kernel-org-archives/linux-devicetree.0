From: Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: Re: [PATCH v10 4/6] PCI: hisi: Add PCIe host support for HiSilicon
 SoC Hip05
Date: Wed, 14 Oct 2015 17:44:11 +0800
Message-ID: <561E23EB.7050504@hisilicon.com>
References: <1444445957-239522-1-git-send-email-wangzhou1@hisilicon.com> <11677087.JbqAo0FWJE@wuerfel> <561E1957.5030503@hisilicon.com> <30775300.COZ4nEMWXC@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <30775300.COZ4nEMWXC@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Gabriele Paoloni <gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "pratyush.anand-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <pratyush.anand-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org" <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, "james.morse-5wv7dgnIgG8@public.gmane.org" <james.morse-5wv7dgnIgG8@public.gmane.org>, "Liviu.Dudau-5wv7dgnIgG8@public.gmane.org" <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, "jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org" <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, "robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devi>
List-Id: devicetree@vger.kernel.org

On 2015/10/14 17:06, Arnd Bergmann wrote:
> On Wednesday 14 October 2015 16:59:03 Zhou Wang wrote:
>>
>> Hi Arnd,
>>
>> In Hip05 PCIe host, it uses GITS_TRANSLATER's address to get TLP package
>> which contains MSI address and MSI data, and then combine BDF and MSI data
>> to a 32 bit data which will be writen to GITS_TRANSLATER register of ITS.
>>
>> I think maybe this is a defect of our PCIe controller.
> 
> I'd consider it a bug in the firmware if this is not set up correctly
> before boot.
> 
>>> I don't think what you do here is safe because the 'reg' property
>>> of the MSI controller might point to the address that is used for
>>> the message directly.
>>
>> I see your point, however we must get address of GITS_TRANSLATER and
>> set it to PCIe host. How about adding necessary comments here?
> 
> This seems to just be static setup that should be done before Linux
> is even loaded. Any reason you can't do it that way?
>

There are some ITSs in Hip05-D02 platform, in fact, we can use any of them
as a msi-controller,  which we can configure in dts. I am afraid that
hard-setting the value in BIOS would lead to restrictions in terms of flexibility,
as with the current implementation the same BIOS-driver can fit different
DTS structures.

Regards,
Zhou

> 	Arnd
> 
> .
> 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
