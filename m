From: Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: Re: [PATCH v9 5/6] Documentation: DT: Add HiSilicon PCIe host binding
Date: Wed, 16 Sep 2015 09:14:16 +0800
Message-ID: <55F8C268.2020809@hisilicon.com>
References: <1442321361-174300-1-git-send-email-wangzhou1@hisilicon.com> <1442321361-174300-6-git-send-email-wangzhou1@hisilicon.com> <55F874F9.1060804@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55F874F9.1060804-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pratyush.anand-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, gabriele.paoloni-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, james.morse-5wv7dgnIgG8@public.gmane.org, Liviu.Dudau-5wv7dgnIgG8@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zhangjukuo-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, qiuzhenfa-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, liudongdong3-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, qiujiang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2015/9/16 3:43, Rob Herring wrote:
> On 09/15/2015 07:49 AM, Zhou Wang wrote:
>> This patch adds related DTS binding document for HiSilicon PCIe host driver.
>>
>> Signed-off-by: Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
>> ---
>>  .../devicetree/bindings/pci/hisilicon-pcie.txt     | 46 ++++++++++++++++++++++
>>  1 file changed, 46 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/pci/hisilicon-pcie.txt
>>
>> diff --git a/Documentation/devicetree/bindings/pci/hisilicon-pcie.txt b/Documentation/devicetree/bindings/pci/hisilicon-pcie.txt
>> new file mode 100644
>> index 0000000..2afc9d1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pci/hisilicon-pcie.txt
>> @@ -0,0 +1,46 @@
>> +HiSilicon PCIe host bridge DT description
>> +
>> +HiSilicon PCIe host controller is based on Designware PCI core.
>> +It shares common functions with PCIe Designware core driver and inherits
>> +common properties defined in
>> +Documentation/devicetree/bindings/pci/designware-pci.txt.
>> +
>> +Additional properties are described here:
>> +
>> +Required properties:
>> +- compatible: Should contain "hisilicon,hip05-pcie".
>> +- reg: Should contain rc_dbi, subctrl, config registers location and length.
>> +- reg-names: Must include the following entries:
>> +  "rc_dbi": controller configuration registers;
>> +  "subctrl": whole PCIe hosts configuration registers;
>> +  "config": PCIe configuration space registers.
>> +- msi-parent: Should be its_pcie which is an ITS receiving MSI interrupts.
>> +- port-id: Should be 0, 1, 2 or 3.
> 
> What is port-id for? Use of instance indexes need to have good reason.
> 
> Rob

There are four PCIe controllers in HiSilicon Hip05 SoC, port-id just indicates
which one we use. And we will use port-id to locate related registers in driver.

Thanks,
Zhou

>
> 
> .
> 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
