From: Oza Pawandeep <oza.pawandeep-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 0/3] PCI hotplug feature
Date: Thu, 31 Aug 2017 22:29:01 +0530
Message-ID: <CAK1A=4wznHsh=drYNrEEhaaJQrksWjkB8K_mOutgxFPh1CVdPg@mail.gmail.com>
References: <1504155029-24729-1-git-send-email-oza.oza@broadcom.com> <20170831133951.GA8154@bhelgaas-glaptop.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170831133951.GA8154-1RhO1Y9PlrlHTL0Zs8A6p5iNqAH0jzoTYJqu5kTmcBRl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Oza Pawandeep <oza.oza-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Andy Gospodarek <gospo-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 31, 2017 at 7:09 PM, Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Thu, Aug 31, 2017 at 10:20:26AM +0530, Oza Pawandeep wrote:
>> These patches bring in PCI hotplug support for iproc family chipsets.
>>
>> It includes DT binding documentation and, the implementation in
>> iproc pcie RC driver.
>>
>> Changes since v5:
>> [RESEND]
>
> Not sure what the point of resending this as v6 was, since v5 was
> posted 6 minutes earlier and you don't mention any changes in v6?

My apologies,
It looked to me that v5 went out twice, might be confusing.

Hence sent out v6.

Regards,
Oza.
>
>> Changes since v4:
>> Rebased to pci-next
>> Added; Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>>
>> Changes since v3:
>> Resend. just to be in sync previous in-flight patches.
>>
>> Changes since v2:
>> Addressed Rob Herring's comments.
>> Changed subject to "dt-bindings: PCI:..."
>> Made generic PCI hotplug properties 'slot-pluggable' and 'prsnt-gpios'
>> Rebased the patches on top of Lorenzo's patches.
>>
>> Oza Pawandeep (3):
>>   dt-bindings: PCI: Add PCI hotplug property
>>   dt-bindings: PCI iproc: Implement optional property prsnt-gpios
>>   PCI: iproc: Implement PCI hotplug support
>>
>>  .../devicetree/bindings/pci/brcm,iproc-pcie.txt    |  14 ++
>>  Documentation/devicetree/bindings/pci/pci.txt      |  15 ++
>>  drivers/pci/host/pcie-iproc-platform.c             |   3 +
>>  drivers/pci/host/pcie-iproc.c                      | 166 ++++++++++++++++++---
>>  drivers/pci/host/pcie-iproc.h                      |   7 +
>>  5 files changed, 187 insertions(+), 18 deletions(-)
>>
>> --
>> 1.9.1
>>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
