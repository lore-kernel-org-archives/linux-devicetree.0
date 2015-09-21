From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] mfd: tps65912: Rewrite driver adding DT support and
 using regmap
Date: Tue, 22 Sep 2015 00:04:45 +0100
Message-ID: <20150921230445.GA11284@x1>
References: <1442339861-30300-1-git-send-email-afd@ti.com>
 <1442339861-30300-3-git-send-email-afd@ti.com>
 <20150920041644.GF3039@x1>
 <56004AE8.5030504@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56004AE8.5030504-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 21 Sep 2015, Andrew F. Davis wrote:
> On 09/19/2015 11:16 PM, Lee Jones wrote:
> >On Tue, 15 Sep 2015, Andrew F. Davis wrote:
> >
> >>The old driver does not support DT. Rewrite the driver adding DT su=
pport
> >>and use modern kernel features such as regmap and related helpers.
> >>
> >>Signed-off-by: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
> >>---
> >>  drivers/gpio/gpio-tps65912.c           | 291 ++++++------
> >>  drivers/mfd/Kconfig                    |  20 +-
> >>  drivers/mfd/Makefile                   |   3 +-
> >>  drivers/mfd/tps65912-core.c            | 288 +++++-------
> >>  drivers/mfd/tps65912-i2c.c             | 233 ++++------
> >>  drivers/mfd/tps65912-irq.c             | 217 ---------
> >>  drivers/mfd/tps65912-spi.c             | 236 ++++------
> >>  drivers/regulator/tps65912-regulator.c | 783 ++++++++++----------=
-------------
> >>  include/linux/mfd/tps65912.h           | 256 +++++++----
> >>  9 files changed, 854 insertions(+), 1473 deletions(-)
> >>  rewrite drivers/gpio/gpio-tps65912.c (68%)
> >>  rewrite drivers/mfd/tps65912-core.c (96%)
> >>  rewrite drivers/mfd/tps65912-i2c.c (92%)
> >>  delete mode 100644 drivers/mfd/tps65912-irq.c
> >>  rewrite drivers/mfd/tps65912-spi.c (91%)
> >>  rewrite drivers/regulator/tps65912-regulator.c (94%)
> >
> >Is there really no other way to split this up?
>=20
> I don't think so, not without breaking stuff, all the files are stron=
gly
> connected.

I believe you've already had this conversation with Mark, so I'll not
labour it.

[...]

> >>+#include <linux/interrupt.h>
> >>+#include <linux/module.h>
> >>+#include <linux/of_device.h>
> >>+
> >
> >No need for the '\n'.
> >
>=20
> Is it prohibited? It seems a lot over files do it this way, I persona=
lly
> think it makes it cleaner to see what headers are driver local. If yo=
u
> really don't like it have have no problem removing it though.

It's not a blocker.

> >>+#include <linux/mfd/tps65912.h>
> >>+
> >>+#define TPS65912_IRQ(_name, _reg, _offset)	\
> >>+	[TPS65912_IRQ_ ## _name] =3D {	\
> >>+		.mask =3D TPS65912_ ## _reg ## _ ## _name,	\
> >>+		.reg_offset =3D _offset,	\
> >>+	}
> >
> >If you find this useful, then others will too.
> >
> >Please submit this to Mark Brown.
>=20
> This is a really horrible macro hack I made so I didn't have to type
> out the whole register name each time, I'm not sure anyone else
> could use this, a better solution for most would be to use less
> verbose #defines for register names.

http://www.gossamer-threads.com/lists/linux/kernel/2261088

[...]

> >>+	.name =3D "tps65912",
> >>+	.irqs =3D tps65912_irqs,
> >>+	.num_irqs =3D ARRAY_SIZE(tps65912_irqs),
> >>+
> >>+	.num_regs =3D 4,
> >
> >Why do you have 2 num_regs entries?
>=20
> Not sure what you mean, the other is num_irqs?

That's what no sleep on a plane gets you.

Please ignore.

[...]

> >>+#include <linux/mfd/tps65912.h>
> >>+
> >>+static const struct of_device_id tps65912_i2c_of_match_table[] =3D=
 {
> >>+	{ .compatible =3D "ti,tps65912", },
> >>+	{ /*sentinel*/ }
> >
> >No need for this comment.  We know what { } does.
>=20
> We do, but I didn't when I first saw this kind of thing, everything i=
s
> obvious to someone, I'm not sure trying to keep the kernel as comment
> bare as it is is a good idea. Plus, how many chances do you get to
> use the word "sentinel" :). But I'll remove it if you have a strong
> opposition to it.

Again, it's not a blocker, but I believe there are enough of these now
and they have been around long enough that any non-noob will know what
they mean.  But granted, "sentinel" is a cool word.  Either remove it
completely, or at least conform to the Kernel's single line
commentating standards (HINT: Whitespace).

> >>+};
> >>+
> >>+static int tps65912_i2c_probe(struct i2c_client *client,
> >>+			      const struct i2c_device_id *ids)
> >>+{
> >>+	struct tps65912 *tps;
> >>+	const struct of_device_id *match;
> >>+
> >>+	match =3D of_match_device(tps65912_i2c_of_match_table, &client->d=
ev);
> >>+	if (!match) {
> >>+		dev_err(&client->dev, "Failed to find matching DT id\n");
> >>+		return -EINVAL;
> >>+	}
> >
> >Why are you matching?
> >
>=20
> It looks like other drivers do this so they will fail early if they w=
ere
> not instantiated with DT. Here we don't need the match, so I'll just
> drop this check.

They should not be doing that either.

> >>+	tps =3D devm_kzalloc(&client->dev, sizeof(*tps), GFP_KERNEL);
> >>+	if (!tps)
> >>+		return -ENOMEM;
> >>+
> >>+	i2c_set_clientdata(client, tps);
> >>+	tps->dev =3D &client->dev;
> >>+	tps->irq =3D client->irq;
> >>+
> >>+	tps->regmap =3D devm_regmap_init_i2c(client, &tps65912_regmap_con=
fig);
> >>+	if (IS_ERR(tps->regmap)) {
> >>+		int ret =3D PTR_ERR(tps->regmap);
> >
> >Neater just to declare 'int ret' up the top like we always do.
>=20
> Linus has decreed we should not mix code and declerations outside of =
C89,
> and so I will not, but ret is at the top of its scope and so is confo=
rment
> to C89. Moving it further up might be overly overly pedantic.
>=20
> But if you think it would be really neater I can move it :)

Again, it's not a 'standard' per say and not a blocker, but it would
be conforming to the way we normally do things.

[...]

> >>+	{ "tps65912", TPS65912 },
> >
> >This doesn't appear to be used?
> >
>=20
> The TPS65912 part is not, but it may someday get an extra device ID,
> some use just 0 for the second field, but I have TPS65912 defined so
> might as well use it.

I'm not into adding code for 'may some day's.  If it's not used,
please remove it.

> >>+	{ /*sentinel*/ },
> >
> >As before.
> >
> >>+};
> >>+MODULE_DEVICE_TABLE(i2c, tps65912_i2c_id_table);
> >>+
> >>+static struct i2c_driver tps65912_i2c_driver =3D {
> >>+	.driver		=3D {
> >>+		.name	=3D "tps65912",
> >>+		.of_match_table =3D tps65912_i2c_of_match_table,
> >>+	},
> >>+	.probe		=3D tps65912_i2c_probe,
> >>+	.remove		=3D tps65912_i2c_remove,
> >>+	.id_table       =3D tps65912_i2c_id_table,
> >>+};
> >>+
> >>+module_i2c_driver(tps65912_i2c_driver);
> >>+
> >>+MODULE_AUTHOR("Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>");
> >>+MODULE_DESCRIPTION("TPS65912x I2C Interface Driver");
> >>+MODULE_LICENSE("GPL v2");
> >>diff --git a/drivers/mfd/tps65912-irq.c b/drivers/mfd/tps65912-irq.=
c
> >>deleted file mode 100644
> >>index db2c29c..0000000
> >>--- a/drivers/mfd/tps65912-irq.c
> >>+++ /dev/null
> >>@@ -1,217 +0,0 @@
> >>-/*
> >>- * tps65912-irq.c  --  TI TPS6591x
> >>- *
> >>- * Copyright 2011 Texas Instruments Inc.
> >>- *
> >>- * Author: Margarita Olaya <magi-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>
> >>- *
> >>- *  This program is free software; you can redistribute it and/or =
modify it
> >>- *  under  the terms of the GNU General  Public License as publish=
ed by the
> >>- *  Free Software Foundation;  either version 2 of the License, or=
 (at your
> >>- *  option) any later version.
> >>- *
> >>- * This driver is based on wm8350 implementation.
> >>- */
> >>-
> >>-#include <linux/kernel.h>
> >>-#include <linux/module.h>
> >>-#include <linux/bug.h>
> >>-#include <linux/device.h>
> >>-#include <linux/interrupt.h>
> >>-#include <linux/irq.h>
> >>-#include <linux/gpio.h>
> >>-#include <linux/mfd/tps65912.h>
> >>-
> >>-static inline int irq_to_tps65912_irq(struct tps65912 *tps65912,
> >>-							int irq)
> >>-{
> >>-	return irq - tps65912->irq_base;
> >>-}
> >>-
> >>-/*
> >>- * This is a threaded IRQ handler so can access I2C/SPI.  Since th=
e
> >>- * IRQ handler explicitly clears the IRQ it handles the IRQ line
> >>- * will be reasserted and the physical IRQ will be handled again i=
f
> >>- * another interrupt is asserted while we run - in the normal cour=
se
> >>- * of events this is a rare occurrence so we save I2C/SPI reads. W=
e're
> >>- * also assuming that it's rare to get lots of interrupts firing
> >>- * simultaneously so try to minimise I/O.
> >>- */
> >>-static irqreturn_t tps65912_irq(int irq, void *irq_data)
> >>-{
> >>-	struct tps65912 *tps65912 =3D irq_data;
> >>-	u32 irq_sts;
> >>-	u32 irq_mask;
> >>-	u8 reg;
> >>-	int i;
> >>-
> >>-
> >>-	tps65912->read(tps65912, TPS65912_INT_STS, 1, &reg);
> >>-	irq_sts =3D reg;
> >>-	tps65912->read(tps65912, TPS65912_INT_STS2, 1, &reg);
> >>-	irq_sts |=3D reg << 8;
> >>-	tps65912->read(tps65912, TPS65912_INT_STS3, 1, &reg);
> >>-	irq_sts |=3D reg << 16;
> >>-	tps65912->read(tps65912, TPS65912_INT_STS4, 1, &reg);
> >>-	irq_sts |=3D reg << 24;
> >>-
> >>-	tps65912->read(tps65912, TPS65912_INT_MSK, 1, &reg);
> >>-	irq_mask =3D reg;
> >>-	tps65912->read(tps65912, TPS65912_INT_MSK2, 1, &reg);
> >>-	irq_mask |=3D reg << 8;
> >>-	tps65912->read(tps65912, TPS65912_INT_MSK3, 1, &reg);
> >>-	irq_mask |=3D reg << 16;
> >>-	tps65912->read(tps65912, TPS65912_INT_MSK4, 1, &reg);
> >>-	irq_mask |=3D reg << 24;
> >>-
> >>-	irq_sts &=3D ~irq_mask;
> >>-	if (!irq_sts)
> >>-		return IRQ_NONE;
> >>-
> >>-	for (i =3D 0; i < tps65912->irq_num; i++) {
> >>-		if (!(irq_sts & (1 << i)))
> >>-			continue;
> >>-
> >>-		handle_nested_irq(tps65912->irq_base + i);
> >>-	}
> >>-
> >>-	/* Write the STS register back to clear IRQs we handled */
> >>-	reg =3D irq_sts & 0xFF;
> >>-	irq_sts >>=3D 8;
> >>-	if (reg)
> >>-		tps65912->write(tps65912, TPS65912_INT_STS, 1, &reg);
> >>-	reg =3D irq_sts & 0xFF;
> >>-	irq_sts >>=3D 8;
> >>-	if (reg)
> >>-		tps65912->write(tps65912, TPS65912_INT_STS2, 1, &reg);
> >>-	reg =3D irq_sts & 0xFF;
> >>-	irq_sts >>=3D 8;
> >>-	if (reg)
> >>-		tps65912->write(tps65912, TPS65912_INT_STS3, 1, &reg);
> >>-	reg =3D irq_sts & 0xFF;
> >>-	if (reg)
> >>-		tps65912->write(tps65912, TPS65912_INT_STS4, 1, &reg);
> >>-
> >>-	return IRQ_HANDLED;
> >>-}
> >>-
> >>-static void tps65912_irq_lock(struct irq_data *data)
> >>-{
> >>-	struct tps65912 *tps65912 =3D irq_data_get_irq_chip_data(data);
> >>-
> >>-	mutex_lock(&tps65912->irq_lock);
> >>-}
> >>-
> >>-static void tps65912_irq_sync_unlock(struct irq_data *data)
> >>-{
> >>-	struct tps65912 *tps65912 =3D irq_data_get_irq_chip_data(data);
> >>-	u32 reg_mask;
> >>-	u8 reg;
> >>-
> >>-	tps65912->read(tps65912, TPS65912_INT_MSK, 1, &reg);
> >>-	reg_mask =3D reg;
> >>-	tps65912->read(tps65912, TPS65912_INT_MSK2, 1, &reg);
> >>-	reg_mask |=3D reg << 8;
> >>-	tps65912->read(tps65912, TPS65912_INT_MSK3, 1, &reg);
> >>-	reg_mask |=3D reg << 16;
> >>-	tps65912->read(tps65912, TPS65912_INT_MSK4, 1, &reg);
> >>-	reg_mask |=3D reg << 24;
> >>-
> >>-	if (tps65912->irq_mask !=3D reg_mask) {
> >>-		reg =3D tps65912->irq_mask & 0xFF;
> >>-		tps65912->write(tps65912, TPS65912_INT_MSK, 1, &reg);
> >>-		reg =3D tps65912->irq_mask >> 8 & 0xFF;
> >>-		tps65912->write(tps65912, TPS65912_INT_MSK2, 1, &reg);
> >>-		reg =3D tps65912->irq_mask >> 16 & 0xFF;
> >>-		tps65912->write(tps65912, TPS65912_INT_MSK3, 1, &reg);
> >>-		reg =3D tps65912->irq_mask >> 24 & 0xFF;
> >>-		tps65912->write(tps65912, TPS65912_INT_MSK4, 1, &reg);
> >>-	}
> >>-
> >>-	mutex_unlock(&tps65912->irq_lock);
> >>-}
> >>-
> >>-static void tps65912_irq_enable(struct irq_data *data)
> >>-{
> >>-	struct tps65912 *tps65912 =3D irq_data_get_irq_chip_data(data);
> >>-
> >>-	tps65912->irq_mask &=3D ~(1 << irq_to_tps65912_irq(tps65912, data=
->irq));
> >>-}
> >>-
> >>-static void tps65912_irq_disable(struct irq_data *data)
> >>-{
> >>-	struct tps65912 *tps65912 =3D irq_data_get_irq_chip_data(data);
> >>-
> >>-	tps65912->irq_mask |=3D (1 << irq_to_tps65912_irq(tps65912, data-=
>irq));
> >>-}
> >>-
> >>-static struct irq_chip tps65912_irq_chip =3D {
> >>-	.name =3D "tps65912",
> >>-	.irq_bus_lock =3D tps65912_irq_lock,
> >>-	.irq_bus_sync_unlock =3D tps65912_irq_sync_unlock,
> >>-	.irq_disable =3D tps65912_irq_disable,
> >>-	.irq_enable =3D tps65912_irq_enable,
> >>-};
> >>-
> >>-int tps65912_irq_init(struct tps65912 *tps65912, int irq,
> >>-			    struct tps65912_platform_data *pdata)
> >>-{
> >>-	int ret, cur_irq;
> >>-	int flags =3D IRQF_ONESHOT;
> >>-	u8 reg;
> >>-
> >>-	if (!irq) {
> >>-		dev_warn(tps65912->dev, "No interrupt support, no core IRQ\n");
> >>-		return 0;
> >>-	}
> >>-
> >>-	if (!pdata || !pdata->irq_base) {
> >>-		dev_warn(tps65912->dev, "No interrupt support, no IRQ base\n");
> >>-		return 0;
> >>-	}
> >>-
> >>-	/* Clear unattended interrupts */
> >>-	tps65912->read(tps65912, TPS65912_INT_STS, 1, &reg);
> >>-	tps65912->write(tps65912, TPS65912_INT_STS, 1, &reg);
> >>-	tps65912->read(tps65912, TPS65912_INT_STS2, 1, &reg);
> >>-	tps65912->write(tps65912, TPS65912_INT_STS2, 1, &reg);
> >>-	tps65912->read(tps65912, TPS65912_INT_STS3, 1, &reg);
> >>-	tps65912->write(tps65912, TPS65912_INT_STS3, 1, &reg);
> >>-	tps65912->read(tps65912, TPS65912_INT_STS4, 1, &reg);
> >>-	tps65912->write(tps65912, TPS65912_INT_STS4, 1, &reg);
> >>-
> >>-	/* Mask top level interrupts */
> >>-	tps65912->irq_mask =3D 0xFFFFFFFF;
> >>-
> >>-	mutex_init(&tps65912->irq_lock);
> >>-	tps65912->chip_irq =3D irq;
> >>-	tps65912->irq_base =3D pdata->irq_base;
> >>-
> >>-	tps65912->irq_num =3D TPS65912_NUM_IRQ;
> >>-
> >>-	/* Register with genirq */
> >>-	for (cur_irq =3D tps65912->irq_base;
> >>-	     cur_irq < tps65912->irq_num + tps65912->irq_base;
> >>-	     cur_irq++) {
> >>-		irq_set_chip_data(cur_irq, tps65912);
> >>-		irq_set_chip_and_handler(cur_irq, &tps65912_irq_chip,
> >>-					 handle_edge_irq);
> >>-		irq_set_nested_thread(cur_irq, 1);
> >>-		irq_clear_status_flags(cur_irq, IRQ_NOREQUEST | IRQ_NOPROBE);
> >>-	}
> >>-
> >>-	ret =3D request_threaded_irq(irq, NULL, tps65912_irq, flags,
> >>-				   "tps65912", tps65912);
> >>-
> >>-	irq_set_irq_type(irq, IRQ_TYPE_LEVEL_LOW);
> >>-	if (ret !=3D 0)
> >>-		dev_err(tps65912->dev, "Failed to request IRQ: %d\n", ret);
> >>-
> >>-	return ret;
> >>-}
> >>-
> >>-int tps65912_irq_exit(struct tps65912 *tps65912)
> >>-{
> >>-	free_irq(tps65912->chip_irq, tps65912);
> >>-	return 0;
> >>-}
> >>diff --git a/drivers/mfd/tps65912-spi.c b/drivers/mfd/tps65912-spi.=
c
> >>dissimilarity index 91%
> >>index de60ad9..d6ab929 100644
> >>--- a/drivers/mfd/tps65912-spi.c
> >>+++ b/drivers/mfd/tps65912-spi.c
> >>@@ -1,141 +1,95 @@
> >>-/*
> >>- * tps65912-spi.c  --  SPI access for TI TPS65912x PMIC
> >>- *
> >>- * Copyright 2011 Texas Instruments Inc.
> >>- *
> >>- * Author: Margarita Olaya Cabrera <magi-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>
> >>- *
> >>- *  This program is free software; you can redistribute it and/or =
modify it
> >>- *  under  the terms of the GNU General  Public License as publish=
ed by the
> >>- *  Free Software Foundation;  either version 2 of the License, or=
 (at your
> >>- *  option) any later version.
> >>- *
> >>- *  This driver is based on wm8350 implementation.
> >>- */
> >>-
> >>-#include <linux/module.h>
> >>-#include <linux/moduleparam.h>
> >>-#include <linux/init.h>
> >>-#include <linux/slab.h>
> >>-#include <linux/gpio.h>
> >>-#include <linux/spi/spi.h>
> >>-#include <linux/mfd/core.h>
> >>-#include <linux/mfd/tps65912.h>
> >>-
> >>-static int tps65912_spi_write(struct tps65912 *tps65912, u8 addr,
> >>-							int bytes, void *src)
> >>-{
> >>-	struct spi_device *spi =3D tps65912->control_data;
> >>-	u8 *data =3D (u8 *) src;
> >>-	int ret;
> >>-	/* bit 23 is the read/write bit */
> >>-	unsigned long spi_data =3D 1 << 23 | addr << 15 | *data;
> >>-	struct spi_transfer xfer;
> >>-	struct spi_message msg;
> >>-	u32 tx_buf;
> >>-
> >>-	tx_buf =3D spi_data;
> >>-
> >>-	xfer.tx_buf	=3D &tx_buf;
> >>-	xfer.rx_buf	=3D NULL;
> >>-	xfer.len	=3D sizeof(unsigned long);
> >>-	xfer.bits_per_word =3D 24;
> >>-
> >>-	spi_message_init(&msg);
> >>-	spi_message_add_tail(&xfer, &msg);
> >>-
> >>-	ret =3D spi_sync(spi, &msg);
> >>-	return ret;
> >>-}
> >>-
> >>-static int tps65912_spi_read(struct tps65912 *tps65912, u8 addr,
> >>-							int bytes, void *dest)
> >>-{
> >>-	struct spi_device *spi =3D tps65912->control_data;
> >>-	/* bit 23 is the read/write bit */
> >>-	unsigned long spi_data =3D 0 << 23 | addr << 15;
> >>-	struct spi_transfer xfer;
> >>-	struct spi_message msg;
> >>-	int ret;
> >>-	u8 *data =3D (u8 *) dest;
> >>-	u32 tx_buf, rx_buf;
> >>-
> >>-	tx_buf =3D spi_data;
> >>-	rx_buf =3D 0;
> >>-
> >>-	xfer.tx_buf	=3D &tx_buf;
> >>-	xfer.rx_buf	=3D &rx_buf;
> >>-	xfer.len	=3D sizeof(unsigned long);
> >>-	xfer.bits_per_word =3D 24;
> >>-
> >>-	spi_message_init(&msg);
> >>-	spi_message_add_tail(&xfer, &msg);
> >>-
> >>-	if (spi =3D=3D NULL)
> >>-		return 0;
> >>-
> >>-	ret =3D spi_sync(spi, &msg);
> >>-	if (ret =3D=3D 0)
> >>-		*data =3D (u8) (rx_buf & 0xFF);
> >>-	return ret;
> >>-}
> >>-
> >>-static int tps65912_spi_probe(struct spi_device *spi)
> >>-{
> >>-	struct tps65912 *tps65912;
> >>-
> >>-	tps65912 =3D devm_kzalloc(&spi->dev,
> >>-				sizeof(struct tps65912), GFP_KERNEL);
> >>-	if (tps65912 =3D=3D NULL)
> >>-		return -ENOMEM;
> >>-
> >>-	tps65912->dev =3D &spi->dev;
> >>-	tps65912->control_data =3D spi;
> >>-	tps65912->read =3D tps65912_spi_read;
> >>-	tps65912->write =3D tps65912_spi_write;
> >>-
> >>-	spi_set_drvdata(spi, tps65912);
> >>-
> >>-	return tps65912_device_init(tps65912);
> >>-}
> >>-
> >>-static int tps65912_spi_remove(struct spi_device *spi)
> >>-{
> >>-	struct tps65912 *tps65912 =3D spi_get_drvdata(spi);
> >>-
> >>-	tps65912_device_exit(tps65912);
> >>-
> >>-	return 0;
> >>-}
> >>-
> >>-static struct spi_driver tps65912_spi_driver =3D {
> >>-	.driver =3D {
> >>-		.name =3D "tps65912",
> >>-		.owner =3D THIS_MODULE,
> >>-	},
> >>-	.probe	=3D tps65912_spi_probe,
> >>-	.remove =3D tps65912_spi_remove,
> >>-};
> >>-
> >>-static int __init tps65912_spi_init(void)
> >>-{
> >>-	int ret;
> >>-
> >>-	ret =3D spi_register_driver(&tps65912_spi_driver);
> >>-	if (ret !=3D 0)
> >>-		pr_err("Failed to register TPS65912 SPI driver: %d\n", ret);
> >>-
> >>-	return 0;
> >>-}
> >>-/* init early so consumer devices can complete system boot */
> >>-subsys_initcall(tps65912_spi_init);
> >>-
> >>-static void __exit tps65912_spi_exit(void)
> >>-{
> >>-	spi_unregister_driver(&tps65912_spi_driver);
> >>-}
> >>-module_exit(tps65912_spi_exit);
> >>-
> >>-MODULE_AUTHOR("Margarita Olaya	<magi-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>");
> >>-MODULE_DESCRIPTION("SPI support for TPS65912 chip family mfd");
> >>-MODULE_LICENSE("GPL");
> >>+/*
> >>+ * tps65912-spi.c -- SPI access driver for TI TPS65912x PMIC
> >
> >All the same comments as the other files -- I'll not labour them.
> >
> >Same goes for the rest of the file.
> >
>=20
> ACK
>=20
> >>+ * Copyright (C) 2015 Texas Instruments Incorporated - http://www.=
ti.com/
> >>+ *
> >>+ * Author: Andrew F. Davis <afd-l0cyMroinI0@public.gmane.org>
> >>+ *
> >>+ * This program is free software; you can redistribute it and/or
> >>+ * modify it under the terms of the GNU General Public License ver=
sion 2 as
> >>+ * published by the Free Software Foundation.
> >>+ *
> >>+ * This program is distributed "as is" WITHOUT ANY WARRANTY of any
> >>+ * kind, whether expressed or implied; without even the implied wa=
rranty
> >>+ * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See th=
e
> >>+ * GNU General Public License version 2 for more details.
> >>+ *
> >>+ * Based on the TPS65218 driver and the previous TPS65912 driver b=
y
> >>+ * Margarita Olaya Cabrera <magi-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>
> >>+ */
> >>+
> >>+#include <linux/spi/spi.h>
> >>+#include <linux/module.h>
> >>+#include <linux/of_device.h>
> >>+#include <linux/regmap.h>
> >
> >Alphabetical.
> >
>=20
> ACK
>=20
> >>+#include <linux/mfd/tps65912.h>
> >>+
> >>+static const struct of_device_id tps65912_spi_of_match_table[] =3D=
 {
> >>+	{ .compatible =3D "ti,tps65912", },
> >>+	{ /*sentinel*/ }
> >>+};
> >>+
> >>+static int tps65912_spi_probe(struct spi_device *spi)
> >>+{
> >>+	struct tps65912 *tps;
> >>+	const struct of_device_id *match;
> >>+
> >>+	match =3D of_match_device(tps65912_spi_of_match_table, &spi->dev)=
;
> >>+	if (!match) {
> >>+		dev_err(&spi->dev, "Failed to find matching DT id\n");
> >>+		return -EINVAL;
> >>+	}
> >
> >Why are you matching?
> >
>=20
> Same response as above.
>=20
> >>+	tps =3D devm_kzalloc(&spi->dev, sizeof(*tps), GFP_KERNEL);
> >>+	if (!tps)
> >>+		return -ENOMEM;
> >>+
> >>+	spi_set_drvdata(spi, tps);
> >>+	tps->dev =3D &spi->dev;
> >>+	tps->irq =3D spi->irq;
> >>+
> >>+	tps->regmap =3D devm_regmap_init_spi(spi, &tps65912_regmap_config=
);
> >>+	if (IS_ERR(tps->regmap)) {
> >>+		int ret =3D PTR_ERR(tps->regmap);
> >>+
> >>+		dev_err(tps->dev, "Failed to allocate register map: %d\n",
> >>+			ret);
> >>+
> >>+		return ret;
> >>+	}
> >>+
> >>+	return tps65912_device_init(tps);
> >>+}
> >>+
> >>+static int tps65912_spi_remove(struct spi_device *client)
> >>+{
> >>+	struct tps65912 *tps =3D spi_get_drvdata(client);
> >>+
> >>+	tps65912_device_exit(tps);
> >>+
> >>+	return 0;
> >>+}
> >>+
> >>+static const struct spi_device_id tps65912_spi_id_table[] =3D {
> >>+	{ "tps65912", TPS65912 },
> >>+	{ /*sentinel*/ },
> >>+};
> >>+MODULE_DEVICE_TABLE(spi, tps65912_spi_id_table);
> >>+
> >>+static struct spi_driver tps65912_spi_driver =3D {
> >>+	.driver		=3D {
> >>+		.name	=3D "tps65912",
> >>+		.owner	=3D THIS_MODULE,
> >
> >Remove this line.
> >
>=20
> I wasn't sure about this one, all the SPI drivers I looked at still h=
ave
> this, but if you are sure this is not needed then I'll remove it.
>=20
> (also if it is not needed someone could probably remove this from all
> these drivers like 816c44c36901 did in power)

Yes, they should all be removed.  It's taken care of elsewhere.  Some
effort has been put in and I believe a Coccinelle script even exists
now.

=46ill your boots.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
