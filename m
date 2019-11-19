Return-Path: <SRS0=CGHq=ZL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA03C432C0
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 Nov 2019 18:52:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D74112231E
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 Nov 2019 18:52:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WOpL1RBX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbfKSSwj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 Nov 2019 13:52:39 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36130 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726792AbfKSSwi (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 Nov 2019 13:52:38 -0500
Received: by mail-pl1-f193.google.com with SMTP id d7so12249861pls.3
        for <devicetree@vger.kernel.org>; Tue, 19 Nov 2019 10:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=cqphRUBWoV7WE5nNKC8RYhviiEEJhT1j+Y7ZoErED5U=;
        b=WOpL1RBXyIGRx7LAZsUabQOZOXFY6VbckSItM1OeGFrV3wPaVQymPt1VJcTPz1B8cr
         zchv124LAaaBJD+OT7fj1lhnhX96FJ4SKT/N4wq0wQk7auHQCPOzOX+TAV5rxOlfwYYr
         5bvaefywZDbXkp8Uh3vXiE/JibC3aEJaX27Co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=cqphRUBWoV7WE5nNKC8RYhviiEEJhT1j+Y7ZoErED5U=;
        b=mCl2l+n0GDhD+7F2XO53PKHrSRK/U+3eKp865L8FjgcMGxP3zscisOXcCzJkH/9iM/
         Irz80K3dP2/0B60KLVBGQHGYN9z+jHsr74g1DMsfAk0FaiSrihPntJU4l6rBHmsszMvq
         vAkLSWM1TAiUENthjirXRi6jrEpmJpu01KAZB+8TBzTVxNW9Xy63e3M8kA/VFGZRFixm
         ViIshhS8JFTvnW/iGDLNjot9ljYGn4JZpPARfjApmxY2ZRGBZs3oLYrJlXYmBQoPXlDq
         3leGZa77ciltNmj2cSoc09CpF0YbVd5wvMjgOajVnZhqZvOcM+AiM8m5ahHN3HiBww3y
         tqQQ==
X-Gm-Message-State: APjAAAU7ycVcvAVVOkHzZSAzTVQaBFd5M74ZO///cFKWvP3iIRjyTaD7
        plPTsYVjk/8xGWnvqbZRSoAmyA==
X-Google-Smtp-Source: APXvYqxJ/LCpjfL6i8k3WsYcLFwA+acmJMKmMqeGG0hum8Accmkz64zdUg7sdnrncEbx+LUDVgdWrw==
X-Received: by 2002:a17:902:7b98:: with SMTP id w24mr20717726pll.307.1574189557220;
        Tue, 19 Nov 2019 10:52:37 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id j17sm25734881pfr.2.2019.11.19.10.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 10:52:36 -0800 (PST)
Message-ID: <5dd439f4.1c69fb81.8a1e8.adb5@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0101016e7f99eaca-e623ce91-3e2a-40ae-bf2d-647a786aa7d7-000000@us-west-2.amazonses.com>
References: <20191118173944.27043-1-sibis@codeaurora.org> <0101016e7f99eaca-e623ce91-3e2a-40ae-bf2d-647a786aa7d7-000000@us-west-2.amazonses.com>
Subject: Re: [PATCH 6/6] arm64: dts: sm8150: Add rpmh power-domain node
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mark.rutland@arm.com, dianders@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        rnayak@codeaurora.org, robh+dt@kernel.org, ulf.hansson@linaro.org
User-Agent: alot/0.8.1
Date:   Tue, 19 Nov 2019 10:52:35 -0800
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Sibi Sankar (2019-11-18 09:40:23)
> Add the DT node for the rpmhpd power controller.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

