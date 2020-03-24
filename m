Return-Path: <SRS0=2e0x=5J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA675C4332B
	for <linux-devicetree@archiver.kernel.org>; Tue, 24 Mar 2020 10:57:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8D2B620786
	for <linux-devicetree@archiver.kernel.org>; Tue, 24 Mar 2020 10:57:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XzPL8rmm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727196AbgCXK5s (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 24 Mar 2020 06:57:48 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39924 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727112AbgCXK5s (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 24 Mar 2020 06:57:48 -0400
Received: by mail-wr1-f65.google.com with SMTP id p10so8417051wrt.6
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2020 03:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=DOA10CRKFJGu8b5wtBJ2yLDJfOkq/sBVSQmhdUC4ypY=;
        b=XzPL8rmmIVLxiwmtlWoRSXM0V5GpXguC00V1OiwP6D+VNJxQu2ndjNH1DMpUjS28PQ
         95d55nIqF92A5FJDVtQG8Jzb05LrNkZmBvwRk7n8ylcgjn2PXRej0umf85yg4FJtwRIf
         1d6lguSarwuUd5qHDfnSxccZHHNay6tDtznC6eX6gJLk7WG884AyXPo8Re0uFBwUCYRa
         EJvXYkjpEwuOQ+odcen6exRdljEbPs65kh1We93B8zHf7DKnQ9qYQGqCQip3Pr7KLhbt
         MOAHL7oolr6K4tZz9zakUdiOTZZ68VaGyLG81OjlfADYwnOzGldnrkt5IBYVDJai8PZR
         9zoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=DOA10CRKFJGu8b5wtBJ2yLDJfOkq/sBVSQmhdUC4ypY=;
        b=mwAjYT+K2M7dhmOOnhG8guWwUn5SJXmwpnJ8XmwNQlZwHgV7439gh3Xna2n60WIm1z
         HyoLcesvyoLN8BbMnbCAGjlY0Acq6YXJUm0D/cNAvqSzYmHcm2lR9VepqmVr5asCEq9f
         x7+EafwQ0sZP/2h12sHwpK5ueuN4PGUTGvpubpsZke09rfz/e32J6fdNdwxLuw40lctE
         9H9MPsblIf81eHNiuOhWIeoBIneQeha+d8+GlJq+GmJkbBuAI24BMAa0J+H5Boq07Tc3
         cceH2ta0JsVzdxlSsYszDLrq5ecOAm5XJFhcl9KO4hsW/AC/xBBZ3edNDWxzgWgAY5ue
         G2hQ==
X-Gm-Message-State: ANhLgQ12Hyx6LfoX+Z27hzhAym+RBdmyiIACkqBsD8Lp7WfBU2yUvmCV
        wWtpVpxO2rLFarNKAUyjpM3Asw==
X-Google-Smtp-Source: ADFU+vt2lLYB0Tgp6XRl+Nd0We086rBZL2iX6nYLI5T5X83Rf+H43VbfRkFbjVqQgqGMEydvpBiXPQ==
X-Received: by 2002:adf:ba48:: with SMTP id t8mr36017493wrg.329.1585047466432;
        Tue, 24 Mar 2020 03:57:46 -0700 (PDT)
Received: from dell ([2.27.35.213])
        by smtp.gmail.com with ESMTPSA id c7sm17274309wrn.49.2020.03.24.03.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 03:57:45 -0700 (PDT)
Date:   Tue, 24 Mar 2020 10:58:35 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        stefan@agner.ch, b.galvani@gmail.com, phh@phh.me,
        letux-kernel@openphoenux.org, knaack.h@gmx.de, lars@metafoo.de,
        pmeerw@pmeerw.net, linux-iio@vger.kernel.org, jic23@kernel.org
Subject: Re: [PATCH v7 7/7] mfd: rn5t618: cleanup i2c_device_id
Message-ID: <20200324105835.GJ5477@dell>
References: <20200320081105.12026-1-andreas@kemnade.info>
 <20200320081105.12026-8-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200320081105.12026-8-andreas@kemnade.info>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 20 Mar 2020, Andreas Kemnade wrote:

> That list was just empty, so it can be removed if .probe_new
> instead of .probe is used
> 
> Suggested-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
> Functional independent from the other patches, but since they are
> touching similar areas, commit/merge conflicts would occur.
>  drivers/mfd/rn5t618.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
