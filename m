From: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/3] dt-bindings: designware: add binding for
 Designware PCIe in ECAM mode
Date: Thu, 24 Aug 2017 23:37:37 +0100
Message-ID: <CAKv+Gu-ho_ipsuAViyaDY6=m+NO7Y-hpZ2TEz=7WgVJP-i+eAw@mail.gmail.com>
References: <20170824184321.19432-1-ard.biesheuvel@linaro.org>
 <20170824184321.19432-4-ard.biesheuvel@linaro.org> <CAL_JsqJTGeLv-c0wXCvMZggU4yzo__s-pD7qEZ7Q3w8=uUuu4Q@mail.gmail.com>
 <CAKv+Gu-D0tgygJ84iGEoEU9OcjUwrtvS2Z2wrOHAZ9kO_kE_rA@mail.gmail.com> <CAL_JsqJkDmT3_Umhi+y9e6qML+Ei=ee7G7EohpoMJacBeecirQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJkDmT3_Umhi+y9e6qML+Ei=ee7G7EohpoMJacBeecirQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marcin Wojtas <mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, Leif Lindholm <leif.lindholm-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Graeme Gregory <graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Joao Pinto <Joao.Pinto-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 24 August 2017 at 23:12, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Aug 24, 2017 at 3:12 PM, Ard Biesheuvel
> <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> On 24 August 2017 at 21:02, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>> Cc the DT list for bindings please.
>>>
>>> On Thu, Aug 24, 2017 at 1:43 PM, Ard Biesheuvel
>>> <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>>> Describe the binding for firmware-configured instances of the Synopsys
>>>> Designware PCIe controller in RC mode.
>>>>
>>>> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>>> Signed-off-by: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>> ---
>>>>  Documentation/devicetree/bindings/pci/designware-pcie-ecam.txt | 56 ++++++++++++++++++++
>>>>  1 file changed, 56 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/pci/designware-pcie-ecam.txt b/Documentation/devicetree/bindings/pci/designware-pcie-ecam.txt
>>>> new file mode 100644
>>>> index 000000000000..b8127b19c220
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/pci/designware-pcie-ecam.txt
>>>> @@ -0,0 +1,56 @@
>>>> +* Synopsys Designware PCIe root complex in ECAM mode
>>>> +
>>>> +In some cases, firmware may already have configured the Synopsys Designware
>>>> +PCIe controller in RC mode with static ATU window mappings that cover all
>>>> +config, MMIO and I/O spaces in a [mostly] ECAM compatible fashion.
>>>> +In this case, there is no need for the OS to perform any low level setup
>>>> +of clocks or device registers, nor is there any reason for the driver to
>>>> +reconfigure ATU windows for config and/or IO space accesses at runtime.
>>>> +
>>>> +Such hardware configurations should be described as "pci-host-ecam-generic"
>>>> +if they are truly ECAM compatible. Configurations that require no low-level
>>>> +setup by the OS nor any ATU window reconfiguration at runtime, but do
>>>> +require special handling for type 0 config TLPs may instead be described as
>>>> +"snps,dw-pcie-ecam".
>>>
>>> Humm, what happens when we have the next exception that's SoC specific
>>> or another vendor?
>>
>> This is not SoC specific, but IP specific. We are working with two
>> different SoCs from completely different vendors that both synthesized
>> this IP with a 64 KB ATU window size, not expecting this to break ECAM
>> compatibility.
>
> This case is not SoC specific, but quirks/bugs show up in both places.
> Plus "dw-pcie" is fairly meaningless because the IP is both
> configurable and has multiple releases.
>
>>> Seems like perhaps "firmware initialized" should
>>> have been a separate property flag for bootloaders to add rather than
>>> a compatible string.
>>>
>>
>> Yes, but then you still have 10 different drivers that all retain the
>> low-level bits that are all different between SoCs. That is exactly
>> what I want to get rid of, and usually we can do that with existing
>> bindings, because we simply expose it as pci-host-ecam-generic. Only
>> in this particular case, that doesn't fly due to the quirk.
>
> You can expose it as "vendor,soc-pcie", "pci-host-ecam-generic" and
> then the kernel can decide. Then you can use: the default ecam driver,
> the ecam driver but match on "vendor,soc-pcie" for quirks, or a vendor
> specific driver. The only thing that wouldn't work would be having
> both quirks in the ecam driver and a vendor driver which IMO we just
> shouldn't support anyway.
>
> Now if you have 10 SoCs all needing this same quirk, then maybe adding
> "snps,dw-pcie-ecam" addtionally to the above makes sense. But that
> only saves you match strings.
>

Exposing this as "pci-host-ecam-generic" doesn't work, or we wouldn't
be having this discussion.

So if I understand you correctly, you would rather have

marvell,armada8k-pcie-ecam
socionext,synquacer-pcie-ecam

and add more of those to the list if needed, and update the
binding+driver to use those and drop the generic identifier? I take it
that applies to the description of the MSI frame as well?

>>> I'd rather see this done in a way that does not require DT updates if
>>> quirks have to be handled/added later.
>>>
>>
>> Do you see a way that still allows us to keep the abstraction? I don't
>> want a flag, I simply don't want to expose any low-level specifics
>> about the device to the OS, beyond what it needs to use it in its
>> configured state.
>
> That's not how DT works. Detailed information is exposed to the OS and
> the OS decides if it can handle things generically or not because that
> decision can change over time. Whenever we don't make things specific
> enough, we've gotten burned.
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
