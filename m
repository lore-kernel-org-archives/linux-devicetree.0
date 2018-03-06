Return-Path: <SRS0=0TRk=F4=linux.intel.com=heikki.krogerus@kernel.org>
Date: Tue, 6 Mar 2018 14:02:02 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v2 10/12] dt-bindings: connector: add properties for
 typec power delivery
Message-ID: <20180306120202.GA4951@kuha.fi.intel.com>
References: <1519645759-12701-1-git-send-email-jun.li@nxp.com>
 <CGME20180226120532epcas5p3c4b0258ec0677939f4241b24da5f48bc@epcas5p3.samsung.com>
 <1519645759-12701-11-git-send-email-jun.li@nxp.com>
 <20522804-65ab-5d48-716a-c199e4c095fc@samsung.com>
 <VI1PR0402MB39175D757B94FB52CB5A09F889DA0@VI1PR0402MB3917.eurprd04.prod.outlook.com>
 <133b5194-26ff-071a-d3d1-2bfca1375cae@samsung.com>
 <VI1PR0402MB3917B47072CEC815AB6AE06A89D90@VI1PR0402MB3917.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline
In-Reply-To: <VI1PR0402MB3917B47072CEC815AB6AE06A89D90@VI1PR0402MB3917.eurprd04.prod.outlook.com>
To: Jun Li <jun.li@nxp.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux@roeck-us.net" <linux@roeck-us.net>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "yueyao@google.com" <yueyao@google.com>, Peter Chen <peter.chen@nxp.com>, "garsilva@embeddedor.com" <garsilva@embeddedor.com>, "o_leveque@orange.fr" <o_leveque@orange.fr>, "shufan_lee@richtek.com" <shufan_lee@richtek.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi guys,

On Tue, Mar 06, 2018 at 09:38:59AM +0000, Jun Li wrote:
> > >>> diff --git
> > >>> a/Documentation/devicetree/bindings/connector/usb-connector.txt
> > >>> b/Documentation/devicetree/bindings/connector/usb-connector.txt
> > >>> index e1463f1..242f6df 100644
> > >>> --- a/Documentation/devicetree/bindings/connector/usb-connector.txt
> > >>> +++
> > b/Documentation/devicetree/bindings/connector/usb-connector.txt
> > >>> @@ -15,6 +15,30 @@ Optional properties:
> > >>>  - type: size of the connector, should be specified in case of USB-A,
> > USB-B
> > >>>    non-fullsize connectors: "mini", "micro".
> > >>>
> > >>> +Required properties for usb-c-connector with power delivery support:
> > >>> +- port-type: should be one of "source", "sink" or "dual".
> > >>> +- default-role: preferred power role if port-type is "dual"(drp),
> > >>> +should be
> > >>> +  "sink" or "source".
> > >> Since port carries data and power, it would be better to explicitly
> > >> mention it in names of properties which can be ambiguous.
> > >> Maybe instead of 'port-type' you can use 'power-role', for example.
> > > Port-type is align with the name of typec coding and ABI, 'power-role'
> > > is more like for the current role rather than the port's ability.
> > 
> > I am not sure what are you exactly mean by "coding and ABI", but I guess it is
> > just about Power-Delivery part of USB-C. And if you want to put this property
> > into USB node without mark it is related to PD part of USB connector, you
> > risk confusion with possible USB data related properties.
> 
> Understood your concern, I am following typec naming conventions,
> for typec, port-type property has the same meaning as
> /sys/class/typec/portx/port_type
> which is not only for power, also for data, there are dedicated
> sys files power_role for power and data_role for data.
> 
> > Simple question, what if somebody wants to add property describing USB
> > data capabilities (DFP, UFP, DRD), how should it be named?
> > 
> 
> Then we may use data-role?
> 
> > >
> > >> Other thing is that default-role is required only in case of DRP, so
> > >> maybe better would be to squash it in power-role, for example:
> > >> ?????? power-role: should be on of "source", "sink", "dual-source",
> > >> "dual-sink", in case of dual roles suffix determines preferred role.
> > > I don't know how much this squash can benefit, "dual-source/sink" is
> > > not directly showing its meaning by name.
> > 
> > Some benefit is simpler binding, no conditionally-required property.
> > 
> 
> There is already string definition for port type and preferred role parse 
> static const char * const typec_port_types[] = {
>          [TYPEC_PORT_DFP] = "source",
>          [TYPEC_PORT_UFP] = "sink",
>          [TYPEC_PORT_DRP] = "dual",
> };
> And I think there will be other conditionally-required properties
> to be extended later, are we going to name all of them by this way?
> Either way is OK for me, I am not sure if there is principle like we
> should avoid conditionally-required property, if we should, maybe
> "dual-preferred-source/sink" is better.
> 
> Hi Heikki,
> Do you have any comments/preference here?

In the first versions of USB Type-C specification the data and power
roles were in practice coupled together. There were no data role
specific modes, just DFP, UFP and DRP. However, v1.2 of the spec.
introduced separate modes for the data roles as well, and I have a
patch for that (attached).

If you are asking my opinion, the data role must be handled as
separate capability of the port, i.e. you probable want to have
separate properties for the power role and data role, even if we did
not support that yet in the class code. Don't use "port-type" name,
just call them "power-role" and "data-role" from now on.

The default-role should tell the state machines whether Try.SNK or
Try.SRC states should be used or not. Perhaps you should have boolean
property for both: "try-snk" and "try-src" (note: both can not be true).

Final note. I think it would make sense to clearly separate the USB
Type-C specific properties from USB PD ones. Though it is unlikely
that we will see USB PD being used with other connector types besides
Type-C anymore, USB Type-C connectors will still definitely not
always support USB PD, but when USB PD is not supported, we still need
to know the data-role, power-role, default-role (or try-snk, try-src),
etc.


Br,

-- 
heikki

--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="0001-usb-typec-Separate-the-definitions-for-data-and-powe.patch"

>From 4f7652ba8a3d4e8f7bd30cf7ca8beba6af5ad873 Mon Sep 17 00:00:00 2001
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date: Tue, 2 Jan 2018 17:07:58 +0300
Subject: [PATCH] usb: typec: Separate the definitions for data and power roles

USB Type-C specification v1.2 separated the power and data
roles more clearly. Dual-Role-Data term was introduced, and
the meaning of DRP was changed from "Dual-Role-Port" to
"Dual-Role-Power".

In order to allow the port drivers to describe the
capabilities of the ports more clearly according to the
newest specifications, introducing separate definitions for
the data roles.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/class.c           | 56 ++++++++++++++++++++++---------------
 drivers/usb/typec/fusb302/fusb302.c |  1 +
 drivers/usb/typec/tcpm.c            |  9 +++---
 drivers/usb/typec/tps6598x.c        | 26 +++++++++++------
 drivers/usb/typec/typec_wcove.c     |  1 +
 drivers/usb/typec/ucsi/ucsi.c       | 13 +++++++--
 include/linux/usb/tcpm.h            |  1 +
 include/linux/usb/typec.h           | 14 ++++++++--
 8 files changed, 80 insertions(+), 41 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 2620a694704f..53df10df2f9d 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -282,10 +282,10 @@ typec_altmode_roles_show(struct device *dev, struct device_attribute *attr,
 	ssize_t ret;
 
 	switch (mode->roles) {
-	case TYPEC_PORT_DFP:
+	case TYPEC_PORT_SRC:
 		ret = sprintf(buf, "source\n");
 		break;
-	case TYPEC_PORT_UFP:
+	case TYPEC_PORT_SNK:
 		ret = sprintf(buf, "sink\n");
 		break;
 	case TYPEC_PORT_DRP:
@@ -797,14 +797,14 @@ static const char * const typec_data_roles[] = {
 };
 
 static const char * const typec_port_types[] = {
-	[TYPEC_PORT_DFP] = "source",
-	[TYPEC_PORT_UFP] = "sink",
+	[TYPEC_PORT_SRC] = "source",
+	[TYPEC_PORT_SNK] = "sink",
 	[TYPEC_PORT_DRP] = "dual",
 };
 
 static const char * const typec_port_types_drp[] = {
-	[TYPEC_PORT_DFP] = "dual [source] sink",
-	[TYPEC_PORT_UFP] = "dual source [sink]",
+	[TYPEC_PORT_SRC] = "dual [source] sink",
+	[TYPEC_PORT_SNK] = "dual source [sink]",
 	[TYPEC_PORT_DRP] = "[dual] source sink",
 };
 
@@ -875,9 +875,7 @@ static ssize_t data_role_store(struct device *dev,
 		return ret;
 
 	mutex_lock(&port->port_type_lock);
-	if (port->port_type != TYPEC_PORT_DRP) {
-		dev_dbg(dev, "port type fixed at \"%s\"",
-			     typec_port_types[port->port_type]);
+	if (port->cap->data != TYPEC_PORT_DRD) {
 		ret = -EOPNOTSUPP;
 		goto unlock_and_ret;
 	}
@@ -897,7 +895,7 @@ static ssize_t data_role_show(struct device *dev,
 {
 	struct typec_port *port = to_typec_port(dev);
 
-	if (port->cap->type == TYPEC_PORT_DRP)
+	if (port->cap->data == TYPEC_PORT_DRD)
 		return sprintf(buf, "%s\n", port->data_role == TYPEC_HOST ?
 			       "[host] device" : "host [device]");
 
@@ -1328,7 +1326,6 @@ struct typec_port *typec_register_port(struct device *parent,
 				       const struct typec_capability *cap)
 {
 	struct typec_port *port;
-	int role;
 	int ret;
 	int id;
 
@@ -1354,21 +1351,36 @@ struct typec_port *typec_register_port(struct device *parent,
 		goto err_mux;
 	}
 
-	if (cap->type == TYPEC_PORT_DFP)
-		role = TYPEC_SOURCE;
-	else if (cap->type == TYPEC_PORT_UFP)
-		role = TYPEC_SINK;
-	else
-		role = cap->prefer_role;
-
-	if (role == TYPEC_SOURCE) {
-		port->data_role = TYPEC_HOST;
+	switch (cap->type) {
+	case TYPEC_PORT_SRC:
 		port->pwr_role = TYPEC_SOURCE;
 		port->vconn_role = TYPEC_SOURCE;
-	} else {
-		port->data_role = TYPEC_DEVICE;
+		break;
+	case TYPEC_PORT_SNK:
 		port->pwr_role = TYPEC_SINK;
 		port->vconn_role = TYPEC_SINK;
+		break;
+	case TYPEC_PORT_DRP:
+		if (cap->prefer_role != TYPEC_NO_PREFERRED_ROLE)
+			port->pwr_role = cap->prefer_role;
+		else
+			port->pwr_role = TYPEC_SINK;
+		break;
+	}
+
+	switch (cap->data) {
+	case TYPEC_PORT_DFP:
+		port->data_role = TYPEC_HOST;
+		break;
+	case TYPEC_PORT_UFP:
+		port->data_role = TYPEC_DEVICE;
+		break;
+	case TYPEC_PORT_DRD:
+		if (cap->prefer_role == TYPEC_SOURCE)
+			port->data_role = TYPEC_HOST;
+		else
+			port->data_role = TYPEC_DEVICE;
+		break;
 	}
 
 	port->id = id;
diff --git a/drivers/usb/typec/fusb302/fusb302.c b/drivers/usb/typec/fusb302/fusb302.c
index b267b907bf24..76c9d955fa40 100644
--- a/drivers/usb/typec/fusb302/fusb302.c
+++ b/drivers/usb/typec/fusb302/fusb302.c
@@ -1230,6 +1230,7 @@ static const struct tcpc_config fusb302_tcpc_config = {
 	.max_snk_mw = 15000,
 	.operating_snk_mw = 2500,
 	.type = TYPEC_PORT_DRP,
+	.data = TYPEC_PORT_DRD,
 	.default_role = TYPEC_SINK,
 	.alt_modes = NULL,
 };
diff --git a/drivers/usb/typec/tcpm.c b/drivers/usb/typec/tcpm.c
index bfcaf6618a1f..0e1d92381522 100644
--- a/drivers/usb/typec/tcpm.c
+++ b/drivers/usb/typec/tcpm.c
@@ -350,7 +350,7 @@ static enum tcpm_state tcpm_default_state(struct tcpm_port *port)
 		else if (port->tcpc->config->default_role == TYPEC_SINK)
 			return SNK_UNATTACHED;
 		/* Fall through to return SRC_UNATTACHED */
-	} else if (port->port_type == TYPEC_PORT_UFP) {
+	} else if (port->port_type == TYPEC_PORT_SNK) {
 		return SNK_UNATTACHED;
 	}
 	return SRC_UNATTACHED;
@@ -2264,7 +2264,7 @@ static inline enum tcpm_state unattached_state(struct tcpm_port *port)
 			return SRC_UNATTACHED;
 		else
 			return SNK_UNATTACHED;
-	} else if (port->port_type == TYPEC_PORT_DFP) {
+	} else if (port->port_type == TYPEC_PORT_SRC) {
 		return SRC_UNATTACHED;
 	}
 
@@ -3554,11 +3554,11 @@ static int tcpm_port_type_set(const struct typec_capability *cap,
 
 	if (!port->connected) {
 		tcpm_set_state(port, PORT_RESET, 0);
-	} else if (type == TYPEC_PORT_UFP) {
+	} else if (type == TYPEC_PORT_SNK) {
 		if (!(port->pwr_role == TYPEC_SINK &&
 		      port->data_role == TYPEC_DEVICE))
 			tcpm_set_state(port, PORT_RESET, 0);
-	} else if (type == TYPEC_PORT_DFP) {
+	} else if (type == TYPEC_PORT_SRC) {
 		if (!(port->pwr_role == TYPEC_SOURCE &&
 		      port->data_role == TYPEC_HOST))
 			tcpm_set_state(port, PORT_RESET, 0);
@@ -3748,6 +3748,7 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 
 	port->typec_caps.prefer_role = tcpc->config->default_role;
 	port->typec_caps.type = tcpc->config->type;
+	port->typec_caps.data = tcpc->config->data;
 	port->typec_caps.revision = 0x0120;	/* Type-C spec release 1.2 */
 	port->typec_caps.pd_revision = 0x0200;	/* USB-PD spec release 2.0 */
 	port->typec_caps.dr_set = tcpm_dr_set;
diff --git a/drivers/usb/typec/tps6598x.c b/drivers/usb/typec/tps6598x.c
index 37a15c14a6c6..8b8406867c02 100644
--- a/drivers/usb/typec/tps6598x.c
+++ b/drivers/usb/typec/tps6598x.c
@@ -393,31 +393,39 @@ static int tps6598x_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
+	tps->typec_cap.revision = USB_TYPEC_REV_1_2;
+	tps->typec_cap.pd_revision = 0x200;
+	tps->typec_cap.prefer_role = TYPEC_NO_PREFERRED_ROLE;
+	tps->typec_cap.pr_set = tps6598x_pr_set;
+	tps->typec_cap.dr_set = tps6598x_dr_set;
+
 	switch (TPS_SYSCONF_PORTINFO(conf)) {
 	case TPS_PORTINFO_SINK_ACCESSORY:
 	case TPS_PORTINFO_SINK:
-		tps->typec_cap.type = TYPEC_PORT_UFP;
+		tps->typec_cap.type = TYPEC_PORT_SNK;
+		tps->typec_cap.data = TYPEC_PORT_UFP;
 		break;
 	case TPS_PORTINFO_DRP_UFP_DRD:
 	case TPS_PORTINFO_DRP_DFP_DRD:
-		tps->typec_cap.dr_set = tps6598x_dr_set;
-		/* fall through */
+		tps->typec_cap.type = TYPEC_PORT_DRP;
+		tps->typec_cap.data = TYPEC_PORT_DRD;
+		break;
 	case TPS_PORTINFO_DRP_UFP:
+		tps->typec_cap.type = TYPEC_PORT_DRP;
+		tps->typec_cap.data = TYPEC_PORT_UFP;
+		break;
 	case TPS_PORTINFO_DRP_DFP:
-		tps->typec_cap.pr_set = tps6598x_pr_set;
 		tps->typec_cap.type = TYPEC_PORT_DRP;
+		tps->typec_cap.data = TYPEC_PORT_DFP;
 		break;
 	case TPS_PORTINFO_SOURCE:
-		tps->typec_cap.type = TYPEC_PORT_DFP;
+		tps->typec_cap.type = TYPEC_PORT_SRC;
+		tps->typec_cap.data = TYPEC_PORT_DFP;
 		break;
 	default:
 		return -ENODEV;
 	}
 
-	tps->typec_cap.revision = USB_TYPEC_REV_1_2;
-	tps->typec_cap.pd_revision = 0x200;
-	tps->typec_cap.prefer_role = TYPEC_NO_PREFERRED_ROLE;
-
 	tps->port = typec_register_port(&client->dev, &tps->typec_cap);
 	if (IS_ERR(tps->port))
 		return PTR_ERR(tps->port);
diff --git a/drivers/usb/typec/typec_wcove.c b/drivers/usb/typec/typec_wcove.c
index 2e990e0d917d..19cca7f1b2c5 100644
--- a/drivers/usb/typec/typec_wcove.c
+++ b/drivers/usb/typec/typec_wcove.c
@@ -572,6 +572,7 @@ static struct tcpc_config wcove_typec_config = {
 	.operating_snk_mw = 15000,
 
 	.type = TYPEC_PORT_DRP,
+	.data = TYPEC_PORT_DRD,
 	.default_role = TYPEC_SINK,
 };
 
diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 69d544cfcd45..bf0977fbd100 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -592,11 +592,18 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 		return ret;
 
 	if (con->cap.op_mode & UCSI_CONCAP_OPMODE_DRP)
-		cap->type = TYPEC_PORT_DRP;
+		cap->data = TYPEC_PORT_DRD;
 	else if (con->cap.op_mode & UCSI_CONCAP_OPMODE_DFP)
-		cap->type = TYPEC_PORT_DFP;
+		cap->data = TYPEC_PORT_DFP;
 	else if (con->cap.op_mode & UCSI_CONCAP_OPMODE_UFP)
-		cap->type = TYPEC_PORT_UFP;
+		cap->data = TYPEC_PORT_UFP;
+
+	if (con->cap.provider && con->cap.consumer)
+		cap->type = TYPEC_PORT_DRP;
+	else if (con->cap.provider)
+		cap->type = TYPEC_PORT_SRC;
+	else if (con->cap.consumer)
+		cap->type = TYPEC_PORT_SNK;
 
 	cap->revision = ucsi->cap.typec_version;
 	cap->pd_revision = ucsi->cap.pd_version;
diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
index fe3508e6e1df..f0d839daeaea 100644
--- a/include/linux/usb/tcpm.h
+++ b/include/linux/usb/tcpm.h
@@ -91,6 +91,7 @@ struct tcpc_config {
 	unsigned int operating_snk_mw;
 
 	enum typec_port_type type;
+	enum typec_port_data data;
 	enum typec_role default_role;
 	bool try_role_hw;	/* try.{src,snk} implemented in hardware */
 
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 2408e5c2ed91..672b39bb0adc 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -22,9 +22,15 @@ struct typec_port;
 struct fwnode_handle;
 
 enum typec_port_type {
+	TYPEC_PORT_SRC,
+	TYPEC_PORT_SNK,
+	TYPEC_PORT_DRP,
+};
+
+enum typec_port_data {
 	TYPEC_PORT_DFP,
 	TYPEC_PORT_UFP,
-	TYPEC_PORT_DRP,
+	TYPEC_PORT_DRD,
 };
 
 enum typec_plug_type {
@@ -186,10 +192,11 @@ struct typec_partner_desc {
 
 /*
  * struct typec_capability - USB Type-C Port Capabilities
- * @role: DFP (Host-only), UFP (Device-only) or DRP (Dual Role)
+ * @type: Supported power role of the port
+ * @data: Supported data role of the port
  * @revision: USB Type-C Specification release. Binary coded decimal
  * @pd_revision: USB Power Delivery Specification revision if supported
- * @prefer_role: Initial role preference
+ * @prefer_role: Initial role preference (DRP ports).
  * @accessory: Supported Accessory Modes
  * @sw: Cable plug orientation switch
  * @mux: Multiplexer switch for Alternate/Accessory Modes
@@ -205,6 +212,7 @@ struct typec_partner_desc {
  */
 struct typec_capability {
 	enum typec_port_type	type;
+	enum typec_port_data	data;
 	u16			revision; /* 0120H = "1.2" */
 	u16			pd_revision; /* 0300H = "3.0" */
 	int			prefer_role;
-- 
2.16.1


--opJtzjQTFsWo+cga--
