Return-Path: <SRS0=xnVj=BG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C094EC433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 19:17:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95E8120719
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 19:17:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jYbLK+sw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728049AbgG0TRX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jul 2020 15:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728563AbgG0TRW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jul 2020 15:17:22 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07895C0619D4
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 12:17:22 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id j20so9615707pfe.5
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 12:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nJD8ANcLO/VUZAQvdaY1B7X+QEC8ivatXB0HOFF0ZtY=;
        b=jYbLK+swZ7oxpeCHFmdwpZfHpXputie5W/EjIQUbE8weTwlTEepQhsfFuOurIFeN9B
         GswDdi46JYQ9aLEeP6SEQOpDHpVuNdXW4MZ/cG9ljtiIVjQct65sI7OUGEQKxmTnESOE
         4D9DRhVUAC18CbCTeCtF2sGDcMNnIaJjApsoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nJD8ANcLO/VUZAQvdaY1B7X+QEC8ivatXB0HOFF0ZtY=;
        b=pmnLjJabqtG7928vjrIFKrlLyjvtXHUNs0e6fb44gSCwQra0b44qXXSxLFcEX5iOiF
         s+HOLcLkl8p3Hb96aGNCghUnWy4J/7Kmv7UaAiGn0ozHruXPb7sovcYUHvJMAYGvdrds
         NZkahC8G60wc4sc/tCCioSPEX5Y6l1v6vMHdPYgGkU5coqFLNifxIr6UtXMsMO3iWS1g
         vizSLRJiXgRuQNeYU1RtUcse63rTgS2qJze+9goFzGpimgWOww5FqBPLvAhbE/qSoQ0i
         lDuKfVGHiR5NCIbWfvXA/FV62Dh/9xlB4kPFGFPftFkrkUh0B5l65+JdlRTB4cC4h9K7
         KpqQ==
X-Gm-Message-State: AOAM531l4aRQrkcylZNyPk3mNDQ0a+4n9eKqtgRfTavKSKBNgmvHQ5W4
        p0Jk3BH5vKy1SXX4KyW4XY9yYw==
X-Google-Smtp-Source: ABdhPJyxz8nTCcV4GFjF0/DzhCHEFEk9iyfb6jBZGO5755r2yYlLAHzxDMoJDgSbCpD92ecQxHBIqg==
X-Received: by 2002:a63:182:: with SMTP id 124mr19887757pgb.288.1595877441496;
        Mon, 27 Jul 2020 12:17:21 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id f18sm15177144pgv.84.2020.07.27.12.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 12:17:20 -0700 (PDT)
Date:   Mon, 27 Jul 2020 12:17:19 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: Re: [PATCH v10 1/2] usb: dwc3: qcom: Add interconnect support in
 dwc3 driver
Message-ID: <20200727191719.GB3191083@google.com>
References: <1595528857-25357-1-git-send-email-sanm@codeaurora.org>
 <1595528857-25357-2-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1595528857-25357-2-git-send-email-sanm@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jul 23, 2020 at 11:57:36PM +0530, Sandeep Maheswaram wrote:
> Add interconnect support in dwc3-qcom driver to vote for bus
> bandwidth.
> 
> This requires for two different paths - from USB to
> DDR. The other is from APPS to USB.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
