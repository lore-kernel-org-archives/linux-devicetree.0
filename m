Return-Path: <SRS0=lKpO=5L=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B14C43331
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 07:45:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9252520719
	for <linux-devicetree@archiver.kernel.org>; Thu, 26 Mar 2020 07:45:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="HwWWvGmm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbgCZHpg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 26 Mar 2020 03:45:36 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:36052 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726138AbgCZHpf (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 26 Mar 2020 03:45:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585208735; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=ofNam/A9mK9m4P86u/2kTjqxbhuy862zWmIh3TjFQ6M=; b=HwWWvGmmx1xR8PYIpkQYReDOmoDSFv2BUTfFtuJlK3xwr+K3VzXP2kMLSuyk/b2gF3NpRUf+
 0YSl/VX3J9DZ4Bvjoxd9nsXBCBqMl4vxwTV/iBLQEXGjfvhioOTp5MhQGWYy3aI/QvaHe9RW
 0fQpWdvTButIc6tHRsY97extlHo=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1YmJiNiIsICJkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7c5d9b.7f09eda134c8-smtp-out-n02;
 Thu, 26 Mar 2020 07:45:31 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 85168C4478F; Thu, 26 Mar 2020 07:45:30 +0000 (UTC)
Received: from tynnyri.adurom.net (tynnyri.adurom.net [51.15.11.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5D007C433D2;
        Thu, 26 Mar 2020 07:45:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5D007C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kvalo@codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     <Ajay.Kathat@microchip.com>
Cc:     <linux-wireless@vger.kernel.org>, <devel@driverdev.osuosl.org>,
        <devicetree@vger.kernel.org>, <gregkh@linuxfoundation.org>,
        <Adham.Abozaeid@microchip.com>, <johannes@sipsolutions.net>,
        <robh@kernel.org>
Subject: Re: [PATCH] staging: wilc1000: remove label from examples in DT binding documentation
References: <20200325164234.14146-1-ajay.kathat@microchip.com>
Date:   Thu, 26 Mar 2020 09:45:22 +0200
In-Reply-To: <20200325164234.14146-1-ajay.kathat@microchip.com> (Ajay Kathat's
        message of "Wed, 25 Mar 2020 16:42:39 +0000")
Message-ID: <87v9mrpnjh.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

<Ajay.Kathat@microchip.com> writes:

> From: Ajay Singh <ajay.kathat@microchip.com>
>
> Remove labels and not relevant property from DT binding documentation
> examples as suggested in [1].
>
> 1. https://patchwork.ozlabs.org/patch/1252837

Just a nitpick but patchwork links are not that reliable in the long
run. Instead using a lore link is better as the message id is visible
directly from the URL.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
