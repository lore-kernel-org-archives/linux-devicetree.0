Return-Path: <SRS0=LTWd=4A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65DAAC2BA83
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Feb 2020 16:16:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 38DF820714
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Feb 2020 16:16:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="qUqU8Stp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbgBLQQU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Feb 2020 11:16:20 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:47864 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726728AbgBLQQU (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 12 Feb 2020 11:16:20 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581524180; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=foQgFeAktbx/iw/W8qYYRatgWy+DUe0kTzSO8cPTnW4=;
 b=qUqU8StpDJcgi+y1w9mwCNvCMh5oXJtxGdAPnknN9tDHJSlG2qe6to0LnQqh2DBxkCmWjHpf
 Ul7h9S0a3r8gDm0Lk4Fj8xAbm61+qoPbM0t6LYam64SfhKNGUQwZf8WBhiqeHa3+hKICOqTK
 BEE2RGyFsEAk/V3qv5Too6yUlaM=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4424d3.7f389c135730-smtp-out-n02;
 Wed, 12 Feb 2020 16:16:19 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6377CC447A0; Wed, 12 Feb 2020 16:16:19 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7E16CC43383;
        Wed, 12 Feb 2020 16:16:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7E16CC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kvalo@codeaurora.org
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 1/2] DTS: bindings: wl1251: mark ti,
 power-gpio as optional
From:   Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <d34183026b1a46a082f73ab3d0888c92cf6286ec.1580068813.git.hns@goldelico.com>
References: <d34183026b1a46a082f73ab3d0888c92cf6286ec.1580068813.git.hns@goldelico.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexios Zavras <alexios.zavras@intel.com>,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com
User-Agent: pwcli/0.0.0-git (https://github.com/kvalo/pwcli/) Python/2.7.12
Message-Id: <20200212161619.6377CC447A0@smtp.codeaurora.org>
Date:   Wed, 12 Feb 2020 16:16:19 +0000 (UTC)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> It is now only useful for SPI interface.
> Power control of SDIO mode is done through mmc core.
> 
> Suggested by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

2 patches applied to wireless-drivers-next.git, thanks.

57f0a29c3e08 DTS: bindings: wl1251: mark ti,power-gpio as optional
346bdd8e979d wl1251: remove ti,power-gpio for SDIO mode

-- 
https://patchwork.kernel.org/patch/11351957/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
