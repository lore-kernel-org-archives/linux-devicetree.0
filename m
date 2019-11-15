Return-Path: <SRS0=ud5f=ZH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D7A5C33C99
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 Nov 2019 19:38:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 765242073C
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 Nov 2019 19:38:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UXpz2/GG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726881AbfKOTig (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 Nov 2019 14:38:36 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37680 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726613AbfKOTif (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 15 Nov 2019 14:38:35 -0500
Received: by mail-pf1-f195.google.com with SMTP id p24so7164783pfn.4
        for <devicetree@vger.kernel.org>; Fri, 15 Nov 2019 11:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=rpIokldTgdr5Exrhz1mWV7HaLCSuNS/NOSl6iO2Uvg8=;
        b=UXpz2/GGf6m28T8JsRJL22/FmaujD4Zkm42D4hqF1gSN9xyzIKBP3jZPikdFoLutN0
         1QwHjpjumV9GiZEurjnQujKejh1y/BRNClPVP3v+DWWoMqXo/U/+jfny1z67SpJ8Aedd
         x6F5L4BYk9ZEUUHmuomaBUpqdhxgthCmLWzwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=rpIokldTgdr5Exrhz1mWV7HaLCSuNS/NOSl6iO2Uvg8=;
        b=oo/30MUpGbHROcImUbXf8qOeYnruGXmcHH6c3mERRspqNcMpvp9OLMI42t4NWPeSj+
         AEu0WUp5R1k2RhNoy6PGtkomcarl3+o9XU0I98cYa57sS+y5YoWPs7N7NOceXYau1gwt
         0Fosh3dYy2OsleTEbPCBQae5Htpqz5EH5gzgJJ3mlewF0tpvO1TYlsW7U0+AJrDfBm8M
         5Rm9AgrvZjRkRaQhbRMw3UOez0nI7E8h44Mk7tDJz1TWltcpltFJ7E38k9ms5odr0svA
         GaD8sbes1+SiUqIkZFMZyB+YUNgyMoMfBlY0vzyhqtrDrjQdkNTjZpfB/HtVzPzraLtu
         mPHA==
X-Gm-Message-State: APjAAAWz5Wcd7mTcppEePWYFhvj/ujEwx4F1XRVX4z+pKFgSU4cubQG1
        GK1lr9OrXIKsx/v1wGjMB+3MQA==
X-Google-Smtp-Source: APXvYqykqc5dyf2YeTH9F9RX5Ivj9h24yWKDFvAQmQ98bDBv24JthZfMkfiBfpD1ahLZlS9AfiPdcg==
X-Received: by 2002:a65:6145:: with SMTP id o5mr17611208pgv.38.1573846714978;
        Fri, 15 Nov 2019 11:38:34 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id h23sm10528899pgg.58.2019.11.15.11.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 11:38:34 -0800 (PST)
Message-ID: <5dcefeba.1c69fb81.258f2.f70e@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a2bb92de65e90768bf1d6b8c0b7fbd43cba704d2.1573814758.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1573814758.git.saiprakash.ranjan@codeaurora.org> <a2bb92de65e90768bf1d6b8c0b7fbd43cba704d2.1573814758.git.saiprakash.ranjan@codeaurora.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: sdm845: Update the device tree node for LLCC
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 11:38:33 -0800
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Sai Prakash Ranjan (2019-11-15 02:59:12)
> LLCC cache-controller was renamed to system-cache-controller
> to make schema pass the dt binding check. Update the device
> tree node to reflect this change.
>=20
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

