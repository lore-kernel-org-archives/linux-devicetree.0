Return-Path: <SRS0=V/0G=F3=linux.intel.com=heikki.krogerus@kernel.org>
Date: Mon, 5 Mar 2018 13:30:05 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v2 03/12] staging: typec: tcpci: support port config
 passed via dt
Message-ID: <20180305113005.GD10598@kuha.fi.intel.com>
References: <1519645759-12701-1-git-send-email-jun.li@nxp.com>
 <1519645759-12701-4-git-send-email-jun.li@nxp.com>
 <20180226140604.GD25535@kuha.fi.intel.com>
 <VI1PR0402MB3917FFA57640C5B4B7030FA789C10@VI1PR0402MB3917.eurprd04.prod.outlook.com>
 <20180227110302.GE25535@kuha.fi.intel.com>
 <VI1PR0402MB39176A73FBA147B7F1153EA389DA0@VI1PR0402MB3917.eurprd04.prod.outlook.com>
 <20180305095346.GB10598@kuha.fi.intel.com>
 <VI1PR0402MB39173B772C2642C4ECC626B589DA0@VI1PR0402MB3917.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI1PR0402MB39173B772C2642C4ECC626B589DA0@VI1PR0402MB3917.eurprd04.prod.outlook.com>
To: Jun Li <jun.li@nxp.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "a.hajda@samsung.com" <a.hajda@samsung.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "yueyao@google.com" <yueyao@google.com>, Peter Chen <peter.chen@nxp.com>, "garsilva@embeddedor.com" <garsilva@embeddedor.com>, "o_leveque@orange.fr" <o_leveque@orange.fr>, "shufan_lee@richtek.com" <shufan_lee@richtek.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Hi,

On Mon, Mar 05, 2018 at 10:35:07AM +0000, Jun Li wrote:
> > So it actually does make sense to define those properties for the
> > "connector" node instead of TCPC parent. They are generic "Type-C"
> > properties (right?), so we may want to use them with multiport devices as
> > well.
> > 
> 
> Yes, that's the idea of my v2, I will keep this but via fwnode_property*.

Cool. While at it, can you also add a patch to this series where the
fwnode is bind to the port? Something like this:

diff --git a/drivers/staging/typec/tcpci.c b/drivers/staging/typec/tcpci.c
index 9bd4412356c9..ac4e7605f9d5 100644
--- a/drivers/staging/typec/tcpci.c
+++ b/drivers/staging/typec/tcpci.c
@@ -452,6 +452,8 @@ static int tcpci_probe(struct i2c_client *client,
        if (IS_ERR(tcpci->regmap))
                return PTR_ERR(tcpci->regmap);

+       tcpci->tcpc.fwnode = device_get_named_child_node(&client->dev, "connector");
+
        tcpci->tcpc.init = tcpci_init;
        tcpci->tcpc.get_vbus = tcpci_get_vbus;
        tcpci->tcpc.set_vbus = tcpci_set_vbus;
diff --git a/drivers/usb/typec/tcpm.c b/drivers/usb/typec/tcpm.c
index f4d563ee7690..68a0ead400c0 100644
--- a/drivers/usb/typec/tcpm.c
+++ b/drivers/usb/typec/tcpm.c
@@ -3729,6 +3729,7 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
        else
                port->try_role = TYPEC_NO_PREFERRED_ROLE;

+       port->typec_caps.fwnode = tcpc->fwnode;
        port->typec_caps.prefer_role = tcpc->config->default_role;
        port->typec_caps.type = tcpc->config->type;
        port->typec_caps.revision = 0x0120;     /* Type-C spec release 1.2 */
diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
index ca1c0b57f03f..a25ebfea054d 100644
--- a/include/linux/usb/tcpm.h
+++ b/include/linux/usb/tcpm.h
@@ -127,6 +127,7 @@ struct tcpc_mux_dev {
 /**
  * struct tcpc_dev - Port configuration and callback functions
  * @config:    Pointer to port configuration
+ * @fwnode:    Pointer to port fwnode
  * @get_vbus:  Called to read current VBUS state
  * @get_current_limit:
  *             Optional; called by the tcpm core when configured as a snk
@@ -155,6 +156,7 @@ struct tcpc_mux_dev {
  */
 struct tcpc_dev {
        const struct tcpc_config *config;
+       struct fwnode_handle *fwnode;

        int (*init)(struct tcpc_dev *dev);
        int (*get_vbus)(struct tcpc_dev *dev);


Thanks,

-- 
heikki
