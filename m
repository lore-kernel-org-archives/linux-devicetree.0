Return-Path: <SRS0=9JgI=YN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D914ACA9EB0
	for <linux-devicetree@archiver.kernel.org>; Sun, 20 Oct 2019 18:20:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AB86C21929
	for <linux-devicetree@archiver.kernel.org>; Sun, 20 Oct 2019 18:20:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l7u/BpbS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbfJTSUm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 20 Oct 2019 14:20:42 -0400
Received: from mail-pf1-f177.google.com ([209.85.210.177]:43408 "EHLO
        mail-pf1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbfJTSUl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 20 Oct 2019 14:20:41 -0400
Received: by mail-pf1-f177.google.com with SMTP id a2so6876190pfo.10
        for <devicetree@vger.kernel.org>; Sun, 20 Oct 2019 11:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=Vtq1cPbHIup3PI1Pklqt+T3Wejcx/hjFTg1OvfYHiqc=;
        b=l7u/BpbSbNqw5fVEJyHYDtg4FMxHVm+Bc7/mpfTyfURwUnheRWErIGThqwGUAH6Q30
         AHNKI7HTOo/RKSzMgXIXSYChyFKiqC1tOcWfdHTlqsiRAnBdhwcyBVagsDl8Xj+xn7zO
         +Y37at/WVr2v3llqflDEwhQyfG+O/RYdKckCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=Vtq1cPbHIup3PI1Pklqt+T3Wejcx/hjFTg1OvfYHiqc=;
        b=abdw6G34QsytfaP502e4Ggm4m6dsfuuHMvVoeZ6w/2r1M5hHU1h8RJxe+b7WrtWtFr
         OOVUGzAb0F74dA+rk8ZI70ttvk7yGE+d6H3XofSn5wfuZp+MkphoW6VofGqgd4EMCaL3
         yYi/ZOFZBctdMyD/hYTn3UvZPeoLXZXxPPNcRfpPTTEp00Ud8MtpAS3TVaw1gl9V3p7j
         tU9pzIYrTLVIjbzVHswuznBhVcy+QESvuaDWw7fnmbn3JdDmRJPiChZ3pr0QfEoGWnZh
         +7lBtRW0xpRU6nimBJgok2cg5BO8wTU7YaTGR7TLXwBImr7euXnUtp75kNQsgS2WehtT
         ohOQ==
X-Gm-Message-State: APjAAAVyhEPhG4YJPbl5okuj85S0MhsizHPwxK0/e10hxQT8I/DcGI5X
        vH5a4Q6fGIBFhjYo0dMZ72RwhA==
X-Google-Smtp-Source: APXvYqygRiNNt9TOyeQgTpYIcVsl3b06KRb38CZLx2jIA84O5k/K6VZjZKpIgvc8kokWWIPQgivzTg==
X-Received: by 2002:a62:ac02:: with SMTP id v2mr17810962pfe.200.1571595640853;
        Sun, 20 Oct 2019 11:20:40 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id i190sm13648751pgc.93.2019.10.20.11.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 11:20:39 -0700 (PDT)
Message-ID: <5daca577.1c69fb81.1e7d3.20d3@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <de1bc7fe1edef4b43a2043fcfb20ec536285d344.1571484439.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1571484439.git.saiprakash.ranjan@codeaurora.org> <de1bc7fe1edef4b43a2043fcfb20ec536285d344.1571484439.git.saiprakash.ranjan@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        devicetree@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv2 3/3] dt-bindings: msm: Add LLCC for SC7180
User-Agent: alot/0.8.1
Date:   Sun, 20 Oct 2019 11:20:39 -0700
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Sai Prakash Ranjan (2019-10-19 04:37:13)
> Add LLCC compatible for SC7180 SoC.
>=20
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

