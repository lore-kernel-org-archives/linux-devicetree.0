Return-Path: <SRS0=SRlD=7W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B543C433E1
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 22:32:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E27372078D
	for <linux-devicetree@archiver.kernel.org>; Tue,  9 Jun 2020 22:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591741930;
	bh=qsqTgXP+KODtGFq6EtZegDmXsGWtFBRUMwZG9rP2GtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=qW2ru6ELIqW8kRRnweVSoxuMXlEgsaRm9QEBjq4mDCSW6PdLl8Cjtx4c8Oxa3MiEA
	 dSwpqKPaRgVlSxu87GPnvdyjmxkAM9lEZF/uVpmt/8xnZFVzbxEnikRgaYj26sC950
	 /g2lEfG/NcLBjUxnO7JlaE73NOv307d8hNK7mP6k=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728364AbgFIWcJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 9 Jun 2020 18:32:09 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:35067 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728135AbgFIWcJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 9 Jun 2020 18:32:09 -0400
Received: by mail-io1-f66.google.com with SMTP id s18so7830ioe.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2020 15:32:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=pEYj8Q8hvWMVFci2AIGkl90xllgpbmt8ipjrO6OHSLs=;
        b=LDWE4qg9ti1L4VT1q0lwOMUMh0x1BvEfB9ImhkBDgQlTQTmjwVEg8h2er/MjOTPX0E
         JWGWrfDzgHGYXP7hEumOahgJIyeWtY+zOvNCXtILCBnvKytVeFxVyte1Usf3uPLCxaK7
         gVp14OPcLPmqmORrDf0mMHMhJpjdtRNnlu2zQ9kVY+yf5dZLWtq74hgJw3e1tjhh0MLR
         ZQzrHv82diHWm66WH3W5wCp+/5Rg/tc0+RzWqHIvI45BkSlArTMCkdc2CZ2y1hX/Xvnn
         lQzm7PGXHNB1wUPAIY6aZaS9tPvhg3wRhA1EXoiyxXYFh6TAbMi0UtflAckCTP+Fos35
         DJew==
X-Gm-Message-State: AOAM5313eahJiideZBUfOwYsM4ZGzIJdMAOeaTRkoL+WoKssyrHGGIH2
        uPXlgp0YUbheJere0oFwdQ==
X-Google-Smtp-Source: ABdhPJyt5YfQsuRoIMwdfPzISkYMAJHYLcHFHVzz3hR9HowWYWnL9UlrtXdu879YVUnJLYs3lo7g+g==
X-Received: by 2002:a5d:9505:: with SMTP id d5mr377613iom.34.1591741927140;
        Tue, 09 Jun 2020 15:32:07 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id d1sm2290032ilq.3.2020.06.09.15.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 15:32:06 -0700 (PDT)
Received: (nullmailer pid 1619975 invoked by uid 1000);
        Tue, 09 Jun 2020 22:32:05 -0000
Date:   Tue, 9 Jun 2020 16:32:05 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        =?iso-8859-1?Q?S=F8ren?= Andersen <san@skov.dk>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v1 5/6] dt-bindings: panel: add LOGIC Technologies panels
Message-ID: <20200609223205.GA1619918@bogus>
References: <20200601083309.712606-1-sam@ravnborg.org>
 <20200601083309.712606-6-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200601083309.712606-6-sam@ravnborg.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 01 Jun 2020 10:33:08 +0200, Sam Ravnborg wrote:
> Add support for the following panels from LOGIC Technologies, Inc:
> - LTTD800480070-L2RT
> - LTTD800480070-L6WH-RT
> 
> The LTTD800480 L2RT is discontinued, but it may be used in
> existing products.
> 
> Both panels are dumb panels that matches the panel-simple binding.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Søren Andersen <san@skov.dk>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml       | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
