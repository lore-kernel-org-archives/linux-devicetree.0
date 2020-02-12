Return-Path: <SRS0=LTWd=4A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92501C352A4
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Feb 2020 19:23:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6468B21739
	for <linux-devicetree@archiver.kernel.org>; Wed, 12 Feb 2020 19:23:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LC9x1oP7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727279AbgBLTX5 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 12 Feb 2020 14:23:57 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55435 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727231AbgBLTX4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Feb 2020 14:23:56 -0500
Received: by mail-wm1-f65.google.com with SMTP id q9so3615094wmj.5
        for <devicetree@vger.kernel.org>; Wed, 12 Feb 2020 11:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BxOEBk0OKDVQaQ1jykEnv7FtZWP6/XV6yKSqEx4izqY=;
        b=LC9x1oP7D6Kv4xPOS5y9ufKAAfofqmoqi2Fc2HzhKWm75lOMR/KkGAYNehp3KWwtke
         TmnfD2efFR2SBoKaRvOzON/xuA5UDae6/EIOVBH7suBLs8IA4UrBQVtu6pAr0LPfZk4Q
         B1Pca6eJHx+BiXpgG4N08+bSVW4KlFCgWuOM2ww+hn5nyyGUR2ktv8YTtp1wo7VJLXfM
         df+gmLChwHixqaHh62sSoLXjiwhpb3VvMguKTI00zlcMfojgQRk+NIo1qcoEv8MAg3su
         1aAE8KK5rkgj0gvuhSXlwtj9F+cRQB1/hzRmaaolPN2039H6cl0CdvFvaD46SRJvKQAV
         3CFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BxOEBk0OKDVQaQ1jykEnv7FtZWP6/XV6yKSqEx4izqY=;
        b=e+4BcpjpzoRpoObPkD1J6gOKrY7xluvYo0c5Dk6c1eb9AhykuTuw5AHotDYyLT3TuK
         MKc+aOPpSc7kr/6IiHCTjYoKdy/vDOhc+6C6M5VF9cnPmRbHnvfFuom15rYv/84SLgT+
         3MZKvv61K0YgoWi3//y4uHME+ooHHHuF4IXUzbaRvfl96devHkxDOVtRv43dlez0VaeQ
         EbrrLvLyMiEpC2L3Zs7YjsnK5K+2cnrTyZLezUiHK5m3E44/tg026zS4rJnso0ZvMCaG
         r0T1QDOIEN4UtazglPFgqOnUijscItmlVULhK5tju7ig3ojJsyezBgFBdRLezLUc/jD3
         +TOw==
X-Gm-Message-State: APjAAAXBoRXyZ1b5UetXGnZ7lUJ3R0zE15RsrAvZ5xMwtZ5W1AaDO/qk
        6/1jN8TmxHlRYL4hVThoIWH4vw==
X-Google-Smtp-Source: APXvYqyWqw8BKICcq5QZlIbjaSRydX9hYWd4c1GuAjl40H9iZHJ6iLJuURr569xFagrcOuf+H0w3aA==
X-Received: by 2002:a1c:7c11:: with SMTP id x17mr651484wmc.168.1581535434685;
        Wed, 12 Feb 2020 11:23:54 -0800 (PST)
Received: from linaro.org (14.red-88-14-208.dynamicip.rima-tde.net. [88.14.208.14])
        by smtp.gmail.com with ESMTPSA id 16sm1940727wmi.0.2020.02.12.11.23.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2020 11:23:54 -0800 (PST)
Date:   Wed, 12 Feb 2020 20:23:51 +0100
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     Benjamin GAIGNARD <benjamin.gaignard@st.com>
Cc:     "tglx@linutronix.de" <tglx@linutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        Pascal PAILLET-LME <p.paillet@st.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Fabrice GASNIER <fabrice.gasnier@st.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: mfd: Document STM32 low power
 clkevent bindings
Message-ID: <20200212192351.GC2949@linaro.org>
References: <20200128120702.26166-1-benjamin.gaignard@st.com>
 <20200128120702.26166-2-benjamin.gaignard@st.com>
 <20200212165116.GA2949@linaro.org>
 <f25fc32a-7131-6b78-5bf2-d2028e74820e@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f25fc32a-7131-6b78-5bf2-d2028e74820e@st.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Benjamin,

On Wed, Feb 12, 2020 at 05:07:49PM +0000, Benjamin GAIGNARD wrote:
> On 2/12/20 5:51 PM, Daniel Lezcano wrote:
> > On Tue, Jan 28, 2020 at 01:07:01PM +0100, Benjamin Gaignard wrote:
> >> Add a subnode to STM low power timer bindings to support clkevent driver
> > clkevent is Linux specific.
> Does 'event' or 'broadcast' would sound better ?

As this describes the timer hardware block of the mfd, I would say 'timer' is
more appropriate.

