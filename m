From: Thor Thayer <tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCH 1/3] arm: socfpga: Enable ECC of L2 and OCRAM on startup.
Date: Mon, 6 Oct 2014 09:47:59 -0500
Message-ID: <5432AB9F.90803@opensource.altera.com>
References: <1412181092-27162-1-git-send-email-tthayer@opensource.altera.com> <1412181092-27162-2-git-send-email-tthayer@opensource.altera.com> <5430C764.8080603@hitachi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5430C764.8080603-FCd8Q96Dh0JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masami Hiramatsu <masami.hiramatsu.pt-FCd8Q96Dh0JBDgjK7y7TUQ@public.gmane.org>
Cc: dinh-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org, dougthompson-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-edac-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tthayer.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org


On 10/04/2014 11:21 PM, Masami Hiramatsu wrote:
> (2014/10/02 1:31), tthayer-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org wrote:
>> +void socfpga_init_ocram_ecc(void)
>> +{
>> +	struct device_node *np;
>> +	const __be32 *prop;
>> +	u32 ocr_edac_addr, iram_addr, len;
>> +	void __iomem  *mapped_ocr_edac_addr;
>> +	size_t size;
>> +	struct gen_pool *gp;
>> +
>> +	np = of_find_compatible_node(NULL, NULL, "altr,ocram-edac");
>> +	if (!np) {
>> +		pr_err("SOCFPGA: Unable to find altr,ocram-edac in dtb\n");
>> +		return;
>> +	}
>> +
>> +	prop = of_get_property(np, "reg", &size);
>> +	ocr_edac_addr = be32_to_cpup(prop++);
>> +	len = be32_to_cpup(prop);
>> +	if (!prop || size < sizeof(*prop)) {
>> +		pr_err("SOCFPGA: Unable to find OCRAM ECC mapping in dtb\n");
>> +		return;
>> +	}
>> +
>> +	gp = of_get_named_gen_pool(np, "iram", 0);
>> +	if (!gp) {
>> +		pr_err("SOCFPGA: OCRAM cannot find gen pool\n");
>> +		return;
>> +	}
>> +
>> +	np = of_find_compatible_node(NULL, NULL, "mmio-sram");
>> +	if (!np) {
>> +		pr_err("SOCFPGA: Unable to find mmio-sram in dtb\n");
>> +		return;
>> +	}
>> +	/* Determine the OCRAM address and size */
>> +	prop = of_get_property(np, "reg", &size);
>> +	iram_addr = be32_to_cpup(prop++);
>> +	len = be32_to_cpup(prop);
>> +
>> +	if (!prop || size < sizeof(*prop)) {
>> +		pr_err("SOCFPGA: Unable to find OCRAM mapping in dtb\n");
>> +		return;
>> +	}
>> +
>> +	iram_addr = gen_pool_alloc(gp, len);
>> +	if (iram_addr == 0) {
>> +		pr_err("SOCFPGA: cannot alloc from gen pool\n");
>> +		return;
>> +	}
>> +
>> +	memset((void *)iram_addr, 0, len);
>> +
>> +	mapped_ocr_edac_addr = ioremap(ocr_edac_addr, 4);
>> +
>> +	gen_pool_free(gp, iram_addr, len);
>> +
>> +	/* Clear any pending OCRAM ECC interrupts, then enable ECC */
>> +	writel(0x18, mapped_ocr_edac_addr);
>> +	writel(0x19, mapped_ocr_edac_addr);
> Should we better iounmap() here?
> It seems no one can use mapped_ocr_edac_addr afterwords.
>

Yes, I will make this change. Thank you!

>> +
>> +	pr_debug("SOCFPGA: Success Initializing OCRAM\n");
>> +}
>> +
> Thank you,
>
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
