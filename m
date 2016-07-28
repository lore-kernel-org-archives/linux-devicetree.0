From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH v16 6/6] ARM: socfpga: fpga bridge driver support
Date: Thu, 28 Jul 2016 10:21:01 -0500
Message-ID: <alpine.DEB.2.02.1607281019100.1032@linuxheads99>
References: <1454707803-27947-1-git-send-email-atull@opensource.altera.com> <1454707803-27947-7-git-send-email-atull@opensource.altera.com> <1465525089.15779.203.camel@rtred1test09.kymeta.local>
 <CAC+thW3U_vEre0DovmK7t_oiK5v1evZCBPqpahf+e6aCvmhqLA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAC+thW3U_vEre0DovmK7t_oiK5v1evZCBPqpahf+e6aCvmhqLA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrea Galbusera <gizero@gmail.com>
Cc: Trent Piepho <tpiepho@kymetacorp.com>, Rob Herring <robh+dt@kernel.org>, "pantelis.antoniou@konsulko.com" <pantelis.antoniou@konsulko.com>, Moritz Fischer <moritz.fischer@ettus.com>, Josh Cartwright <joshc@ni.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "monstr@monstr.eu" <monstr@monstr.eu>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "delicious.quinoa@gmail.com" <delicious.quinoa@gmail.com>, "dinguyen@opensource.altera.com" <dinguyen@opensource.altera.com>Matthew Gerlach <m>
List-Id: devicetree@vger.kernel.org

On Thu, 28 Jul 2016, Andrea Galbusera wrote:

> On Fri, Jun 10, 2016 at 4:18 AM, Trent Piepho <tpiepho@kymetacorp.com> wrote:
> > On Fri, 2016-02-05 at 15:30 -0600, atull@opensource.altera.com wrote:
> >> Supports Altera SOCFPGA bridges:
> >>  * fpga2sdram
> >>  * fpga2hps
> >>  * hps2fpga
> >>  * lwhps2fpga
> >>
> >> Allows enabling/disabling the bridges through the FPGA
> >> Bridge Framework API functions.
> >
> > I'm replying to v16 because it exists on gmane, while v17 appears not
> > to.  lkml.org's forward feature appears to be broken so I can't reply to
> > that message (no way to get message-id).  But v17 of this patch should
> > be the same.  If a v18 was posted, I've not been able to find it.
> >
> >> diff --git a/drivers/fpga/altera-hps2fpga.c b/drivers/fpga/altera-hps2fpga.c
> >> new file mode 100644
> >> index 0000000..c15df47
> >> --- /dev/null
> >> +++ b/drivers/fpga/altera-hps2fpga.c
> >> @@ -0,0 +1,213 @@
> >> +/*
> >> + * FPGA to/from HPS Bridge Driver for Altera SoCFPGA Devices
> >> + *
> >> + *  Copyright (C) 2013-2015 Altera Corporation, All Rights Reserved.
> >> + *
> >> + * This program is free software; you can redistribute it and/or modify it
> >> + * under the terms and conditions of the GNU General Public License,
> >> + * version 2, as published by the Free Software Foundation.
> >> + *
> >> + * This program is distributed in the hope it will be useful, but WITHOUT
> >> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> >> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> >> + * more details.
> >> + *
> >> + * You should have received a copy of the GNU General Public License along with
> >> + * this program.  If not, see <http://www.gnu.org/licenses/>.
> >> + */
> >> +
> >> +/*
> >> + * This driver manages bridges on a Altera SOCFPGA between the ARM host
> >> + * processor system (HPS) and the embedded FPGA.
> >> + *
> >> + * This driver supports enabling and disabling of the configured ports, which
> >> + * allows for safe reprogramming of the FPGA, assuming that the new FPGA image
> >> + * uses the same port configuration.  Bridges must be disabled before
> >> + * reprogramming the FPGA and re-enabled after the FPGA has been programmed.
> >> + */
> >> +
> >> +#include <linux/clk.h>
> >> +#include <linux/fpga/fpga-bridge.h>
> >> +#include <linux/kernel.h>
> >> +#include <linux/mfd/syscon.h>
> >> +#include <linux/module.h>
> >> +#include <linux/of_platform.h>
> >> +#include <linux/regmap.h>
> >> +#include <linux/reset.h>
> >> +
> >> +#define ALT_L3_REMAP_OFST                    0x0
> >> +#define ALT_L3_REMAP_MPUZERO_MSK             0x00000001
> >> +#define ALT_L3_REMAP_H2F_MSK                 0x00000008
> >> +#define ALT_L3_REMAP_LWH2F_MSK                       0x00000010
> >> +
> >> +#define HPS2FPGA_BRIDGE_NAME                 "hps2fpga"
> >> +#define LWHPS2FPGA_BRIDGE_NAME                       "lwhps2fpga"
> >> +#define FPGA2HPS_BRIDGE_NAME                 "fpga2hps"
> >> +
> >> +struct altera_hps2fpga_data {
> >> +     const char *name;
> >> +     struct reset_control *bridge_reset;
> >> +     struct regmap *l3reg;
> >> +     /* The L3 REMAP register is write only, so keep a cached value. */
> >> +     unsigned int l3_remap_value;
> >> +     unsigned int remap_mask;
> >> +     struct clk *clk;
> >> +};
> >> +
> >> +static int alt_hps2fpga_enable_show(struct fpga_bridge *bridge)
> >> +{
> >> +     struct altera_hps2fpga_data *priv = bridge->priv;
> >> +
> >> +     return reset_control_status(priv->bridge_reset);
> >> +}
> >> +
> >> +static int _alt_hps2fpga_enable_set(struct altera_hps2fpga_data *priv,
> >> +                                 bool enable)
> >> +{
> >> +     int ret;
> >> +
> >> +     /* bring bridge out of reset */
> >> +     if (enable)
> >> +             ret = reset_control_deassert(priv->bridge_reset);
> >> +     else
> >> +             ret = reset_control_assert(priv->bridge_reset);
> >> +     if (ret)
> >> +             return ret;
> >> +
> >> +     /* Allow bridge to be visible to L3 masters or not */
> >> +     if (priv->remap_mask) {
> >> +             priv->l3_remap_value |= ALT_L3_REMAP_MPUZERO_MSK;
> >
> > Doesn't seem like this belongs here.  I realize the write-only register
> > is a problem.  Maybe the syscon driver should be initializing this
> > value?
> >
> >> +
> >> +             if (enable)
> >> +                     priv->l3_remap_value |= priv->remap_mask;
> >> +             else
> >> +                     priv->l3_remap_value &= ~priv->remap_mask;
> >> +
> >> +             ret = regmap_write(priv->l3reg, ALT_L3_REMAP_OFST,
> >> +                                priv->l3_remap_value);
> >
> > This isn't going work if more than one bridge is used.  Each bridge has
> > its own priv and thus priv->l3_remap_value.  Each bridge's priv will
> > have just the bit for it's own remap set.  The 2nd bridge to be enabled
> > will turn off the 1st bridge when it re-write the l3 register.
> 
> I can confirm this is exactly what happens with tag
> "rel_socfpga-4.1.22-ltsi_16.06.02_pr" of socfpga-4.1.22-ltsi branch
> from altera-opensource/linux-socfpga which includes more or less the
> code in this patch. If you have 2 bridges (lw-hps2fpga and hps2fpga)
> you end up with only one of them being visible. Easily spot by logging
> l3_remap_value being passed to regmap_write()...
> 

Anatolij kindly provided a patch for this issue.  I'll push it
to my github repo when I can.

Alan
---
>From e408cc03dfcdf5769133d069dda5914372b7aa54 Mon Sep 17 00:00:00 2001
From: Anatolij Gustschin <agust@denx.de>
Date: Fri, 22 Jul 2016 17:59:58 +0200
Subject: [PATCH 1/2] fpga: altera-hps2fpga: fix HPS2FPGA bridge visibility to L3 masters

While FPGA reconfiguration over device tree overlays the HPS2FPGA
bridge visibility to L3 masters is disabled. This results in abort
errors when accessing the address range of the FPGA devices behind
the HPS2FPGA bridge, i.e.:
  ...
  Unhandled fault: imprecise external abort (0x406) at 0xf0400000
  pgd = eef48000
  [f0400000] *pgd=2e362811, *pte=00000000, *ppte=00000000
  Internal error: : 406 [#1] SMP ARM
  ...

This visibility configuration error happens in bridge enable
function because the per-bridge 'priv->l3_remap_value' variable
doesn't cache all already written bits to write-only 'remap'
register. After FPGA reconfiguration the HPS2FPGA and LWHPS2FPGA
bridges must be enabled (bits 3 and 4 of the 'remap' register set).
So enable_set function is called for HPS2FPGA and then for LWHPS2FPGA
bridge. In the first call the value 0x9 is written to the 'remap'
register, in the second call the value 0x11 is written, resulting
in disabled HPS2FPGA visibility.

Use remap shadow register common for all bridges to fix the
external abort issue.

Signed-off-by: Anatolij Gustschin <agust@denx.de>
---
 drivers/fpga/altera-hps2fpga.c |   20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/fpga/altera-hps2fpga.c b/drivers/fpga/altera-hps2fpga.c
index a2f0bd6..476e548 100644
--- a/drivers/fpga/altera-hps2fpga.c
+++ b/drivers/fpga/altera-hps2fpga.c
@@ -34,6 +34,7 @@
 #include <linux/of_platform.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
+#include <linux/spinlock.h>
 
 #define ALT_L3_REMAP_OFST			0x0
 #define ALT_L3_REMAP_MPUZERO_MSK		0x00000001
@@ -48,8 +49,6 @@ struct altera_hps2fpga_data {
 	const char *name;
 	struct reset_control *bridge_reset;
 	struct regmap *l3reg;
-	/* The L3 REMAP register is write only, so keep a cached value. */
-	unsigned int l3_remap_value;
 	unsigned int remap_mask;
 	struct clk *clk;
 };
@@ -61,9 +60,14 @@ static int alt_hps2fpga_enable_show(struct fpga_bridge *bridge)
 	return reset_control_status(priv->bridge_reset);
 }
 
+/* The L3 REMAP register is write only, so keep a cached value. */
+static unsigned int l3_remap_shadow;
+static spinlock_t l3_remap_lock;
+
 static int _alt_hps2fpga_enable_set(struct altera_hps2fpga_data *priv,
 				    bool enable)
 {
+	unsigned long flags;
 	int ret;
 
 	/* bring bridge out of reset */
@@ -76,15 +80,17 @@ static int _alt_hps2fpga_enable_set(struct altera_hps2fpga_data *priv,
 
 	/* Allow bridge to be visible to L3 masters or not */
 	if (priv->remap_mask) {
-		priv->l3_remap_value |= ALT_L3_REMAP_MPUZERO_MSK;
+		spin_lock_irqsave(&l3_remap_lock, flags);
+		l3_remap_shadow |= ALT_L3_REMAP_MPUZERO_MSK;
 
 		if (enable)
-			priv->l3_remap_value |= priv->remap_mask;
+			l3_remap_shadow |= priv->remap_mask;
 		else
-			priv->l3_remap_value &= ~priv->remap_mask;
+			l3_remap_shadow &= ~priv->remap_mask;
 
 		ret = regmap_write(priv->l3reg, ALT_L3_REMAP_OFST,
-				   priv->l3_remap_value);
+				   l3_remap_shadow);
+		spin_unlock_irqrestore(&l3_remap_lock, flags);
 	}
 
 	return ret;
@@ -159,6 +165,8 @@ static int alt_fpga_bridge_probe(struct platform_device *pdev)
 		return -EBUSY;
 	}
 
+	spin_lock_init(&l3_remap_lock);
+
 	ret = fpga_bridge_register(dev, priv->name, &altera_hps2fpga_br_ops,
 				   priv);
 	if (ret)
-- 
1.7.9.5
