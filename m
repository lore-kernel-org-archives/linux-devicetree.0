Return-Path: <SRS0=xnVj=BG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D60C433E8
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 20:10:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 035DF20729
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 20:10:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J/Vg4qI9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728903AbgG0UKY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jul 2020 16:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728867AbgG0UKX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jul 2020 16:10:23 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 777EDC0619D4
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 13:10:23 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id q17so8719262pls.9
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 13:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UdLyNGTWMHvHhwOJiAVBynAmD0CjHGQzhSi/nggidvs=;
        b=J/Vg4qI9eDkBhX0XginvSJghLnUks7HG7oSMGZrNKStY5y3R3v9/fujqIbakw/XA9G
         ngFsdubO0Fsnh6ueE1f9sR1HTzu0n4v5xMMj/2sBd2bHfHtMuNXTvSBKlrKSYwYKhXe/
         S9/4UA5qFjZ/sftKUkyuU6MoXy+Ch8HR+n+dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UdLyNGTWMHvHhwOJiAVBynAmD0CjHGQzhSi/nggidvs=;
        b=YT91p+7ahka9P1Vbse/MLulewgdvZJgfbYPWHYPb00NANU/jjL40mtshuDJNPvEv82
         1T3vBUkpxZGmwWrhagHELa/p5IOFI0684E4vrJ/ifjZAhW7IzryAagboCHRyvALQHUbE
         4Sld6Q0SJi97ijZmyGbdB7TUCn+b2ScDyikBF6lwi8h46vZ9o8INKxusLMkOvjX2WGoG
         TQ97XlduXSitEXv3oU6LsSP3tZx/UPxy5aA+ppKXB77IZ5d3auj/P6h4+SITHSOv4yqC
         4bZ9xC0bVHmIwHjlqboO7tEdqkqOhCIQQXvwecdkchgVV+sZP8a16AU7vIHHotNlFVJI
         21Cg==
X-Gm-Message-State: AOAM531aD0TYjsXPA7tWi3dDqITwQeePqAE0fe7IymlBOb1ivPOR69xD
        TlnL7hXd9tr9REmz+Rf2fI+1+g==
X-Google-Smtp-Source: ABdhPJxBz1FXycwPTXTy/WCTt2NjfqcLLzcYIy4Yx9gFDji2WBixP5lH/qx3NIthBdl+34zBfkswGw==
X-Received: by 2002:a17:902:680c:: with SMTP id h12mr20030463plk.86.1595880623009;
        Mon, 27 Jul 2020 13:10:23 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id l62sm469449pjb.7.2020.07.27.13.10.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 13:10:22 -0700 (PDT)
Date:   Mon, 27 Jul 2020 13:10:21 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        sibis@codeaurora.org, dianders@chromium.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] interconnect: Introduce xlate_extended() callback
Message-ID: <20200727201021.GE3191083@google.com>
References: <20200723130942.28491-1-georgi.djakov@linaro.org>
 <20200723130942.28491-2-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200723130942.28491-2-georgi.djakov@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jul 23, 2020 at 04:09:37PM +0300, Georgi Djakov wrote:
> Currently there is the xlate() callback, which is provider-specific is
> used for mapping the nodes from phandle arguments. This is fine for simple
> mappings, but the phandle arguments could contain an additional data, such
> as tag information. Let's create another callback xlate_extended() for the
> cases where providers want also populate the tagging data.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Tested-by: Matthias Kaehlcke <mka@chromium.org>
