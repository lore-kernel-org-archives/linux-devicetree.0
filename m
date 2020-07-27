Return-Path: <SRS0=xnVj=BG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26187C433E4
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 13:06:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A587206D8
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 13:06:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728141AbgG0NGi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jul 2020 09:06:38 -0400
Received: from mga02.intel.com ([134.134.136.20]:59418 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728393AbgG0NGh (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 27 Jul 2020 09:06:37 -0400
IronPort-SDR: 2v0DxkGq+SM2aWK39bJXdQ6yAPqQh4b7pUQLm0w8fFGi1F47bYVl6gZTj58Vt3/EiWFAaNOFms
 qgYhgSp1xNEA==
X-IronPort-AV: E=McAfee;i="6000,8403,9694"; a="139038469"
X-IronPort-AV: E=Sophos;i="5.75,402,1589266800"; 
   d="scan'208";a="139038469"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2020 06:05:32 -0700
IronPort-SDR: dm4Ln0TlqLC73NTofpZWW3ntYmjGkEGiQhlTD4Sfp5KSWJPzN0DxI79e2OcLzxsM1OrPykZol/
 A2mpmgx/NTcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,402,1589266800"; 
   d="scan'208";a="393977754"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 27 Jul 2020 06:05:29 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 27 Jul 2020 16:05:28 +0300
Date:   Mon, 27 Jul 2020 16:05:28 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Tobias Schramm <t.schramm@manjaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] usb: typec: Add
 typec_port_register_altmodes_from_fwnode()
Message-ID: <20200727130528.GB883641@kuha.fi.intel.com>
References: <20200714113617.10470-1-hdegoede@redhat.com>
 <20200714113617.10470-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200714113617.10470-3-hdegoede@redhat.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Hans,

On Tue, Jul 14, 2020 at 01:36:15PM +0200, Hans de Goede wrote:
> This can be used by Type-C controller drivers which use a standard
> usb-connector fwnode, with altmodes sub-node, to describe the available
> altmodes.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/usb/typec/class.c | 56 +++++++++++++++++++++++++++++++++++++++
>  include/linux/usb/typec.h |  7 +++++
>  2 files changed, 63 insertions(+)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index c9234748537a..47de2b2e3d54 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -1607,6 +1607,62 @@ typec_port_register_altmode(struct typec_port *port,
>  }
>  EXPORT_SYMBOL_GPL(typec_port_register_altmode);
>  
> +void typec_port_register_altmodes_from_fwnode(struct typec_port *port,
> +	const struct typec_altmode_ops *ops, void *drvdata,
> +	struct typec_altmode **altmodes, size_t n,
> +	struct fwnode_handle *fwnode)
> +{
> +	struct fwnode_handle *altmodes_node, *child;
> +	struct typec_altmode_desc desc;
> +	struct typec_altmode *alt;
> +	size_t index = 0;
> +	u32 svid, vdo;
> +	int ret;
> +
> +	altmodes_node = fwnode_get_named_child_node(fwnode, "altmodes");
> +	if (!altmodes_node)
> +		return;

Do we need that? Why not just make the sub-nodes describing the
alternate modes direct children of the connector node instead of
grouping them under a special sub-node?

If the child node of the connector has device properties "svid" and
"vdo" then it is an alt mode that the connector supports, and it can't
be anything else, no?


> +	child = NULL;
> +	while ((child = fwnode_get_next_child_node(altmodes_node, child))) {
> +		ret = fwnode_property_read_u32(child, "svid", &svid);
> +		if (ret) {
> +			dev_err(&port->dev, "Error reading svid for altmode %s\n",
> +				fwnode_get_name(child));
> +			continue;
> +		}
> +
> +		ret = fwnode_property_read_u32(child, "vdo", &vdo);
> +		if (ret) {
> +			dev_err(&port->dev, "Error reading vdo for altmode %s\n",
> +				fwnode_get_name(child));
> +			continue;
> +		}
> +
> +		if (index >= n) {
> +			dev_err(&port->dev, "Error not enough space for altmode %s\n",
> +				fwnode_get_name(child));
> +			continue;
> +		}
> +
> +		desc.svid = svid;
> +		desc.vdo = vdo;
> +		desc.mode = index + 1;
> +		alt = typec_port_register_altmode(port, &desc);
> +		if (IS_ERR(alt)) {
> +			dev_err(&port->dev, "Error registering altmode %s\n",
> +				fwnode_get_name(child));
> +			continue;
> +		}
> +
> +		alt->ops = ops;
> +		typec_altmode_set_drvdata(alt, drvdata);
> +		altmodes[index] = alt;
> +		index++;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(typec_port_register_altmodes_from_fwnode);
> +
>  /**
>   * typec_register_port - Register a USB Type-C Port
>   * @parent: Parent device
> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> index 5daa1c49761c..fbe4bccb3a98 100644
> --- a/include/linux/usb/typec.h
> +++ b/include/linux/usb/typec.h
> @@ -17,6 +17,7 @@ struct typec_partner;
>  struct typec_cable;
>  struct typec_plug;
>  struct typec_port;
> +struct typec_altmode_ops;
>  
>  struct fwnode_handle;
>  struct device;
> @@ -121,6 +122,12 @@ struct typec_altmode
>  struct typec_altmode
>  *typec_port_register_altmode(struct typec_port *port,
>  			     const struct typec_altmode_desc *desc);
> +
> +void typec_port_register_altmodes_from_fwnode(struct typec_port *port,
> +	const struct typec_altmode_ops *ops, void *drvdata,
> +	struct typec_altmode **altmodes, size_t n,
> +	struct fwnode_handle *fwnode);
> +
>  void typec_unregister_altmode(struct typec_altmode *altmode);
>  
>  struct typec_port *typec_altmode2port(struct typec_altmode *alt);
> -- 
> 2.26.2

thanks,

-- 
heikki
