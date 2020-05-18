Return-Path: <SRS0=92uP=7A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7498C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 08:46:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8DAE5207D8
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 08:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589791609;
	bh=l41k8WOcSAevgUEovK3C8Xo8J7ox25uuSDhcFkvYpME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=uxr0KpEbAegvwD+KLnabHG51//eX5H2KdvtDBiyDNpyTsAAZM0fsuRBjPdLX+D5Cd
	 HLQ1tfeTTGkuu9kgkbqvX7Vxth38vQSSeWCnXp9xeG7lPXWQjcWGRYp/vXihBzaQR0
	 mqajKMG16SSIPzzIxUpch1vUD2E5MdMgAtXsOXbA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbgERIqt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 May 2020 04:46:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:48352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726040AbgERIqs (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 18 May 2020 04:46:48 -0400
Received: from localhost (unknown [171.76.87.222])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B0AEC20787;
        Mon, 18 May 2020 08:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589791608;
        bh=l41k8WOcSAevgUEovK3C8Xo8J7ox25uuSDhcFkvYpME=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kCMS6DwyvYiVn3BYBDobSkQ6vUV+f3uqfoIWHATqXG/4v+T3yG793kDq1wE0gym+y
         UgEUzF69Aey/VAHOD4rtW/Jc03pUSdMHzB3ihyFYGqCw433kLDYusnJYfPvYMuNAc6
         htZfQaeanyYlle3yRa61rmTkYGEnGagllo055HHs=
Date:   Mon, 18 May 2020 14:16:37 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: Re: [PATCH v3] arm64: dts: qcom: apq8016-sbc-d3: Add Qualcomm
 APQ8016 SBC + D3Camera mezzanine
Message-ID: <20200518084637.GE374218@vkoul-mobl.Dlink>
References: <20200518082129.2103683-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200518082129.2103683-1-robert.foss@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 18-05-20, 10:21, Robert Foss wrote:
> Add device treee support for the Qualcomm APQ8016 SBC, otherwise known as
> the Dragonboard 410c with the D3Camera mezzanine expansion board.
> 
> The D3Camera mezzanine ships in a kit with a OmniVision 5640 sensor module,
> which is what this DT targets.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
