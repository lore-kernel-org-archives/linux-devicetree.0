Return-Path: <SRS0=WBDS=5X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 186ACC2D0EC
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Apr 2020 20:02:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C7D3E2074B
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Apr 2020 20:02:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9s+Nsjb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbgDGUCN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Apr 2020 16:02:13 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:38111 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgDGUCN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Apr 2020 16:02:13 -0400
Received: by mail-ed1-f67.google.com with SMTP id e5so5648723edq.5;
        Tue, 07 Apr 2020 13:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MUp2c8y2HHIRTgmEPGs/ibkN5lEkspycNdWSfgTEUbc=;
        b=f9s+Nsjb99omWJX4KC/AGEHJjvc5gw9L124vu3A156NeCbUwzinTkfRfcRYegWb7cv
         WIqzN7MgNgcmD8MUACyKJbRBEjeWDyg2Va+axXuK+WhYVH0rKwv0H7vChe9WnBgxuJxf
         2Y+v3BkqLjeMyizMbntE4EAj+a0Hj2e3Cv4wN7w7s1HMbQVp4xqew48BR+v//nV+llhg
         3v2m9xc/OZAchYw4Is9P7JPxA+b/CjfKuthW4zIdsnqgy7jxxZG6XA9CLCW+pKXnLt7J
         CNqeFm0N5L35qFY1eOzHyf2hA3cxhdd/H22p8sxzEReBwMLwlLkKFmvg7uPU1jJ1No/7
         uNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MUp2c8y2HHIRTgmEPGs/ibkN5lEkspycNdWSfgTEUbc=;
        b=Z+3u1iVyZVaZH4oxlmnWVa5QjyTleYiMH3dcxHxXrwSWfu4YZKI3C0tusNGG6TO18P
         MQoSjyk/ZrY8wcETQGwFKvnULDeOCJIudU58JojUCnynOSJtbswZHWxV1zHvK6CiEoYy
         C3zRyihR6dXloLDm0KolbHOAiiso0hebAYACUv8/83htYB1Uek0z983C0auaqnWKOE7q
         G70azc4iITgLJpfi3Gj0IncIy+LI9U9vptgTmakpC3DQn3GC8KdNnuU105Hlc2qFDZv/
         GN9OLXWB9NONyrwfxQchPQwqbtMfcYGtZROfMbxi3c2mQ5rUD9+V8vaA2adN27LwAqgQ
         +H0g==
X-Gm-Message-State: AGi0PuYCPhX2nIXbD4Uj7GG8+3dWR/95stu8K6L6u3bEFrm94+B9Nli2
        rBuuOa0dqJmHVkB1xfTh09Y2g2e+w3YZGw==
X-Google-Smtp-Source: APiQypLZNS9G1HxgrjA9flFz0dG7wY+UCU0XFVYp2vgZgriIo3EK0ZDQozZ8p8nO98gJt/Z28zLEKA==
X-Received: by 2002:a05:6402:1484:: with SMTP id e4mr3530446edv.195.1586289730743;
        Tue, 07 Apr 2020 13:02:10 -0700 (PDT)
Received: from localhost (ip1f115f16.dynamic.kabel-deutschland.de. [31.17.95.22])
        by smtp.gmail.com with ESMTPSA id bm18sm195465edb.85.2020.04.07.13.02.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Apr 2020 13:02:10 -0700 (PDT)
Date:   Tue, 7 Apr 2020 22:02:09 +0200
From:   Oliver Graute <oliver.graute@gmail.com>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     robh+dt@kernel.org, kishon@ti.com, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, jun.li@nxp.com, linux-imx@nxp.com
Subject: Re: [PATCH v3 2/2] doc: dt-binding: cdns-salvo-phy: add binding doc
Message-ID: <20200407200209.GB13466@ripley>
References: <20200324071030.19801-1-peter.chen@nxp.com>
 <20200324071030.19801-2-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324071030.19801-2-peter.chen@nxp.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 24/03/20, Peter Chen wrote:
> Add Cadence SALVO PHY binding doc, this PHY is a legacy module,
> and is only used for USB3 and USB2.
> 
> Signed-off-by: Peter Chen <peter.chen@nxp.com>

Tested-by:  Oliver Graute <oliver.graute@kococonnector.com>
