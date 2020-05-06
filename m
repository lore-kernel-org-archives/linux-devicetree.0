Return-Path: <SRS0=1UAq=6U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 977CAC28CBC
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 09:04:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 77D2B20714
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 09:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588755886;
	bh=UmRfIgrDkfkbhyaF1rH3TCqqTzBBRSFZuTzOSYuwxaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=tDk9oqkFDQtIpKLAMAiAojoB6Eeblb0zAHs92dshBOHRVt+TWwt60nBr9qW8wWE0q
	 7JN4vwLiejCWl2KT0NM6T2G7Dwb2F4PZS3E5ZZYF9OSdeTO+XOI8f7Q9GcLsBc/dq+
	 BmmtTJPFFa7J2u/7FA/BpCCXOvrP/kPZVPJMRJd8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728814AbgEFJEn (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 May 2020 05:04:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:46906 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726935AbgEFJEn (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 6 May 2020 05:04:43 -0400
Received: from localhost (unknown [122.181.213.114])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1351920714;
        Wed,  6 May 2020 09:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588755882;
        bh=UmRfIgrDkfkbhyaF1rH3TCqqTzBBRSFZuTzOSYuwxaI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DwIYbt28Tk7K7gzQRm9dsEZZR1/ORFvc/F7lF3Ro/JpkC49+1aSnZzrv/lhtmToJI
         KIAx/skmpMjkbY4W0hK0bi6nDtgZjgCps0yT9kEDMa1NWibBJxUXMM59iEp9JlaG6V
         FqcqcBLWSr9sHuwL1gZ+0SuciCFPZ6wZsENjiSAw=
Date:   Wed, 6 May 2020 14:34:33 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        robh+dt@kernel.org, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jackp@codeaurora.org
Subject: Re: [PATCH] dt-bindings: phy: usb-snps-femto-v2: Add regulator
 entries to example
Message-ID: <20200506090433.GA1375924@vkoul-mobl>
References: <1588753589-22673-1-git-send-email-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588753589-22673-1-git-send-email-wcheng@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 06-05-20, 01:26, Wesley Cheng wrote:
> Fix errors reported by dt_binding_check, due to missing required
> regulators in the example node.

Applied, thanks

-- 
~Vinod
