Return-Path: <SRS0=x5QR=37=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC33C352A3
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Feb 2020 12:05:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3CFD72051A
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Feb 2020 12:05:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728274AbgBKMFg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 11 Feb 2020 07:05:36 -0500
Received: from foss.arm.com ([217.140.110.172]:44736 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727936AbgBKMFg (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 11 Feb 2020 07:05:36 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 380A61FB;
        Tue, 11 Feb 2020 04:05:36 -0800 (PST)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 52BEF3F6CF;
        Tue, 11 Feb 2020 04:05:35 -0800 (PST)
Date:   Tue, 11 Feb 2020 12:05:33 +0000
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/7] dt-bindings: arm: Add Versatile Express and Juno
 YAML schema
Message-ID: <20200211120533.GC52147@bogus>
References: <20200210092713.279105-1-linus.walleij@linaro.org>
 <20200210092713.279105-7-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200210092713.279105-7-linus.walleij@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Feb 10, 2020 at 10:27:12AM +0100, Linus Walleij wrote:
> This implements the top-level schema for the ARM Versatile
> Express and Juno platforms.
>
> Cc: Sudeep Holla <sudeep.holla@arm.com>

With my limited understanding on YAML scheme for DT bindings, this looks
good to me.

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
