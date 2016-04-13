From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v2 06/11] phy: da8xx-usb: new driver for DA8XX SoC USB PHY
Date: Wed, 13 Apr 2016 15:51:15 -0500
Message-ID: <570EB143.4060309@lechnology.com>
References: <1458181615-27782-1-git-send-email-david@lechnology.com>
 <1458181615-27782-7-git-send-email-david@lechnology.com>
 <56FE74AC.6080303@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56FE74AC.6080303@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Petr Kulhavy <petr@barix.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bin Liu <b-liu@ti.com>, =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>, Tony Lindgren <tony@atomide.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04/01/2016 08:16 AM, Kishon Vijay Abraham I wrote:

>> +EXPORT_SYMBOL_GPL(da8xx_usb20_phy_set_mode);
>
> Don't prefer export symbols from PHY driver. That'll create unnecessary
> dependencies between the controller and the PHY.
>
> I think it'll be better to create a new attribute and use it?
>

Just having an attribute that keeps track of state does not work. I need 
a callback to poke registers. Would this be acceptable instead?

-----8<------
diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index e7e574d..a13c7e4 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -342,6 +342,36 @@ int phy_power_off(struct phy *phy)
  }
  EXPORT_SYMBOL_GPL(phy_power_off);

+int phy_get_mode(struct phy *phy, enum phy_mode *mode)
+{
+       int ret;
+
+       if (!phy || !phy->ops->get_mode)
+               return 0;
+
+       mutex_lock(&phy->mutex);
+       ret = phy->ops->get_mode(phy, mode);
+       mutex_unlock(&phy->mutex);
+
+       return ret;
+}
+EXPORT_SYMBOL_GPL(phy_get_mode);
+
+int phy_set_mode(struct phy *phy, enum phy_mode mode)
+{
+       int ret;
+
+       if (!phy || !phy->ops->set_mode)
+               return 0;
+
+       mutex_lock(&phy->mutex);
+       ret = phy->ops->set_mode(phy, mode);
+       mutex_unlock(&phy->mutex);
+
+       return ret;
+}
+EXPORT_SYMBOL_GPL(phy_set_mode);
+
  /**
   * _of_phy_get() - lookup and obtain a reference to a phy by phandle
   * @np: device_node for which to get the phy
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 8cf05e3..12c1986 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -22,12 +22,21 @@

  struct phy;

+enum phy_mode {
+       PHY_MODE_INVALID,
+       PHY_MODE_USB_HOST,
+       PHY_MODE_USB_DEVICE,
+       PHY_MODE_USB_OTG,
+};
+
  /**
   * struct phy_ops - set of function pointers for performing phy operations
   * @init: operation to be performed for initializing phy
   * @exit: operation to be performed while exiting
   * @power_on: powering on the phy
   * @power_off: powering off the phy
+ * @get_mode: get the current mode of the phy
+ * @set_mode: set the mode of the phy
   * @owner: the module owner containing the ops
   */
  struct phy_ops {
@@ -35,6 +44,8 @@ struct phy_ops {
         int     (*exit)(struct phy *phy);
         int     (*power_on)(struct phy *phy);
         int     (*power_off)(struct phy *phy);
+       int     (*get_mode)(struct phy *phy, enum phy_mode *mode);
+       int     (*set_mode)(struct phy *phy, enum phy_mode mode);
         struct module *owner;
  };

@@ -119,6 +130,8 @@ int phy_init(struct phy *phy);
  int phy_exit(struct phy *phy);
  int phy_power_on(struct phy *phy);
  int phy_power_off(struct phy *phy);
+int phy_get_mode(struct phy *phy, enum phy_mode *mode);
+int phy_set_mode(struct phy *phy, enum phy_mode mode);
  static inline int phy_get_bus_width(struct phy *phy)
  {
         return phy->attrs.bus_width;
@@ -224,6 +237,16 @@ static inline int phy_power_off(struct phy *phy)
         return -ENOSYS;
  }

+static inline int phy_get_mode(struct phy *phy, enum phy_mode *mode)
+{
+       return 0;
+}
+
+static inline int phy_set_mode(struct phy *phy, enum phy_mode mode)
+{
+       return 0;
+}
+
  static inline int phy_get_bus_width(struct phy *phy)
  {
         return -ENOSYS;
