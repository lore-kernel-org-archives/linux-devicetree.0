Return-Path: <SRS0=vVuV=BW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12884C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 12:50:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E38162065C
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Aug 2020 12:50:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727961AbgHLMuA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Aug 2020 08:50:00 -0400
Received: from mga01.intel.com ([192.55.52.88]:57955 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727817AbgHLMuA (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 12 Aug 2020 08:50:00 -0400
IronPort-SDR: F7Tu8HzgYkcAnAe1UfHmyX/HLrHwK++DIAZGlL1ANdIeEh8XWgLEyeT9gXP6NXzgRjOnZ3IuQU
 CWtj4GJTyljw==
X-IronPort-AV: E=McAfee;i="6000,8403,9710"; a="171987071"
X-IronPort-AV: E=Sophos;i="5.76,304,1592895600"; 
   d="scan'208";a="171987071"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2020 05:49:59 -0700
IronPort-SDR: NSPy78gSBXDDNkFrYpL64aVOWVgXqj2+RxWSASPm6eLfKgZ0F1p9iI5yvAYCDqXflgUNQiaUYv
 fA5N5lFTUs3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,304,1592895600"; 
   d="scan'208";a="398825863"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 12 Aug 2020 05:49:56 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 12 Aug 2020 15:49:55 +0300
Date:   Wed, 12 Aug 2020 15:49:55 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Tobias Schramm <t.schramm@manjaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] usb: typec: Add
 typec_port_register_altmodes_from_fwnode()
Message-ID: <20200812124955.GB1169992@kuha.fi.intel.com>
References: <20200714113617.10470-1-hdegoede@redhat.com>
 <20200714113617.10470-3-hdegoede@redhat.com>
 <20200727130528.GB883641@kuha.fi.intel.com>
 <469f369a-73f4-c348-b9ee-1662956f45be@redhat.com>
 <20200811143833.GC627773@kuha.fi.intel.com>
 <6c223f20-cf63-392e-f694-869cb231c46d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c223f20-cf63-392e-f694-869cb231c46d@redhat.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Aug 12, 2020 at 10:36:32AM +0200, Hans de Goede wrote:
> Hi,
> 
> On 8/11/20 4:38 PM, Heikki Krogerus wrote:
> > Hi,
> > 
> > > > > +void typec_port_register_altmodes_from_fwnode(struct typec_port *port,
> > > > > +	const struct typec_altmode_ops *ops, void *drvdata,
> > > > > +	struct typec_altmode **altmodes, size_t n,
> > > > > +	struct fwnode_handle *fwnode)
> > > > > +{
> > > > > +	struct fwnode_handle *altmodes_node, *child;
> > > > > +	struct typec_altmode_desc desc;
> > > > > +	struct typec_altmode *alt;
> > > > > +	size_t index = 0;
> > > > > +	u32 svid, vdo;
> > > > > +	int ret;
> > > > > +
> > > > > +	altmodes_node = fwnode_get_named_child_node(fwnode, "altmodes");
> > > > > +	if (!altmodes_node)
> > > > > +		return;
> > > > 
> > > > Do we need that? Why not just make the sub-nodes describing the
> > > > alternate modes direct children of the connector node instead of
> > > > grouping them under a special sub-node?
> > > 
> > > If you envision how this will look in e.g. DTS sources then I think
> > > you will see that this grouping keeps the DTS source code more
> > > readable. Grouping things together like this is somewhat normal in
> > > devicetree files. E.g. PMIC's or other regulator providers typical
> > > have a "regulators" node grouping all their regulators; and also the OF
> > > graph bindings which are used in the USB-connector node start with a
> > > "ports" parent / grouping node.
> > > 
> > > > If the child node of the connector has device properties "svid" and
> > > > "vdo" then it is an alt mode that the connector supports, and it can't
> > > > be anything else, no?
> > > 
> > > If you want to get rid of the altmodes parent/grouping node, then the
> > > usual way to do this would be to add a compatible string to the nodes,
> > > rather then check for the existence of some properties.
> > 
> > I'm looking at this from ACPI PoW. We do not have compatible string in
> > ACPI (and in case you are wondering, the _HID PRP0001 is not a
> > reliable solution for that).
> 
> Note my main use-case for this is the ACPI case too, remember the
> infamous drivers/platform/x86/intel_cht_int33fe_typec.c that is my
> main consumer for this patch. Although there the info is lacking in ACPI
> so I need to inject it with c-code.
> 
> > If you wish to group the altmodes under a subnode, then that's fine, but
> > the "altmodes" node will need to be optional, just like the "ports"
> > OF-graph node is optional. So we need to be able to support systems
> > where the alternate mode subnodes are directly under the connector as
> > well.
> 
> So for the ports case, AFAIK not having a ports subnode to group them
> is only used in the case there are no other type of subnodes.
> 
> With the existing usb-connector devicetree-bindings we will have both
> ports subnodes and altmode subnodes. The usb-connector devicetree-bindings
> already specify that the port subnodes *must* be grouped together under
> a single ports subnode (for usb-connector nodes).
> 
> So it seems logical and much cleaner to me to also group the altmodes
> together under an altmodes subnode. This also solves the problem of
> having to due heuristics to tell different kinds of subnodes apart.
> 
> Question: why do you write: "we need to be able to support systems
> where the alternate mode subnodes are directly under the connector as
> well" are there already systems out there (or on their way) which
> contain ACPI table which contain a fwnode adhering to the usb-connector
> bindings + having subnodes which set a svid + vdo ?

There are indeed platforms on their way, but I'll see if I can still
influence what goes into the ACPI tables of those platforms.

> Because unless such systems already exist I don't see why we need to
> be able to support them ?  New systems can use whatever scheme we
> can come-up with and unless existing systems already have what we
> need, except for the altmodes grouping node, then we will need some
> translating code which generates the expected swnodes anyways and
> then the translator can easily inject the grouping node.
> 
> So I do not see why we would " need to be able to support systems
> where the alternate mode subnodes are directly under the connector as
> well" ?
> 
> If you insist I can make the altmodes node optional and simply
> skip any child nodes which do not have both a svid and a vdo
> property, but having the subnode (and then logging an error on
> missing svid or vdo props) seems cleaner to me.

I'm trying to get the way the USB Type-C connectors are described
in ACPI (including the alternate modes) documented somewhere. I think
I already mentioned that to you already. There is now a discussion
with our Windows folks how to move forward with that. In any case,
additional nodes like that "altmodes" node are really problematic in
Windows because of way they handle the nodes, and to be honest, I
don't see any way I could convince those guys to accept it.

But all that is really not your problem. I have now a feeling that the
way we will end up describing the alternate modes in ACPI will not be
compatible with DT :-(. So I guess we can just go ahead with this, and
then add support for ACPI later?

thanks,

-- 
heikki
