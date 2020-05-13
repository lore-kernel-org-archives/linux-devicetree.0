Return-Path: <SRS0=QJws=63=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC0DC2D0F8
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 06:56:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC4A120718
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 06:56:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HeCl5LAR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730031AbgEMG4E (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 May 2020 02:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726020AbgEMG4E (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 13 May 2020 02:56:04 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B20FC061A0E
        for <devicetree@vger.kernel.org>; Tue, 12 May 2020 23:56:02 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x15so7003070pfa.1
        for <devicetree@vger.kernel.org>; Tue, 12 May 2020 23:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LJHGQuw2V3Xg6P6HYJwM8po9CR1rONhE229L4UIiqZg=;
        b=HeCl5LARXb/enGdtswo3Ot9WFWx7QXR8BPP2kxKOy8eyOkZPU3u/MOZj1xZJWzota4
         IHbesCyh4Etbk1iXh6lH/Ox014NX1MkJZ5r/82shGUCRTkdW07DNifELv0wMpCh6zN56
         F7KMqN6A3SrYsyUoth8z6fHaXBixRvCSvOYq0Ms3ZtoAWdxur69hUCsfT6d/IrxQ4uwa
         s5k4yBm7582I77BABe2EXZYj0wo1XvEoOIMOi2JNF4H3h2zibBh52WrEUS747LyVidwG
         R01hR4521Wjo1FqgwvSmjyJR3uBRM6+T/YKiMdSud36tGgO0wYRhJKGLaYD2DZxEN5kL
         YEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LJHGQuw2V3Xg6P6HYJwM8po9CR1rONhE229L4UIiqZg=;
        b=oikyjpRTzLI/nz5TO9HP4yjPI6JDhI0zMGr7aq+g/nnR484BWMP0BkCunUqmj3mseV
         ffXOfuEbR9bainxCL6D/0oPC1QF+QndbXBe35vKA0Te+IWEanpvHBvpnY7AdBtlnvde1
         Q3OEWLRqAHcmuk6Bc9TUASLPwGOeZ1xOQFIdwpNIkmQgbMJA/IJDNfWyTYrJ4uH624Bp
         OodgAfZxpv4OE28ptVbAavkPac0fB4+RQWAQk5T5dS/FELxPzCvcRQ+M6iTkfT6EVynZ
         aE/tR5RK9t5MSRIhUTxIjQSDf4dyO0L3ksRFXWHeaseXENxZ8XEZ1WF1lh1u5Z/5SkqZ
         qIsQ==
X-Gm-Message-State: AGi0PuZNt0bLhGUSmgE+gYkFtGGh4Mdi+xVjRmSNLzLerTgMpVLdCW0T
        FFNMtT/MhHNLudlqvu+ViGXXNA==
X-Google-Smtp-Source: APiQypJWigu8UwG4STmKKHYp2/YL6bKwOqWwliz1sZMYzemDP7rbkhoiwCPDuakh0JPVULE0+zPTWQ==
X-Received: by 2002:a63:7e5a:: with SMTP id o26mr18911436pgn.134.1589352962029;
        Tue, 12 May 2020 23:56:02 -0700 (PDT)
Received: from localhost ([122.167.130.103])
        by smtp.gmail.com with ESMTPSA id m12sm12384277pgj.46.2020.05.12.23.56.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 May 2020 23:56:01 -0700 (PDT)
Date:   Wed, 13 May 2020 12:25:59 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     vireshk@kernel.org, nm@ti.com, sboyd@kernel.org, rjw@rjwysocki.net,
        saravanak@google.com, sibis@codeaurora.org, mka@chromium.org,
        robh+dt@kernel.org, rnayak@codeaurora.org,
        bjorn.andersson@linaro.org, vincent.guittot@linaro.org,
        jcrouse@codeaurora.org, evgreen@chromium.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 00/10] Introduce OPP bandwidth bindings
Message-ID: <20200513065559.wznvqc7tzvmv3ghy@vireshk-i7>
References: <20200512125327.1868-1-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512125327.1868-1-georgi.djakov@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 12-05-20, 15:53, Georgi Djakov wrote:
> Here is a proposal to extend the OPP bindings with bandwidth based on
> a few previous discussions [1] and patchsets from me [2][3] and Saravana
> [4][5][6][7][8][9].
> 
> Changes in v8:
> * Addressed review comments from Matthias, Sibi and Viresh.
> * Picked reviewed-by tags.
> * Picked Sibi's interconnect-tag patches into this patchset.

I have applied the series with the modifications I replied with
separately.

Please lemme know if any more tags (reviewed/acked) etc need to be
applied or any more changes are required before I send the pull
request to Rafael.

Please give my branch a try as soon as you can.

Thanks.

-- 
viresh
