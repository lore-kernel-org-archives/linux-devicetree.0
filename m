Return-Path: <SRS0=vQ7I=74=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0989CC433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 15 Jun 2020 23:12:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D40DB20A8B
	for <linux-devicetree@archiver.kernel.org>; Mon, 15 Jun 2020 23:12:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="a/H1lS9d"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725960AbgFOXMM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 15 Jun 2020 19:12:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726706AbgFOXML (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 15 Jun 2020 19:12:11 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51F4FC08C5C3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2020 16:12:10 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id k1so7389883pls.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2020 16:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=brcjvLKF1tqBCWFby3z+8MOldV/7mW3P5ikqS7XALSA=;
        b=a/H1lS9d3FYn9UhSPXJsrr9Ixza6PpJjH8tSHUvh/CVDtcrK+HwLEfl5AcfQGKk7Yt
         DgkSjxwNcl1kly5pAN0wEFgD8B08fUExsWnorPyLFmvpIBj+R/zkm9nzMFoDzMIv7hC6
         We3UEU2NIbpxqEVOI2R78klemetd7V15D0qk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=brcjvLKF1tqBCWFby3z+8MOldV/7mW3P5ikqS7XALSA=;
        b=Vm9d+EMbUDcG+9KS12uAEd5DqxJgbVNN6BQz+wKmwy114OWCfRfiLLPSYqxEsYKh9D
         exVzGxKyr+sD/ZlqM+2PgnNoFzl5L6nO1aVMva8rgBLyypsyXqQpqq2lSCjRxXyQDlfG
         3MIejRAwtehZ4dXXARxHIIx9a75rX2BleAeKVIC+/vlnlTd77ZEtMWbLeko0o5zDl4bJ
         Cub7qlT1QFgmGIV1Jb1VDzfu/AaezU058cmyDRC456U7xGOlUKplDJhoLVGgp+uiHp6g
         k+9vJJtQLt7aJ633AVj/2u1wnn5bJQLivFQR0A5BCvdL5nn3DXDx05yzMWiW8JFTr/e5
         PvWw==
X-Gm-Message-State: AOAM532Me0KstBR2hlOJm59BuV+pY8q5tJunVZIuljqyoFe4vpTpbeBy
        Ot3ojBzADSQwvMLjQAsYTvaERQ==
X-Google-Smtp-Source: ABdhPJyyci+2oQlVyjby51mYZoyBYZiTzI2eRXhAYx5ofJPrOzIloyTJpVXRIiOsGGjwxvfH9O22kg==
X-Received: by 2002:a17:90b:3004:: with SMTP id hg4mr266813pjb.208.1592262729649;
        Mon, 15 Jun 2020 16:12:09 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id h3sm513401pje.28.2020.06.15.16.12.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2020 16:12:08 -0700 (PDT)
Date:   Mon, 15 Jun 2020 16:12:07 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Pradeep P V K <ppvk@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, adrian.hunter@intel.com,
        robh+dt@kernel.org, ulf.hansson@linaro.org,
        vbadigan@codeaurora.org, sboyd@kernel.org,
        georgi.djakov@linaro.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mmc-owner@vger.kernel.org,
        rnayak@codeaurora.org, sibis@codeaurora.org, matthias@chromium.org
Subject: Re: [PATCH V4 1/2] mmc: sdhci-msm: Add interconnect bandwidth
 scaling support
Message-ID: <20200615231207.GX4525@google.com>
References: <1591691846-7578-1-git-send-email-ppvk@codeaurora.org>
 <1591691846-7578-2-git-send-email-ppvk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1591691846-7578-2-git-send-email-ppvk@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jun 09, 2020 at 02:07:25PM +0530, Pradeep P V K wrote:
> Interconnect bandwidth scaling support is now added as a
> part of OPP. So, make sure interconnect driver is ready
> before handling interconnect scaling.
> 
> Signed-off-by: Pradeep P V K <ppvk@codeaurora.org>
> Reviewed-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

Do you plan to send also patches that add the necessary DT entries?
I'm particularly interested in SC7180.
