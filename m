Return-Path: <SRS0=Wk4Z=ZO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A1FC432C0
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 22:52:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EBCC62070E
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 22:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574463130;
	bh=Tkh1+Z3SfAu/e43ffSdZleJpHzGrktzmj8NTwYbsaac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Jjh1wSS54IdByygAEduPkx8wnTs/jrFgi5JAbHFmjO2UXZvuWOy1Z9OrMnKiqk+OE
	 woKvayNBPJsZ4RS39NcIKd4vzBiLsu8rGRt9D/2ELeuJ2n+Vut1AmRfCkmjW51tOAC
	 V5UtAxkNm1NjX5V1VRQPwdXN31nug7JdSHjy9fts=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbfKVWwJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 22 Nov 2019 17:52:09 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:45556 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbfKVWwJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 22 Nov 2019 17:52:09 -0500
Received: by mail-ot1-f67.google.com with SMTP id r24so7570515otk.12;
        Fri, 22 Nov 2019 14:52:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=e2Kuj3HGhGYNdxls8aJwodarz1qpw5npM7OevFhBVqw=;
        b=Fys34CfhsNSZtfhuyksoSgYFzadoGrJ1ElRj0Iyfwiw85486d4UXT7sdD2kB7pA7i2
         pumFWyePfh1bHgFWzAELElCxzgKfdie4ByIqIbpBkvXnN7eYZlT5v/cddhhDcv3GTpC6
         xslSDOiRkFfIxizz0iW9hKdQ0FvWMZDzuLuj2258eCsa8ACrX7hQKyewpsX7szy+dlFU
         9XJmF3ZbIsqGJVWFRGbJ61ov6mtbLipoJ8Akj895ptTBTmQxFuCmZeN/5xtGx/kMTjkZ
         SJ/tZ6V/yHy0Tfpuid4BrAbpP1nI7jBOVH7OPfy60UhQMGrhwnYe0AlTsPWfG+esYfu2
         uf4Q==
X-Gm-Message-State: APjAAAXzlaoiw9dJGHAn30imQVhzg23mKyaXuB1B3Y0w02/liIU70XKg
        XlvWjeFkvNKHFcSx+nk8oQ==
X-Google-Smtp-Source: APXvYqy41erDboq1N+XYxLBZ5aQeIaFuH8UOLZ30Ly5N0IQ6wjAkUtlFPxVF1kLjthKhQz/+regFng==
X-Received: by 2002:a9d:6b0e:: with SMTP id g14mr12869372otp.128.1574463128725;
        Fri, 22 Nov 2019 14:52:08 -0800 (PST)
Received: from localhost ([2607:fb90:bde:716a:c9ec:246b:67b7:9768])
        by smtp.gmail.com with ESMTPSA id 202sm2533064oii.39.2019.11.22.14.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 14:52:07 -0800 (PST)
Date:   Fri, 22 Nov 2019 16:52:05 -0600
From:   Rob Herring <robh@kernel.org>
To:     Hanjie Lin <hanjie.lin@amlogic.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Kevin Hilman <khilman@baylibre.com>,
        devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-usb@vger.kernel.org, Yue Wang <yue.wang@amlogic.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Liang Yang <liang.yang@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        Carlo Caione <carlo@caione.org>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, Jian Hu <jian.hu@amlogic.com>
Subject: Re: [PATCH 1/6] dt-bindings: phy: Add Amlogic G12A USB2 PHY Bindings
Message-ID: <20191122225205.GA14311@bogus>
References: <1574405757-76184-1-git-send-email-hanjie.lin@amlogic.com>
 <1574405757-76184-2-git-send-email-hanjie.lin@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1574405757-76184-2-git-send-email-hanjie.lin@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 22 Nov 2019 14:55:52 +0800, Hanjie Lin wrote:
> Add the Amlogic A1 Family USB2 PHY Bindings
> 
> It supports Host mode only.
> 
> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
> ---
>  .../bindings/phy/amlogic,meson-a1-usb2-phy.yaml    | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
