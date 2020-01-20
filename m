Return-Path: <SRS0=m/NK=3J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF094C33CA1
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 08:40:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B1FC02073A
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 08:40:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hxw6Ec/T"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbgATIk7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jan 2020 03:40:59 -0500
Received: from mail-wr1-f48.google.com ([209.85.221.48]:36371 "EHLO
        mail-wr1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726075AbgATIkz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jan 2020 03:40:55 -0500
Received: by mail-wr1-f48.google.com with SMTP id z3so28560329wru.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jan 2020 00:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=YcyMDNxU6CeZD0M4XJTzTVAVqgpQcDsBZ5eIyxVur50=;
        b=hxw6Ec/TOFHL1uviTFBXvHVns2s9jWeNiGPGY/t1nMnDss7ykWrKFU5OtlWIUYN/rn
         CSz/bR6YM4gxEe17MPUqY2sokNN+JOcvbUGn2uDJDb3DIau1C1LqvB4qjiulY/yHM1CS
         d/VfmvGC8KOnS0AHEyrqYUnG1QVsZgPJcxH8+tQSNrNuhR6Cjtso48v5pIUyorrMwyrg
         VXYIFb27EiVo5/RXvhpRR1RlvZZU5jsohwFCoBsLc1fKCk9sUkeNZgw1v+m7IjsYaOo8
         nQJWeVM7a+vNKAp0AigC4Y1uuJ067vY4nlXZ2IdjfSeym3L/srI6T/cKHXIb0xUZy8jY
         gJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=YcyMDNxU6CeZD0M4XJTzTVAVqgpQcDsBZ5eIyxVur50=;
        b=dzSao8Iug5AIv0uI6J5XDYFMsj1S6VQ3aih549XEQpwS4apUia3w4SBh/XFIR2i/Dj
         atUpqIbVbfgH9W1GVAiYV3AarFp3ulUk1wDbBrudrU4Z3h9vs/csbvpdI40yuNQvcSTM
         XQ2+hQEOVkmMxf8/M00CGvirwb5+gLPs1UBwtoH7CLRn79Ckee5suzBEvkQN5Pb+DX7q
         CJCJ+ZvfJrUPZcTcISJsppCQ5N5qm4JBzWcFgLxcGyVeUQXCbUdAmP+MCyF6RCqo9RwB
         Incz23oWWnoKhXxyi0iX3sDR/J2+rCJ30fJGIKM/TyUXOCLnRTZ78JlJUVjl5Fi2Ed1g
         o6lw==
X-Gm-Message-State: APjAAAXxQY4pNUJYsu1Kz5TXgJlccdAH59t87o0hFtXSqTvsihIPrGp+
        uVVyfgVTFoZZJOYChnKqNjrpMQ==
X-Google-Smtp-Source: APXvYqyFzecxKx1E4K2sGz5OeZKOZDc0OJZI0IE0kmHpxY+jcimDKMgxHvzb7SXw0xV4Pn/XfxamKg==
X-Received: by 2002:adf:fd0d:: with SMTP id e13mr17024029wrr.421.1579509653290;
        Mon, 20 Jan 2020 00:40:53 -0800 (PST)
Received: from dell ([2.27.35.227])
        by smtp.gmail.com with ESMTPSA id x6sm21451676wmi.44.2020.01.20.00.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 00:40:52 -0800 (PST)
Date:   Mon, 20 Jan 2020 08:41:08 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Wen Su <Wen.Su@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, wsd_upstream@mediatek.com
Subject: Re: [RESEND 0/4] Add Support for MediaTek PMIC MT6359 Regulator
Message-ID: <20200120084108.GV15507@dell>
References: <1579506450-21830-1-git-send-email-Wen.Su@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1579506450-21830-1-git-send-email-Wen.Su@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 20 Jan 2020, Wen Su wrote:

> This patchset add support to MT6359 PMIC regulator. MT6359 is primary
> PMIC for MT6779 platform.

This is not a proper cover-letter.  Please use the correct formatting,
which can be provided to you for free using `git format-patch`.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
