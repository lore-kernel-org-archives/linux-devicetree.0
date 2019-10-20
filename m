Return-Path: <SRS0=9JgI=YN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 328C1CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Sun, 20 Oct 2019 18:20:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0082A218BA
	for <linux-devicetree@archiver.kernel.org>; Sun, 20 Oct 2019 18:20:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bhffvDjV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbfJTSU2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 20 Oct 2019 14:20:28 -0400
Received: from mail-pf1-f174.google.com ([209.85.210.174]:38475 "EHLO
        mail-pf1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbfJTSU2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 20 Oct 2019 14:20:28 -0400
Received: by mail-pf1-f174.google.com with SMTP id h195so6877916pfe.5
        for <devicetree@vger.kernel.org>; Sun, 20 Oct 2019 11:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=hPpICzNZ4Kh87S4bTYCVObRqy3CHa+mSHYJpyaWsGjM=;
        b=bhffvDjVvdeFW/Tx78BtMAZVB8MmP3/OQBSp6HjqtMP8LyYpafnXDE/wsiq+AvVOKY
         8OvGACyriUjlq/mCmqnQm+CFvFAJKcU9RM2aPGmvPhm+5SBbmDXMSzWm1RMnRAaQqs11
         Xa9XawAtOzu61KafTJmjBMdZxOjhRB3SuO080=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=hPpICzNZ4Kh87S4bTYCVObRqy3CHa+mSHYJpyaWsGjM=;
        b=pAjoj5560EDCaVdxdYTfMWowkfE9spNPA74kw1E+FD4zgNH0G1Hv0apWNM9u1HusL1
         iL/BzGNpaLiuWYBtDy7G6mqVDbHolXwwVuLzq5EHB0oWTY31c1qPF2zitSzvhnK93AVF
         U80bZdhFsjkkWhd+bJoU+Ox5e1pOsDNFoUk6OI66VEMntO3GRmrbs256A+wNHQ7CiOZ3
         olbqI40LTThGbA652uXvy70/D+Nk6uYNFAFdagnhg/0JakGyFqE5tgYAKkFDaElenVdW
         TGdt8vvc4UDk/dmv5efOubeVs+TXq058/ttjaCGRdbVWfL65sxaIEkRoc3/aawTC3yIC
         QxQw==
X-Gm-Message-State: APjAAAUaG1EVgJnAvYUw7so0ai3yp6/4yl15+8zwBI3xQON4oQc+5Bc0
        oUk0t/IINARrbZtAi3Dy2hrAFg==
X-Google-Smtp-Source: APXvYqzfECRM11aVxu+TNtHORkU10rSq08jh5g9G7KzF4s/YTxkke2dpbf/yjDPkiZ2BfBZ0dIhqxQ==
X-Received: by 2002:a63:d246:: with SMTP id t6mr14765447pgi.5.1571595627178;
        Sun, 20 Oct 2019 11:20:27 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id v35sm15092846pgn.89.2019.10.20.11.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 11:20:26 -0700 (PDT)
Message-ID: <5daca56a.1c69fb81.41ec4.5d65@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7b896d05df926c6443758b3162c24eb3e1d7510c.1571484439.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1571484439.git.saiprakash.ranjan@codeaurora.org> <7b896d05df926c6443758b3162c24eb3e1d7510c.1571484439.git.saiprakash.ranjan@codeaurora.org>
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
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv2 1/3] soc: qcom: llcc: Add configuration data for SC7180
User-Agent: alot/0.8.1
Date:   Sun, 20 Oct 2019 11:20:24 -0700
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Sai Prakash Ranjan (2019-10-19 04:37:11)
> From: Vivek Gautam <vivek.gautam@codeaurora.org>
>=20
> Add LLCC configuration data for SC7180 SoC which controls
> LLCC behaviour.
>=20
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

