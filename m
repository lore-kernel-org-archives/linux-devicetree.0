From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 4/7] dt-bindings: sdm845-pinctrl: add wakeup interrupt parent for GPIO
Date: Thu, 31 Jan 2019 23:09:49 -0800
Message-ID: <154900498906.169292.1193422735086292701@swboyd.mtv.corp.google.com>
References: <20181219221105.3004-1-ilina@codeaurora.org> <20181219221105.3004-5-ilina@codeaurora.org> <20181229000714.GA3654@bogus> <20190107185113.GH14960@codeaurora.org> <CAL_Jsq+McuN5F9_a2bmECegR65vziNATpUqt4hysKL7FT=b9RA@mail.gmail.com> <20190109173111.GB22547@codeaurora.org> <CAL_JsqL1z-iOewqBeE43n1cVSGiQyOPHBGbRmEm9zcVLJkoLEA@mail.gmail.com> <154724884881.169631.9705938789464714812@swboyd.mtv.corp.google.com> <154827672955.136743.8509585166504871320@swboyd.mtv.corp.google.com> <154897162267.169292.1911486544543857784@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154897162267.169292.1911486544543857784@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lina Iyer <ilina@codeaurora.org>, Rob Herring <robh@kernel.org>
Cc: Evan Green <evgreen@chromium.org>, Marc Zyngier <marc.zyngier@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

Quoting Stephen Boyd (2019-01-31 13:53:42)
>=20
> I'm prototyping out some code to do the remapping based on this type of
> DT property, because it will make the irqdomain::alloc function a little
> simpler to implement by passing in a struct irq_fwspec and getting out a
> parent irq_fwspec and it will make the patches to add these mapping
> tables in C irrelevant. Plus, I think Lina will be happy that the
> pinctrl driver will know if some pin maps to the PDC or not without
> having to see if it fails to allocate in the parent irqdomain. But there
> will still need to be a property for 'wakeup-parent' unless we do
> something to expose irqdomain tokens into DT.
>=20

And here's the code to do this remapping idea, heavily based on the
phandle remapping code. I didn't properly fix up the irq alloc function
for the pinctrl driver here, but it should work out properly without
much more diff. I realize now that the pass-thru mechanism will fail
horribly when a specifier changes size types. I guess we'll need to keep
that in mind if we convert the PDC driver to this too. Or we can leave
the PDC driver as is and not worry about listing out the individual
pins.

-----8<-----
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qco=
m/sdm845.dtsi
index a2241dd9c185..6b3a4227f433 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1213,6 +1213,83 @@
 			#interrupt-cells =3D <2>;
 			gpio-ranges =3D <&tlmm 0 0 150>;
 			wakeup-parent =3D <&pdc_intc>;
+			irqdomain-map =3D <1 0 &pdc_intc 30 0>,
+					<3 0 &pdc_intc 31 0>,
+					<5 0 &pdc_intc 32 0>,
+					<10 0 &pdc_intc 33 0>,
+					<11 0 &pdc_intc 34 0>,
+					<20 0 &pdc_intc 35 0>,
+					<22 0 &pdc_intc 36 0>,
+					<24 0 &pdc_intc 37 0>,
+					<26 0 &pdc_intc 38 0>,
+					<30 0 &pdc_intc 39 0>,
+					<31 0 &pdc_intc 117 0>,
+					<32 0 &pdc_intc 41 0>,
+					<34 0 &pdc_intc 42 0>,
+					<36 0 &pdc_intc 43 0>,
+					<37 0 &pdc_intc 44 0>,
+					<38 0 &pdc_intc 45 0>,
+					<39 0 &pdc_intc 46 0>,
+					<40 0 &pdc_intc 47 0>,
+					<41 0 &pdc_intc 115 0>,
+					<43 0 &pdc_intc 49 0>,
+					<44 0 &pdc_intc 50 0>,
+					<46 0 &pdc_intc 51 0>,
+					<48 0 &pdc_intc 52 0>,
+					<49 0 &pdc_intc 118 0>,
+					<52 0 &pdc_intc 54 0>,
+					<53 0 &pdc_intc 55 0>,
+					<54 0 &pdc_intc 56 0>,
+					<56 0 &pdc_intc 57 0>,
+					<57 0 &pdc_intc 58 0>,
+					<58 0 &pdc_intc 59 0>,
+					<59 0 &pdc_intc 60 0>,
+					<60 0 &pdc_intc 61 0>,
+					<61 0 &pdc_intc 62 0>,
+					<62 0 &pdc_intc 63 0>,
+					<63 0 &pdc_intc 64 0>,
+					<64 0 &pdc_intc 65 0>,
+					<66 0 &pdc_intc 66 0>,
+					<68 0 &pdc_intc 67 0>,
+					<71 0 &pdc_intc 68 0>,
+					<73 0 &pdc_intc 69 0>,
+					<77 0 &pdc_intc 70 0>,
+					<78 0 &pdc_intc 71 0>,
+					<79 0 &pdc_intc 72 0>,
+					<80 0 &pdc_intc 73 0>,
+					<84 0 &pdc_intc 74 0>,
+					<85 0 &pdc_intc 75 0>,
+					<86 0 &pdc_intc 76 0>,
+					<88 0 &pdc_intc 77 0>,
+					<89 0 &pdc_intc 116 0>,
+					<91 0 &pdc_intc 79 0>,
+					<92 0 &pdc_intc 80 0>,
+					<95 0 &pdc_intc 81 0>,
+					<96 0 &pdc_intc 82 0>,
+					<97 0 &pdc_intc 83 0>,
+					<101 0 &pdc_intc 84 0>,
+					<103 0 &pdc_intc 85 0>,
+					<104 0 &pdc_intc 86 0>,
+					<115 0 &pdc_intc 90 0>,
+					<116 0 &pdc_intc 91 0>,
+					<117 0 &pdc_intc 92 0>,
+					<118 0 &pdc_intc 93 0>,
+					<119 0 &pdc_intc 94 0>,
+					<120 0 &pdc_intc 95 0>,
+					<121 0 &pdc_intc 96 0>,
+					<122 0 &pdc_intc 97 0>,
+					<123 0 &pdc_intc 98 0>,
+					<124 0 &pdc_intc 99 0>,
+					<125 0 &pdc_intc 100 0>,
+					<127 0 &pdc_intc 102 0>,
+					<128 0 &pdc_intc 103 0>,
+					<129 0 &pdc_intc 104 0>,
+					<130 0 &pdc_intc 105 0>,
+					<132 0 &pdc_intc 106 0>,
+					<133 0 &pdc_intc 107 0>,
+					<145 0 &pdc_intc 108 0>;
+			irqdomain-map-mask =3D <0xff 0>;
+			irqdomain-map-pass-thru =3D <0 0xff>;
=20
 			qspi_clk: qspi-clk {
 				pinmux {
diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 02ad93a304a4..b37f4cdfda53 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -274,6 +274,130 @@ int of_irq_parse_raw(const __be32 *addr, struct of_ph=
andle_args *out_irq)
 }
 EXPORT_SYMBOL_GPL(of_irq_parse_raw);
=20
+int of_irq_domain_map(const struct irq_fwspec *in, struct irq_fwspec *out)
+{
+	char *stem_name;
+	char *cells_name, *map_name =3D NULL, *mask_name =3D NULL;
+	char *pass_name =3D NULL;
+	struct device_node *cur, *new =3D NULL;
+	const __be32 *map, *mask, *pass;
+	static const __be32 dummy_mask[] =3D { [0 ... MAX_PHANDLE_ARGS] =3D ~0 };
+	static const __be32 dummy_pass[] =3D { [0 ... MAX_PHANDLE_ARGS] =3D 0 };
+	__be32 initial_match_array[MAX_PHANDLE_ARGS];
+	const __be32 *match_array =3D initial_match_array;
+	int i, ret, map_len, match;
+	u32 in_size, out_size;
+
+	stem_name =3D "";
+	cells_name =3D "#interrupt-cells";
+
+	ret =3D -ENOMEM;
+	map_name =3D kasprintf(GFP_KERNEL, "irqdomain%s-map", stem_name);
+	if (!map_name)
+		goto free;
+
+	mask_name =3D kasprintf(GFP_KERNEL, "irqdomain%s-map-mask", stem_name);
+	if (!mask_name)
+		goto free;
+
+	pass_name =3D kasprintf(GFP_KERNEL, "irqdomain%s-map-pass-thru", stem_nam=
e);
+	if (!pass_name)
+		goto free;
+
+	/* Get the #interrupt-cells property */
+	cur =3D to_of_node(in->fwnode);
+	ret =3D of_property_read_u32(cur, cells_name, &in_size);
+	if (ret < 0)
+		goto put;
+
+	/* Precalculate the match array - this simplifies match loop */
+	for (i =3D 0; i < in_size; i++)
+		initial_match_array[i] =3D cpu_to_be32(in->param[i]);
+
+	ret =3D -EINVAL;
+	/* Get the irqdomain-map property */
+	map =3D of_get_property(cur, map_name, &map_len);
+	if (!map) {
+		ret =3D 0;
+		goto free;
+	}
+	map_len /=3D sizeof(u32);
+
+	/* Get the irqdomain-map-mask property (optional) */
+	mask =3D of_get_property(cur, mask_name, NULL);
+	if (!mask)
+		mask =3D dummy_mask;
+	/* Iterate through irqdomain-map property */
+	match =3D 0;
+	while (map_len > (in_size + 1) && !match) {
+		/* Compare specifiers */
+		match =3D 1;
+		for (i =3D 0; i < in_size; i++, map_len--)
+			match &=3D !((match_array[i] ^ *map++) & mask[i]);
+
+		of_node_put(new);
+		new =3D of_find_node_by_phandle(be32_to_cpup(map));
+		map++;
+		map_len--;
+
+		/* Check if not found */
+		if (!new)
+			goto put;
+
+		if (!of_device_is_available(new))
+			match =3D 0;
+
+		ret =3D of_property_read_u32(new, cells_name, &out_size);
+		if (ret)
+			goto put;
+
+		/* Check for malformed properties */
+		if (WARN_ON(out_size > MAX_PHANDLE_ARGS))
+			goto put;
+		if (map_len < out_size)
+			goto put;
+
+		/* Move forward by new node's #interrupt-cells amount */
+		map +=3D out_size;
+		map_len -=3D out_size;
+	}
+	if (match) {
+		/* Get the irqdomain-map-pass-thru property (optional) */
+		pass =3D of_get_property(cur, pass_name, NULL);
+		if (!pass)
+			pass =3D dummy_pass;
+
+		/*
+		 * Successfully parsed a irqdomain-map translation; copy new
+		 * specifier into the out structure, keeping the
+		 * bits specified in irqdomain-map-pass-thru.
+		 */
+		match_array =3D map - out_size;
+		for (i =3D 0; i < out_size; i++) {
+			__be32 val =3D *(map - out_size + i);
+
+			out->param[i] =3D in->param[i];
+			if (i < in_size) {
+				val &=3D ~pass[i];
+				val |=3D cpu_to_be32(out->param[i]) & pass[i];
+			}
+
+			out->param[i] =3D be32_to_cpu(val);
+		}
+		out->param_count =3D in_size =3D out_size;
+		out->fwnode =3D of_node_to_fwnode(new);
+	}
+put:
+	of_node_put(new);
+free:
+	kfree(mask_name);
+	kfree(map_name);
+	kfree(pass_name);
+
+	return ret;
+}
+EXPORT_SYMBOL(of_irq_domain_map);
+
 /**
  * of_irq_parse_one - Resolve an interrupt for a device
  * @device: the device whose interrupt is to be resolved
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinc=
trl-msm.c
index 9b45219893bd..0473b180dc8d 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1011,6 +1011,12 @@ static int msm_gpio_domain_alloc(struct irq_domain *=
domain, unsigned int virq,
 	if (!domain->parent)
 		return 0;
=20
+	ret =3D of_irq_domain_map(fwspec, &parent.fwspec);
+	if (ret)
+		return ret;
+
+	pr_info("incoming is %d %#x and outgoing is %d %#x\n", fwspec->param[0], =
fwspec->param[1], parent.fwspec.param[0], parent.fwspec.param[1]);
+
 	parent.fwspec.fwnode      =3D domain->parent->fwnode;
 	parent.fwspec.param_count =3D 2;
 	parent.fwspec.param[0]    =3D hwirq;
diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index 1214cabb2247..80ba1e9be68d 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -32,6 +32,8 @@ static inline int of_irq_parse_oldworld(struct device_nod=
e *device, int index,
 }
 #endif /* CONFIG_PPC32 && CONFIG_PPC_PMAC */
=20
+extern int of_irq_domain_map(const struct irq_fwspec *in, struct irq_fwspe=
c *out);
+
 extern int of_irq_parse_raw(const __be32 *addr, struct of_phandle_args *ou=
t_irq);
 extern int of_irq_parse_one(struct device_node *device, int index,
 			  struct of_phandle_args *out_irq);
