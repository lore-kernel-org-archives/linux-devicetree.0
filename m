From: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 0/5] Add Keystone PCIe controller driver
Date: Tue, 8 Jul 2014 08:49:00 -0400
Message-ID: <53BBE8BC.2090302@ti.com>
References: <1404164720-11066-1-git-send-email-m-karicheri2@ti.com> <20140705182332.GB28871@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140705182332.GB28871-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Pratyush Anand <pratyush.anand-qxv4g6HH51o@public.gmane.org>, Richard Zhu <r65037-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/05/2014 02:23 PM, Bjorn Helgaas wrote:
> On Mon, Jun 30, 2014 at 05:45:15PM -0400, Murali Karicheri wrote:
>> This patch add PCIe controller driver for Keystone SoCs. This
>> is based on v2 of the series posted to the mailing list.
>> Keystone PCI controller is based on version 3.65 of the DW
>> hardware. This driver re-uses some of the DW core driver
>> functions and required modification in some to support
>> the old DW h/w based Keystone driver.
>>
>> Please review and let me know if you have any comments.
>
> I'm waiting for acks from Mohit or Jingoo for the designware changes.
>
Bjorn,

Thanks for your email.

So far I got Ack for 1/5 and 2/5. I will ping them today for 3/5 and 4/5.

> I'd also like an ack from the devicetree folks for the Keystone binding.
>
Ok
> And I think we need a MAINTAINERS update for drivers/pci/host/\*keystone\*
I will address your comments against 5/5 and discuss them if any and 
make the above update for v4 and send the patch set to the list.

Thanks and regards,

Murali
>
>> CC: Santosh Shilimkar<santosh.shilimkar-l0cyMroinI0@public.gmane.org>
>> CC: Russell King<linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
>> CC: Grant Likely<grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> CC: Rob Herring<robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> CC: Mohit Kumar<mohit.kumar-qxv4g6HH51o@public.gmane.org>
>> CC: Jingoo Han<jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> CC: Bjorn Helgaas<bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
>> CC: Pratyush Anand<pratyush.anand-qxv4g6HH51o@public.gmane.org>
>> CC: Richard Zhu<r65037-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> CC: Kishon Vijay Abraham I<kishon-l0cyMroinI0@public.gmane.org>
>> CC: Marek Vasut<marex-ynQEQJNshbs@public.gmane.org>
>> CC: Arnd Bergmann<arnd-r2nGTMty4D4@public.gmane.org>
>> CC: Pawel Moll<pawel.moll-5wv7dgnIgG8@public.gmane.org>
>> CC: Mark Rutland<mark.rutland-5wv7dgnIgG8@public.gmane.org>
>> CC: Ian Campbell<ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
>> CC: Kumar Gala<galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
>> CC: Randy Dunlap<rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
>> CC: Grant Likely<grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>
>> Changelog:
>>
>> v3
>>   - DW application register handling code is now part of
>>     Keystone PCI driver. RFC had this code part of Keystone
>>     PCI driver, then V1 moved this to a separate file to
>>     re-use on other platforms that uses this version of the
>>     DW h/w. Then based on comments against v2, this is moved
>>     back to Keystone driver.
>>   - Keystone SerDes phy driver is removed from this series so that
>>     this can be merged independent of that patch
>>   - added msi_set_irq()/clear_irq() API's to support Keystone
>>
>> V2
>>   - Split the designware pcie enhancement patch to multiple
>>     patches based on functionality added
>>   - Remove the quirk code and add a patch to fix mps/mrss
>>     tuning for ARM. Use kernel command line parameter
>>     pci=pcie_bus_perf to work with Keystone PCI Controller.
>>     Following patch addressed this.
>>       [PATCH v1] ARM: pci: add call to pcie_bus_configure_settings()
>>   - Add documentation for device tree bindings
>>   - Add separate interrupt controller nodes for MSI and Legacy
>>     IRQs and use irq map for legacy IRQ
>>   - Use compatibility to identify v3.65 version of the DW hardware
>>     and use it to customize the designware common code.
>>   - Use reg property for configuration space instead of range
>>   - Other minor updates based on code inspection.
>>
>> V1
>>   - Add an interrupt controller node for Legacy irq chip and use
>>     interrupt map/map-mask property to map legacy IRQs A/B/C/D
>>   - Add a Phy driver to replace the original serdes driver
>>   - Move common application register handling code to a separate
>>     file to allow re-use across other platforms that use older
>>     DW PCIe h/w
>>   - PCI quirk for maximum read request size. Check and override only
>>     if the maximum is higher than what controller can handle.
>>   - Converted to a module platform driver.
>>
>> Murali Karicheri (5):
>>    PCI: designware: add rd[wr]_other_conf API
>>    PCI: designware: refactor MSI code to work with v3.65 dw hardware
>>    PCI: designware: refactor host init code to re-use on keystone PCI
>>    PCI: designware: enhance dw core driver to support Keystone PCI host
>>      controller
>>    PCI: add PCI controller for Keystone PCIe h/w
>>
>>   .../devicetree/bindings/pci/designware-pcie.txt    |    2 +
>>   .../devicetree/bindings/pci/pci-keystone.txt       |   69 +++
>>   drivers/pci/host/Kconfig                           |    5 +
>>   drivers/pci/host/Makefile                          |    1 +
>>   drivers/pci/host/pci-keystone-dw.c                 |  523 ++++++++++++++++++++
>>   drivers/pci/host/pci-keystone.c                    |  381 ++++++++++++++
>>   drivers/pci/host/pci-keystone.h                    |   56 +++
>>   drivers/pci/host/pcie-designware.c                 |  206 ++++++--
>>   drivers/pci/host/pcie-designware.h                 |   17 +-
>>   9 files changed, 1207 insertions(+), 53 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/pci/pci-keystone.txt
>>   create mode 100644 drivers/pci/host/pci-keystone-dw.c
>>   create mode 100644 drivers/pci/host/pci-keystone.c
>>   create mode 100644 drivers/pci/host/pci-keystone.h
>>
>> --
>> 1.7.9.5
>>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
