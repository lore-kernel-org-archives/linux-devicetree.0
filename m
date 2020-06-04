Return-Path: <SRS0=QtGe=7R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017BAC433E0
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 13:13:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CCE15206C3
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 13:13:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728116AbgFDNNJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 4 Jun 2020 09:13:09 -0400
Received: from foss.arm.com ([217.140.110.172]:44350 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726003AbgFDNNJ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 4 Jun 2020 09:13:09 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0C4B30E;
        Thu,  4 Jun 2020 06:13:08 -0700 (PDT)
Received: from bogus (unknown [10.37.12.7])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43A053F305;
        Thu,  4 Jun 2020 06:13:07 -0700 (PDT)
Date:   Thu, 4 Jun 2020 14:13:04 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Liviu Dudau <liviu.dudau@arm.com>, Rob Herring <robh@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Sudeep Holla <sudeep.holla@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm: dts: vexpress: Move mcc node back into motherboard
 node
Message-ID: <20200604131304.GC12397@bogus>
References: <20200603162237.16319-1-andre.przywara@arm.com>
 <159126075826.16785.4183160239670270692.b4-ty@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <159126075826.16785.4183160239670270692.b4-ty@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jun 04, 2020 at 09:56:31AM +0100, Sudeep Holla wrote:
> On Wed, 3 Jun 2020 17:22:37 +0100, Andre Przywara wrote:
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
> > [...]
> 
> Applied to sudeep.holla/linux (for-next/juno), thanks!
> 
> [1/1] arm: dts: vexpress: Move mcc node back into motherboard node
>       https://git.kernel.org/sudeep.holla/c/8a8cd9a910

Had to fix the 'Fixes' tag based on the report from linux-next, so updated to:

https://git.kernel.org/sudeep.holla/c/38ac46002d1d

--
Regards,
Sudeep
