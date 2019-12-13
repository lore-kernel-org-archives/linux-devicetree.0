Return-Path: <SRS0=VR/D=2D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 670FAC43603
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 21:40:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0896E214AF
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Dec 2019 21:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576273238;
	bh=LU4lqeBvEFGMdWLDjrG05L1FkzIbXvHxtDYeVFSuxTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=B9ntsSx8JQ16+3xW3VFGLxK96+liMrK84IFkIyZ7JT5Qk6lRMDEjqPHwt4b0CXGW3
	 q6kCFPe4Ss6GvqnACnkctvtxKqraVOK3xJSqNIMxA/V5vRPyKEnYbP+xkhMsBp/ncH
	 N4giJzonFRpe1JsbExP13gm6IegXEEh6Q0DsdKH0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbfLMVkh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Dec 2019 16:40:37 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:45016 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbfLMVkh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Dec 2019 16:40:37 -0500
Received: by mail-ot1-f67.google.com with SMTP id x3so707251oto.11;
        Fri, 13 Dec 2019 13:40:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:content-language
         :user-agent;
        bh=62qgAxqDUF0J8N6PNN7vUr5KHVDudRPB+CJm3n4qias=;
        b=XGnfHc/zkJgPXuzd2oexlk9wZD6uF1uDvJz1XVDW3DYYEsRC45GRZ7TrDH2sxVUlM+
         wt3D9xJO3NjZWymDW1eQy6NL2nH2SDsB/vqt3nsHvW7uV8VFSFuCAPdikXZeE2XaDJpL
         afCnqwQyG0cqf3kNlUO6TNuQSskd48eMHKjgj/2xtuqre5Hk2IT1pJ37N65gO/Ad7dLT
         rdeXT9iTVQjwmF+qYp1LR9N8UnAyDeqlECnFzT6B+Ofhb+2JCAv3sonRK/hryFGA68tx
         egyKNSll+Z03s0czfEp/Hr+AhlUPiapQ38YFqJ7dXXWbtmhMmNAR3uKRUEc+qtGnq8UG
         falw==
X-Gm-Message-State: APjAAAUd6Rex2W5X8naoqMSlk4wSjLr+qTtxaAzL8PEoVdoDIEGh6rH4
        ccvyQUgIDdg36UbNRKGSXw==
X-Google-Smtp-Source: APXvYqw2+Nhmt7AaP30iwDCboHyUDibJoBCVQEjBMF69q2XL2GMax5TPG99Ey9Zj55y2AGvkM6GpFQ==
X-Received: by 2002:a05:6830:1e2d:: with SMTP id t13mr17404914otr.128.1576273236647;
        Fri, 13 Dec 2019 13:40:36 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a16sm3804534otd.64.2019.12.13.13.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 13:40:35 -0800 (PST)
Date:   Fri, 13 Dec 2019 15:40:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marco Antonio Franchi <marco.franchi@nxp.com>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "marcofrk@gmail.com" <marcofrk@gmail.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "atv@google.com" <atv@google.com>,
        Marco Antonio Franchi <marco.franchi@nxp.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: Add Google Coral Edge TPU entry
Message-ID: <20191213214035.GA7467@bogus>
References: <20191128194815.26642-1-marco.franchi@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191128194815.26642-1-marco.franchi@nxp.com>
Content-Language: en-US
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 28 Nov 2019 19:48:31 +0000, Marco Antonio Franchi wrote:
> 
> Add Google Coral Edge TPU, named as imx8mq-phanbell, to the
> imx8mq supported devices.
> 
> Signed-off-by: Marco Franchi <marco.franchi@nxp.com>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v3:
> - none
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
