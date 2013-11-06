From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH dtc] C-based DT schema checker integrated into dtc
Date: Wed, 6 Nov 2013 13:17:54 +0100
Message-ID: <20131106121752.GB6984@ulmo.nvidia.com>
References: <1382651488-9696-1-git-send-email-swarren@wwwdotorg.org>
 <2443024.JdDKnfkC18@wuerfel>
 <5277CD33.6030003@wwwdotorg.org>
 <1704730.RnIqE1USnv@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wzJLGUyc3ArbnUjN"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1704730.RnIqE1USnv@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Benoit Cousson <bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, fparent-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, Alison_Chaiken-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--wzJLGUyc3ArbnUjN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 04, 2013 at 09:43:22PM +0100, Arnd Bergmann wrote:
> On Monday 04 November 2013 09:37:07 Stephen Warren wrote:
> > > The basic idea is to extend 'devres' to automatically register
> > > all the resources (registers, irq, dma, gpio, pinctrl, clk, regulator=
, ...)
> > > and simple properties before the ->probe() callback is even called,
> > > based on a per-driver data structure that describes them, and that
> > > can be easily parsed by an external tool.
> >=20
> > I had suggested that while talking to someone at the kernel summit,
> > basically each driver supplies functions like:
> >=20
> > 1) ACPI -> platform data or resources converter
> > 2) DT -> platform or resources data converter
> > 3) anything else -> platform or resources data converter
> > 4) probe()
>=20
> FWIW, here is a very early draft of the interfaces I have in mind.
> At the moment the implementation is DT focused, but that should
> be extensible to ACPI if necessary.
>=20
> At the end, you can see how a probe function could end up looking.
> I'm sure this is full of bugs at the moment, incomplete and needs
> to be moved into actual header and C files, but it should be enough
> to get across where I'm getting with this, and to see if anyone
> thinks it's a really bad idea or won't actually work.

I know that this is completely unconstructive, but the below gives me
the creeps.

Thierry

>=20
> 	Arnd
>=20
> #if 0
> /* allocate drvdata */
> DEVM_ALLOC,
>=20
> /* request hardware properties */
> DEVM_IRQ,
> DEVM_IOMAP,
> DEVM_GPIO,
> DEVM_DMA_SLAVE,
> DEVM_PINCTRL,
> DEVM_REGULATOR,
> DEVM_CLK,
> DEVM_PWM,
> DEVM_USBPHY,
>=20
> /* auxiliary information */
> DEVM_PROP_BOOL
> DEVM_PROP_U32
> DEVM_PROP_STRING
> #endif
>=20
> #error don't bother compiling this file, it's only proof-of-concept
>=20
> struct device;
>=20
> struct devm_probe {
> 	int (*initfunc)(struct device *dev, const struct devm_probe *probe);
> 	ptrdiff_t offset;
> 	unsigned int index;
> 	const char *name;
> 	void *arg;
> 	unsigned int flags;
> };
>=20
> /* like offsetof(), but ensures that MEMBER is of type MEMBERTYPE */
> #define offsetof_t(TYPE, MEMBER, MEMBERTYPE) \
> 	((typeof(MEMBER)*)0 - typeof(MEMBERTYPE*)0 + offsetof((TYPE), (MEMBER)))
>=20
> /* cast 'ptr' to void* and cause a build warning if it wasn't of 'type' b=
efore */
> #define typecheck_ptr(ptr, type) \
> 	(void *)(ptr - (type)NULL + (type)NULL)
>=20
> /*
>  * This is the main entry point for drivers:=20
>  *
>  * Given an zero-terminated array of 'struct devm_probe' entries,
>  * this calls all initfunc pointers in the given order. Each initfunc
>  * may manipulate a field in the driver_data, as pointed to by
>  * the 'offset' member.
>  */
> int devm_probe(struct device *dev, const struct devm_probe *probe)
> {
> 	int ret;
>=20
> 	for (ret =3D 0; !ret && probe->initfunc, probe++)
> 		ret =3D probe->initfunc(dev, probe);
>=20
> 	return ret;
> }
> EXPORT_SYMBOL_GPL(devm_probe);
>=20
> /*
>  * this must be the called before any of the others, or not at
>  * all, if dev_set_drvdata() has already been called.
>  */
> static void devm_probe_alloc_release(struct device *dev, void *res)
> {
> 	dev_set_drvdata(dev, NULL);
> }
> int devm_probe_alloc(struct device *dev, const struct devm_probe *probe)
> {
> 	void *dr;
>=20
> 	if (dev_get_drvdata)
> 		return -EBUSY;
>=20
> 	dr =3D alloc_dr(devm_probe_alloc_release, probe->offset, GFP_KERNEL);
> 	if (unlikely(!dr))
> 		return -ENOMEM;
>=20
> 	dev_set_drvdata(dev, dr);
> 	set_node_dbginfo(&dr->node, "devm_probe_alloc", size);
> 	devres_add(dev, dr->data);
> }
> EXPORT_SYMBOL_GPL(devm_probe_alloc);
>=20
>=20
> #define DEVM_ALLOC(_struct) \
> 	{ .initfunc =3D devm_probe_alloc, .offset =3D sizeof(struct _struct), }
>=20
> int devm_probe_irq(struct device *dev, const struct devm_probe *probe)
> {
> 	int ret;
> 	int irq;
> 	int *irqp;
> 	int index;
> 	const char *name;
>=20
> 	/* come up with a reasonable string for the irq name,
> 	   maybe create devm_kasprintf() to allow arbitrary length? */
> 	name =3D devm_kmalloc(dev, 32, GFP_KERNEL);
> 	if (!name)
> 		return -ENOMEM;
> 	if (probe->name)
> 		snprintf(name, 32 - 1, "%s:%s", dev_name(dev), probe->name);
> 	else
> 		snprintf(name, 32 - 1, "%s:%n", dev_name(dev), probe->index);
>=20
> 	/* find IRQ number from resource if platform device */
> 	irq =3D 0;
> 	if (dev->bus_type =3D=3D &platform_bus) {
> 		struct platform_device *pdev =3D to_platform_device(dev);
>=20
> 		if (probe->name)
> 			irq =3D platform_get_irq_byname(pdev, probe->name);
> 		else
> 			irq =3D platform_get_irq(pdev, probe->index);
> 	}
>=20
> 	/* try getting irq number from device tree if that failed */
> 	if (!irq && dev->of_node) {
> 		if (probe->name)
> 			index =3D of_property_match_string(dev->of_node,
> 							 "interrupt-names",
> 							 probe->name);
> 		else
> 			index =3D probe->index;
>=20
> 		irq =3D irq_of_parse_and_map(dev->of_node, index);
> 	}
>=20
> 	/* copy irq number to driver data */
> 	irqp =3D dev_get_drvdata(dev) + probe->offset;
> 	*irqp =3D irq;
> =09
> 	return devm_request_irq(dev, irq, probe->arg, probe->flags, name, probe-=
>dev);
> }
> EXPORT_SYMBOL_GPL(devm_probe_irq);
>=20
> #define DEVM_IRQ(_struct, _member, _index, _handler, _flags) {	\
> 	.initfunc =3D devm_probe_irq,				\
> 	.offset =3D offsetof_t(struct _struct, _member, int),	\
> 	.index =3D _index,					\
> 	.arg =3D typecheck_ptr((_handler), irq_handler_t),	\
> 	.flags =3D _flags,					\
> }=09
>=20
> #define DEVM_IRQ_NAMED(_struct, _member, _name, _handler, _flags) { \
> 	.initfunc =3D devm_probe_irq,				\
> 	.offset =3D offsetof_t(struct _struct, _member, int),	\
> 	.name =3D _name,						\
> 	.arg =3D typecheck_ptr((_handler), irq_handler_t),	\
> 	.flags =3D _flags,					\
> }=09
>=20
>=20
> #define DEVM_IOMAP_NOREQUEST 1
>=20
> int devm_probe_iomap(struct device *dev, const struct devm_probe *probe)
> {
> 	struct resource res, *resp;
> 	void __iomem *vaddr;
> 	void * __iomem *vaddrp;
> 	int ret;
>=20
> 	/* find mem resource from platform device */
> 	if (dev->bus_type =3D=3D &platform_bus) {
> 		struct platform_device *pdev =3D to_platform_device(dev);
>=20
> 		if (probe->name)
> 			resp =3D platform_get_resource_byname(pdev,
> 					IORESOURCE_MEM, probe->name);
> 		else
> 			resp =3D platform_get_resource(pdev,
> 					IORESOURCE_MEM, probe->index);
> 	}
>=20
> 	/* try getting resource from device tree if that failed */
> 	if (!resp && dev->of_node) {
> 		if (probe->name)
> 			index =3D of_property_match_string(dev->of_node,
> 							 "reg-names",
> 							 probe->name);
> 		else
> 			index =3D probe->index;
>=20
> 		ret =3D of_address_to_resource(dev->of_node, index, &res);
> 		if (ret)
> 			return ret;
> 		resp =3D &res;
> 	}
>=20
>=20
> 	if (probe->flags & DEVM_IOMAP_NOREQUEST) {
> 		vaddr =3D devm_ioremap(dev, resp->start, resource_size(resp));
> 		if (!vaddr)
> 			return -EINVAL;
> 	} else {
> 		vaddr =3D devm_ioremap_resource(dev, resp);
> 		if (IS_ERR(vaddr))
> 			return PTR_ERR(vaddr);
> 	}
>=20
> 	vaddrp =3D dev_get_drvdata(dev) + probe->offset;
> 	*vaddrp =3D vaddr;
>=20
> 	return 0;
> }
> EXPORT_SYMBOL_GPL(devm_probe_iomap);
>=20
> #define DEVM_IOMAP(_struct, _member, _index, _flags) {			\
> 	.initfunc =3D devm_probe_iomap,					\
> 	.offset =3D offsetof_t(struct _struct, _member, void __iomem *),	\
> 	.index =3D _index,						\
> 	.flags =3D _flags,						\
> }=09
>=20
> #define DEVM_IOMAP_NAMED(_struct, _member, _name, _flags) { 		\
> 	.initfunc =3D devm_probe_iomap,					\
> 	.offset =3D offsetof_t(struct _struct, _member, void __iomem *),	\
> 	.name =3D _name,							\
> 	.flags =3D _flags,						\
> }=09
>=20
> int devm_probe_gpio(struct device *dev, const struct devm_probe *probe)
> {
> 	struct gpio_desc *desc, **descp;
>=20
> 	desc =3D devm_gpiod_get_index(dev, probe->name, probe->index);
> 	if (IS_ERR(desc)) {
> 		/* FIXME: this looks wrong */
> 		desc =3D of_get_named_gpiod_flags(dev->of_node, probe->name,
> 						probe->index, NULL);
> 		if (IS_ERR(desc))
> 			return PTR_ERR(desc);
> 		devm_gpio_request(dev, desc_to_gpio(desc), probe->name);
> 	}
>=20
> 	descp =3D dev_get_drvdata(dev) + probe->offset;
> 	*descp =3D desc;
>=20
> 	return 0;
> }
>=20
> #define DEVM_GPIO(_struct, _member, _index) {				 \
> 	.initfunc =3D devm_probe_iomap,					 \
> 	.offset =3D offsetof_t(struct _struct, _member, struct gpio_desc*),\
> 	.name =3D "gpios",						 \
> 	.index =3D _index,						 \
> }=09
>=20
> #define DEVM_GPIO_NAMED(_struct, _member, _name) { 			 \
> 	.initfunc =3D devm_probe_iomap,					 \
> 	.offset =3D offsetof_t(struct _struct, _member, struct gpio_desc*),\
> 	.name =3D _name,							 \
> }=09
>=20
> static void devm_probe_dma_release(struct device *dev, void *chanp)
> {
> 	dma_release_channel(*(struct dma_chan**)chanp);
> }
>=20
> int devm_probe_dma(struct device *dev, const struct devm_probe *probe)
> {
> 	struct dma_chan *chan, **chanp;
>=20
> 	/* there is no devm_dma_request_channel yet, so build our own */
> 	chanp =3D devres_alloc(devm_probe_dma_release, sizeof(chanp), GFP_KERNEL=
);
> 	if (!chanp)
> 		return -ENOMEM;
>=20
> 	chan =3D dma_request_slave_channel(dev, probe->name);
> 	if (!chan) {
> 		devres_free(chanp);
> 		return -EINVAL;
> 	}
>=20
> 	*chanp =3D chan;
> 	devres_add(dev, chanp);
>=20
> 	/* add pointer to the private data */
> 	chanp =3D dev_get_drvdata(dev) + probe->offset;
> 	*chanp =3D chan;
>=20
> 	return 0;
> }
>=20
> #define DEVM_DMA_SLAVE(_struct, _member, _name)				\
> 	.offset =3D offsetof_t(struct _struct, _member, struct dma_chan*),\
> 	.name =3D _name,							\
> }
>=20
> /*
>  * simple properties: bool, u32, string
>  * no actual need for managed interfaces, just a way to abstract the
>  * access to DT or other information source
>  */
> int devm_probe_prop_bool(struct device *dev, struct devm_probe *probe)
> {
> 	bool *val;
>=20
> 	val =3D dev_get_drvdata(dev) + probe->offset;
> 	*val =3D of_property_read_bool(dev->of_node, probe->name);
>=20
> 	return 0;
> }
> EXPORT_SYMBOL_GPL(devm_probe_prop_bool);
>=20
> #define DEVM_PROP_BOOL(_struct, _member, _name)			\
> 	.offset =3D offsetof_t(struct _struct, _member, bool),	\
> 	.name =3D _name,						\
> }
>=20
> int devm_probe_prop_u32(struct device *dev, struct devm_probe *probe)
> {
> 	u32 *val;
> 	int ret;
>=20
> 	val =3D dev_get_drvdata(dev) + probe->offset;
> 	ret =3D of_property_read_u32(dev->of_node, probe->name, val);
>=20
> 	return ret;
> }
> EXPORT_SYMBOL_GPL(devm_probe_prop_bool);
>=20
> #define DEVM_PROP_U32(_struct, _member, _name)			\
> 	.offset =3D offsetof_t(struct _struct, _member, u32),	\
> 	.name =3D _name,						\
> }
>=20
> int devm_probe_prop_string(struct device *dev, struct devm_probe *probe)
> {
> 	const char **val;
> 	int ret;
>=20
> 	val =3D dev_get_drvdata(dev) + probe->offset;
> 	ret =3D of_property_read_string(dev->of_node, probe->name, val);
>=20
> 	return ret;
> }
> EXPORT_SYMBOL_GPL(devm_probe_prop_bool);
>=20
> #define DEVM_PROP_STRING(_struct, _member, _name)			\
> 	.offset =3D offsetof_t(struct _struct, _member, const char *),	\
> 	.name =3D _name,							\
> }
>=20
> /* example driver */
> struct foo_priv {
> 	spinlock_t lock;
> 	void __iomem *regs;
> 	int irq;
> 	struct gpio_desc *gpio;
> 	struct dma_chan *rxdma;
> 	struct dma_chan *txdma;
> 	bool oldstyle_dma;
> };
>=20
> static irqreturn_t foo_irq_handler(int irq, void *dev);
>=20
> /*
>  * this lists all properties we access from the driver. The list
>  * is interpreted by devm_probe() and can be programmatically
>  * verified to match the binding.
>  */
> static const struct devm_probe foo_probe_list[] =3D {
> 	DEVM_ALLOC(foo_priv),
> 	DEVM_IOMAP(foo_priv, regs, 0, 0),
> 	DEVM_PROP_BOOL(foo_priv, oldstyle_dma, "foo,oldstyle-dma"),
> 	DEVM_DMA_SLAVE(foo_priv, rxdma, "rx");
> 	DEVM_DMA_SLAVE(foo_priv, txdma, "tx");
> 	DEVM_GPIO(foo_priv, gpio, 0);
> 	DEVM_IRQ_NAMED(foo_priv, irq, foo_irq_handler, "fifo", IRQF_SHARED),
> 	{},
> };
>=20
> static int foo_probe(struct platform_device *dev)
> {
> 	int ret;
>=20
> 	ret =3D devm_probe(dev->dev, foo_probe_list);
> 	if (ret)
> 		return ret;
>=20
> 	return bar_subsystem_register(&foo_bar_ops, dev);
> }
>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--wzJLGUyc3ArbnUjN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSejNwAAoJEN0jrNd/PrOhXLsP/RO1mWLY4pe5KdAcBkmr13DL
aNpGWLnqdM3j5hcDxaVIyxZRSjzfQapdix56xmb7fUQZ/tbssKY7wMduZzVntnla
7DKalDKXtmtO0fE6v+KCwZSBCBXffGmOh/xCttZCv55CjvUUI9OZ9rOMfUwVVFl3
RDwnimcV4uVt60+gr9+ov49sfbUvwfycUNm6qqHuKtyVxG8UGdOOlmkO3TB3oOaz
pOIFyYBEa+CCS7hWDcHTNqgCeosmd/+7800z8KzypXZe+bVfjavJ/t4iVpKUJBIn
j0i7XadAhzw7Rv19Ix2951hXmcXCjGMoHnRoR7T02XqmfOZamaJUVe1Rl0VTZnLh
IpE66FvHKLHCbi0mlMvdAhE8qoTi6QfVe6kp5wnHs8a4s2n7Z+WsHRSIYip788JM
KGcrChpV6GHzWWY4i0RnC7kRtW+Yastn3fFWhKqWET2brxDMZ+5UHMIMpfjbCUO0
8yW4shOOdWekx7lXDcAGnhIAy0L0wD00COi/NizEBsxynD6NI6/iyuPa1ZSpZ0wd
Cmgm4dmRYLfnXXC5KhBZYFQQxQD4/SZKNAKduAAiEM0PLbLzqkV6OJ9gGaLHaB9L
WxdgE7/3k0S6oUzXfKKm4yYv7n/N30l1uklBQuaRnZ7vrvVQImHfObqNJQ6hbr7U
wADFm9hCtyLuqaT3BYFv
=O28+
-----END PGP SIGNATURE-----

--wzJLGUyc3ArbnUjN--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
