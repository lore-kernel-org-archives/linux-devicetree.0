From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [sodaville] [PATCH TIP 08/14] x86/dtb: add support for PCI
	devices backed by dtb nodes
Date: Tue, 22 Feb 2011 12:21:23 +0100
Message-ID: <20110222112123.GB24641@www.tglx.de>
References: <1295843342-1122-1-git-send-email-bigeasy@linutronix.de>
	<1295843342-1122-9-git-send-email-bigeasy@linutronix.de>
	<AANLkTimWxmEcr=7AibGUht3bBi7ms2MRqj4Qj-jwEGBB@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTimWxmEcr=7AibGUht3bBi7ms2MRqj4Qj-jwEGBB-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

* Grant Likely | 2011-02-16 14:59:15 [-0700]:

>> diff --git a/arch/x86/include/asm/prom.h b/arch/x86/include/asm/prom.h
>> index bd67ab2..3ed0bd6 100644
>> --- a/arch/x86/include/asm/prom.h
>> +++ b/arch/x86/include/asm/prom.h
>> @@ -28,8 +29,24 @@ extern void add_dtb(u64 data);
>> =A0void x86_dtb_find_config(void);
>> =A0void x86_dtb_get_config(unsigned int unused);
>> =A0void add_interrupt_host(struct irq_domain *ih);
>> +void __cpuinit x86_of_pci_init(void);
>> +
>> +static inline struct device_node *pci_device_to_OF_node(struct pci_dev =
*pdev)
>> +{
>> + =A0 =A0 =A0 return pdev->dev.of_node;
>> +}
>> +
>> +static inline struct device_node *pci_bus_to_OF_node(struct pci_bus *bu=
s)
>> +{
>> + =A0 =A0 =A0 if (bus->self)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return pci_device_to_OF_node(bus->self);
>> + =A0 =A0 =A0 else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NULL;
>> +}
>
>Nit: could simply be:
>
>static inline struct device_node *pci_device_to_OF_node(struct pci_dev *pd=
ev)
>{
>       return pdev ? pdev->dev.of_node : NULL;
>}
>
>static inline struct device_node *pci_bus_to_OF_node(struct pci_bus *bus)
>{
>       return pci_device_to_OF_node(bus->self);
>}
>
done.

Sebastian
