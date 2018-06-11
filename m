Return-Path: <SRS0=3bjE=I5=linux.intel.com=heikki.krogerus@kernel.org>
Date: Mon, 11 Jun 2018 15:05:16 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v6 06/15] usb: typec: tcpm: support get typec and pd
 config from device properties
Message-ID: <20180611120516.GI17155@kuha.fi.intel.com>
References: <1527475967-15201-1-git-send-email-jun.li@nxp.com>
 <1527475967-15201-7-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527475967-15201-7-git-send-email-jun.li@nxp.com>
To: Li Jun <jun.li@nxp.com>
Cc: robh+dt@kernel.org, gregkh@linuxfoundation.org, linux@roeck-us.net, cw00.choi@samsung.com, a.hajda@samsung.com, shufan_lee@richtek.com, peter.chen@nxp.com, garsilva@embeddedor.com, gsomlo@gmail.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-imx@nxp.com
List-ID: <devicetree@vger.kernel.org>

On Mon, May 28, 2018 at 10:52:38AM +0800, Li Jun wrote:
> This patch adds support of get typec and power delivery config from
> firmware description.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>

This looks good to me, assuming that everybody agrees with the names
used in the bindings. As usual, I would like Guenter to check tcpm.c
changes. I'm putting a few nitpicks below, but in any case:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm.c | 132 +++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 110 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm.c b/drivers/usb/typec/tcpm.c
> index fcd22e8..aa17cd5 100644
> --- a/drivers/usb/typec/tcpm.c
> +++ b/drivers/usb/typec/tcpm.c
> @@ -4241,6 +4241,81 @@ static int tcpm_copy_vdos(u32 *dest_vdo, const u32 *src_vdo,
>  	return nr_vdo;
>  }
>  
> +static int tcpm_fw_get_caps(struct tcpm_port *port,
> +			    struct fwnode_handle *fwnode)
> +{
> +	const char *cap_str;
> +	int ret;
> +	u32 mw;
> +
> +	if (!port || !fwnode)

if (!fwnode) is enough.

> +		return -EINVAL;
> +
> +	/* USB data support is optional */
> +	ret = fwnode_property_read_string(fwnode, "data-role", &cap_str);
> +	if (ret == 0) {
> +		port->typec_caps.data = typec_find_port_data_role(cap_str);
> +		if (port->typec_caps.data < 0)
> +			return -EINVAL;
> +	}
> +
> +	ret = fwnode_property_read_string(fwnode, "power-role", &cap_str);
> +	if (ret < 0)
> +		return ret;
> +
> +	port->typec_caps.type = typec_find_port_power_role(cap_str);
> +	if (port->typec_caps.type < 0)
> +		return -EINVAL;
> +	port->port_type = port->typec_caps.type;
> +
> +	if (port->port_type == TYPEC_PORT_SNK)
> +		goto sink;
> +
> +	/* Get soruce pdos */

s/soruce/source/

> +	ret = fwnode_property_read_u32_array(fwnode, "source-pdos",
> +					     NULL, 0);
> +	if (ret <= 0)
> +		return -EINVAL;
> +
> +	port->nr_src_pdo = min(ret, PDO_MAX_OBJECTS);
> +	ret = fwnode_property_read_u32_array(fwnode, "source-pdos",
> +					     port->src_pdo, port->nr_src_pdo);
> +	if ((ret < 0) || tcpm_validate_caps(port, port->src_pdo,
> +					    port->nr_src_pdo))
> +		return -EINVAL;
> +
> +	if (port->port_type == TYPEC_PORT_SRC)
> +		return 0;
> +
> +	/* Get the preferred power role for DRP */
> +	ret = fwnode_property_read_string(fwnode, "try-power-role", &cap_str);
> +	if (ret < 0)
> +		return ret;
> +
> +	port->typec_caps.prefer_role = typec_find_power_role(cap_str);
> +	if (port->typec_caps.prefer_role < 0)
> +		return -EINVAL;
> +sink:
> +	/* Get sink pdos */
> +	ret = fwnode_property_read_u32_array(fwnode, "sink-pdos",
> +					     NULL, 0);
> +	if (ret <= 0)
> +		return -EINVAL;
> +
> +	port->nr_snk_pdo = min(ret, PDO_MAX_OBJECTS);
> +	ret = fwnode_property_read_u32_array(fwnode, "sink-pdos",
> +					     port->snk_pdo, port->nr_snk_pdo);
> +	if ((ret < 0) || tcpm_validate_caps(port, port->snk_pdo,
> +					    port->nr_snk_pdo))
> +		return -EINVAL;
> +
> +	if (fwnode_property_read_u32(fwnode, "op-sink-microwatt", &mw) < 0)
> +		return -EINVAL;
> +	port->operating_snk_mw = mw / 1000;
> +
> +	return 0;
> +}

Thanks,

-- 
heikki
