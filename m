From: Oza Oza <oza.oza@broadcom.com>
Subject: Re: [PATCH 2/2] PCI: iproc: Add optional brcm,pci-hotplug
Date: Wed, 9 Aug 2017 11:22:50 +0530
Message-ID: <CAMSpPPdxGdXoh0dux3Lyh5o210mxSK2WhMvyh_ygW8gQN28ymg@mail.gmail.com>
References: <1502167455-10516-1-git-send-email-oza.oza@broadcom.com>
 <1502167455-10516-3-git-send-email-oza.oza@broadcom.com> <CAL_JsqL3dWA-0Sq-_8ufa-cwXZEbFQBJHCK-5wLp_xw5NrTHKw@mail.gmail.com>
 <CAMSpPPfjxbjaScqovegcRG6GBhkUutqgj3Ly1B+0_BnZN2Ewug@mail.gmail.com>
 <735e0534-ab77-7440-fbc6-5b40598da445@broadcom.com> <CAMSpPPejuTn210aSYjApbz_Jx_tO7V1Fd6nSt96axm-9MFruhA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMSpPPejuTn210aSYjApbz_Jx_tO7V1Fd6nSt96axm-9MFruhA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ray Jui <ray.jui@broadcom.com>
Cc: Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, Andy Gospodarek <gospo@broadcom.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Oza Pawandeep <oza.pawandeep@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 9, 2017 at 11:13 AM, Oza Oza <oza.oza@broadcom.com> wrote:
> On Wed, Aug 9, 2017 at 10:57 AM, Ray Jui <ray.jui@broadcom.com> wrote:
>>
>>
>> On 8/8/2017 10:22 PM, Oza Oza wrote:
>>>
>>> On Tue, Aug 8, 2017 at 7:50 PM, Rob Herring <robh+dt@kernel.org> wrote:
>>>>
>>>> Please send bindings to DT list.
>>>
>>> Sure, will do that.
>>>
>>>> On Mon, Aug 7, 2017 at 11:44 PM, Oza Pawandeep <oza.oza@broadcom.com>
>>>> wrote:
>>>>>
>>>>> Add description for optional device tree property
>>>>> 'brcm,pci-hotplug' for PCI hotplug feature.
>>>>>
>>>>> Signed-off-by: Oza Pawandeep <oza.oza@broadcom.com>
>>>>> Reviewed-by: Ray Jui <ray.jui@broadcom.com>
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/pci/brcm,iproc-pcie.txt
>>>>> b/Documentation/devicetree/bindings/pci/brcm,iproc-pcie.txt
>>>>> index b8e48b4..a3bad24 100644
>>>>> --- a/Documentation/devicetree/bindings/pci/brcm,iproc-pcie.txt
>>>>> +++ b/Documentation/devicetree/bindings/pci/brcm,iproc-pcie.txt
>>>>> @@ -72,6 +72,29 @@ Optional properties:
>>>>>   - brcm,pcie-msi-inten: Needs to be present for some older iProc
>>>>> platforms that
>>>>>   require the interrupt enable registers to be set explicitly to enable
>>>>> MSI
>>>>>
>>>>> +Optional properties:
>>>>> +- brcm,pci-hotplug: PCI hotplug feature is supported.
>>>>
>>>> I think we should make this a common property. We already have
>>>> "ibm,slot-pluggable", so I'd propose "slot-pluggable".
>>>>
>>>> There's also "hotpluggable" for memory nodes defined, so we could
>>>> reuse that here.
>>>>
>>> ok I will rename this to
>>> brcm,slot-pluggable
>>
>>
>> How's brcm,slot-pluggable a common property? It's still brcm specific.
>> Didn't Rob propose either "slot-pluggable" or "hotpluggable"?
>>
>> And note it goes to the generic PCI binding instead iProc PCIe specific
>> binding.
>>
>
> Initially I thought, Rob suggested either "slot-pluggable".
> followed by, "hotpluggable" since memory node already has such property.
>
> but not sure in which generic pci binding I should add ?
> should it be part of
> Documentation/devicetree/bindings/pci/host-generic-pci.txt
>
> Can you please clarify Rob ?
>
> Regards,
> Oza.

To add, every SOC might have different way of implementing hotplug.
so I suppose both the binding documents have to be updated.

Documentation/devicetree/bindings/pci/host-generic-pci.txt
which can have common boolean property
named "hotpluggable"

and SOC specific implementation can stay here
for e.g.
Documentation/devicetree/bindings/pci/brcm,iproc-pcie.txt
brcm,prsnt-gpios

Rob and Ray:
please let me know how this sounds.

Regards,
Oza.
