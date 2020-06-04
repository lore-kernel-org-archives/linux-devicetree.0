Return-Path: <SRS0=QtGe=7R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC123C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 10:52:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC00820820
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 10:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591267945;
	bh=bs327waT4rQpdlozlp8rd/nL9EuZI4KaN1KX7wJv68U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=1l7bteBtXAcXL90AVQ0p/rO4P+F2+AW/8N0yfF4HmGt9XN+gFfQlcZiBZZ9JpNmCc
	 jGY1gxycwGa9xRxsGCJKmCmgOhi+4H1l9MFXLvYjDKaIjRCQuekd1tXt8xBbv+OphB
	 0aURKu0jTsQaK9tQDxgaplGT498T4rucSrCTVJMM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbgFDKwZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 4 Jun 2020 06:52:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:49718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725854AbgFDKwY (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 4 Jun 2020 06:52:24 -0400
Received: from localhost (unknown [122.179.53.240])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AB916207D3;
        Thu,  4 Jun 2020 10:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591267944;
        bh=bs327waT4rQpdlozlp8rd/nL9EuZI4KaN1KX7wJv68U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ynrWQ5hwwix13pKMOB4RMjDBnq6Jib9oMCU0Nus2h8xaSOjxm8GPaFbsxJLxaT80g
         HLXFAKx/yC9q61D5kTqroZe7MPNAx2MgqT2BFGI0azG1bWGTmHEZem3jqnOjW+gm0N
         RuSQnzjPfRo4o5XUYn1NWd9g0UbgaDS+gidAQuHU=
Date:   Thu, 4 Jun 2020 16:22:20 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8250: add watchdog device
Message-ID: <20200604105220.GI3521@vkoul-mobl>
References: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
 <20200604004331.669936-7-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604004331.669936-7-dmitry.baryshkov@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 04-06-20, 03:43, Dmitry Baryshkov wrote:
> Add on-SoC watchdog device node.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
