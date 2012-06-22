From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RESEND] of: add const to struct of_device_id.data
Date: Fri, 22 Jun 2012 17:26:22 +0000
Message-ID: <201206221726.22285.arnd@arndb.de>
References: <1335171381-24869-1-git-send-email-u.kleine-koenig@pengutronix.de> <20120607102014.GI22191@pengutronix.de> <20120622055613.GL5642@pengutronix.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120622055613.GL5642@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Uwe =?iso-8859-1?q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Friday 22 June 2012, Uwe Kleine-K=F6nig wrote:
> On Thu, Jun 07, 2012 at 12:20:14PM +0200, Uwe Kleine-K=F6nig wrote:
> > Drivers should never need to modify the data of a device id. So it =
can
> > be const which in turn allows more consts in the driver.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> > (Cc +=3D lkml + Grant)
> >=20
> > Hello,
> >=20
> > this might introduce warnings in drivers that access the data membe=
r
> > without using const, so this is definitly merge window material if =
it is
> > considered at all.
>
> ping

Sorry for the delayed response. I think the approach is right, but I
am a bit worried about adding warnings for legit code.

A quick test with the defconfigs gave me this error for prima2_defconfi=
g
and kzm9g_defconfig:

/home/arnd/linux-arm/arch/arm/mm/cache-l2x0.c: In function 'l2x0_of_ini=
t':
/home/arnd/linux-arm/arch/arm/mm/cache-l2x0.c:573:7: error: assignment =
discards 'const' qualifier from pointer target type [-Werror]

and this one with at91sam9263_defconfig:
/home/arnd/linux-arm/drivers/misc/atmel_tclib.c: In function 'tc_probe'=
:
/home/arnd/linux-arm/drivers/misc/atmel_tclib.c:170:19: error: assignme=
nt discards 'const' qualifier from pointer target type [-Werror]

I haven't checked all the defconfigs yet, but I think we should at leas=
t
make sure they build fine before applying your patch.

	Arnd

8<---
diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
index 2a8e380..577baf7 100644
--- a/arch/arm/mm/cache-l2x0.c
+++ b/arch/arm/mm/cache-l2x0.c
@@ -554,7 +554,7 @@ static const struct of_device_id l2x0_ids[] __initc=
onst =3D {
 int __init l2x0_of_init(u32 aux_val, u32 aux_mask)
 {
 	struct device_node *np;
-	struct l2x0_of_data *data;
+	const struct l2x0_of_data *data;
 	struct resource res;
=20
 	np =3D of_find_matching_node(NULL, l2x0_ids);
diff --git a/include/linux/atmel_tc.h b/include/linux/atmel_tc.h
index 1d14b1dc..89a931b 100644
--- a/include/linux/atmel_tc.h
+++ b/include/linux/atmel_tc.h
@@ -63,7 +63,7 @@ struct atmel_tc {
 	struct platform_device	*pdev;
 	struct resource		*iomem;
 	void __iomem		*regs;
-	struct atmel_tcb_config	*tcb_config;
+	const struct atmel_tcb_config *tcb_config;
 	int			irq[3];
 	struct clk		*clk[3];
 	struct list_head	node;
