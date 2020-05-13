Return-Path: <SRS0=QJws=63=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF698C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 17:26:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D85C2065D
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 17:26:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732740AbgEMR0F (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 May 2020 13:26:05 -0400
Received: from foss.arm.com ([217.140.110.172]:51048 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732731AbgEMR0F (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 13 May 2020 13:26:05 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ADE6830E;
        Wed, 13 May 2020 10:26:04 -0700 (PDT)
Received: from bogus (unknown [10.37.12.13])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F263D3F305;
        Wed, 13 May 2020 10:26:02 -0700 (PDT)
Date:   Wed, 13 May 2020 18:26:00 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Rob Herring <robh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3 04/20] arm64: dts: arm: vexpress: Move fixed devices
 out of bus node
Message-ID: <20200513172600.GC27686@bogus>
References: <20200513103016.130417-1-andre.przywara@arm.com>
 <20200513103016.130417-5-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513103016.130417-5-andre.przywara@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, May 13, 2020 at 11:30:00AM +0100, Andre Przywara wrote:
> The devicetree compiler complains when DT nodes without a reg property
> live inside a (simple) bus node:
> Warning (simple_bus_reg): Node /bus@8000000/motherboard-bus/refclk32khz
>                           missing or empty reg/ranges property
> 
> Move the fixed clocks, the fixed regulator, the leds and the config bus
> subtree to the root node, since they do not depend on any busses.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  arch/arm/boot/dts/vexpress-v2m-rs1.dtsi | 308 ++++++++++++------------
>  1 file changed, 154 insertions(+), 154 deletions(-)
> 

$subject tells this is arm64 while patch is arm32, I can fix up in case
you don't respin.

-- 
Regards,
Sudeep
