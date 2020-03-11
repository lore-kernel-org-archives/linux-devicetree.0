Return-Path: <SRS0=AZXu=44=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F02B5C10F27
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 09:03:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C0B0820873
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Mar 2020 09:03:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728704AbgCKJDj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Mar 2020 05:03:39 -0400
Received: from mga09.intel.com ([134.134.136.24]:64222 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726362AbgCKJDj (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 11 Mar 2020 05:03:39 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Mar 2020 02:03:38 -0700
X-IronPort-AV: E=Sophos;i="5.70,540,1574150400"; 
   d="scan'208";a="234652427"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Mar 2020 02:03:36 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 1EC522096B; Wed, 11 Mar 2020 11:03:04 +0200 (EET)
Date:   Wed, 11 Mar 2020 11:03:04 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     mchehab@kernel.org, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org,
        laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH v12 06/19] media: v4l2-fwnode: add initial connector
 parsing support
Message-ID: <20200311090303.GI5379@paasikivi.fi.intel.com>
References: <20200309101428.15267-1-m.felsch@pengutronix.de>
 <20200309101428.15267-7-m.felsch@pengutronix.de>
 <20200311081703.GF5379@paasikivi.fi.intel.com>
 <20200311084357.jodtsrcfaeanv7hz@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311084357.jodtsrcfaeanv7hz@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Mar 11, 2020 at 09:43:57AM +0100, Marco Felsch wrote:
> Hi Sakari,
> 
> On 20-03-11 10:17, Sakari Ailus wrote:
> > Hi Marco,
> > 
> > On Mon, Mar 09, 2020 at 11:14:15AM +0100, Marco Felsch wrote:
> > ...
> > > +void v4l2_fwnode_connector_free(struct v4l2_fwnode_connector *connector)
> > > +{
> > > +	struct v4l2_connector_link *link, *tmp;
> > > +
> > > +	if (IS_ERR_OR_NULL(connector) ||
> > > +	    connector->type == V4L2_CONN_UNKNOWN)
> > > +		return;
> > > +
> > > +	list_for_each_entry_safe(link, tmp, &connector->links, head) {
> > > +		v4l2_fwnode_put_link(&link->fwnode_link);
> > > +		list_del(&link->head);
> > > +		kfree(link);
> > > +	}
> > > +
> > > +	kfree(connector->label);
> > > +	connector->label = NULL;
> > > +	connector = NULL;
> > 
> > No need to set connector NULL here.
> 
> My intention was to make it safe e.g. if a caller calls this twice for
> the same connector.

This changes the pointer to NULL locally but the caller won't see this ---
because it's the value of the pointer that was passed here by the caller.

-- 
Sakari Ailus
