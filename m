From: Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH 4/7] dt-bindings: sdm845-pinctrl: add wakeup interrupt
 parent for GPIO
Date: Wed, 6 Feb 2019 10:07:30 -0700
Message-ID: <20190206170730.GA16254@codeaurora.org>
References: <20181219221105.3004-5-ilina@codeaurora.org>
 <20181229000714.GA3654@bogus>
 <20190107185113.GH14960@codeaurora.org>
 <CAL_Jsq+McuN5F9_a2bmECegR65vziNATpUqt4hysKL7FT=b9RA@mail.gmail.com>
 <20190109173111.GB22547@codeaurora.org>
 <CAL_JsqL1z-iOewqBeE43n1cVSGiQyOPHBGbRmEm9zcVLJkoLEA@mail.gmail.com>
 <154724884881.169631.9705938789464714812@swboyd.mtv.corp.google.com>
 <154827672955.136743.8509585166504871320@swboyd.mtv.corp.google.com>
 <154897162267.169292.1911486544543857784@swboyd.mtv.corp.google.com>
 <154900498906.169292.1193422735086292701@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <154900498906.169292.1193422735086292701@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Evan Green <evgreen@chromium.org>, Marc Zyngier <marc.zyngier@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

Thanks for the patch Stephen. Sorry, it took a while to get to this and
understand how this works.

On Thu, Jan 31 2019 at 00:10 -0700, Stephen Boyd wrote:
>Quoting Stephen Boyd (2019-01-31 13:53:42)
>>
>> I'm prototyping out some code to do the remapping based on this type of
>> DT property, because it will make the irqdomain::alloc function a little
>> simpler to implement by passing in a struct irq_fwspec and getting out a
>> parent irq_fwspec and it will make the patches to add these mapping
>> tables in C irrelevant. Plus, I think Lina will be happy that the
>> pinctrl driver will know if some pin maps to the PDC or not without
>> having to see if it fails to allocate in the parent irqdomain. But there
>> will still need to be a property for 'wakeup-parent' unless we do
>> something to expose irqdomain tokens into DT.
>>
>
>And here's the code to do this remapping idea, heavily based on the
>phandle remapping code. I didn't properly fix up the irq alloc function
>for the pinctrl driver here, but it should work out properly without
>much more diff. I realize now that the pass-thru mechanism will fail
>horribly when a specifier changes size types.
Could you explain?
>I guess we'll need to keep
>that in mind if we convert the PDC driver to this too. Or we can leave
>the PDC driver as is and not worry about listing out the individual
>pins.
The PDC pins are more sequential and it looks clean as it. I would
prefer that it be left as is.
>
>-----8<-----
>diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>index a2241dd9c185..6b3a4227f433 100644
>--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>@@ -1213,6 +1213,83 @@
> 			#interrupt-cells = <2>;
> 			gpio-ranges = <&tlmm 0 0 150>;
> 			wakeup-parent = <&pdc_intc>;
>+			irqdomain-map = <1 0 &pdc_intc 30 0>,
>+					<3 0 &pdc_intc 31 0>,
>+					<5 0 &pdc_intc 32 0>,
>+					<10 0 &pdc_intc 33 0>,
>+					<11 0 &pdc_intc 34 0>,
>+					<20 0 &pdc_intc 35 0>,
>+					<22 0 &pdc_intc 36 0>,
>+					<24 0 &pdc_intc 37 0>,
>+					<26 0 &pdc_intc 38 0>,
>+					<30 0 &pdc_intc 39 0>,
>+					<31 0 &pdc_intc 117 0>,
>+					<32 0 &pdc_intc 41 0>,
>+					<34 0 &pdc_intc 42 0>,
>+					<36 0 &pdc_intc 43 0>,
>+					<37 0 &pdc_intc 44 0>,
>+					<38 0 &pdc_intc 45 0>,
>+					<39 0 &pdc_intc 46 0>,
>+					<40 0 &pdc_intc 47 0>,
>+					<41 0 &pdc_intc 115 0>,
>+					<43 0 &pdc_intc 49 0>,
>+					<44 0 &pdc_intc 50 0>,
>+					<46 0 &pdc_intc 51 0>,
>+					<48 0 &pdc_intc 52 0>,
>+					<49 0 &pdc_intc 118 0>,
>+					<52 0 &pdc_intc 54 0>,
>+					<53 0 &pdc_intc 55 0>,
>+					<54 0 &pdc_intc 56 0>,
>+					<56 0 &pdc_intc 57 0>,
>+					<57 0 &pdc_intc 58 0>,
>+					<58 0 &pdc_intc 59 0>,
>+					<59 0 &pdc_intc 60 0>,
>+					<60 0 &pdc_intc 61 0>,
>+					<61 0 &pdc_intc 62 0>,
>+					<62 0 &pdc_intc 63 0>,
>+					<63 0 &pdc_intc 64 0>,
>+					<64 0 &pdc_intc 65 0>,
>+					<66 0 &pdc_intc 66 0>,
>+					<68 0 &pdc_intc 67 0>,
>+					<71 0 &pdc_intc 68 0>,
>+					<73 0 &pdc_intc 69 0>,
>+					<77 0 &pdc_intc 70 0>,
>+					<78 0 &pdc_intc 71 0>,
>+					<79 0 &pdc_intc 72 0>,
>+					<80 0 &pdc_intc 73 0>,
>+					<84 0 &pdc_intc 74 0>,
>+					<85 0 &pdc_intc 75 0>,
>+					<86 0 &pdc_intc 76 0>,
>+					<88 0 &pdc_intc 77 0>,
>+					<89 0 &pdc_intc 116 0>,
>+					<91 0 &pdc_intc 79 0>,
>+					<92 0 &pdc_intc 80 0>,
>+					<95 0 &pdc_intc 81 0>,
>+					<96 0 &pdc_intc 82 0>,
>+					<97 0 &pdc_intc 83 0>,
>+					<101 0 &pdc_intc 84 0>,
>+					<103 0 &pdc_intc 85 0>,
>+					<104 0 &pdc_intc 86 0>,
>+					<115 0 &pdc_intc 90 0>,
>+					<116 0 &pdc_intc 91 0>,
>+					<117 0 &pdc_intc 92 0>,
>+					<118 0 &pdc_intc 93 0>,
>+					<119 0 &pdc_intc 94 0>,
>+					<120 0 &pdc_intc 95 0>,
>+					<121 0 &pdc_intc 96 0>,
>+					<122 0 &pdc_intc 97 0>,
>+					<123 0 &pdc_intc 98 0>,
>+					<124 0 &pdc_intc 99 0>,
>+					<125 0 &pdc_intc 100 0>,
>+					<127 0 &pdc_intc 102 0>,
>+					<128 0 &pdc_intc 103 0>,
>+					<129 0 &pdc_intc 104 0>,
>+					<130 0 &pdc_intc 105 0>,
>+					<132 0 &pdc_intc 106 0>,
>+					<133 0 &pdc_intc 107 0>,
>+					<145 0 &pdc_intc 108 0>;
>+			irqdomain-map-mask = <0xff 0>;
>+			irqdomain-map-pass-thru = <0 0xff>;
Where do we document these bindings?
>
> 			qspi_clk: qspi-clk {
> 				pinmux {
>diff --git a/drivers/of/irq.c b/drivers/of/irq.c
>index 02ad93a304a4..b37f4cdfda53 100644
>--- a/drivers/of/irq.c
>+++ b/drivers/of/irq.c
>@@ -274,6 +274,130 @@ int of_irq_parse_raw(const __be32 *addr, struct of_phandle_args *out_irq)
> }
> EXPORT_SYMBOL_GPL(of_irq_parse_raw);
>
I would think this would be a separate patch and I presume, I can add
you as the author with your signed-off-by?

>+int of_irq_domain_map(const struct irq_fwspec *in, struct irq_fwspec *out)
>+{
>+	char *stem_name;
>+	char *cells_name, *map_name = NULL, *mask_name = NULL;
>+	char *pass_name = NULL;
>+	struct device_node *cur, *new = NULL;
>+	const __be32 *map, *mask, *pass;
>+	static const __be32 dummy_mask[] = { [0 ... MAX_PHANDLE_ARGS] = ~0 };
>+	static const __be32 dummy_pass[] = { [0 ... MAX_PHANDLE_ARGS] = 0 };
>+	__be32 initial_match_array[MAX_PHANDLE_ARGS];
>+	const __be32 *match_array = initial_match_array;
>+	int i, ret, map_len, match;
>+	u32 in_size, out_size;
>+
>+	stem_name = "";
>+	cells_name = "#interrupt-cells";
>+
>+	ret = -ENOMEM;
>+	map_name = kasprintf(GFP_KERNEL, "irqdomain%s-map", stem_name);
>+	if (!map_name)
>+		goto free;
>+
>+	mask_name = kasprintf(GFP_KERNEL, "irqdomain%s-map-mask", stem_name);
>+	if (!mask_name)
>+		goto free;
>+
>+	pass_name = kasprintf(GFP_KERNEL, "irqdomain%s-map-pass-thru", stem_name);
>+	if (!pass_name)
>+		goto free;
>+
>+	/* Get the #interrupt-cells property */
>+	cur = to_of_node(in->fwnode);
>+	ret = of_property_read_u32(cur, cells_name, &in_size);
>+	if (ret < 0)
>+		goto put;
>+
>+	/* Precalculate the match array - this simplifies match loop */
>+	for (i = 0; i < in_size; i++)
>+		initial_match_array[i] = cpu_to_be32(in->param[i]);
>+
>+	ret = -EINVAL;
>+	/* Get the irqdomain-map property */
>+	map = of_get_property(cur, map_name, &map_len);
>+	if (!map) {
>+		ret = 0;
>+		goto free;
>+	}
>+	map_len /= sizeof(u32);
>+
>+	/* Get the irqdomain-map-mask property (optional) */
>+	mask = of_get_property(cur, mask_name, NULL);
>+	if (!mask)
>+		mask = dummy_mask;
>+	/* Iterate through irqdomain-map property */
>+	match = 0;
>+	while (map_len > (in_size + 1) && !match) {
>+		/* Compare specifiers */
>+		match = 1;
>+		for (i = 0; i < in_size; i++, map_len--)
>+			match &= !((match_array[i] ^ *map++) & mask[i]);
>+
>+		of_node_put(new);
>+		new = of_find_node_by_phandle(be32_to_cpup(map));
>+		map++;
>+		map_len--;
>+
>+		/* Check if not found */
>+		if (!new)
>+			goto put;
>+
>+		if (!of_device_is_available(new))
>+			match = 0;
>+
>+		ret = of_property_read_u32(new, cells_name, &out_size);
>+		if (ret)
>+			goto put;
>+
>+		/* Check for malformed properties */
>+		if (WARN_ON(out_size > MAX_PHANDLE_ARGS))
>+			goto put;
>+		if (map_len < out_size)
>+			goto put;
>+
>+		/* Move forward by new node's #interrupt-cells amount */
>+		map += out_size;
>+		map_len -= out_size;
Nit: Could make this a bit simpler to understand if you broke out the
loop on match instead of continuing the loop.
>+	}
>+	if (match) {
>+		/* Get the irqdomain-map-pass-thru property (optional) */
>+		pass = of_get_property(cur, pass_name, NULL);
>+		if (!pass)
>+			pass = dummy_pass;
>+
>+		/*
>+		 * Successfully parsed a irqdomain-map translation; copy new
>+		 * specifier into the out structure, keeping the
>+		 * bits specified in irqdomain-map-pass-thru.
>+		 */
>+		match_array = map - out_size;
>+		for (i = 0; i < out_size; i++) {
>+			__be32 val = *(map - out_size + i);
>+
>+			out->param[i] = in->param[i];
>+			if (i < in_size) {
>+				val &= ~pass[i];
I don't get why the mask is inverted and reversed here again?
>+				val |= cpu_to_be32(out->param[i]) & pass[i];
>+			}
>+
>+			out->param[i] = be32_to_cpu(val);
>+		}
>+		out->param_count = in_size = out_size;
>+		out->fwnode = of_node_to_fwnode(new);
>+	}
>+put:
>+	of_node_put(new);
>+free:
>+	kfree(mask_name);
>+	kfree(map_name);
>+	kfree(pass_name);
>+
>+	return ret;
>+}
>+EXPORT_SYMBOL(of_irq_domain_map);
>+
> /**
>  * of_irq_parse_one - Resolve an interrupt for a device
>  * @device: the device whose interrupt is to be resolved
>diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
>index 9b45219893bd..0473b180dc8d 100644
>--- a/drivers/pinctrl/qcom/pinctrl-msm.c
>+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
>@@ -1011,6 +1011,12 @@ static int msm_gpio_domain_alloc(struct irq_domain *domain, unsigned int virq,
> 	if (!domain->parent)
> 		return 0;
>
>+	ret = of_irq_domain_map(fwspec, &parent.fwspec);
>+	if (ret)
>+		return ret;
>+
>+	pr_info("incoming is %d %#x and outgoing is %d %#x\n", fwspec->param[0], fwspec->param[1], parent.fwspec.param[0], parent.fwspec.param[1]);
>+
> 	parent.fwspec.fwnode      = domain->parent->fwnode;
> 	parent.fwspec.param_count = 2;
> 	parent.fwspec.param[0]    = hwirq;
>diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
>index 1214cabb2247..80ba1e9be68d 100644
>--- a/include/linux/of_irq.h
>+++ b/include/linux/of_irq.h
>@@ -32,6 +32,8 @@ static inline int of_irq_parse_oldworld(struct device_node *device, int index,
> }
> #endif /* CONFIG_PPC32 && CONFIG_PPC_PMAC */
>
>+extern int of_irq_domain_map(const struct irq_fwspec *in, struct irq_fwspec *out);
>+
> extern int of_irq_parse_raw(const __be32 *addr, struct of_phandle_args *out_irq);
> extern int of_irq_parse_one(struct device_node *device, int index,
> 			  struct of_phandle_args *out_irq);
