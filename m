Return-Path: <SRS0=QJws=63=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFD2C433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 17:22:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 760472053B
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 17:22:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389949AbgEMRWy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 May 2020 13:22:54 -0400
Received: from foss.arm.com ([217.140.110.172]:51000 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389945AbgEMRWy (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 13 May 2020 13:22:54 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDBFF30E;
        Wed, 13 May 2020 10:22:53 -0700 (PDT)
Received: from bogus (unknown [10.37.12.13])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E298B3F305;
        Wed, 13 May 2020 10:22:51 -0700 (PDT)
Date:   Wed, 13 May 2020 18:22:48 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Rob Herring <robh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sudeep Holla <sudeep.holla@arm.com>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3 03/20] arm64: dts: arm: fvp: Move fixed devices out of
 bus node
Message-ID: <20200513172248.GB27686@bogus>
References: <20200513103016.130417-1-andre.przywara@arm.com>
 <20200513103016.130417-4-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513103016.130417-4-andre.przywara@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, May 13, 2020 at 11:29:59AM +0100, Andre Przywara wrote:
> The devicetree compiler complains when DT nodes without a reg property
> live inside a (simple) bus node:
> Warning (simple_bus_reg): Node /bus@8000000/motherboard-bus/v2m_refclk32khz
>                           missing or empty reg/ranges property
>
> Move the fixed clocks, the fixed regulator, and the config bus subtree
> to the root node, since they do not depend on any busses.
>

[nit] only if you respin the series, you can drop extra "arm:" in the
subject. Also if it contains both fvp and juno change, use fvp/juno.

--
Regards,
Sudeep
