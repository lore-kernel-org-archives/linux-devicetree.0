Return-Path: <SRS0=deyM=Y4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B81E0CA9ECF
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 Nov 2019 07:15:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8409E21744
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 Nov 2019 07:15:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uqj54HMn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbfKDHP6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 4 Nov 2019 02:15:58 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:56223 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbfKDHP6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 4 Nov 2019 02:15:58 -0500
Received: by mail-wm1-f67.google.com with SMTP id m17so6086411wmi.5
        for <devicetree@vger.kernel.org>; Sun, 03 Nov 2019 23:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=vxpfpSTNArRIpYDDU43CcJdAWB39Ke0QALR4oVEypT4=;
        b=uqj54HMnQA5SJ8btXdn201fUD+jGaxv0l552g9lWfDXXedqkrlhrK8WYzPYXIXWYyX
         QaPcEXRrvT2gPhTihR9C3Xm/RVEuVzOk7oLi1GmuPWxUZGItyCrOOh7gZsMKcT7o/BQf
         vf+6u6C0FtzZ5h+XwUxfrpbufqHz3+wdO5V8Fi7r8uJuMJ4O3CdRjvoFRpUUHNjhBhON
         xBXmN7+nLuWZQOtLouSAFmsCpQwFtAQwYDOkSK7FwgEXwzope9Scf8cki3MPIVQRSlJj
         LBNqN/vrIym3lmNQsl6iacXM4nU391Gq0562F0UFmHRKqj6mRu2RwTP92jdW2WxIehIt
         HtbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=vxpfpSTNArRIpYDDU43CcJdAWB39Ke0QALR4oVEypT4=;
        b=q07DTiSAGhLeUgVbINiJ//0aJ9cIgGqe5M8gHWPw/XMUf4sm/g17dSgJQKvJWBexOP
         VKyy8F8utrq1fYZQOmrpc9mWhIvcZ4pr1/jNTwGZ3weUbMAOJ/GHSG3J4rZNS7qctBxO
         Fh2AUio43riFtPfpu/pB3D8rPfokaGAWanH59b9xWOrM5Fwkd/XnlmANnGfPZlSiw95u
         LMem8VLOFV+mF0pJt49luu7jK4JX43KpHhda3D4I1qRwEyveQP0rqoUd+F98cF46qkuR
         RhkIj9KQxchzCmgqrBuDGeb5u4k8isZGKTNB1Su8uWQabkG2OxMR63fMlQibQTxxKPwj
         d6pw==
X-Gm-Message-State: APjAAAVEK/kt+Hqh9KAyin4oZSXICKwE/YqeslFixC+LtPpTHw0JDU3N
        4ZujwyW4X/PVZESHH5Rt19OX3g==
X-Google-Smtp-Source: APXvYqz32pI5Sru+QNOivnJMXGi29ceCxEjH6H6KjArDxhH+kDfUeNFyWAPKrA1xkKvDXkWkzwoiGQ==
X-Received: by 2002:a7b:c7c7:: with SMTP id z7mr1785835wmk.133.1572851754938;
        Sun, 03 Nov 2019 23:15:54 -0800 (PST)
Received: from dell ([2.31.163.64])
        by smtp.gmail.com with ESMTPSA id p12sm17618694wrm.62.2019.11.03.23.15.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Nov 2019 23:15:53 -0800 (PST)
Date:   Mon, 4 Nov 2019 07:15:54 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Add syscon YAML description
Message-ID: <20191104071554.GK5700@dell>
References: <20191101141034.259906-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191101141034.259906-1-maxime@cerno.tech>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 01 Nov 2019, Maxime Ripard wrote:

> The syscon binding is a pretty loose one, with everyone having a bunch of
> vendor specific compatibles.
> 
> In order to start the effort to describe them using YAML, let's create a
> binding that tolerates additional, not listed, compatibles.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../devicetree/bindings/mfd/syscon.txt        | 32 --------
>  .../bindings/misc/allwinner,syscon.txt        | 20 -----
>  .../devicetree/bindings/misc/syscon.yaml      | 74 +++++++++++++++++++

Why are you moving this to drivers/misc?

>  3 files changed, 74 insertions(+), 52 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/syscon.txt
>  delete mode 100644 Documentation/devicetree/bindings/misc/allwinner,syscon.txt
>  create mode 100644 Documentation/devicetree/bindings/misc/syscon.yaml

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
