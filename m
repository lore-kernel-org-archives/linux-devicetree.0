Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D896BC432C0
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 19:27:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A9B1720848
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 19:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575401279;
	bh=sdWBCZZhvF86A2PP9Gn0gNoyQBix4n2lEgFUNdG6vpw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=jV3oxcxSCp8oIAAbCbpa3+IJ+CRw1ZTqt9lBVt9r36NhXgcJKd9ONZFn4Pvgdl2Pf
	 rJ7ShnpjO4znZqnN+fc3KyiF6wg6YmyytaeG+FWyiLtSYGCb1oN8U9hArwrbntYw1V
	 hNz7euzZ+/1XxY3pyQnadDOUodYmeIARzXRfBQ1M=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbfLCT17 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 14:27:59 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44178 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726932AbfLCT17 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Dec 2019 14:27:59 -0500
Received: by mail-oi1-f194.google.com with SMTP id d62so4377680oia.11
        for <devicetree@vger.kernel.org>; Tue, 03 Dec 2019 11:27:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HP/XS4lIgFeGIfCqiXtNeLKC0699AGqVSeMl324T2Ik=;
        b=HbkH4lZ4mswqCbhRxGHNd8MmQRqNxsgRKJUosfN8/yCjK0KF8Wu3PZ5gTTDPgus6H3
         jHeUgOjVnZRCUTr3JKAPt1LNquaQYrCnkrTiy+TVMixo0LY50HKsggkfderwtcMc65jj
         UYn4Rc9srn9I7kKhwhF6eGZRCSTZ7jZx5Za7FkYxR+JPyRZtxjWgikbhcBuoNsq5AYbo
         gPz3uUNbTj8dO/meEMoUUA9ZzqGPRRjkfYavZ4vjuAX3dpaW2u7kE9iXncy1nQwzHtXR
         2rHrdJcnPahzHEYKqY9l8ylFCVwGtZxgaHcYHpqZG1GpKbKzD48z9vicPRyReWTFvSSo
         cYAA==
X-Gm-Message-State: APjAAAUAjjDy8QZxBuBlGDHCO4x0FU1uBdOjHiqp5e2a9Ht7Cog+tBpW
        0hzTNYgoQQgmPLF9FpSg1YcrrnI=
X-Google-Smtp-Source: APXvYqy0KoeigJ/g+387l+3eFZkkjDJ1VN7OIPFFIQnkeaHpUi5XcqNurGlEInb0iPQfuiS5/pCQpg==
X-Received: by 2002:a05:6808:8f9:: with SMTP id d25mr5062297oic.49.1575401278291;
        Tue, 03 Dec 2019 11:27:58 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f142sm1443810oig.48.2019.12.03.11.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 11:27:57 -0800 (PST)
Date:   Tue, 3 Dec 2019 13:27:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     robh+dt@kernel.org, KCHSU0@nuvoton.com, broonie@kernel.org,
        thomas.fehrenbacher@siedle.de, kernel@pengutronix.de,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: ASoC: add nau8812 documentation
Message-ID: <20191203192757.GA32491@bogus>
References: <20191115160819.15557-1-m.felsch@pengutronix.de>
 <20191115160819.15557-2-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191115160819.15557-2-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 15 Nov 2019 17:08:17 +0100, Marco Felsch wrote:
> Add dt-bindings for the nau8812 device.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/sound/nau8810.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
