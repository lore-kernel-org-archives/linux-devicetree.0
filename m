Return-Path: <SRS0=e4CZ=6A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AFB6C2BA2B
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 07:02:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DAC26206A2
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 07:02:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zS3y8Lnl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437790AbgDPHC6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Apr 2020 03:02:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2437800AbgDPHCh (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Apr 2020 03:02:37 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8A00C03C1A9
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 00:02:34 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id t14so3450351wrw.12
        for <devicetree@vger.kernel.org>; Thu, 16 Apr 2020 00:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=UcbV/1U7fcT3mqmBtnCZDKM08tchT85s7YFfnWx+Mb8=;
        b=zS3y8LnlF68g0JllYixN26PbAwCSYY7xSlE8nXjsy7YcsVxDwbGAO2rKjNYL1Vw91a
         cDrmXmEMPfKStjnT6sMkP5P5xZ8usWxZHQ37ENd8X7uF3wahkUpFfF65sbOObwpTipWH
         TwoCG+Z5BXWUk1u0ookteA/VWEm7Wd0Jed1o8tTilBP9B0hvhsJE5Z0KHkyyIpWzxfRH
         doTWrjcELR9xW1KFiQWOEp6uzvD1Nu0DMMHEgI58rgOUMG1xKY+G6wCXfFHBYPbGaMxd
         5TBnIdhsAJvm7fT4SxC6iM6fvjYQgs5DBb/i/3w3d45KPazkLTm3Ew6LM+RzDHcGFe5f
         6/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=UcbV/1U7fcT3mqmBtnCZDKM08tchT85s7YFfnWx+Mb8=;
        b=MgrkZ2F/vHxbKqpj0yGeWo498Ty6n74x9hJMrKW7lOddmZ6s6V13W8PzaVsbjqCXe4
         831k7fBa7c63kMXwqJvO64GatsjwQvBj7lJCB09iCDGhK/D5hYxSDnyrF+Q7AC5nlVtH
         kG5WZCacTEeJy7QOz4j6XGQ1tz9MGi46E68zZV9Rpta9A0/qqegi2g4o6WAMTMOs32hw
         9S5RPpgd49Nm8NyV2okg31D9jfhRrRRJRma72dWpEQDoVwjyhS1201P3NSG3Kpxi1Qev
         2G9g9mjRoV87IjMWRr+iHrXjNEtuaf0BZue6vTwzsGHOtBVYDuWsdZNZmdugOEbxzEy9
         vEcQ==
X-Gm-Message-State: AGi0PuYiBIPK4g/8bI/Xpjg7mhbe61EZeDOEhbuMSseow/+jp4Zx/5gR
        s62/6k+wI4zoSclipz6MR3ZfjA==
X-Google-Smtp-Source: APiQypJ96rWLxKp7VAvSeHK7hZEqilWnmaYg11vV8dBdjgLm8n9pRM8C8e1VgmyHDPezkPAvIIBirQ==
X-Received: by 2002:adf:ed0e:: with SMTP id a14mr32770394wro.400.1587020553212;
        Thu, 16 Apr 2020 00:02:33 -0700 (PDT)
Received: from dell ([95.149.164.124])
        by smtp.gmail.com with ESMTPSA id j11sm4915082wrr.62.2020.04.16.00.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 00:02:32 -0700 (PDT)
Date:   Thu, 16 Apr 2020 08:03:23 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     fabrice.gasnier@st.com, robh+dt@kernel.org, mark.rutland@arm.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
        daniel.lezcano@linaro.org, tglx@linutronix.de,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/6] mfd: stm32: enable regmap fast_io for
 stm32-lptimer
Message-ID: <20200416070323.GO2167633@dell>
References: <20200401083909.18886-1-benjamin.gaignard@st.com>
 <20200401083909.18886-5-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200401083909.18886-5-benjamin.gaignard@st.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 01 Apr 2020, Benjamin Gaignard wrote:

> Because stm32-lptimer need to write in registers in interrupt context
> enable regmap fast_io to use a spin_lock to protect registers access
> rather than a mutex.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  drivers/mfd/stm32-lptimer.c | 1 +
>  1 file changed, 1 insertion(+)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
