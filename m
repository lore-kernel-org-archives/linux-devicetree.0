Return-Path: <SRS0=7KtL=73=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 637A6C433E0
	for <linux-devicetree@archiver.kernel.org>; Sun, 14 Jun 2020 21:48:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 320DF2071A
	for <linux-devicetree@archiver.kernel.org>; Sun, 14 Jun 2020 21:48:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DmJj8SwV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbgFNVsk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 14 Jun 2020 17:48:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726844AbgFNVsk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 14 Jun 2020 17:48:40 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0A78C05BD43
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2020 14:48:39 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id y17so15081449wrn.11
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2020 14:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version:in-reply-to
         :references:content-transfer-encoding;
        bh=4ll9gTuODUcXr9og5Q/LYBsrUScj9jVDgcQv5m7nbJo=;
        b=DmJj8SwVD5uqc+UUxRlfxuFaDInpyxLCjNdqfcW165X4ug0IM54TosjxgUKZFvvdo/
         esDIawd2eCh0xhyOW1MPEpoF9C2ZVaXrtn1drJLxxIr6I3gZ+L3NzuJySFFDgDJJNhzK
         ShCjIAVYhHATULAVKlA6oR6ODZ5Vh70z7ffE5kB0LYs5q4yuxWS5MQeQ2dsoVI4sfFcr
         4zDX0MVPFet2xl2IlFcNzbmo+O8AxZwwizwi+RK/QAIlKEth3EfojEKRfG07tJtIXu+K
         Vo+Y8ARoSKQ1S0DM+7pYmDfLsG5ps6O7JXc02GxnNrt4dEUb8d9iclnIkizfoKiuPkF7
         mn4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :in-reply-to:references:content-transfer-encoding;
        bh=4ll9gTuODUcXr9og5Q/LYBsrUScj9jVDgcQv5m7nbJo=;
        b=IE+7zbR6HR3Q+CwFSkbPwsYR5Ie+EwrnA3oM3gbWD8oSNfZ3vgwnlcCVAyNQ/xFAVH
         PbNkL7VK1Dro9/a0zu6aMpuavjkVxtyXGMhfKNjrsJcqOut84MTZ1bVXvtZI2WTdSlUo
         ydH7Z1RrAr8fmJWjUGSE1Co7AntUj/q7Gwa03LA9DFFlQOTYOMELbtjdq5WIqDxtghd1
         +52AmMnXSrWzLKsQXegmaK3YeqNBS2QuCQhQ+bF7lbjpUYMZJaH2UCfRI8rfyJyQuDQZ
         amwDW3BJTrUtmOqEwFTrF1bakuc8ktrPqFOhCoe2BHiHV4yHjzbcnYopEhzoVHdE0IlB
         yxhw==
X-Gm-Message-State: AOAM532S+epFmoyqUnW4Hd74OpPDLar8b9idn2iguTliSJ05P03MKYn2
        AjutuzPIDpDoDZY1XnyAw1E=
X-Google-Smtp-Source: ABdhPJzU1SD8JhC/ognD7wZXeGPkdP6oOq0br353b4io8XeY127h11sdWBtOFr9I6YAjX3Yl2PD81g==
X-Received: by 2002:adf:ce02:: with SMTP id p2mr27444569wrn.152.1592171317733;
        Sun, 14 Jun 2020 14:48:37 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id z16sm21560948wrm.70.2020.06.14.14.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2020 14:48:36 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     bcm-kernel-feedback-list@broadcom.com,
        =?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>
Cc:     Hauke Mehrtens <hauke@hauke-m.de>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        =?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>
Subject: Re: [PATCH] ARM: dts: BCM5301X: Add missing memory "device_type" for Luxul XWC-2000
Date:   Sun, 14 Jun 2020 14:48:33 -0700
Message-Id: <20200614214833.1261-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
In-Reply-To: <20200608163341.1743-1-zajec5@gmail.com>
References: <20200608163341.1743-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon,  8 Jun 2020 18:33:41 +0200, Rafał Miłecki <zajec5@gmail.com> wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This property is needed since commit abe60a3a7afb ("ARM: dts: Kill off
> skeleton{64}.dtsi"). Without it booting silently hangs at:
> [    0.000000] Memory policy: Data cache writealloc
> 
> Fixes: 984829e2d39b ("ARM: dts: BCM5301X: Add DT for Luxul XWC-2000")
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---

Applied to devicetree/fixes, thanks!
--
Florian
