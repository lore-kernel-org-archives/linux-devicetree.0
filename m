Return-Path: <SRS0=QtGe=7R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1CF8C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 08:59:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8AB88206C3
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 08:59:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728292AbgFDI7h (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 4 Jun 2020 04:59:37 -0400
Received: from foss.arm.com ([217.140.110.172]:41778 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728261AbgFDI7f (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 4 Jun 2020 04:59:35 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4748F55D;
        Thu,  4 Jun 2020 01:59:35 -0700 (PDT)
Received: from bogus (unknown [10.37.12.7])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9DC643F6CF;
        Thu,  4 Jun 2020 01:59:33 -0700 (PDT)
Date:   Thu, 4 Jun 2020 09:59:31 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Andre Przywara <andre.przywara@arm.com>,
        Rob Herring <robh@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm: dts: vexpress: Move mcc node back into motherboard
 node
Message-ID: <20200604085931.GB8814@bogus>
References: <20200603194614.GA187107@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200603194614.GA187107@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Jun 03, 2020 at 12:46:14PM -0700, Guenter Roeck wrote:
> On Wed, Jun 03, 2020 at 05:22:37PM +0100, Andre Przywara wrote:
> > Commit 	d9258898ad49 ("arm64: dts: arm: vexpress: Move fixed devices
> > out of bus node") moved the "mcc" DT node into the root node, because
> > it does not have any children using "reg" properties, so does violate
> > some dtc checks about "simple-bus" nodes.
> > However this broke the vexpress config-bus code, which walks up the
> > device tree to find the first node with an "arm,vexpress,site" property.
> > This gave the wrong result (matching the root node instead of the
> > motherboard node), so broke the clocks and some other devices for
> > VExpress boards.
> > 
> > Move the whole node back into its original position. This re-introduces
> > the dtc warning, but is conceptually the right thing to do. The dtc
> > warning seems to be overzealous here, there are discussions on fixing or
> > relaxing this check instead.
> > 
> > Fixes: 	d9258898ad49 ("arm64: dts: arm: vexpress: Move fixed devices out of bus node")
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> 
> Tested-by: Guenter Roeck <linux@roeck-us.net>
> 

Thanks, I have added your Reported-by along with this. By the way, this
email seem to have broken the link. Initially thought b4 is getting
confused, but checked the lore.kernel.org too to confirm.

-- 
Regards,
Sudeep
