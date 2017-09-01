From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 10/11] staging: typec: fusb302: Hook up mux support using
 tcpc_gen_mux support
Date: Fri,  1 Sep 2017 23:48:44 +0200
Message-ID: <20170901214845.7153-11-hdegoede@redhat.com>
References: <20170901214845.7153-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20170901214845.7153-1-hdegoede@redhat.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Peter Rosin <peda@axentia.se>, Mathias Nyman <mathias.nyman@intel.com>
Cc: devel@driverdev.osuosl.org, Mark Rutland <mark.rutland@arm.com>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Add mux support to the fusb302 driver, call devm_tcpc_gen_mux_create()
to let the generic tcpc_mux_dev code create a tcpc_mux_dev for us.

Also document the mux-names used by the generic tcpc_mux_dev code in
our devicetree bindings.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 Documentation/devicetree/bindings/usb/fcs,fusb302.txt |  3 +++
 drivers/staging/typec/fusb302/fusb302.c               | 11 ++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/fcs,fusb302.txt b/Documentation/devicetree/bindings/usb/fcs,fusb302.txt
index 472facfa5a71..63d639eadacd 100644
--- a/Documentation/devicetree/bindings/usb/fcs,fusb302.txt
+++ b/Documentation/devicetree/bindings/usb/fcs,fusb302.txt
@@ -6,6 +6,9 @@ Required properties :
 - interrupts             : Interrupt specifier
 
 Optional properties :
+- mux-controls           : List of mux-ctrl-specifiers containing 1 or 2 muxes
+- mux-names              : "type-c-mode-mux" when using 1 mux, or
+                           "type-c-mode-mux", "usb-role-mux" when using 2 muxes
 - fcs,max-sink-microvolt : Maximum voltage to negotiate when configured as sink
 - fcs,max-sink-microamp  : Maximum current to negotiate when configured as sink
 - fcs,max-sink-microwatt : Maximum power to negotiate when configured as sink
diff --git a/drivers/staging/typec/fusb302/fusb302.c b/drivers/staging/typec/fusb302/fusb302.c
index cf6355f59cd9..00d045d0246b 100644
--- a/drivers/staging/typec/fusb302/fusb302.c
+++ b/drivers/staging/typec/fusb302/fusb302.c
@@ -1259,7 +1259,6 @@ static void init_tcpc_dev(struct tcpc_dev *fusb302_tcpc_dev)
 	fusb302_tcpc_dev->set_roles = tcpm_set_roles;
 	fusb302_tcpc_dev->start_drp_toggling = tcpm_start_drp_toggling;
 	fusb302_tcpc_dev->pd_transmit = tcpm_pd_transmit;
-	fusb302_tcpc_dev->mux = NULL;
 }
 
 static const char * const cc_polarity_name[] = {
@@ -1817,6 +1816,16 @@ static int fusb302_probe(struct i2c_client *client,
 			return -EPROBE_DEFER;
 	}
 
+	chip->tcpc_dev.mux = devm_tcpc_gen_mux_create(dev);
+	if (IS_ERR(chip->tcpc_dev.mux)) {
+		ret = PTR_ERR(chip->tcpc_dev.mux);
+		/* Use of a mux is optional (for now?), ignore -ENODEV errors */
+		if (ret == -ENODEV)
+			chip->tcpc_dev.mux = NULL;
+		else
+			return ret;
+	}
+
 	cfg.drv_data = chip;
 	chip->psy = devm_power_supply_register(dev, &fusb302_psy_desc, &cfg);
 	if (IS_ERR(chip->psy)) {
-- 
2.13.5
