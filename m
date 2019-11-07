Return-Path: <SRS0=C4ig=Y7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE667C43331
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 18:50:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C539E21D7F
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 Nov 2019 18:50:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BnKFCdVT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbfKGSuo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 Nov 2019 13:50:44 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34834 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726963AbfKGSuo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 Nov 2019 13:50:44 -0500
Received: by mail-pf1-f193.google.com with SMTP id d13so3152578pfq.2
        for <devicetree@vger.kernel.org>; Thu, 07 Nov 2019 10:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:to:cc:user-agent:date;
        bh=C1WVX915fPdh/srtNce/iA7rehF3H9bggdi/Th19950=;
        b=BnKFCdVTc1hnaaYgE2CPbWERaaKAAIdT05HgPAM4h2vuO+YFleEa2fKwcq/6/Gd5sR
         CPiZMg/65hkMuMW5O6lLxjQka6L9JG43UhjpMNZXykK5vHW8d3kpRGonUfO7gQYPywJo
         EgmCTZ8E9vES6oyhW1mkqUXGCEQbsSPgUdUp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:to:cc
         :user-agent:date;
        bh=C1WVX915fPdh/srtNce/iA7rehF3H9bggdi/Th19950=;
        b=R3BNGe+XuHNUhP1JeRn9dghOpMVuG0OF8icl1xMsAriCnhbHV/+HdUOGRVcwWUSp4f
         7CpinZHbZCbjRU1a5vdVKioFGxd90x8X/C6eug/xrwa99/Z9i3cwBQ0xfU0cGZuKMlxi
         4o/wVzsl6TQcYSjuWWnHFojwB//+p+8igvY+KLgL5KgGX1l30mhl1IPXqUJChC4yN9o2
         QfXnbsI+72HqeprZvxG5Wieiq4Mrus7iju+iAR2TuQfUJcjP1wR5143tE4oizrqDYgAh
         qnIRlxuqy6WEKlPC8uLoJ8RtM3mXFPmuhfQWpAPejS2y+DejTDDcytuEbXRb7NFNCwaX
         1sHg==
X-Gm-Message-State: APjAAAXjwRRxuYy5EAH1GWWTPD8A5KrtpcsIDmwMYmZKOTg1PHvn2PbU
        xESoek1mbzvc5nyP+QIQQi5Gxg==
X-Google-Smtp-Source: APXvYqwXYon+nNFVYIt+LRRJ84g0KnEUdAh1JFByFpVa60fm9mh39498T+YM8DFuEp34dlBkoGGBww==
X-Received: by 2002:a63:e84f:: with SMTP id a15mr6304654pgk.309.1573152643162;
        Thu, 07 Nov 2019 10:50:43 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id f33sm3276919pgl.33.2019.11.07.10.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 10:50:42 -0800 (PST)
Message-ID: <5dc46782.1c69fb81.3133c.8993@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191106065017.22144-14-rnayak@codeaurora.org>
References: <20191106065017.22144-1-rnayak@codeaurora.org> <20191106065017.22144-14-rnayak@codeaurora.org>
Subject: Re: [PATCH v4 13/14] arm64: dts: qcom: SC7180: Add node for rpmhcc clock driver
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Taniya Das <tdas@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 10:50:41 -0800
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Rajendra Nayak (2019-11-05 22:50:16)
> From: Taniya Das <tdas@codeaurora.org>
>=20
> Add node for rpmhcc clock driver.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

