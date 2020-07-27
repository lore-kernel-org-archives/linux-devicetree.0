Return-Path: <SRS0=xnVj=BG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3334FC433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 20:58:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 024CE20838
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 20:58:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I5dX71/U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbgG0U65 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jul 2020 16:58:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbgG0U65 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jul 2020 16:58:57 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE1D7C061794
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 13:58:56 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id gc9so10362072pjb.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 13:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1oR/0P9ErtpTgrX+m0OBVrR3VYxPvi53ReAdjDAOr4Y=;
        b=I5dX71/Uvcfwk/jblm750/2EXt9yjhsPtSEdC4N4lQ/AO2FGB8gfWH/WsjvuuSQOyj
         ONY5pB87KzLdpaf2iZKf6HtgyagXcsssjLA0pBtIbfYXso5X7qhilKimVkhh0S66fKIy
         UdZRRQbO/XKIGmFIbA50WIhCZmfQ+15/zHM9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1oR/0P9ErtpTgrX+m0OBVrR3VYxPvi53ReAdjDAOr4Y=;
        b=JX6pOztTN9P3Vf/qwou4atscP+EVFk+n2tub7msRDcZZitCGhqzsanJKVELfgoXxtP
         V92XHXJRr1LACUqmxQlnjw9C9KOPQVYRwwdLMQX+OBACu06T6yGBZgyOP3CgfMVHQpbr
         uigWOVNa+pSW75Ik2n8aYmnNz4S25oousFKRIODSKZ2MmejBt7wLsYzytO6w0GUISeS9
         cQjgKaEvSWm9uyIxhsQJkDVu5zoTvWDJbT0AKa5TRqtkWkhzdLEgU6mnLectmhIVZNHp
         dogvhy16wc2QS1PQFOHGyHsPlRFcwcaugLaMar7lWVfFJgihHL/lixrpD2xy19HYBNi4
         8O9g==
X-Gm-Message-State: AOAM532ZdqRUsyEDL3QEecNd9ovgj4gCx40aFZ2LNGTIAoALlbh/83Id
        F9i90Qm6l8OFNJTTE2XGQFX/bw==
X-Google-Smtp-Source: ABdhPJwNPDS+cc+l5C6Fk46mxdaDL9PclHliTxJP5rQfP6oKuQNDrzGsoCx2t1y2JMkjPqG1jMFPKw==
X-Received: by 2002:a17:902:7485:: with SMTP id h5mr7030550pll.282.1595883536582;
        Mon, 27 Jul 2020 13:58:56 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id g8sm15819746pgr.70.2020.07.27.13.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 13:58:55 -0700 (PDT)
Date:   Mon, 27 Jul 2020 13:58:55 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        sibis@codeaurora.org, dianders@chromium.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] interconnect: qcom: sc7180: Replace xlate with
 xlate_extended
Message-ID: <20200727205855.GI3191083@google.com>
References: <20200723130942.28491-1-georgi.djakov@linaro.org>
 <20200723130942.28491-6-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200723130942.28491-6-georgi.djakov@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Jul 23, 2020 at 04:09:41PM +0300, Georgi Djakov wrote:
> From: Sibi Sankar <sibis@codeaurora.org>
> 
> Use the qcom_icc_xlate_extended() in order to parse tags, that are
> specified as an additional arguments to the path endpoints in DT.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>

Tested-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
