Return-Path: <SRS0=UIXH=76=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E88A3C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 20:46:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B8D74212CC
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 20:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592426777;
	bh=gjTsurEkod+60e2lodYczXDyG39zEfZ7V2B6mvdS7D8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Myxxum6FKzKZe2DHAfI545xe/QTXix4MSFeQgxwoGBn1uGQgwIpU6/zg36f4f7W91
	 RBjFle2hgZL/A6j+TFcSJP7Euu0SBA4LsxCNiZQ1Kws7/2XbM7d8kknxdodcIiA2v5
	 vXUwtvJaB5h4JNvsvdan8+tLYECnR1blrxW4JCeM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726835AbgFQUqR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 17 Jun 2020 16:46:17 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:42740 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726815AbgFQUqR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 17 Jun 2020 16:46:17 -0400
Received: by mail-il1-f194.google.com with SMTP id j19so3648840ilk.9
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2020 13:46:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JR8quGWzY9xRaXyxV+yyRtBWHKBAD2lN7RO7RyJOBMs=;
        b=DswQkeSwg8APr0fJehHK6l89GYz6dBDt++vTU8bo8BQmeli5TI0Upo3/oo7r5UhTXL
         xkCoIrhjUqoFGSGS2igo/XIMqOnoy4qd/EB9v1TmHU5z9eFXhzGVqULq/kULuM5w3Ppn
         ta0qeA2oUyXUMjOsDznJvODlF/6ThMzuR9vSNJEBls+iVT8BCVUGuppxLLX4ab37dc+X
         Pr4We9xOMKPljOkOPYH8ZIJiyv8UE7sDFEOeq2kHQsDJwAsakV48fmyU96ghv2doHhja
         Qj3S7jVMMqgzY6AoGCswb0HLEpiP5SrybnSyTdIsIWtQYINWpDwamVlXVpPTOXytRYXD
         1JXQ==
X-Gm-Message-State: AOAM531TrdpBh86qjhGVO28jPG78qSJcB7LRKhBUxs8A6L/yG93PcDca
        tZ6khy97vV9dDHgULu47dw==
X-Google-Smtp-Source: ABdhPJyy5flrnpymipR8LmT+l0YZjYwmY1OTZK4h5cn9bd4pNB/ZMPeF7Clv4AoYb4oFmvAo977NBA==
X-Received: by 2002:a05:6e02:ca:: with SMTP id r10mr721453ilq.274.1592426776123;
        Wed, 17 Jun 2020 13:46:16 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id n4sm549283ioc.8.2020.06.17.13.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 13:46:15 -0700 (PDT)
Received: (nullmailer pid 2773239 invoked by uid 1000);
        Wed, 17 Jun 2020 20:46:14 -0000
Date:   Wed, 17 Jun 2020 14:46:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     Li Jun <jun.li@nxp.com>
Cc:     devicetree@vger.kernel.org, shawnguo@kernel.org, linux-imx@nxp.com,
        robh+dt@kernel.org, festevam@gmail.com, kernel@pengutronix.de,
        kishon@ti.com, s.hauer@pengutronix.de, peter.chen@nxp.com
Subject: Re: [PATCH 1/2] dt-bindings: phy-imx8mq-usb: add compatible string
 for imx8mp usb phy
Message-ID: <20200617204614.GA2773053@bogus>
References: <1591621893-22363-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591621893-22363-1-git-send-email-jun.li@nxp.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 08 Jun 2020 21:11:32 +0800, Li Jun wrote:
> Add "fsl,imx8mp-usb-phy" compatible string for imx8mp usb phy, which is
> similar with imx8mq usb phy but with some different customizations.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> 

Acked-by: Rob Herring <robh@kernel.org>
