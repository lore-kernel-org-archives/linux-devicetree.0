Return-Path: <SRS0=xnVj=BG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 195F1C433E5
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 19:18:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE98C2073E
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 19:18:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="R2jjdbqK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728800AbgG0TS5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jul 2020 15:18:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728107AbgG0TS5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jul 2020 15:18:57 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13C95C0619D2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 12:18:57 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id l6so8641567plt.7
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2020 12:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KYcxnJiJj69tRTiEAadwyrdtR22boWUN2z9HB/fXNUA=;
        b=R2jjdbqKOeMyZXLB5gCmo1dIyD9OXYKPAw+app2x6HmA8T10ZwHHuGiPJj3zRmg6O7
         1Kh9JSmdZ1lQWiFdA9qmTn0+xQjjDc5+40Vwtt44N8cymoskiaKIubLi364r/FxULAYZ
         d0cyj50JO7V7RoocGGEctm4t/IqWYi/7QEc647x1JKyp99qd9q5Vdzz9vaS0ICmd3Gni
         TVW7BrlR7HduEobquyFjGm0jjX1nZdfZUuKAeZ/OLCrRhocMGZMdopallxdVUWyPa4L3
         XrMnPwSV2+3bsPyAPrhLet0db6mtxzHtCuvWmHQa8tlfiQUBdGFh/CpHQGL7MYakiAy5
         Qopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KYcxnJiJj69tRTiEAadwyrdtR22boWUN2z9HB/fXNUA=;
        b=HnEhhWC+fHl6amKCAOZpluPq0dB/1byIXuvsrAShl1pGyQfh86tQwhysAktzSGjfp/
         2aMjTjLw7LDmzSr0pM3N0ojRQjVDNnI851IexGCDtmDlYLhmvW45hFec3BUwmr1xAN3D
         qgbhHLe4sKCaCQ9tX2Yn9V1o75v71Q0+hIQT+Jj04ftv/omgYcXJmzw9JxBM3Ibi9pKI
         r43MiUShVx4yLeo3Ajg9LI3jUpW//LUueDLlTQPNkl4BFrvqXFT45sqwWhA8JMJGdjPc
         ajJ80X5yf1pD3eW70euF+s3WdrzF86Yu170sNSFdv030KBeeztygYtQmhVuWzr6cxJd5
         FRFQ==
X-Gm-Message-State: AOAM533QyVo53pDLsD2vvW7JqrfDsfQzFJ/7p7BTrN2gK8mFfpus8y22
        9ZLrAl2CHK3O3f0h8YGW6h6ptA==
X-Google-Smtp-Source: ABdhPJz2jqCiQQNL40op8DOdoDG7P0HFj98+NtEUkvD4/UOy/rpmH+LlNHdciSjH2PKrVot5+x/gRg==
X-Received: by 2002:a17:902:6bc2:: with SMTP id m2mr19056144plt.119.1595877536516;
        Mon, 27 Jul 2020 12:18:56 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id o10sm345581pjo.55.2020.07.27.12.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 12:18:55 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Christian Hewitt <christianshewitt@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: meson: fix mmc0 tuning error on Khadas VIM3
Date:   Mon, 27 Jul 2020 12:18:53 -0700
Message-Id: <159587752409.20735.8859718228289623070.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200721015950.11816-1-christianshewitt@gmail.com>
References: <20200721015950.11816-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 21 Jul 2020 01:59:50 +0000, Christian Hewitt wrote:
> Similar to other G12B devices using the W400 dtsi, I see reports of mmc0
> tuning errors on VIM3 after a few hours uptime:
> 
> [12483.917391] mmc0: tuning execution failed: -5
> [30535.551221] mmc0: tuning execution failed: -5
> [35359.953671] mmc0: tuning execution failed: -5
> [35561.875332] mmc0: tuning execution failed: -5
> [61733.348709] mmc0: tuning execution failed: -5
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: meson: fix mmc0 tuning error on Khadas VIM3
      commit: f1bb924e8f5b50752a80fa5b48c43003680a7b64

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>
