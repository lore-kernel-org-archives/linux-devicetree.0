Return-Path: <SRS0=tkJE=4P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B894DC11D3D
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 19:28:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 80CA624691
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 19:28:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MInX3EnV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729611AbgB0T2T (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Feb 2020 14:28:19 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:36585 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727159AbgB0T2S (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Feb 2020 14:28:18 -0500
Received: by mail-pj1-f67.google.com with SMTP id gv17so215865pjb.1
        for <devicetree@vger.kernel.org>; Thu, 27 Feb 2020 11:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jNCZd6PX1ZXEAM0JJJbx9u4ik+xm3nBZiCZphk2ha1g=;
        b=MInX3EnV8wgU47uc9h3KH9yf6+mIM72gr7ccu2K2qz1d2ZNuKQNlMbTi3R7+BhSfqv
         rDHO0iGnakLLx+EOu8+n39dXrytRJFY8KCvjR/E/Kjw/ypO+Zj1NxY5ZCA8R15huPH84
         FW5E2JAaK62ALZphlg/hpHr/wCMZnLzBIy5s7gFX+QTlHXew0i+9qBjQXXzQ/yUefy7H
         lrpzzKT+QXfWkv/gDDevh1y300mGIZa4HahgzcvkEwQdq/zPA+xT/x4wc7AMLOMO6ZiI
         aUciO6BcpiMxtlzSG1w21IiE/aRWwu2A2cUXExP1XzUKz43HP7SH55GAdd9tIcipovXy
         uF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jNCZd6PX1ZXEAM0JJJbx9u4ik+xm3nBZiCZphk2ha1g=;
        b=QFd7leVr2IKbP9D7ewHzTpmJ3FaTbG3cDW47JEp9XITUt2L1S38UtaE/YwBarql1Yf
         WESSLxq9rLn4jJtUa9LiqZ43wavCjshGmlwK4Qf5PwBo89uH8f6R4ey5zD+hPwmsl4qp
         MhssoU+seu5EXxyNjj4XyN0+JZYYwQX4yJBU57g+FXUD4CgeVCs06r8X0CBl1IiIIST+
         /77l3CKi0ZOmgr+of1V47kUnFKTzk4E2tdqZwzkb7n6zpGbVmEaBww2FTl6hRoBKL+3t
         +Zr0/wiKoT32UEpbbuJXpHT58vJRE674ETIwNPxBhfbRz4JTM6VulylQbgxf8AEZr4SU
         ew3w==
X-Gm-Message-State: APjAAAUGfJqrqLpnurE4S9EG2PJWUXBIXQ7qP5RwLt2x8PZ/CGVIjBut
        zjL3lNoxfE2adk0yC0q2nF0=
X-Google-Smtp-Source: APXvYqwQoz3E1P/SooEY8LLUApT5q9S4/JijUIy8oMpK0ifXJLl3yIeoz4NUFnD1/8gXG5TKSoqHRg==
X-Received: by 2002:a17:90a:bc41:: with SMTP id t1mr471493pjv.137.1582831696842;
        Thu, 27 Feb 2020 11:28:16 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id c3sm8016336pfb.85.2020.02.27.11.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 11:28:16 -0800 (PST)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     bcm-kernel-feedback-list@broadcom.com,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: bcm2835_defconfig: Explicitly restore CONFIG_DEBUG_FS
Date:   Thu, 27 Feb 2020 11:28:15 -0800
Message-Id: <20200227192815.16827-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <1582462976-30646-1-git-send-email-stefan.wahren@i2se.com>
References: <1582462976-30646-1-git-send-email-stefan.wahren@i2se.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, 23 Feb 2020 14:02:56 +0100, Stefan Wahren <stefan.wahren@i2se.com> wrote:
> The commit 0e4a459f56c3 ("tracing: Remove unnecessary DEBUG_FS dependency")
> accidentally dropped the DEBUG FS support in bcm2835_defconfig. So
> restore the config as before the commit.
> 
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Fixes: 0e4a459f56c3 ("tracing: Remove unnecessary DEBUG_FS dependency")
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---

Applied to defconfig/next, thanks!
--
Florian
