Return-Path: <SRS0=C4ig=Y7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD25C5DF61
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 18:52:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 48F52218AE
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 18:52:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RDPZUhW2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725851AbfKGSwy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 Nov 2019 13:52:54 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37154 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726963AbfKGSwy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 Nov 2019 13:52:54 -0500
Received: by mail-pg1-f193.google.com with SMTP id z24so2601451pgu.4
        for <devicetree@vger.kernel.org>; Thu, 07 Nov 2019 10:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:to:cc:user-agent:date;
        bh=C1Udvg9FMxOUFKtX1EFlPrYF5BAQ0Gfet99gcsH4OkQ=;
        b=RDPZUhW2GMjZQNBzTRog95xYEqHC62R7wRvDFPcNSjTizh86M+UZMspV5nR41HzlAd
         223mequfRm19yKEKUWwXh6h57DPhTChHueGRlIKa0HqVRf7jWS+M1s3ER2zzuf3FRZdX
         5H7SMfWCVsqRSRbgZAnAwW2fgNSCcOrlkOE0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:to:cc
         :user-agent:date;
        bh=C1Udvg9FMxOUFKtX1EFlPrYF5BAQ0Gfet99gcsH4OkQ=;
        b=uoVvRQvIYSfw0mkmvjTDrnUoSBjQSkz2TB5coQifsPGEfTJr0lW7bLx/Y3RWO0M4PE
         tRmsTXQfZFF9SNbnB6Wrq6rCF6ynmWMMtz/Naj2r1LPIVXKHzVGec9JmxZY1j8mqNL9m
         X3r3eoNkIWKXZ8M7CeWgUpZjtcZnPkDlMN9J51+4Jek/Ozo6nlVPSyWuQ3BXIBFpcFxI
         yJfP9QaSczhm3dY5UxpsJaWEx8uJw9AZrsCcuIE/TcOheGzZFYfY2wy+49Bm3yQwdIV8
         BWzH4vtzSgLX0qKudXAbKPKgFOoGAGkTC7/VMaxP1qmy3GwD+uMIgrqQXoa7hcFT/yx9
         aaew==
X-Gm-Message-State: APjAAAV8YxgnQq/DvnIiFyPlzgCduCohvYgXTtfdGqhVaS1C2iHZVcKt
        85LOIczLM3akhPfHlAJeMeil+w==
X-Google-Smtp-Source: APXvYqyB1ZNXurx6OgmgxRyU2jt7yTNA6aM9Et3IiaHkfKyaOSY9/xmUAbjYahGijJqorxavaS49yQ==
X-Received: by 2002:a62:1ad6:: with SMTP id a205mr5975230pfa.64.1573152773805;
        Thu, 07 Nov 2019 10:52:53 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id r15sm692550pfh.81.2019.11.07.10.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 10:52:53 -0800 (PST)
Message-ID: <5dc46805.1c69fb81.7b5fa.1eea@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191106065017.22144-15-rnayak@codeaurora.org>
References: <20191106065017.22144-1-rnayak@codeaurora.org> <20191106065017.22144-15-rnayak@codeaurora.org>
Subject: Re: [PATCH v4 14/14] arm64: dts: sc7180: Add qupv3_0 and qupv3_1
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 10:52:52 -0800
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Rajendra Nayak (2019-11-05 22:50:17)
> From: Roja Rani Yarubandi <rojay@codeaurora.org>
>=20
> Add QUP SE instances configuration for sc7180.
>=20
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

It has the weird qup numbering too, but I guess it's correct somehow.

