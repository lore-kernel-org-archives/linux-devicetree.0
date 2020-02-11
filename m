Return-Path: <SRS0=x5QR=37=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D754C352A3
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Feb 2020 14:23:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E10F42070A
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Feb 2020 14:23:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="nA3IxTQk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729363AbgBKOX2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 11 Feb 2020 09:23:28 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:51637 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727963AbgBKOX2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 11 Feb 2020 09:23:28 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581431007; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=CCfMU7sbr4eW0hoz5ecQOYNZ5Pq4hUp0qTnvqU/rbss=;
 b=nA3IxTQk7oF76dANH0mbDoyaCOlsO9s9wG6BZAtN3+sCHfyx6fyvnq5rHUiQSUSCVsR9lee6
 t0ViPh9XBUzM8HNzqIxYmZvg3I6+BKZ5WkFdEu/5RWI1Cb8AAw/hdOAhuan4jp+2AROp6lhr
 ppFQQZWAT60qQnlcUh/OrlxZbcI=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e42b8df.7f0b91a365a8-smtp-out-n02;
 Tue, 11 Feb 2020 14:23:27 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 546B4C433A2; Tue, 11 Feb 2020 14:23:26 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CB3E8C43383;
        Tue, 11 Feb 2020 14:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CB3E8C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kvalo@codeaurora.org
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCHv2 1/2] dt-bindings: ath10k: Add new dt entries to identify
 coex support
From:   Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1580152736-18654-1-git-send-email-tamizhr@codeaurora.org>
References: <1580152736-18654-1-git-send-email-tamizhr@codeaurora.org>
To:     Tamizh Chelvam <tamizhr@codeaurora.org>
Cc:     ath10k@lists.infradead.org, devicetree@vger.kernel.org,
        linux-wireless@vger.kernel.org,
        Tamizh Chelvam <tamizhr@codeaurora.org>
User-Agent: pwcli/0.0.0-git (https://github.com/kvalo/pwcli/) Python/2.7.12
Message-Id: <20200211142326.546B4C433A2@smtp.codeaurora.org>
Date:   Tue, 11 Feb 2020 14:23:26 +0000 (UTC)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Tamizh Chelvam <tamizhr@codeaurora.org> wrote:

> This adds new dt entries qcom,coexist-support and qcom,coexist-gpio-pin
> which will be used by ath10k driver to identify coex support
> of a hardware and notify wifi firmware the gpio pin number.
> This pin number information is needed for the hardware QCA4019.
> 
> Signed-off-by: Tamizh Chelvam <tamizhr@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

7354de9c6e2c dt-bindings: ath10k: Add new dt entries to identify coex support
9f83993e1a92 ath10k: Add support to read btcoex related data from DT

-- 
https://patchwork.kernel.org/patch/11353153/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
