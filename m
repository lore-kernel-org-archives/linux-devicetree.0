Return-Path: <SRS0=Wk2R=75=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE9BC433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 08:47:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5785207BC
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 08:47:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="l8Cle5W2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbgFPIrs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 16 Jun 2020 04:47:48 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:36397 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725710AbgFPIrs (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 16 Jun 2020 04:47:48 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592297267; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=Spo7eC55jSJoYU1hDj3mBi9mLWk+m3pNzf3/uvqS3k0=;
 b=l8Cle5W2+W+kncmMsVoF0yPpEFXGiKzHhqhKqS8NbNYwSHv8Ds6B6d83XIJEToM8HafMmxoM
 RgM3+rV8H05xJNMa58g0SJGJBOoqPOF8Vp+SAZkte6IGon/v6GMmC8jXtL/VkZKvUI2pGPAh
 93jnVvx3HFUIFoOXBcwQX89DXXM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-west-2.postgun.com with SMTP id
 5ee8872f6bebe35deb003c23 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Jun 2020 08:47:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E1D2CC433CB; Tue, 16 Jun 2020 08:47:42 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 73675C433C8;
        Tue, 16 Jun 2020 08:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 73675C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kvalo@codeaurora.org
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/8] ath11k: update firmware files read path
From:   Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1591709581-18039-3-git-send-email-akolli@codeaurora.org>
References: <1591709581-18039-3-git-send-email-akolli@codeaurora.org>
To:     Anilkumar Kolli <akolli@codeaurora.org>
Cc:     ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        linux-wireless@vger.kernel.org,
        Anilkumar Kolli <akolli@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20200616084742.E1D2CC433CB@smtp.codeaurora.org>
Date:   Tue, 16 Jun 2020 08:47:42 +0000 (UTC)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Anilkumar Kolli <akolli@codeaurora.org> wrote:

> We need this so that all hardware versions can coexist and
> it's easier to manage everything then all hardware
> directories are under ath11k directory.
> 
> Copy ath11k firmware files to
> /lib/firmware/ath11k/IPQ8074/hw2.0/
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

7309f7730532 ath11k: update firmware files read path

-- 
https://patchwork.kernel.org/patch/11595655/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

