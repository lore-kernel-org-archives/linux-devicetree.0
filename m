Return-Path: <SRS0=Dkm/=JL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail1.bemta25.messagelabs.com ([195.245.230.65]:3060 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932135AbeFYKpz (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 25 Jun 2018 06:45:55 -0400
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Subject: RE: [PATCH v7 06/14] usb: typec: tcpm: support get typec and pd
 config from device properties
Date: Mon, 25 Jun 2018 10:45:46 +0000
Message-ID: <2E89032DDAA8B9408CB92943514A0337014C1F47AF@SW-EX-MBX01.diasemi.com>
References: <1529914126-22550-1-git-send-email-jun.li@nxp.com>
 <1529914126-22550-7-git-send-email-jun.li@nxp.com>
In-Reply-To: <1529914126-22550-7-git-send-email-jun.li@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Li Jun <jun.li@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "linux@roeck-us.net" <linux@roeck-us.net>
Cc: "a.hajda@samsung.com" <a.hajda@samsung.com>, "cw00.choi@samsung.com" <cw00.choi@samsung.com>, "shufan_lee@richtek.com" <shufan_lee@richtek.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-imx@nxp.com" <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

On 25 June 2018 09:09, Li Jun wrote:

> This patch adds support of get typec and power delivery config from
> firmware description.
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  drivers/usb/typec/tcpm.c | 132 +++++++++++++++++++++++++++++++++++++++-----
> ---
>  1 file changed, 110 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm.c b/drivers/usb/typec/tcpm.c
> index d22b37b..0454654 100644
> --- a/drivers/usb/typec/tcpm.c
> +++ b/drivers/usb/typec/tcpm.c
> @@ -4236,6 +4236,81 @@ static int tcpm_copy_vdos(u32 *dest_vdo, const u32
> *src_vdo,
>  	return nr_vdo;
>  }

...

>  struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
>  {
>  	struct tcpm_port *port;
>  	int i, err;
> 
> -	if (!dev || !tcpc || !tcpc->config ||
> +	if (!dev || !tcpc ||
>  	    !tcpc->get_vbus || !tcpc->set_cc || !tcpc->get_cc ||
>  	    !tcpc->set_polarity || !tcpc->set_vconn || !tcpc->set_vbus ||
>  	    !tcpc->set_pd_rx || !tcpc->set_roles || !tcpc->pd_transmit)
> @@ -4556,30 +4655,19 @@ struct tcpm_port *tcpm_register_port(struct device
> *dev, struct tcpc_dev *tcpc)
>  	init_completion(&port->pps_complete);
>  	tcpm_debugfs_init(port);
> 
> -	if (tcpm_validate_caps(port, tcpc->config->src_pdo,
> -			       tcpc->config->nr_src_pdo) ||
> -	    tcpm_validate_caps(port, tcpc->config->snk_pdo,
> -			       tcpc->config->nr_snk_pdo)) {
> -		err = -EINVAL;
> +	if (tcpc->config)
> +		err = tcpm_copy_caps(port, tcpc->config);
> +	else
> +		err = tcpm_fw_get_caps(port, tcpc->fwnode);
> +	if (err < 0)

Should we not be favouring the generic FW based capabilities over values defined
in a Type C port controller driver, if the FW config is present? For example
fusb302 driver has a hard coded config so that would always be selected rather
than the FW based config, unless I'm missing something obvious?
