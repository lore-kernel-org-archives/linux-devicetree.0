Return-Path: <SRS0=8ciE=JN=diasemi.com=Adam.Thomson.Opensource@kernel.org>
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Subject: RE: [PATCH v8 06/14] usb: typec: tcpm: support get typec and pd
 config from device properties
Date: Wed, 27 Jun 2018 08:13:43 +0000
Message-ID: <2E89032DDAA8B9408CB92943514A033701983033D5@SW-EX-MBX01.diasemi.com>
References: <1530056732-9640-1-git-send-email-jun.li@nxp.com>
 <1530056732-9640-7-git-send-email-jun.li@nxp.com>
In-Reply-To: <1530056732-9640-7-git-send-email-jun.li@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Li Jun <jun.li@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "linux@roeck-us.net" <linux@roeck-us.net>
Cc: "a.hajda@samsung.com" <a.hajda@samsung.com>, "cw00.choi@samsung.com" <cw00.choi@samsung.com>, "shufan_lee@richtek.com" <shufan_lee@richtek.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-imx@nxp.com" <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On 27 June 2018 00:45, Li Jun wrote:

> This patch adds support of get typec and power delivery config from
> firmware description.
>=20
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Li Jun <jun.li@nxp.com>

Acked-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

> ---
>  drivers/usb/typec/tcpm.c | 131 +++++++++++++++++++++++++++++++++++++++--=
---
> ---
>  1 file changed, 109 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/usb/typec/tcpm.c b/drivers/usb/typec/tcpm.c
> index d22b37b..9dcab81 100644
> --- a/drivers/usb/typec/tcpm.c
> +++ b/drivers/usb/typec/tcpm.c
> @@ -4236,6 +4236,81 @@ static int tcpm_copy_vdos(u32 *dest_vdo, const u32
> *src_vdo,
>  	return nr_vdo;
>  }
>=20
> +static int tcpm_fw_get_caps(struct tcpm_port *port,
> +			    struct fwnode_handle *fwnode)
> +{
> +	const char *cap_str;
> +	int ret;
> +	u32 mw;
> +
> +	if (!fwnode)
> +		return -EINVAL;
> +
> +	/* USB data support is optional */
> +	ret =3D fwnode_property_read_string(fwnode, "data-role", &cap_str);
> +	if (ret =3D=3D 0) {
> +		port->typec_caps.data =3D typec_find_port_data_role(cap_str);
> +		if (port->typec_caps.data < 0)
> +			return -EINVAL;
> +	}
> +
> +	ret =3D fwnode_property_read_string(fwnode, "power-role", &cap_str);
> +	if (ret < 0)
> +		return ret;
> +
> +	port->typec_caps.type =3D typec_find_port_power_role(cap_str);
> +	if (port->typec_caps.type < 0)
> +		return -EINVAL;
> +	port->port_type =3D port->typec_caps.type;
> +
> +	if (port->port_type =3D=3D TYPEC_PORT_SNK)
> +		goto sink;
> +
> +	/* Get source pdos */
> +	ret =3D fwnode_property_read_u32_array(fwnode, "source-pdos",
> +					     NULL, 0);
> +	if (ret <=3D 0)
> +		return -EINVAL;
> +
> +	port->nr_src_pdo =3D min(ret, PDO_MAX_OBJECTS);
> +	ret =3D fwnode_property_read_u32_array(fwnode, "source-pdos",
> +					     port->src_pdo, port->nr_src_pdo);
> +	if ((ret < 0) || tcpm_validate_caps(port, port->src_pdo,
> +					    port->nr_src_pdo))
> +		return -EINVAL;
> +
> +	if (port->port_type =3D=3D TYPEC_PORT_SRC)
> +		return 0;
> +
> +	/* Get the preferred power role for DRP */
> +	ret =3D fwnode_property_read_string(fwnode, "try-power-role", &cap_str)=
;
> +	if (ret < 0)
> +		return ret;
> +
> +	port->typec_caps.prefer_role =3D typec_find_power_role(cap_str);
> +	if (port->typec_caps.prefer_role < 0)
> +		return -EINVAL;
> +sink:
> +	/* Get sink pdos */
> +	ret =3D fwnode_property_read_u32_array(fwnode, "sink-pdos",
> +					     NULL, 0);
> +	if (ret <=3D 0)
> +		return -EINVAL;
> +
> +	port->nr_snk_pdo =3D min(ret, PDO_MAX_OBJECTS);
> +	ret =3D fwnode_property_read_u32_array(fwnode, "sink-pdos",
> +					     port->snk_pdo, port->nr_snk_pdo);
> +	if ((ret < 0) || tcpm_validate_caps(port, port->snk_pdo,
> +					    port->nr_snk_pdo))
> +		return -EINVAL;
> +
> +	if (fwnode_property_read_u32(fwnode, "op-sink-microwatt", &mw) < 0)
> +		return -EINVAL;
> +	port->operating_snk_mw =3D mw / 1000;
> +
> +	return 0;
> +}
> +
>  int tcpm_update_source_capabilities(struct tcpm_port *port, const u32 *p=
do,
>  				    unsigned int nr_pdo)
>  {
> @@ -4521,12 +4596,36 @@ static int devm_tcpm_psy_register(struct tcpm_por=
t
> *port)
>  	return PTR_ERR_OR_ZERO(port->psy);
>  }
>=20
> +static int tcpm_copy_caps(struct tcpm_port *port,
> +			  const struct tcpc_config *tcfg)
> +{
> +	if (tcpm_validate_caps(port, tcfg->src_pdo, tcfg->nr_src_pdo) ||
> +	    tcpm_validate_caps(port, tcfg->snk_pdo, tcfg->nr_snk_pdo))
> +		return -EINVAL;
> +
> +	port->nr_src_pdo =3D tcpm_copy_pdos(port->src_pdo, tcfg->src_pdo,
> +					  tcfg->nr_src_pdo);
> +	port->nr_snk_pdo =3D tcpm_copy_pdos(port->snk_pdo, tcfg->snk_pdo,
> +					  tcfg->nr_snk_pdo);
> +
> +	port->nr_snk_vdo =3D tcpm_copy_vdos(port->snk_vdo, tcfg->snk_vdo,
> +					  tcfg->nr_snk_vdo);
> +
> +	port->operating_snk_mw =3D tcfg->operating_snk_mw;
> +
> +	port->typec_caps.prefer_role =3D tcfg->default_role;
> +	port->typec_caps.type =3D tcfg->type;
> +	port->typec_caps.data =3D tcfg->data;
> +
> +	return 0;
> +}
> +
>  struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev=
 *tcpc)
>  {
>  	struct tcpm_port *port;
>  	int i, err;
>=20
> -	if (!dev || !tcpc || !tcpc->config ||
> +	if (!dev || !tcpc ||
>  	    !tcpc->get_vbus || !tcpc->set_cc || !tcpc->get_cc ||
>  	    !tcpc->set_polarity || !tcpc->set_vconn || !tcpc->set_vbus ||
>  	    !tcpc->set_pd_rx || !tcpc->set_roles || !tcpc->pd_transmit)
> @@ -4556,30 +4655,18 @@ struct tcpm_port *tcpm_register_port(struct devic=
e
> *dev, struct tcpc_dev *tcpc)
>  	init_completion(&port->pps_complete);
>  	tcpm_debugfs_init(port);
>=20
> -	if (tcpm_validate_caps(port, tcpc->config->src_pdo,
> -			       tcpc->config->nr_src_pdo) ||
> -	    tcpm_validate_caps(port, tcpc->config->snk_pdo,
> -			       tcpc->config->nr_snk_pdo)) {
> -		err =3D -EINVAL;
> +	err =3D tcpm_fw_get_caps(port, tcpc->fwnode);
> +	if ((err < 0) && tcpc->config)
> +		err =3D tcpm_copy_caps(port, tcpc->config);
> +	if (err < 0)
>  		goto out_destroy_wq;
> -	}
> -	port->nr_src_pdo =3D tcpm_copy_pdos(port->src_pdo, tcpc->config->src_pd=
o,
> -					  tcpc->config->nr_src_pdo);
> -	port->nr_snk_pdo =3D tcpm_copy_pdos(port->snk_pdo, tcpc->config-
> >snk_pdo,
> -					  tcpc->config->nr_snk_pdo);
> -	port->nr_snk_vdo =3D tcpm_copy_vdos(port->snk_vdo, tcpc->config-
> >snk_vdo,
> -					  tcpc->config->nr_snk_vdo);
> -
> -	port->operating_snk_mw =3D tcpc->config->operating_snk_mw;
> -	if (!tcpc->config->try_role_hw)
> -		port->try_role =3D tcpc->config->default_role;
> +
> +	if (!tcpc->config || !tcpc->config->try_role_hw)
> +		port->try_role =3D port->typec_caps.prefer_role;
>  	else
>  		port->try_role =3D TYPEC_NO_PREFERRED_ROLE;
>=20
>  	port->typec_caps.fwnode =3D tcpc->fwnode;
> -	port->typec_caps.prefer_role =3D tcpc->config->default_role;
> -	port->typec_caps.type =3D tcpc->config->type;
> -	port->typec_caps.data =3D tcpc->config->data;
>  	port->typec_caps.revision =3D 0x0120;	/* Type-C spec release 1.2 */
>  	port->typec_caps.pd_revision =3D 0x0300;	/* USB-PD spec release 3.0 */
>  	port->typec_caps.dr_set =3D tcpm_dr_set;
> @@ -4589,7 +4676,7 @@ struct tcpm_port *tcpm_register_port(struct device =
*dev,
> struct tcpc_dev *tcpc)
>  	port->typec_caps.port_type_set =3D tcpm_port_type_set;
>=20
>  	port->partner_desc.identity =3D &port->partner_ident;
> -	port->port_type =3D tcpc->config->type;
> +	port->port_type =3D port->typec_caps.type;
>=20
>  	port->role_sw =3D usb_role_switch_get(port->dev);
>  	if (IS_ERR(port->role_sw)) {
> @@ -4607,7 +4694,7 @@ struct tcpm_port *tcpm_register_port(struct device =
*dev,
> struct tcpc_dev *tcpc)
>  		goto out_destroy_wq;
>  	}
>=20
> -	if (tcpc->config->alt_modes) {
> +	if (tcpc->config && tcpc->config->alt_modes) {
>  		const struct typec_altmode_desc *paltmode =3D tcpc->config-
> >alt_modes;
>=20
>  		i =3D 0;
> --
> 2.7.4
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
