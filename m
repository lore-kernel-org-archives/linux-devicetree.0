From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3] PCI: Xilinx-NWL-PCIe: Added support for Xilinx NWL
 PCIe Host Controller
Date: Fri, 09 Oct 2015 10:02:39 +0100
Message-ID: <561782AF.4080408@arm.com>
References: <1444146289-28940-1-git-send-email-bharatku@xilinx.com> <5613F310.6060305@arm.com> <8520D5D51A55D047800579B0941471980169063F@XAP-PVEXMBX01.xlnx.xilinx.com> <5613F9C8.9020000@arm.com> <8520D5D51A55D047800579B09414719801690CD0@XAP-PVEXMBX01.xlnx.xilinx.com> <56177669.2000302@arm.com> <8520D5D51A55D047800579B09414719801690D3D@XAP-PVEXMBX01.xlnx.xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8520D5D51A55D047800579B09414719801690D3D-4lKfpRxZ5enZMOc0yg5rMog+Gb3gawCHQz34XiSyOiE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bharat Kumar Gogada <bharat.kumar.gogada-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michal Simek <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Soren Brinkmann <sorenb-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org" <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "tinamdar-qTEPVZfXA3Y@public.gmane.org" <tinamdar-qTEPVZfXA3Y@public.gmane.org>, "treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org" <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "m-karicheri2-l0cyMroinI0@public.gmane.org" <m-karicheri2-l0cyMroinI0@public.gmane.org>, "hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org" <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ravikiran Gummaluri <rgummal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/10/15 09:51, Bharat Kumar Gogada wrote:
>> On 09/10/15 06:11, Bharat Kumar Gogada wrote:
>>>>>> +struct nwl_msi {                  /* struct nwl_msi - MSI information
>>>> */
>>>>>> +  struct msi_controller chip;     /* chip: MSI controller */
>>>>>
>>>>>> We're moving away from msi_controller altogether, as the kernel now
>>>>>> has all the necessary infrastructure to do this properly.
>>>>>
>>>>> Our current GIC version does not have separate msi controller (we
>>>>> are not using GICv2m or GICv3), so is it necessary to have separate
>>>>> msi controller node ? Please give me clarity on this.
>>>>
>>>> This has nothing to do with the version of the GIC you are using
>>>> (XGene doesn't have GICv2m or v3 either). This is about reducing code
>>>> duplication and having something that we can maintain. See also
>>>> https://lkml.org/lkml/2015/9/20/193 for yet another example.
>>>>
>>>> I still plan to kill msi_controller, and I'd like to avoid more
>>>> dependencies with it. MSI domains are the way to do it.
>>>>
>>> Sorry previously I haven't configured my email client properly so resending.
>>
>> Thanks for doing so, much appreciated.
>>
>>> Since we don't have separate MSI controller, and our PCIe controller
>>> is handling MSI, is it necessary to create a separate MSI controller
>>> node because we don't have any 'reg' space.
>>
>> No, your PCI controller can perfectly be part of the PCIe node.
> You meant 'msi-controller' property to be part of PCIe node?

Yeah, sorry. Too early, not enough coffee.

>>
>>> Please let me know whether we require a separate msi file as suggested
>>> in your previous comments to separate MSI controller and PCIE
>>> controller in two files, if we don't have separate node. If we do not
>>> need a separate node do we need to embed MSI controller child node  in
>>> PCIe controller node itself, and what properties does this child node
>>> will require other than 'interrupts'.
>>
>> If you want to keep them in the same file, please at least have two separate
>> patches. These are two different functions, and they should be reviewed
>> separately.
>>
> What I meant is if we don't have separate msi node do we need separate file? 

That's up to you. Nodes and source code files don't have to match at all.

> If you meant msi controller to be part of same node then we will use single file and will
> try to have two separate patches.

That's fine by me.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
