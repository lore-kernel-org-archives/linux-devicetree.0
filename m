Return-Path: <SRS0=g9lS=AL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87594C433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 23:32:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C8FA2073E
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 23:32:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TEdNEp5d"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbgF3XcH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 30 Jun 2020 19:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbgF3XcG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 30 Jun 2020 19:32:06 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED3E2C061755
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 16:32:04 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id q17so10110117pfu.8
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 16:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HvnJ5CTY5PKNwx2rApGXMmajme3wNdK5xDZTMK/j40g=;
        b=TEdNEp5deAlbLv+GtHt1PP8akdHtWI6rWWgfVsi4M6zH05mUytdDSQhdPrSSeF4pWz
         gSf9+GHSZq7X+N9QEOyYNdCrJjNwJp+wwZ5pQPIKFxqRf+Bi/nd9abDHyZtIQqxFbxRg
         NaoEe/E9nt+c/poE7PyKzspuuL15XowqC7CDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HvnJ5CTY5PKNwx2rApGXMmajme3wNdK5xDZTMK/j40g=;
        b=eap0t+Td5GojJliq7/qJCN4R7xIjMftnY/XdXsDg1+ZVwSwokuvV2em2w8FZOTPXCy
         F0f1noir7ZPFggLLSjQI4Si+jAGhM3NCiKmoCZ5b5EWwkSr9y6jY/uS+l0ZjXTJl2CQp
         Ip7rFqPdaekjWLXfxW7U+i0XTKoHZVBb/hva03ahNiDgV/tnX35JYbl/zAOJq9j9pan5
         ig/qvwJcROXEswpPhlWumcimOaml6XW3GahvKM4MjPtcwlqMgPIqn5QBJIJhudNXvlMx
         UfqMFF+eiI+NKoXYDLlTlMIRbNrqrxecY3/YT0RdNaE0NlOUvczx2ymLo7Ss6IJZK0ji
         x3FA==
X-Gm-Message-State: AOAM531QTGfDxlIlsPxfLmNQ+XOtH7MgPNvUrqUcr6Mh4dZghh+Weae7
        1rUrM69N1VSt6WNKmvmscGGE6Q==
X-Google-Smtp-Source: ABdhPJzCrE1MU9tgfa+Vyr1llfYnQUE2NKc/S7yR8Vp5B1qGBAY8LkHusztUgu3jHMd9dCv4FVzQUA==
X-Received: by 2002:a63:f316:: with SMTP id l22mr16538006pgh.291.1593559924524;
        Tue, 30 Jun 2020 16:32:04 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id c207sm3720503pfb.159.2020.06.30.16.32.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2020 16:32:04 -0700 (PDT)
Date:   Tue, 30 Jun 2020 16:32:02 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 1/4] arm64: dts: sdm845: Add OPP table for all qup devices
Message-ID: <20200630233202.GI39073@google.com>
References: <1593506712-24557-1-git-send-email-rnayak@codeaurora.org>
 <1593506712-24557-2-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1593506712-24557-2-git-send-email-rnayak@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jun 30, 2020 at 02:15:09PM +0530, Rajendra Nayak wrote:
> qup has a requirement to vote on the performance state of the CX domain
> in sdm845 devices. Add OPP tables for these and also add power-domains
> property for all qup instances for uart and spi.
> i2c does not support scaling and uses a fixed clock.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
