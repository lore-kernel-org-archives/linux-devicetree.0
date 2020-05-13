Return-Path: <SRS0=QJws=63=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28304C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 17:01:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87648205CB
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 17:01:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389715AbgEMRBv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 May 2020 13:01:51 -0400
Received: from foss.arm.com ([217.140.110.172]:50674 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728354AbgEMRBv (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 13 May 2020 13:01:51 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAED030E;
        Wed, 13 May 2020 10:01:50 -0700 (PDT)
Received: from bogus (unknown [10.37.12.13])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC54E3F305;
        Wed, 13 May 2020 10:01:48 -0700 (PDT)
Date:   Wed, 13 May 2020 18:01:38 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Rob Herring <robh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sudeep Holla <sudeep.holla@arm.com>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3 02/20] arm64: dts: arm: Fix node address fields
Message-ID: <20200513170128.GA27686@bogus>
References: <20200513103016.130417-1-andre.przywara@arm.com>
 <20200513103016.130417-3-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513103016.130417-3-andre.przywara@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, May 13, 2020 at 11:29:58AM +0100, Andre Przywara wrote:
> The Arm Ltd. boards were using an outdated address convention in the DT
> node names, by separating the high from the low 32-bits of an address by
> a comma.
>
> Remove the comma from the node name suffix to be DT spec compliant.
>

As Robin pointed out before, this was the requirement back then. I assume
it is no longer true.

-- 
Regards,
Sudeep
