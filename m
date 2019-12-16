Return-Path: <SRS0=KHEV=2G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6487CC2D0BF
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 18:33:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3BC27207FF
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 18:33:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jyyXYbhQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730211AbfLPSd2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Dec 2019 13:33:28 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37101 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730474AbfLPSJk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Dec 2019 13:09:40 -0500
Received: by mail-pf1-f196.google.com with SMTP id p14so4252516pfn.4
        for <devicetree@vger.kernel.org>; Mon, 16 Dec 2019 10:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:to:from:cc:user-agent:date;
        bh=uTZ9jD6XcU5csDtmDm0A4lEi/ET7Er5jr9WSb1EMelk=;
        b=jyyXYbhQgJvFoH/gkE8wmpD3skyYKQ7NOFesPHXGsZrxJc9FUF39kXCisPYSVTzGH5
         XfprSHFhYdHkCCIcBitR0qWWWt/V9TEhaHrbqEckar9UuCp+Jsl7qVmxq8BZtEsNxyir
         KSiD+A7sa97Cd257ghc22sKZBvGAGw9UYoEQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:to:from:cc
         :user-agent:date;
        bh=uTZ9jD6XcU5csDtmDm0A4lEi/ET7Er5jr9WSb1EMelk=;
        b=mLK8kJhZYlNSHeTbsIQqHeFNXNAEGrCWO2pD6bzpuFh/uEoG+TniNjQLxZm3rdx0Ci
         8wGVc1wSfO8+GBW3ohawlLuKViJnY7feNGXkPHAT1LJn4PE5mOniBrzQQd/5PS4foSIp
         0ktp7gnWmqbwjxm20bDbB9hs67vH6kEAxdmXiBuYsKcNRPLp6tYA0oV4ebcI4Tl7g8fr
         tsfxBvNPrdBYl4guDrve5r0j27zpI3aYm3N2tAvLFwH7IdDmvZPv5kRLxiyMMilRnBPJ
         w6QRYn0IoEUuoxVkPaj5ijBBFiNqxLfClhKpGJIEbJJycsfuR8qCFOJ+DNX5etaYOY9t
         hqxA==
X-Gm-Message-State: APjAAAWkiDC/6aATF1gJUVqmUmoAO0HgWufzD0LLvPTM2bWfo/kdrORb
        zObuHAaobkhPSfvlbspCxxFBdg==
X-Google-Smtp-Source: APXvYqwgYd4Qk+VgNW5yogq7vFaECby6SdTTUamWheo+l1m4itfak+lUZHj4qp1Cai9JxJJVFmcP4w==
X-Received: by 2002:a62:5202:: with SMTP id g2mr17177463pfb.43.1576519780253;
        Mon, 16 Dec 2019 10:09:40 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id k23sm23348452pgg.7.2019.12.16.10.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 10:09:39 -0800 (PST)
Message-ID: <5df7c863.1c69fb81.91ce4.37b3@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1576474742-23409-3-git-send-email-sanm@codeaurora.org>
References: <1576474742-23409-1-git-send-email-sanm@codeaurora.org> <1576474742-23409-3-git-send-email-sanm@codeaurora.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: usb: qcom,dwc3: Add compatible for SC7180
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Mon, 16 Dec 2019 10:09:38 -0800
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Sandeep Maheswaram (2019-12-15 21:39:02)
> Add compatible for SC7180 in usb dwc3 bindings.
>=20
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

