Return-Path: <SRS0=KHJB=AD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 562E4C433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 10:30:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32D3720578
	for <linux-devicetree@archiver.kernel.org>; Mon, 22 Jun 2020 10:30:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hyTPcZ3p"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbgFVKaY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 22 Jun 2020 06:30:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727037AbgFVKaW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 22 Jun 2020 06:30:22 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D606C061796
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 03:30:21 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id x6so16073671wrm.13
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 03:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=OJZ8ufIPKsqB5rJhxxmA58THKC8gBVaQJxB1BylSHW8=;
        b=hyTPcZ3p/Vj6NBYTZuHMAibM2O4uw5XyIDy98N/mJFvWAkzmlmsgkmIdoUWbpc0r7k
         98uhYZM80THFf+l8shd3BDY8336XLBaz70LV/2bAqqu305gf8YTAYYdWus/Y+V0+47iu
         Rr0HhXfrQyZGE13X5i5Vz+p3VGGkd4eDwsfkgKGa1dnHotEE8Fqp/ZVTKsKQeY2V4iG0
         xi9713viZTF66cHzHcR8S6hrTHw99znvETu7lqsDPBE37UYcZJ0JmPSdcKPUUSHZlV4x
         ZE2v+946/9xzxcKSOfXLVBxbi/C+rNRFDVDrcILhe0MTGy+7VPon/dfW+RTZ9tkVS8G+
         TsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=OJZ8ufIPKsqB5rJhxxmA58THKC8gBVaQJxB1BylSHW8=;
        b=o4Ta6j6hX+kcB2zEig1/gu8nN1eVJR+8ESAT30/BqTxE60bLDXT89AqIF2yHarNuXv
         BMT2TWpWmhRUA1w9+CRVasc2xgKUvbrK2nFryD8wlj7KeEVB/t+PRZVgCMIczVEHAl4j
         gUyPzNLvquAUPD4rp2O09f2DwNEzAxkTuHW0Sx3ZWBzCIlFucy/zGBXcRes7NRmbJqIt
         EWHPUbJYt97/Kkxi/j9/ha1JKtgwML745Hu5D2oQH5L/7aK4vMtoO0foYB63tYtPLqok
         Csj3mzwZRyztU3i8rU5+Im6mj99+Eq31hBDVyaFsAgHJ/TR3YhfVD6PqZrcMVVHBBtPk
         4Qiw==
X-Gm-Message-State: AOAM530aKTIYcHP3PsQWnpX02szkGh6TDfSgBd9jx++CoEC6kxaEVt4a
        xWxn6jvpfAzuoVFSYhR1B4pO5Q==
X-Google-Smtp-Source: ABdhPJzbZyR4CNtd9Ju/EbDUWI2mZigkJb8SK98Z/hYKtkT3onVWzAgyoX8RGlVwB7JFNUi69uXTIQ==
X-Received: by 2002:a5d:4286:: with SMTP id k6mr17702175wrq.140.1592821819859;
        Mon, 22 Jun 2020 03:30:19 -0700 (PDT)
Received: from dell ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id d9sm17210004wre.28.2020.06.22.03.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 03:30:19 -0700 (PDT)
Date:   Mon, 22 Jun 2020 11:30:17 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.co, alexandre.torgue@st.com,
        linus.walleij@linaro.org, amelie.delaunay@st.com,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: mfd: Convert stmfx bindings to
 json-schema
Message-ID: <20200622103017.GS954398@dell>
References: <20200220162246.8334-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200220162246.8334-1-benjamin.gaignard@st.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 20 Feb 2020, Benjamin Gaignard wrote:

> Convert stmfx bindings to json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../devicetree/bindings/mfd/st,stmfx.yaml          | 124 +++++++++++++++++++++
>  Documentation/devicetree/bindings/mfd/stmfx.txt    |  28 -----
>  .../devicetree/bindings/pinctrl/pinctrl-stmfx.txt  | 116 -------------------
>  3 files changed, 124 insertions(+), 144 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/st,stmfx.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mfd/stmfx.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-stmfx.txt

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
