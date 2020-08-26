Return-Path: <SRS0=1b9y=CE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4448C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Aug 2020 13:18:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD708208E4
	for <linux-devicetree@archiver.kernel.org>; Wed, 26 Aug 2020 13:18:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730215AbgHZNR7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 26 Aug 2020 09:17:59 -0400
Received: from mga12.intel.com ([192.55.52.136]:47151 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729177AbgHZNR6 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 26 Aug 2020 09:17:58 -0400
IronPort-SDR: ZoOB5hJk7KLfdKYc9i0y7KO2Z+ES4/ZjgowHdwFYHwICQBZ9ZF0IEZlknRCanSUFxnhD8x6X8B
 s2fUIJWRKk9A==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="135837102"
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="135837102"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2020 06:17:57 -0700
IronPort-SDR: 0P2TVeZbS8m05UNvqj6oRcf8cenXLRUTWHeZm+g4yNkYJ6gsUkpi1UNf0OVEUvlB97V/ftgL4V
 fhgdwX9f66Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="403062174"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 26 Aug 2020 06:17:54 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 26 Aug 2020 16:17:53 +0300
Date:   Wed, 26 Aug 2020 16:17:53 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Tobias Schramm <t.schramm@manjaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] usb: typec: Add
 typec_port_register_altmodes_from_fwnode()
Message-ID: <20200826131753.GB813478@kuha.fi.intel.com>
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

That last fwnode parameter should not be needed. The port device
should have the alternate mode nodes under it as child nodes. That is,
unless I'm missing (or forgetting) something?

> +{
> +	struct fwnode_handle *altmodes_node, *child;
> +	struct typec_altmode_desc desc;
> +	struct typec_altmode *alt;
> +	size_t index = 0;
> +	u32 svid, vdo;
> +	int ret;
> +
> +	altmodes_node = fwnode_get_named_child_node(fwnode, "altmodes");

So this would be:

        altmodes_node = fwnode_get_named_child_node(port->dev.fwnode, "altmodes");

> +	if (!altmodes_node)
> +		return;
> +
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

thanks,

-- 
heikki
