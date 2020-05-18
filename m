Return-Path: <SRS0=92uP=7A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A2FC433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 07:27:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26DFF20657
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 07:27:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WThf6v1b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727076AbgERH1N (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 May 2020 03:27:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbgERH1N (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 18 May 2020 03:27:13 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1771DC061A0C
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 00:27:13 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id e125so6334286lfd.1
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 00:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HJ1XXZHLa809JrkSNxJUZ/JipPd9aJu34AY2ufR3PJo=;
        b=WThf6v1b6S2KxRbXHj/9Oireu+MyynbbLkZ1MFbgL3pLhqoZU3sMzsuLnY4tZPZbJC
         OTVz8qGaqEcrRFMJQICoweiOLOujVkUsCilRtMPhCsXoLyy+FELnX/nhWCMIzmA1St57
         oeUHl3W+6aUyb3OwzFTerXc9zhRbFR/bJoqv5TVrh2G85xFBxYFXz/BPPv8GZx8fwIJQ
         0R6ZdLiEC0LCA8vYMQl0dSWZUBEP/5bhoO+5M26+ytXWp8auEv7eBex7vaWTwz0EbxIn
         9F8H+SSiUO1Sthj4JCkE+s746yY3wUBcbpwzFei2RmRLR4uKpyllD3mXJJL2HWyzV3p4
         n2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HJ1XXZHLa809JrkSNxJUZ/JipPd9aJu34AY2ufR3PJo=;
        b=MnwyWKDNBb+0t+dmAAVirqxHRIpultjTly37e9l1zJ+tc1l1aYhvBCpR+NBclNx1JH
         Yq7hlwLR4GbDS0xYCvj5FVawuIA2IG/VeljqT8RC+YmN5QDKny4HNPTSzVwJGrKkZ5Md
         KFA039vG74CDAb0hXPUEQ+/fhCSbLoCgRUae7YKax9h51zYL/ga/bN/hO4PBxdgQtLQE
         VJj4qSOX664Rh5Kxt1vN7S3T/9EaXVeN9fibpPgsXPobo22MXHi1/4tId3keT7L+CoHQ
         C6hQIXYihbfbnuOhgdUnQ2zk+GB620vVyBxSxC0haBmd1tryi6mS5tC+4y8MLpi+XB9p
         sC9w==
X-Gm-Message-State: AOAM5338Dm0pSKcM6xGARTzd4of7NXcssx9vOMb2ha/f8mzwwAOXx30H
        kW2VuB+DdO4SKNUOSYgWpTajmJDBjdK5Pf+UkDBb9w==
X-Google-Smtp-Source: ABdhPJwn0fBaC73INjIQqOnlFYImDyV2n9kQ81vMCk0gUG5pmQgCYmTGjK7ExSWik+vCggtw3kskUhG8gk8uMqBmThE=
X-Received: by 2002:ac2:5588:: with SMTP id v8mr10381677lfg.217.1589786831617;
 Mon, 18 May 2020 00:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200513095720.8867-1-ckeepax@opensource.cirrus.com> <20200513095720.8867-6-ckeepax@opensource.cirrus.com>
In-Reply-To: <20200513095720.8867-6-ckeepax@opensource.cirrus.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 May 2020 09:27:00 +0200
Message-ID: <CACRpkdbj0JvTWb1AFgaM1iV0a_OvPbN45c=y231u-M286TJpmw@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] pinctrl: madera: Move binding over to dtschema
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, May 13, 2020 at 11:57 AM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Looks good to me.
I assume Rob will apply this?

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
