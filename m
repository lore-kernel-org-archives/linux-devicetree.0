Return-Path: <SRS0=V/11=AM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 765CCC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jul 2020 16:45:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45DEF20874
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jul 2020 16:45:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lOkSuCqd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732451AbgGAQpo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Jul 2020 12:45:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732428AbgGAQpo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 1 Jul 2020 12:45:44 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1144FC08C5DB
        for <devicetree@vger.kernel.org>; Wed,  1 Jul 2020 09:45:44 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id m22so1615017pgv.9
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2020 09:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=49Mcn16N+aFa9aOh6hAClWXAHESH62HxDmnKGrH5isY=;
        b=lOkSuCqdZxAVVWrp8Z9RY9n/dWoxakBrY7g9uGO8za+REDWilZ+06gQnXUNC90MPLH
         O3ZpsV5pt2i9f74lUEAXsK5Qp81t9qWAGVTmNVuKGkUGs3Ypd31bVRnOXBGsV1gKoDPL
         mn6P+Kv4rhd++DjtknIB17jBrmyBdM8iagTqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=49Mcn16N+aFa9aOh6hAClWXAHESH62HxDmnKGrH5isY=;
        b=hv1Xqj7QPVlZawWAwTCSq+etDrftCX3s3iYqYbLXD+xKFrB+qUV9Jrp7QIK90pVTm0
         ql449EDmaNPpBEJ3jFbkIgqEDr6eaSE8Dy9siqsI7Q6cdtgyxkS8UVo3nfFPkbbTpQF4
         jHP0VEKYkA+ZAWmgG1DR9BrQqLyN0FcdE5G2k9Lukr8bErqiWGD5ZavchnVK7d+8es2V
         remurpdxUntxfUtg+xoQCTN3vSxhqEbVXtrcLkMX5qIPX9pr3B4W+SkOEtb9K7Fs4/zR
         k61KvpCjwFiL59sTfRC0HDrX0GwpclYArzyMqaBlImLtlQtQwYNsAlPsjYudMh0y/15X
         tELA==
X-Gm-Message-State: AOAM532G3i+8rlTlsUMOk6mt3zo1yV5vfe4FxbmqhEviDIBsrskibNFu
        JBIr6EoX1csUUEV+gEQYVAHkWA==
X-Google-Smtp-Source: ABdhPJzti+3JRqlNwHbknWrNbd7E/zM7wzW61RGwqj6TcBm/r/My/0CTb4cEkqFl07Qz2HEhcVBJ1Q==
X-Received: by 2002:a62:f206:: with SMTP id m6mr11815418pfh.260.1593621943597;
        Wed, 01 Jul 2020 09:45:43 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id c3sm4464005pfo.203.2020.07.01.09.45.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2020 09:45:43 -0700 (PDT)
Date:   Wed, 1 Jul 2020 09:45:41 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: sdm845: Add OPP tables and power-domains
 for venus
Message-ID: <20200701164541.GA3191083@google.com>
References: <1593603638-19296-1-git-send-email-rnayak@codeaurora.org>
 <1593603638-19296-3-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1593603638-19296-3-git-send-email-rnayak@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Jul 01, 2020 at 05:10:37PM +0530, Rajendra Nayak wrote:
> Add the OPP tables in order to be able to vote on the performance state of
> a power-domain.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
