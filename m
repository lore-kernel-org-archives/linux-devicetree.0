Return-Path: <SRS0=4Y7L=45=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 473D0C2BB1D
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Mar 2020 10:43:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 28365206BE
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Mar 2020 10:43:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725978AbgCLKnR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Mar 2020 06:43:17 -0400
Received: from mga18.intel.com ([134.134.136.126]:25692 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725268AbgCLKnR (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 12 Mar 2020 06:43:17 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Mar 2020 03:43:16 -0700
X-IronPort-AV: E=Sophos;i="5.70,544,1574150400"; 
   d="scan'208";a="236789159"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Mar 2020 03:43:14 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 8B49F208BB; Thu, 12 Mar 2020 12:43:12 +0200 (EET)
Date:   Thu, 12 Mar 2020 12:43:12 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     mchehab@kernel.org, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org,
        laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org,
        kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH v13 04/21] media: v4l2-fwnode: fix v4l2_fwnode_parse_link
 handling
Message-ID: <20200312104312.GO5379@paasikivi.fi.intel.com>
References: <20200312103156.3178-1-m.felsch@pengutronix.de>
 <20200312103156.3178-5-m.felsch@pengutronix.de>
 <20200312104222.GN5379@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200312104222.GN5379@paasikivi.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Mar 12, 2020 at 12:42:22PM +0200, Sakari Ailus wrote:
> On Thu, Mar 12, 2020 at 11:31:39AM +0100, Marco Felsch wrote:
> > Currently the driver differentiate the port number property handling for
> > ACPI and DT. This is wrong as because ACPI should use the "reg" val too
> > [1].
> > 
> > [1] https://patchwork.kernel.org/patch/11421985/
> > 
> > Fixes: ca50c197bd96 ("[media] v4l: fwnode: Support generic fwnode for parsing standardised properties")
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> 
> Oh well, I guess this is OK; I noticed the next patch that depends on this
> one. But it should be merged with the next patch so that it won't be
> accidentally backported alone.
> 
> Then, please add:
> 
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Forgot that no ACPI driver uses it. So _no_ changes are needed to this, and
you can add the ack.

Thanks.

-- 
Sakari Ailus
