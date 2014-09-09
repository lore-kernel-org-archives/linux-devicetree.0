From: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 2/2] PCI: keystone: update to support multiple pci
 ports
Date: Tue, 9 Sep 2014 17:49:19 -0400
Message-ID: <540F75DF.5050904@ti.com>
References: <1410293835-13050-1-git-send-email-m-karicheri2@ti.com> <3294679.puV171E8qx@wuerfel> <540F6646.3010607@ti.com> <9042477.aRbAhpkfQ5@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9042477.aRbAhpkfQ5@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 09/09/2014 05:09 PM, Arnd Bergmann wrote:
> On Tuesday 09 September 2014 16:42:46 Murali Karicheri wrote:
>>>>
>>>>       /* update the Vendor ID */
>>>> -    vendor_device_id = readl(ks_pcie->va_reg_pciid);
>>>> -    writew((vendor_device_id>>   16), pp->dbi_base + PCI_DEVICE_ID);
>>>> +    writew(ks_pcie->device_id, pp->dbi_base + PCI_DEVICE_ID);
>>>>
>>>>       /* update the DEV_STAT_CTRL to publish right mrrs */
>>>>       val = readl(pp->dbi_base + PCIE_CAP_BASE + PCI_EXP_DEVCTL);
>>>
>>> This change must have slipped in accidentally, at least it's not
>>> described in the changelog. Should this be another patch?
>>> The change seems useful.
>> Are you referring to mrrs or update to device id?  device id is in a SoC
>> register at index2 and is read and updated by the driver here. MRRS
>> update was originally in the code.
>>
>
> I meant the device id change. Maybe you accidentally did 'git commit
> --amend' during a rebase and that replaced the real changelog with
> the one of the patch in front of it and merged the two patches?
>
Actually this is an inteded. The vendor ID is in a register indicated by
reg offset and as per the device spec, it needs to be read and updated 
by the software. Now since multiple instances of PCI device needs to be 
read the same register, the reading happens in the probe() and same is 
unmapped after that.

+	ks_pcie->device_id = readl(reg_p) >> 16;
+	devm_iounmap(dev, reg_p);
+	devm_release_mem_region(dev, res->start, resource_size(res));

Afetr that in ks_pcie_host_init(), it update the device_id in the RC's 
config space.

Thanks

Murali
> That happened to me a few times and would explain the strange mix
> of two changes.
>
> 	Arnd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
