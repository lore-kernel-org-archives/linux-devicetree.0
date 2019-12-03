Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB10C432C0
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 19:34:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A3B4F20833
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 19:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575401680;
	bh=+Hji/6/WiVpUux/L+Wkit8NwcRHUKavegTY6PbjFD2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=wr64lg5Ogy6Ez+Q2MBgjjfGYtrSasTLnxJ9icbReQy32+RgF/9C4+d+k+LpNNRuug
	 XqgTm6g3DLbcC8r/1J1MwRhEsGl5qxxF8wCyrZiIJACxuQHrkDOOtozJKuzmEzvqhQ
	 SDBQcGD2mRc7gnR5lqQY7IC730UBSAeWQxNVYk+s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727490AbfLCTej (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Dec 2019 14:34:39 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:37370 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727425AbfLCTej (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Dec 2019 14:34:39 -0500
Received: by mail-oi1-f194.google.com with SMTP id x195so4454638oix.4
        for <devicetree@vger.kernel.org>; Tue, 03 Dec 2019 11:34:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RPx8goVPcVf7/s7EDaX8y+XJlx40iJMswwfANpI8OTw=;
        b=AF2rxg4fpexic2bTLGuxkqhAmG+PwBsqhcOZOJEJlrNxtDBob/fvYwjKXdiHyM9GNL
         jEMC/BznUNeFB2Ao8GHvg+svWFMP3Nz0KXVRr28aIzzCJlglyJoG9gU3L01HgtDfOLVf
         Qs+/6sKRmk3qdAtwJrEo/MIyYr5+Owj7oGVSQ1xZvZnryXu15YlZUeEJOLfhhBs8PB6W
         Qr40sOmYn0r7J+lvhSSZvAMMmIrQeiNob4py3U8CXOGws6SVw+LYt8hi9NM61tEg3qFP
         RYSjMquK0yoj5OMD19MqH3FzU7bvEdbGDnLwl4tPf+62hCB62p8eFh8MPwLngy9I1Uip
         a45Q==
X-Gm-Message-State: APjAAAW7bce9tw6Iq2YBrd1vjPrfM4T7dCSsFvcAeJVxW9W98Bg2sLCo
        Ffjw62OqP6h3owTtmjaFXA==
X-Google-Smtp-Source: APXvYqx+lgHWPFVIFWdl2P9WKFGTd/EhevcQ2hnbWcCthYYFAcdQv3VtxYEdliyhYyn9H99FQpnjXA==
X-Received: by 2002:aca:75d0:: with SMTP id q199mr5251962oic.121.1575401678574;
        Tue, 03 Dec 2019 11:34:38 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p189sm1449175oih.54.2019.12.03.11.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 11:34:38 -0800 (PST)
Date:   Tue, 3 Dec 2019 13:34:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dongas86@gmail.com, kernel@pengutronix.de, shawnguo@kernel.org,
        robh+dt@kernel.org, linux-imx@nxp.com,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: Re: [PATCH 1/3] dt-bindings: mmc: fsl-imx-esdhc: add imx8qm
 compatible string
Message-ID: <20191203193437.GA9654@bogus>
References: <1573995530-14573-1-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573995530-14573-1-git-send-email-aisheng.dong@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, 17 Nov 2019 20:58:48 +0800, Dong Aisheng wrote:
> Add imx8qm compatible string.
> 
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
>  Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
