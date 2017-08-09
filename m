From: Oza Oza <oza.oza-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/2] PCI: iproc: Add optional brcm,pci-hotplug
Date: Wed, 9 Aug 2017 10:52:48 +0530
Message-ID: <CAMSpPPfjxbjaScqovegcRG6GBhkUutqgj3Ly1B+0_BnZN2Ewug@mail.gmail.com>
References: <1502167455-10516-1-git-send-email-oza.oza@broadcom.com>
 <1502167455-10516-3-git-send-email-oza.oza@broadcom.com> <CAL_JsqL3dWA-0Sq-_8ufa-cwXZEbFQBJHCK-5wLp_xw5NrTHKw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqL3dWA-0Sq-_8ufa-cwXZEbFQBJHCK-5wLp_xw5NrTHKw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org" <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Andy Gospodarek <gospo-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Oza Pawandeep <oza.pawandeep-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 8, 2017 at 7:50 PM, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> Please send bindings to DT list.

Sure, will do that.

>
> On Mon, Aug 7, 2017 at 11:44 PM, Oza Pawandeep <oza.oza-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
>> Add description for optional device tree property
>> 'brcm,pci-hotplug' for PCI hotplug feature.
>>
>> Signed-off-by: Oza Pawandeep <oza.oza-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Reviewed-by: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>>
>> diff --git a/Documentation/devicetree/bindings/pci/brcm,iproc-pcie.txt b/Documentation/devicetree/bindings/pci/brcm,iproc-pcie.txt
>> index b8e48b4..a3bad24 100644
>> --- a/Documentation/devicetree/bindings/pci/brcm,iproc-pcie.txt
>> +++ b/Documentation/devicetree/bindings/pci/brcm,iproc-pcie.txt
>> @@ -72,6 +72,29 @@ Optional properties:
>>  - brcm,pcie-msi-inten: Needs to be present for some older iProc platforms that
>>  require the interrupt enable registers to be set explicitly to enable MSI
>>
>> +Optional properties:
>> +- brcm,pci-hotplug: PCI hotplug feature is supported.
>
> I think we should make this a common property. We already have
> "ibm,slot-pluggable", so I'd propose "slot-pluggable".
>
> There's also "hotpluggable" for memory nodes defined, so we could
> reuse that here.
>

ok I will rename this to
brcm,slot-pluggable

>> +
>> +If the brcm,pcie-hotplug property is present, the following properties become
>> +effective:
>> +
>> +- brcm,prsnt-gpio: Array of gpios, needs to be present if Hotplug is supported.
>
> prsnt-gpios

will take care.

>
>> +
>> +PCI hotplug implementation is SOC/Board specific, and also it depends on
>> +how add-in card is designed (e.g. how many present pins are implemented).
>> +
>> +If x8 card is connected, then it might be possible that all the
>> +3 present pins could go low, or at least one pin goes low.
>> +
>> +If x4 card is connected, then it might be possible that 2 present
>> +pins go low, or at least one pin goes low.
>> +
>> +Example:
>> +brcm,prsnt-gpio: <&pca9505 32 1>, <&pca9505 33 1>;
>> +This is x4 connector: monitoring max 2 present lines.
>> +brcm,prsnt-gpio: <&pca9505 32 1>, <&pca9505 33 1>, <&pca9505 34 1>;
>> +This is x8 connector: monitoring max 3 present lines.
>> +
>>  Example:
>>         pcie0: pcie@18012000 {
>>                 compatible = "brcm,iproc-pcie";
>> --
>> 1.9.1
>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
