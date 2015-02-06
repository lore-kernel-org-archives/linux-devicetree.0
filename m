From: Thor Thayer <tthayer@opensource.altera.com>
Subject: Re: [PATCHv6 2/5] arm: socfpga: Enable OCRAM ECC on startup.
Date: Fri, 6 Feb 2015 16:05:39 -0600
Message-ID: <54D53AB3.6040205@opensource.altera.com>
References: <1420772036-3112-1-git-send-email-tthayer@opensource.altera.com> <1420772036-3112-3-git-send-email-tthayer@opensource.altera.com> <20150206184544.GC10324@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20150206184544.GC10324@leverpostej>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "bp@alien8.de" <bp@alien8.de>, "dougthompson@xmission.com" <dougthompson@xmission.com>, "m.chehab@samsung.com" <m.chehab@samsung.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "galak@codeaurora.org" <galak@codeaurora.org>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "dinguyen@opensource.altera.com" <dinguyen@opensource.altera.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "tthayer.linux@gmail.com" <tthayer.linux@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Mark,

On 02/06/2015 12:45 PM, Mark Rutland wrote:
> On Fri, Jan 09, 2015 at 02:53:53AM +0000, tthayer@opensource.altera.com wrote:
>> From: Thor Thayer <tthayer@opensource.altera.com>
>>
>> This patch enables the ECC for On-Chip RAM on machine
>> startup.  The ECC has to be enabled before data is
>> is stored in memory otherwise the ECC will fail on
>> reads.
>
> Where else is this OCRAM used?
>
> If we need the ECC to be enabled before use, a module_init call that
> seems to be unrelated to any other usage doesn't seem right to me.
> Hopefully I've just misunderstood something here.
>

Thank you for reviewing this.

The OCRAM will be used to store data and functions for putting and 
removing the SoC from sleep. However, in this scenario, we won't have 
the ECC enabled.

To initialize ECC, the OCRAM needs to enable ECC then clear the entire 
memory to zero before using it. Doing this early in the startup sequence 
seemed appropriate. Maybe I'm misunderstanding your concern.

< snip>

>> +static int __init socfpga_init_ocram_ecc(void)
>> +{
>> +	struct device_node *np;
>> +	struct resource    res;
>> +	u32                iram_addr;
>> +	void __iomem       *mapped_ocr_edac_addr;
>> +	resource_size_t    size;
>> +	struct gen_pool    *gp;
>> +	int                ret;
>> +
>> +	/* Get the size of the on-chip RAM */
>> +	np = of_find_compatible_node(NULL, NULL, "mmio-sram");
>> +	if (!np) {
>> +		pr_err("%s: Unable to find mmio-sram in dtb\n", __func__);
>> +		return -ENODEV;
>> +	}
>> +
>> +	ret = of_address_to_resource(np, 0, &res);
>> +	if (ret) {
>> +		of_node_put(np);
>> +		pr_err("%s: Problem getting SRAM address in dtb\n", __func__);
>> +		return -ENODEV;
>> +	}
>> +	size = resource_size(&res);
>> +	of_node_put(np);
>> +
>> +	/* Find the OCRAM EDAC device tree node */
>> +	np = of_find_compatible_node(NULL, NULL, "altr,ocram-edac");
>> +	if (!np) {
>> +		pr_err("%s: Unable to find altr,ocram-edac\n", __func__);
>> +		return -ENODEV;
>> +	}
>> +
>> +	mapped_ocr_edac_addr = of_iomap(np, 0);
>> +	if (!mapped_ocr_edac_addr) {
>> +		of_node_put(np);
>> +		pr_err("%s: Unable to map OCRAM ecc regs.\n", __func__);
>> +		return -ENODEV;
>> +	}
>> +
>> +	gp = of_get_named_gen_pool(np, "iram", 0);
>> +	if (!gp) {
>> +		of_node_put(np);
>> +		pr_err("%s: OCRAM cannot find gen pool\n", __func__);
>> +		return -ENODEV;
>> +	}
>> +	of_node_put(np);
>> +
>> +	iram_addr = gen_pool_alloc(gp, size / sizeof(size_t));
>
> Why divide by sizeof(size_t) here? As far as I am aware, resource_size
> gives you a size in bytes...
>

Yes, you are right. I shouldn't have changed this - for some reason when 
I re-read the function prototype, I thought this function was allocating 
integers. Thank you.


>> +	if (iram_addr == 0) {
>> +		pr_err("%s: cannot alloc from gen pool\n", __func__);
>> +		return -ENODEV;
>> +	}
>> +
>> +	/* Clear any pending OCRAM ECC interrupts, then enable ECC */
>> +	writel(ALTR_OCRAM_CLEAR_ECC, mapped_ocr_edac_addr);
>> +	writel(ALTR_OCRAM_ECC_EN, mapped_ocr_edac_addr);
>> +
>> +	memset((void *)iram_addr, 0, size);
>
> ...and here we write size bytes, not (size / sizeof(size_t)) bytes, so
> we're poking memory we weren't allocated.
>
> How is this memory mapped exactly? Is memset safe?
>
> Thanks,
> Mark.
>

Yes, thank you for catching that.

OK. I think I understand your point now. I need to enable the OCRAM ECC 
before the gen_pool_create() which is called by the 
"ocram:sram@ffff0000" node.

In that case, I should move this OCRAM ECC enable into the same place as 
L2 ecc is enabled.

Thor

>> +
>> +	gen_pool_free(gp, iram_addr, size / sizeof(size_t));
>> +
>> +	iounmap(mapped_ocr_edac_addr);
>> +
>> +	return 0;
>> +}
>> +
>> +static void __exit socfpga_exit_ocram_ecc(void)
>> +{
>> +}
>> +
>> +module_init(socfpga_init_ocram_ecc);
>> +module_exit(socfpga_exit_ocram_ecc);
>> --
>> 1.7.9.5
>>
>>
