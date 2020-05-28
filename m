Return-Path: <SRS0=2ZKK=7K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B92B8C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 22:59:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 85B532074B
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 22:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590706792;
	bh=/WmBu2wtHqIc/2g5gfDCSvfp+/TpUzhccpo0Mz4mo48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=a2v/0B8kNorolwdPxSaJeaF+izplwEOHdGfW+2D3WoJm4AF2+6Xtjkkf1GpNNrfk1
	 LzICCH+vJLF5G4bL6IpIvaU10JygrWgaQM8d++OOxItg9DlepIvJL27GuhOHYwn3Zz
	 bYmn8otCtE47KOTj5wOq4kua9TdKuQ9eDqHdW44w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437383AbgE1W7w (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 18:59:52 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:45943 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437266AbgE1W7v (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 May 2020 18:59:51 -0400
Received: by mail-io1-f68.google.com with SMTP id y5so288985iob.12;
        Thu, 28 May 2020 15:59:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=63l28Bq5JSYH0thicVgF9zKNB8VO6tRtQmbEf9CALnA=;
        b=KXWZuvX+CPlDBj8p0KmrUkUl13VBhlmu85oEsHCDMR6iDc6emKFawgKZsy5p7qDDXC
         LI4NXNmEaR8PVFb+oODjbozX26/pJVBody4JROHflchr87W5XluzXEprU538wPphvd1y
         dcdJIIkG8+7Ms8EPg24YiCdven/tdp2DFeMrqxu/lKYB1q9G6wTNMknJSvCgFG29UM+L
         +T/wR5qhjwhKAEgwqvGNdnDIZaMX5GXunRRXzAXvtNM06H9o/301nGH8dOx2TuSWFChi
         H4U6129GQ2ZLcEqgWy6GOxWtZhd3Zw5ZBnQ1LK1FVjfDXqBVdJZqncZcQy3r0joWbq4y
         54Vw==
X-Gm-Message-State: AOAM530c+7ZC6uYyenG8dmcsbgDqwWIl3t6RtPM0+Xzk2RqdlWwQoyov
        hvQTXd/wmrDPUy/9wdKacQ==
X-Google-Smtp-Source: ABdhPJznSLTZm7gTnvmBPUHUbK3PFppQV4FL426PY4ENPB3XQD5duLTC7rIvU7IdbR7ApdsFXn89aQ==
X-Received: by 2002:a6b:fa0b:: with SMTP id p11mr4264202ioh.147.1590706790516;
        Thu, 28 May 2020 15:59:50 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id y12sm4106437ilk.16.2020.05.28.15.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 15:59:50 -0700 (PDT)
Received: (nullmailer pid 837353 invoked by uid 1000);
        Thu, 28 May 2020 22:59:48 -0000
Date:   Thu, 28 May 2020 16:59:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/9] dt-bindings: media: Convert marvell,mmp2-ccic to
 json-schema
Message-ID: <20200528225948.GA837285@bogus>
References: <20200521091356.2211020-1-lkundrak@v3.sk>
 <20200521091356.2211020-6-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521091356.2211020-6-lkundrak@v3.sk>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 21 May 2020 11:13:52 +0200, Lubomir Rintel wrote:
> Convert the marvell,mmp2-ccic binding to DT schema format using
> json-schema. While at that this drops the "func" and "phy" clocks.
> 
> The driver consumes clocks with those names, but it's not clear
> what are they for and they are not used in DT systems. "phy" is
> probably a clock for the sensor and it would belong in the sensor
> node.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> 
> ---
> Changes since v1:
> - Fix indentation
> - Drop clocks other than "axi"
> - s/GPL-2.0-or-later/GPL-2.0-only/
> 
>  .../bindings/media/marvell,mmp2-ccic.txt      | 50 ----------
>  .../bindings/media/marvell,mmp2-ccic.yaml     | 97 +++++++++++++++++++
>  2 files changed, 97 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/marvell,mmp2-ccic.txt
>  create mode 100644 Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml
> 

Applied, thanks!
