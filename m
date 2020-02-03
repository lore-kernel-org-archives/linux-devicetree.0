Return-Path: <SRS0=8HU2=3X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB069C35247
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Feb 2020 17:00:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7DEF82080D
	for <linux-devicetree@archiver.kernel.org>; Mon,  3 Feb 2020 17:00:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QjnvLUY4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727918AbgBCRAO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 3 Feb 2020 12:00:14 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44685 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727540AbgBCRAN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 3 Feb 2020 12:00:13 -0500
Received: by mail-pf1-f195.google.com with SMTP id y5so7858848pfb.11
        for <devicetree@vger.kernel.org>; Mon, 03 Feb 2020 09:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:subject:to:cc:user-agent:date;
        bh=+bbS1LurHkbiJrVa8DwGY53PnP/qS0ULTiVuSYs5A3E=;
        b=QjnvLUY4Q4hhfq3l2iwv+1X78eBmhau5DSyA/OBUYOQTo7bb7ep2XKYKghIh3ErkDd
         IZFNWonhBADCHxXVXrF5wA4/tjMGNQMg+h06spG6a6CTAKE8J4qvXYpFAP4mY6hPQbnm
         wMnNfqk/rz0xpnssK+2Td5w2GVQGzRoArLMDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:subject:to:cc
         :user-agent:date;
        bh=+bbS1LurHkbiJrVa8DwGY53PnP/qS0ULTiVuSYs5A3E=;
        b=Bz/vlKMpeZNZG/NXrqmYH3I+gsnE8ys966+wv66njgZxcmwha3R3v6aGSHs3FZNyUG
         /2WoPRUDl3naa8mZYh1/FhVTejRACFwaHLNMClo/Q+FSuC0Nn9cgeqinG1Mj/VW8nykP
         BOkLAasVWNF2NcQx2BKNLs4bjA76dkPZole+2hZP6DzudY1u++vM92yi4iUiaOXb1nNG
         Eep9zjQgjpjpQEMrz1QS2lD4tlhngkrlzEVcUq8MVB/G2HpqcLhZITa3UZQ4IDBbvNx+
         m07JayOS8oTa4T1Dc7KD0Cu1Ate/mf1PpbtvIto037A2JUW8GxAIruLXo9/b0pQd2URw
         zoyg==
X-Gm-Message-State: APjAAAVg0ljjtmGdZJ7a5fDrDNbYIplM413KGRoTL2kFJelzyYkRP0FA
        XctW1d1y2QbK2OtfuDQAlSG4tA==
X-Google-Smtp-Source: APXvYqxfeVAORXMLObE3gAN7OxJt/+U7e9kSIe1Jr0RUJ3rinUWbypd7Od3IggLAS+/64DWu/MihZg==
X-Received: by 2002:a63:7907:: with SMTP id u7mr21605031pgc.138.1580749213150;
        Mon, 03 Feb 2020 09:00:13 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id v9sm21759786pja.26.2020.02.03.09.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 09:00:12 -0800 (PST)
Message-ID: <5e38519c.1c69fb81.d469f.9b0c@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3726ea2e21cffd2f9667aaa0430003b2407ed74f.1580632081.git.saiprakash.ranjan@codeaurora.org>
References: <3726ea2e21cffd2f9667aaa0430003b2407ed74f.1580632081.git.saiprakash.ranjan@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] dt-bindings: watchdog: Add optional interrupts property
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        devicetree@vger.kernel.org
Cc:     Douglas Anderson <dianders@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Mon, 03 Feb 2020 09:00:11 -0800
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Sai Prakash Ranjan (2020-02-02 21:31:15)
> Add optional interrupts property for specifying pre-timeout (bark)
> interrupt on QCOM SoCs.
>=20
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Maybe there could be a description that says it's the "pre-timeout
(bark)" but I'm not too worried about it.

