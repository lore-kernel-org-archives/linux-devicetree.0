Return-Path: <SRS0=DpSr=6M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57D84C83004
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 09:20:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28EF7206D6
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Apr 2020 09:20:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GSzf/+ws"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbgD1JUu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Apr 2020 05:20:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726961AbgD1JUu (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 28 Apr 2020 05:20:50 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4FD3C03C1A9
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2020 02:20:48 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id h6so16336512lfc.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2020 02:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ICN7dCbBx+6WcoJArMnBEzGvK72rSzOZiK5dL2bPeD0=;
        b=GSzf/+wsv5cyATIz/phw1ojwp4XlksxZM2jEHxqwTKLBsfOj2Tm8SPZhPYNBd+ZYiw
         kkFCMlrO12KSyLfwW6Npq2lked/S06URs6P2h7WJVdy8hHZ+CBtRGQCAQDMgJyyyLRaO
         IvBJ7XYQ5jC0tIiRtVPN2ODt0VtbClcg2ZPs2tMKCR1du0uNpaTy0bAsbdFeW8k/6lVQ
         KjKh1X855w6wNtJ5KK+z0/TMd5dyQCBrcsoXmCGNxSxdiKBaLmy+WoA5p4sO8gqIU4K/
         yvpoXibwcg0tLpNTItn8e408z//AZ+7vFd8F9xxOLytU2lVZhMpt9K7sasBX3FT6nu4o
         4phw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ICN7dCbBx+6WcoJArMnBEzGvK72rSzOZiK5dL2bPeD0=;
        b=H++OJZAyJHLKgigYgWzBvq9j+EW7tLL010NAVYffedUWffvphbtXVNi6uKIlrLGEXU
         tLespMatPdCSVXrnqcbtR0kOhCHc2bF1CmGY4cY7hzCPrfOMnEYv6hyFCbqv3SnKQghd
         bVqOqdE/KJj4BB0xom8a1aIhqUTJBiUVUoGs1GNpcT8irBsYLfDirUdYpuc3Awp0zDga
         g+plhthTc5I6sAC6qap3X5bJFGRGEZz/B5DPi83lp9dRNo+IOTAyGLsddOwuK6acXvmj
         PgzU826jtBlw/UXKs9uVavjd16JM5RVg0d6r9q3CeuNy5z5PloN2WbefRKzzR/njIIOS
         /bdQ==
X-Gm-Message-State: AGi0Pua3RPmH7ftCXqUYTmCwWHW5BlO8GZjT4TLKWQsdx0+uucjW29nN
        rjpxxsYFQ4pPfHg8rwmbTlnvLuzpBtxJveitHVkeIg==
X-Google-Smtp-Source: APiQypIus6ZMe4qjasmN97t76YaFjK6cebZ/M2PBOdjLaAbJq41X1LdszKoDynGbta+EZNl04COKBV/jynSPVQp9okk=
X-Received: by 2002:a19:42c3:: with SMTP id p186mr349742lfa.194.1588065647258;
 Tue, 28 Apr 2020 02:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200417061907.1226490-1-bjorn.andersson@linaro.org>
In-Reply-To: <20200417061907.1226490-1-bjorn.andersson@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Apr 2020 11:20:36 +0200
Message-ID: <CACRpkdb9ZmoD5x1g7O-BHFWJ3qNMBGrrVN_=ygDAMuXe76xuFg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Qualcomm SM8250 TLMM binding and driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Apr 17, 2020 at 8:19 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> Binding and driver for the Qualcomm SM8250 TLMM pinctrl block

Applied both patches. Thanks!

As noted elsewhere Qualcomm is full circle now recycling the
number of their first Snapdragon QSD8250 SoC from 2007
for a new SM8250 SoC only 13 years later :D

Yours,
Linus Walleij
