Return-Path: <SRS0=3bjE=I5=linux.intel.com=heikki.krogerus@kernel.org>
Date: Mon, 11 Jun 2018 14:08:47 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v6 05/15] usb: typec: add API to get typec basic port
 power and data config
Message-ID: <20180611110847.GG17155@kuha.fi.intel.com>
References: <1527475967-15201-1-git-send-email-jun.li@nxp.com>
 <1527475967-15201-6-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527475967-15201-6-git-send-email-jun.li@nxp.com>
To: Li Jun <jun.li@nxp.com>
Cc: robh+dt@kernel.org, gregkh@linuxfoundation.org, linux@roeck-us.net, cw00.choi@samsung.com, a.hajda@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, garsilva@embeddedor.com, gsomlo@gmail.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

Hi Jun,

On Mon, May 28, 2018 at 10:52:37AM +0800, Li Jun wrote:
> This patch adds 3 APIs to get the typec port power and data type,
> and preferred power role by its name string.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  drivers/usb/typec/class.c | 50 +++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/usb/typec.h |  3 +++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 53df10d..4c7d18c 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -802,6 +802,12 @@ static const char * const typec_port_types[] = {
>  	[TYPEC_PORT_DRP] = "dual",
>  };
>  
> +static const char * const typec_data_caps[] = {
> +	[TYPEC_PORT_DFP] = "host",
> +	[TYPEC_PORT_UFP] = "device",
> +	[TYPEC_PORT_DRD] = "dual",
> +};

Since I guess you need to fix this patch in any case, could you rename
that to "typec_port_data_roles".

And while at it, how about using this as an opportunity to rename
typec_port_types to typec_port_power_roles?

So this just a suggestion, no need to actually change it :-) :

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index abbd33939109..97f7eb0e9879 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -918,12 +918,18 @@ static const char * const typec_data_roles[] = {
        [TYPEC_HOST]    = "host",
 };

-static const char * const typec_port_types[] = {
+static const char * const typec_port_power_roles[] = {
        [TYPEC_PORT_SRC] = "source",
        [TYPEC_PORT_SNK] = "sink",
        [TYPEC_PORT_DRP] = "dual",
 };

+static const char * const typec_port_data_roles[] = {
+       [TYPEC_PORT_DFP] = "host",
+       [TYPEC_PORT_UFP] = "device",
+       [TYPEC_PORT_DRD] = "dual",
+};
+
 static const char * const typec_port_types_drp[] = {
        [TYPEC_PORT_SRC] = "dual [source] sink",
        [TYPEC_PORT_SNK] = "dual source [sink]",
@@ -1054,7 +1060,7 @@ static ssize_t power_role_store(struct device *dev,
        mutex_lock(&port->port_type_lock);
        if (port->port_type != TYPEC_PORT_DRP) {
                dev_dbg(dev, "port type fixed at \"%s\"",
-                            typec_port_types[port->port_type]);
+                       typec_port_power_roles[port->port_type]);
                ret = -EOPNOTSUPP;
                goto unlock_and_ret;
        }
@@ -1095,7 +1101,7 @@ port_type_store(struct device *dev, struct device_attribute *attr,
                return -EOPNOTSUPP;
        }

-       ret = sysfs_match_string(typec_port_types, buf);
+       ret = sysfs_match_string(typec_port_power_roles, buf);
        if (ret < 0)
                return ret;

@@ -1129,7 +1135,7 @@ port_type_show(struct device *dev, struct device_attribute *attr,
                return sprintf(buf, "%s\n",
                               typec_port_types_drp[port->port_type]);

-       return sprintf(buf, "[%s]\n", typec_port_types[port->cap->type]);
+       return sprintf(buf, "[%s]\n", typec_port_power_roles[port->cap->type]);
 }
 static DEVICE_ATTR_RW(port_type);


Thanks,

-- 
heikki
