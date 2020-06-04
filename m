Return-Path: <SRS0=QtGe=7R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50CBDC433E1
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 10:51:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3094D207F9
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 10:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591267891;
	bh=RhNOYxp8HzEY0fguziSejdekDkHFB3pmyW5pVGwe3Ps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=IRLYMgZ1ZKIbpTOzE2U96VWLt22utfMoVmmvRtjcZqe7y2MUyqb+Od5wxjSNiG52A
	 JuMdxYf3VDAPXhm8ZRc9qZaGjB/JXEA64UfCfFN4hBf31EyLxMSAYdQfk7Mnjx5Nid
	 w7sh+8ByPFGdaqzjZw9lMoG9tzU0vz7MPpCuGl4o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbgFDKva (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 4 Jun 2020 06:51:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:49296 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725854AbgFDKva (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 4 Jun 2020 06:51:30 -0400
Received: from localhost (unknown [122.179.53.240])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4E3FE207D3;
        Thu,  4 Jun 2020 10:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591267890;
        bh=RhNOYxp8HzEY0fguziSejdekDkHFB3pmyW5pVGwe3Ps=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QuYzu9TZgvdLV/Y0JdenedPajZ7XydPgJsruo4CpKL347Sx8Yhpb5WuySTrFNyYHp
         eVlJnHxMMsAkj5F0dRbjrZikuwvnwYKYH4cKYfenPbvovf8JhcTHHPqI1p4JGOmZAS
         9ybINE4yh5F3vbVU2VLMwYYOE8rMF0p/vw/bPkR0=
Date:   Thu, 4 Jun 2020 16:21:26 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: Re: [PATCH 6/7] arm64: dts: qcom: pm8150: enable rtc device
Message-ID: <20200604105126.GH3521@vkoul-mobl>
References: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
 <20200604004331.669936-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604004331.669936-6-dmitry.baryshkov@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 04-06-20, 03:43, Dmitry Baryshkov wrote:
> Enable rtc device provided by the pmic.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/pm8150.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8150.dtsi b/arch/arm64/boot/dts/qcom/pm8150.dtsi
> index fee2db42f4cb..762fb902db81 100644
> --- a/arch/arm64/boot/dts/qcom/pm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8150.dtsi
> @@ -71,8 +71,6 @@ rtc@6000 {
>  			reg = <0x6000>;
>  			reg-names = "rtc", "alarm";
>  			interrupts = <0x0 0x61 0x1 IRQ_TYPE_NONE>;
> -
> -			status = "disabled";

Again, pls enable in your board dts...

Thanks

-- 
~Vinod
