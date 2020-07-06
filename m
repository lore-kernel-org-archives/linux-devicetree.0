Return-Path: <SRS0=knFt=AR=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64024C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jul 2020 15:58:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33F5120715
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jul 2020 15:58:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PCh8WtzL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729456AbgGFP6U (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jul 2020 11:58:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729429AbgGFP6T (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jul 2020 11:58:19 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28D81C08C5DF
        for <devicetree@vger.kernel.org>; Mon,  6 Jul 2020 08:58:19 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id d4so18577285pgk.4
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2020 08:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9RVtaJ0LNajH8tL25qGstAaY61Hw21/Gz13XlQLJwww=;
        b=PCh8WtzLeJQMoqoq3/Tnrt0CuSDAQ+DIzFonqrKtoRZjJfr/tEk3HFHYPM3L5tm25y
         weOqF5kOYlu+N1df0SXec2EjHElqO5xLSDH+fJUI63HbaqCYOq/vER3IGmw6JvwyglFR
         tJbWSgFgLoQrJhXMDcvjoIO3XCGagDxbLerDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9RVtaJ0LNajH8tL25qGstAaY61Hw21/Gz13XlQLJwww=;
        b=ps+3ceSwE/suADomLUtUNNjJBvVSgKLXUIz880lIl2nbvKNkFq4wb8CTOvYdSl7FcR
         InreQSqqZPYKni9uIyDC+UOPkTLOE9JYdd8l1GAOC/9WgPMZmkHBMJSGUAmaFuStwFRG
         GELiaCPYhgH5cfRrgG9OaBKfh/wg6I8d4OB8pfe4iQeNRsPyILNIODk3swtqozEhoiRO
         EJoGqrs1anhaWj57z8qNRmvJlrXum3oth5DbyVUUcveKLB+6AOpPhmBkUEggJKv64cTx
         u4NKABvEjTZPy+o0ubscJmSEsC1f98ChmyzOI53DPB+zgryOfT/5pQsFgcMGA01f5FmD
         RluA==
X-Gm-Message-State: AOAM530F5+lXzskwAfkFVzBw/XcAwNyH0pE86/Z5qJpv5GCSXNOlyew9
        WiL+OiA+C5qnxsHLlQAxk38Cvw==
X-Google-Smtp-Source: ABdhPJwwxnF0fvOInGc/EtJiOlVFU1DmGn20sGPRjobjVNUcDMlD6m90eL/Rxz6px65Z3jOvRna5Ng==
X-Received: by 2002:aa7:8090:: with SMTP id v16mr5665995pff.199.1594051098637;
        Mon, 06 Jul 2020 08:58:18 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id cl17sm19008565pjb.50.2020.07.06.08.58.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2020 08:58:18 -0700 (PDT)
Date:   Mon, 6 Jul 2020 08:58:16 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org, broonie@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: sc7180: Add qspi opps and power-domains
Message-ID: <20200706155816.GF3191083@google.com>
References: <1593769293-6354-1-git-send-email-rnayak@codeaurora.org>
 <1593769293-6354-4-git-send-email-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1593769293-6354-4-git-send-email-rnayak@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jul 03, 2020 at 03:11:33PM +0530, Rajendra Nayak wrote:
> Add the power domain supporting performance state and the corresponding
> OPP tables for the qspi device on sc7180
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
