Return-Path: <SRS0=xnVj=BG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35AFBC433F2
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 21:06:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0979920786
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 21:06:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WSVfZyPT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgG0VGT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jul 2020 17:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726676AbgG0VGR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jul 2020 17:06:17 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B362DC0619D2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 14:06:17 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id mt12so2958284pjb.4
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 14:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=34Io1s2ohRS9fYcVvKMBQBhD9r95hojhXInNe93ltBo=;
        b=WSVfZyPTeLrfaOpfDbp1fghrlU4fQ7ISrQVlgWJOYUAvZINlRNp/MOq5BrtqHbqyyf
         uovGVPxOBa03XFLuBSubKB6o6EGew5p5MGMgiYMFtaqRL4alM+f1B8CB07Sz+f9jPbes
         y1FN3NcKNfPT/iO47JnM8TYvR+MjH7+TMRw78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=34Io1s2ohRS9fYcVvKMBQBhD9r95hojhXInNe93ltBo=;
        b=gPChTGD6EJTtEEqEyjgvXMkQ3U218RXYaq/dUDYOCFQfQ9USzDD99K21XCJrTTZZw3
         2tD9Gu0SCjme4S4LS55VvuhWfxq6CIIBfE1XQk2cgH1JlkQZHdDvKfhCzi2/ubBdAxt9
         lpwBxqkjPaVjme22aifYpw3zLw0251IYiloOQru9PTlTNqZejQaGTNOY3vw1xme8yzUX
         KPkAfaxPwXRZ4+uN1kuJi2eLNOmuNtXw+s9oZS7+3nANBbO55Qw2gIeSPLv7leC5Vl+/
         rBVRCM0P+Y10IuM+9SYW7foeDP1/oeC5Bndr94uwhatmYElREGxyrzO3Ex6yff+R3K9y
         1IeA==
X-Gm-Message-State: AOAM530lVHg0AgontuEkCVbIa2Ur/uJv6OdTIN/voso6f+k+eFfwjwBH
        NQQfTM27cb6U8Lw1tsrVW4pp3A==
X-Google-Smtp-Source: ABdhPJycSS7Qr/Sdtby+Y1JPA+w5/LNuHzbsu1UyaTDyxG5eK/rsQrZ1PHZzpkIeL9F7+tN67Ny7Rg==
X-Received: by 2002:a17:90a:c394:: with SMTP id h20mr1169984pjt.22.1595883977300;
        Mon, 27 Jul 2020 14:06:17 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id m6sm5020645pfk.36.2020.07.27.14.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 14:06:15 -0700 (PDT)
Date:   Mon, 27 Jul 2020 14:06:14 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        sibis@codeaurora.org, dianders@chromium.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sc7180: Increase the number of
 interconnect cells
Message-ID: <20200727210614.GJ3191083@google.com>
References: <20200723130942.28491-1-georgi.djakov@linaro.org>
 <20200723130942.28491-7-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200723130942.28491-7-georgi.djakov@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jul 23, 2020 at 04:09:42PM +0300, Georgi Djakov wrote:
> From: Sibi Sankar <sibis@codeaurora.org>
> 
> Increase the number of interconnect-cells, as now we can include
> the tag information. The consumers can specify the path tag as an
> additional argument to the endpoints.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>

Tested-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
