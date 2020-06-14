Return-Path: <SRS0=7KtL=73=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E33C433E0
	for <linux-devicetree@archiver.kernel.org>; Sun, 14 Jun 2020 22:29:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F19A820714
	for <linux-devicetree@archiver.kernel.org>; Sun, 14 Jun 2020 22:29:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g54lf2QT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbgFNW3K (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 14 Jun 2020 18:29:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727924AbgFNW3K (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 14 Jun 2020 18:29:10 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFC16C05BD43
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2020 15:29:09 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id y20so12953057wmi.2
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2020 15:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version:in-reply-to
         :references:content-transfer-encoding;
        bh=YZHcpf8DNvlXC5yfdisg9cr+tmt3ST6TkmCVFSnhO/8=;
        b=g54lf2QT9rPhzJDbCi26meLuZt1sEbto6sTuU73JIL2K5swRE6AMvZy0xrf1VnpDML
         tlpMmJUznbHvAGFMaNOXX5jay3FvZeq4HGkb9vA7lBeaYgIbsdxcFDm+rUNF7o5cHb5D
         hi8U855hjlvDXmCQ5xTrwPRinXoR1klW8bssz3+HE8z9OYUPdtiVcOls0XI6vGJgGIrf
         QNHOT19n2O3OPDQ94zGLrmmYUEbHKUrwksMYuVVAKrFS1US0tryrfsog/yphNH8tN+8/
         ujbwl3xc6OZehktFdrx96e63VsbSHAwPRDOdzXjUO3EZCvyu1nan5eGxVzVmk5c4WXq9
         HEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :in-reply-to:references:content-transfer-encoding;
        bh=YZHcpf8DNvlXC5yfdisg9cr+tmt3ST6TkmCVFSnhO/8=;
        b=Dvvoh0aC0kB7uaP/gP6Q1BEDML9cmKSDyDqvLuMTe5iBbuSM/u+lkjyGMCt8bSriXJ
         TZu6gQzKLyFOpBEvHB7cuorW0IKb4N00YxiRKPyim37pz13WM8NEYX/SE0//eEH5KIk6
         j0jEr7Uy7aplwYaJejdKXnWv33w8KVH1vvEyDikFsb8Q2Bt65NSO5YQyXGqQZaoeoDqO
         FbvjNFlK9vyvAGkPlJFRynpd0ccvdwvWKPe63bZcyWCj/E6Az0pwOHHzhyxBhYpT+GNy
         mE3PNHKYMyzX1b+K6/9L8tmpu3y2RXPDLH8WO7Aipm8TOsvga2yKdQCvclc1WQ5CPBjf
         A+Iw==
X-Gm-Message-State: AOAM532vFiQbIgm8GM0RX6ha59Eewh4ikhz1BcGViCiLovCbfJmI0xgH
        FBl/WtPF88zRMxisS+q0kQo=
X-Google-Smtp-Source: ABdhPJwh5Yl1QZFBQcP4LeiWap+awXl5E3ChMR1ND8VWYlavpkWJEi/QjLO1AkLzkApWK/8+6hVcbg==
X-Received: by 2002:a1c:3987:: with SMTP id g129mr10014691wma.139.1592173748514;
        Sun, 14 Jun 2020 15:29:08 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id f185sm20721079wmf.43.2020.06.14.15.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2020 15:29:07 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     bcm-kernel-feedback-list@broadcom.com,
        =?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>
Cc:     Hauke Mehrtens <hauke@hauke-m.de>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        =?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>
Subject: Re: [PATCH] ARM: dts: BCM5301X: Specify switch ports for Luxul devices
Date:   Sun, 14 Jun 2020 15:29:04 -0700
Message-Id: <20200614222904.3166-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <20200608093733.20190-1-zajec5@gmail.com>
References: <20200608093733.20190-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon,  8 Jun 2020 11:37:33 +0200, Rafał Miłecki <zajec5@gmail.com> wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> All those devices use standard BCM53011 (rev 5) or BCM53012 (rev 0).
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---

Applied to devicetree/next, thanks!
--
Florian
