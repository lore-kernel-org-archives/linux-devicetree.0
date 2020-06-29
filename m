Return-Path: <SRS0=mth2=AK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B8A7C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 19:34:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26984206A1
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 19:34:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730540AbgF2Te5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 29 Jun 2020 15:34:57 -0400
Received: from foss.arm.com ([217.140.110.172]:41218 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730794AbgF2Tez (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 29 Jun 2020 15:34:55 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B92501045;
        Mon, 29 Jun 2020 01:55:19 -0700 (PDT)
Received: from bogus (unknown [10.37.12.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 462B83F71E;
        Mon, 29 Jun 2020 01:55:17 -0700 (PDT)
Date:   Mon, 29 Jun 2020 09:55:10 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Andre Przywara <andre.przywara@arm.com>,
        Rob Herring <robh@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 04/20] arm64: dts: arm: vexpress: Move fixed devices
 out of bus node
Message-ID: <20200629085510.GA9940@bogus>
References: <20200513103016.130417-1-andre.przywara@arm.com>
 <20200513103016.130417-5-andre.przywara@arm.com>
 <20200528024810.GA232303@roeck-us.net>
 <20200528025552.GA232631@roeck-us.net>
 <20200627035753.GA63049@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200627035753.GA63049@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jun 26, 2020 at 08:57:53PM -0700, Guenter Roeck wrote:
>
> The problem reported below is still seen in the mainline kernel.
>
> > Here is my list of reverts on top of next-20200526:
> >
> > bdc8a817612b (HEAD -> master) Revert "arm64: dts: vexpress: Move fixed devices out of bus node"
> > 9a1f85df9e1a Revert "arm64: dts: fvp/juno: Fix serial node names"
> > 381e0bbe8c00 Revert "arm64: dts: fvp/juno: Fix bus node names"
> > 63723f67bf4b Revert "arm64: dts: vexpress: Fix VExpress LED names"
> >
>
> Maybe all those patches should be reverted if no fix is in sight ?
>

I have pushed the fix to -next already more than 2 weeks ago and sent
the pull request to Arm SoC team. I see it just landed in main over the
weekend. Arm SoC team tend to wait until enough fixes get accumulate.

--
Regards,
Sudeep
