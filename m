From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [Patch v5 08/13] ARM: imx6q: add config-on-boot gpios
Date: Thu, 19 Jul 2012 10:15:23 +0800
Message-ID: <20120719021522.GP21635@b20223-02.ap.freescale.net>
References: <1339590863-10564-1-git-send-email-richard.zhao@freescale.com>
 <1339590863-10564-9-git-send-email-richard.zhao@freescale.com>
 <50055AD9.6030807@de.bosch.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50055AD9.6030807-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Dirk Behme <dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
Cc: "marex-ynQEQJNshbs@public.gmane.org" <marex-ynQEQJNshbs@public.gmane.org>, "B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org" <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 17, 2012 at 02:30:17PM +0200, Dirk Behme wrote:
> On 13.06.2012 14:34, Richard Zhao wrote:
> >Sometimes, boards have gpios that don't own by any driver or owner
> >by a generic driver that don't like hacks. Such gpios is normally
> >output and need setup once on boot. So I introduce the config-on-boot
> >gpios.
> >
> >Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> >Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> >Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> >Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> >---
> > .../devicetree/bindings/arm/config-on-boot.txt     |   12 +++++++
> > arch/arm/boot/dts/imx6q-sabrelite.dts              |    7 ++++
> > arch/arm/mach-imx/mach-imx6q.c                     |   35 ++++++++++++++++++++
> > 3 files changed, 54 insertions(+)
> > create mode 100644 Documentation/devicetree/bindings/arm/config-on-boot.txt
> >
> >diff --git a/Documentation/devicetree/bindings/arm/config-on-boot.txt b/Documentation/devicetree/bindings/arm/config-on-boot.txt
> >new file mode 100644
> >index 0000000..f98ed74
> >--- /dev/null
> >+++ b/Documentation/devicetree/bindings/arm/config-on-boot.txt
> >@@ -0,0 +1,12 @@
> >+* Configure on Boot
> >+
> >+Node name: config-on-boot
> >+  It must be in root node. config-on-boot means to describe settings that needs
> >+  to be set one time on boot but aren't owned by any driver, or the owned driver
> >+  is too generic to handle such settings. For example, usb hub uses generic
> >+  driver in usb core code, a on-board usb may need deassert reset pin.
> >+
> >+Optional properties:
> >+- output-gpios: Output gpio array that needs to set.
> >+- output-gpio-values: This property is required if output-gpios is set.
> >+  The value is a array of 0 or 1. Total count eaquals the number of gpios.
> >diff --git a/arch/arm/boot/dts/imx6q-sabrelite.dts b/arch/arm/boot/dts/imx6q-sabrelite.dts
> >index e0ec929..1dd2261 100644
> >--- a/arch/arm/boot/dts/imx6q-sabrelite.dts
> >+++ b/arch/arm/boot/dts/imx6q-sabrelite.dts
> >@@ -17,6 +17,13 @@
> > 	model = "Freescale i.MX6 Quad SABRE Lite Board";
> > 	compatible = "fsl,imx6q-sabrelite", "fsl,imx6q";
> >+	config-on-boot {
> >+		output-gpios = <
> >+				&gpio3 22 0>;	/* vbus reset */
> >+		output-gpio-values = <
> >+				1>;		/* vbus reset */
> >+	};
> >+
> > 	memory {
> > 		reg = <0x10000000 0x40000000>;
> > 	};
> >diff --git a/arch/arm/mach-imx/mach-imx6q.c b/arch/arm/mach-imx/mach-imx6q.c
> >index b47e98b..577cf19 100644
> >--- a/arch/arm/mach-imx/mach-imx6q.c
> >+++ b/arch/arm/mach-imx/mach-imx6q.c
> >@@ -19,6 +19,7 @@
> > #include <linux/irqdomain.h>
> > #include <linux/of.h>
> > #include <linux/of_address.h>
> >+#include <linux/of_gpio.h>
> > #include <linux/of_irq.h>
> > #include <linux/of_platform.h>
> > #include <linux/pinctrl/machine.h>
> >@@ -113,6 +114,38 @@ static void __init imx6q_sabrelite_init(void)
> > 	imx6q_sabrelite_cko1_setup();
> > }
> >+static void __init imx6q_config_on_boot(void)
> >+{
> >+	struct device_node *np;
> >+	struct property *pp;
> >+	int cnt, len, i;
> >+	int gpio;
> >+
> >+	np = of_find_node_by_path("/config-on-boot");
> >+	if (!np)
> >+		return;
> >+	cnt = of_gpio_named_count(np, "output-gpios");
> >+	pp = of_find_property(np, "output-gpio-values", &len);
> >+	if (!pp || cnt != len / sizeof(u32)) {
> >+		pr_err("Invalid config-on-boot gpios!\n");
> >+		of_node_put(np);
> >+		return;
> >+	}
> >+	for (i = 0; i < cnt; i++) {
> >+		gpio = of_get_named_gpio(np, "output-gpios", i);
> >+		if (gpio_is_valid(gpio))
> >+			gpio_request_one(gpio, GPIOF_OUT_INIT_HIGH,
> >+					"config-on-boot");
> 
> While trying to use this code: Is there a special reason why all
> pins are set to HIGH here? The contents of 'output-gpio-values' seem
> to be ignored?
It may be bug here. The patch is rejected. imx6_sabrelite happens work
by default value. So I won't follow it any more.

Thanks
Richard
> 
> Best regards
> 
> Dirk
> 
