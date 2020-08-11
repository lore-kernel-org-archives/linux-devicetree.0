Return-Path: <SRS0=YFsx=BV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC3BC433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Aug 2020 14:38:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C528F204FD
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Aug 2020 14:38:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728829AbgHKOii (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 11 Aug 2020 10:38:38 -0400
Received: from mga03.intel.com ([134.134.136.65]:63132 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728783AbgHKOih (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 11 Aug 2020 10:38:37 -0400
IronPort-SDR: eEfmuh2tYJIs8xG5mENvLyAFw9wP23wcuDvc42JEFxnpDHdiDiQL69dVZZ+UpMJOs64Af1DQNf
 e2l6wT8/Ligw==
X-IronPort-AV: E=McAfee;i="6000,8403,9710"; a="153716507"
X-IronPort-AV: E=Sophos;i="5.76,461,1592895600"; 
   d="scan'208";a="153716507"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2020 07:38:36 -0700
IronPort-SDR: Nx76xLg49REiDVzBeRo2QG4Jq1uLrDICOx6ARs93zhCQ9zngHeUpOitdEG8lGLwyKkq99SUwc5
 o12gO+xe7jCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,461,1592895600"; 
   d="scan'208";a="398544463"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 11 Aug 2020 07:38:33 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 11 Aug 2020 17:38:33 +0300
Date:   Tue, 11 Aug 2020 17:38:33 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Tobias Schramm <t.schramm@manjaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] usb: typec: Add
 typec_port_register_altmodes_from_fwnode()
Message-ID: <20200811143833.GC627773@kuha.fi.intel.com>
References: <20200714113617.10470-1-hdegoede@redhat.com>
 <20200714113617.10470-3-hdegoede@redhat.com>
 <20200727130528.GB883641@kuha.fi.intel.com>
 <469f369a-73f4-c348-b9ee-1662956f45be@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <469f369a-73f4-c348-b9ee-1662956f45be@redhat.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

> > > +void typec_port_register_altmodes_from_fwnode(struct typec_port *port,
> > > +	const struct typec_altmode_ops *ops, void *drvdata,
> > > +	struct typec_altmode **altmodes, size_t n,
> > > +	struct fwnode_handle *fwnode)
> > > +{
> > > +	struct fwnode_handle *altmodes_node, *child;
> > > +	struct typec_altmode_desc desc;
> > > +	struct typec_altmode *alt;
> > > +	size_t index = 0;
> > > +	u32 svid, vdo;
> > > +	int ret;
> > > +
> > > +	altmodes_node = fwnode_get_named_child_node(fwnode, "altmodes");
> > > +	if (!altmodes_node)
> > > +		return;
> > 
> > Do we need that? Why not just make the sub-nodes describing the
> > alternate modes direct children of the connector node instead of
> > grouping them under a special sub-node?
> 
> If you envision how this will look in e.g. DTS sources then I think
> you will see that this grouping keeps the DTS source code more
> readable. Grouping things together like this is somewhat normal in
> devicetree files. E.g. PMIC's or other regulator providers typical
> have a "regulators" node grouping all their regulators; and also the OF
> graph bindings which are used in the USB-connector node start with a
> "ports" parent / grouping node.
> 
> > If the child node of the connector has device properties "svid" and
> > "vdo" then it is an alt mode that the connector supports, and it can't
> > be anything else, no?
> 
> If you want to get rid of the altmodes parent/grouping node, then the
> usual way to do this would be to add a compatible string to the nodes,
> rather then check for the existence of some properties.

I'm looking at this from ACPI PoW. We do not have compatible string in
ACPI (and in case you are wondering, the _HID PRP0001 is not a
reliable solution for that).

If you wish to group the altmodes under a subnode, then that's fine, but
the "altmodes" node will need to be optional, just like the "ports"
OF-graph node is optional. So we need to be able to support systems
where the alternate mode subnodes are directly under the connector as
well.

thanks,

-- 
heikki
