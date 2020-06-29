Return-Path: <SRS0=mth2=AK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21106C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 23:19:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E583320776
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 23:19:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="TNGaxkB4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728409AbgF2XTs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 29 Jun 2020 19:19:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728131AbgF2XTr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 29 Jun 2020 19:19:47 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF169C03E979
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 16:19:47 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id gc9so2182367pjb.2
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 16:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7BCJlfo7G05xbD0az983kKAGFwTGf/oknVgG88bEOuo=;
        b=TNGaxkB4WqrzO1Rk2s8RincaD8Rigbs1OexXplCAyMg266FHEL1M5oJZrqqCc4OtXC
         dp31cQYL6GvgZWbR4tfGNlmCwOL8ISJsaS6+8H/YyjK816ypFrD15qyg/sygrl2v6rKS
         KvaPkQipNntsnindjHXBkzi19Wb2/S9eqVQ84Gy22MprFtGor1olAX78/0rFk/syv8J2
         XRmPVPpEOBPLPUURo9vOOiZ9w040EIggc2A2RC6p3/F4ePo0v5eDZr+AaHShDKt1pcnp
         WWU/sRbTyynjwsbTCN/rjvHArtlod0LWN3Sj6mMcXhil62v6nUoNNXdJd7tMDct8s2m9
         Gd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7BCJlfo7G05xbD0az983kKAGFwTGf/oknVgG88bEOuo=;
        b=boOCcQykfqFgjS/HhUfTSe9SRfcTbMAVLdGCNrpRF5tb5/PFC6FPUhQDIoW61ToGWB
         +OPVfXfC2UDEb70eMtHcv9Hr78NItG99FB+wiOo8T405doZEQkn4CK+LgxP1oLn6j1FP
         bc3m+QupLhAR69cPut+wEf/A2AByxXVmjQhoag1HRVuUG/qrXIoch0bwo/KoVmPqCpWm
         LZoYTqa4lZVQ5kQI9fEEy9UkqlU1MS1ipBVCOK3Glfuh0V96OdJDY24dwXq4VghxG3/1
         Hh8bKD6E/y85eWKGZZ8BKxyEgDQVSz3H4hlJdZP9UmhAVHGy459zAoWhsILBzjYcRThG
         OP7Q==
X-Gm-Message-State: AOAM530XIg+kN26ZLaIOGJr6RXYb5jyTBWCgjgfd2EToa2oAWQtuzIL/
        Lq4XgHzU6hPZxLqDCMyONlQTBg==
X-Google-Smtp-Source: ABdhPJx0eXNtAX3bA2KoFAmvdhYvpSuaxwQz3i/aAvo77Rr8UlXpr4imdKYkriuLLMVI7PdD3GaHpQ==
X-Received: by 2002:a17:902:b90c:: with SMTP id bf12mr15253811plb.61.1593472787396;
        Mon, 29 Jun 2020 16:19:47 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id 9sm623822pfh.160.2020.06.29.16.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 16:19:46 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Jerome Brunet <jbrunet@baylibre.com>
Cc:     linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: meson: add missing gxl rng clock
Date:   Mon, 29 Jun 2020 16:19:44 -0700
Message-Id: <159347276726.1911.12754465903057336311.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200617125346.1163527-1-jbrunet@baylibre.com>
References: <20200617125346.1163527-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 17 Jun 2020 14:53:46 +0200, Jerome Brunet wrote:
> The peripheral clock of the RNG is missing for gxl while it is present
> for gxbb.

Applied, thanks!

[1/1] arm64: dts: meson: add missing gxl rng clock
      commit: 95ca6f06dd4827ff63be5154120c7a8511cd9a41

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>
