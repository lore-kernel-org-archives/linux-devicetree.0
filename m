Return-Path: <SRS0=jmN2=2I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4141C43603
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 22:03:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BA4902146E
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 22:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576706615;
	bh=S7gPzhIEX3iN/y2TGhntaaTg3g5jxEpZTnj9EZA0suQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=bwszMgA94chETUPQaS7nwtichpYi4yggpl9smoZFik1+5WKrS8G70Rmirs90FUQY5
	 Knkqxgfjx909YzPAzuL1Oy0d49US+Wx/kz1B5RxqMeUqU6v5P+alAfybE1070heRmu
	 G+79TXD5hcU3BywPOvUdsxSwSzXDev0wbSm12uoA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbfLRWDf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 18 Dec 2019 17:03:35 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:35886 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726530AbfLRWDf (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 18 Dec 2019 17:03:35 -0500
Received: by mail-ot1-f67.google.com with SMTP id w1so4336805otg.3;
        Wed, 18 Dec 2019 14:03:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qCCYItpj+3VsG3DKSCp5gCe88YZojJMWbpQw+wbr1Yw=;
        b=m1a8r1P9BThRZjKdWvPmFtYMOgxuhDxP1KA0d2bmLS4Ib9GtiG5Tv4c7+MiXpCCXZ3
         CKfzgOM0l/y0IKz4qd9Ct/EPbZQTQSpk2hTYNLuQ09CZw+Keshol2EJcSbGFid5Ryt8w
         pwybKVRXz74Q92NZJRzZslM7K7kgDAeg5XlZBtews3oyVMevEEoYjT338eoGtE39J3X0
         oX/26QgrQdNWZ4zigIoh7vjGp1T5Thlrf5Hv5+Ag76iKWFn9vPxhsNLfFQQk8063qc4V
         4aSzr7WK8w4xXsM97IXGgqE0eCbOG/OhatxlDDj+xnECGucLhr5S+xZxZivFgE8E2e2N
         zgRA==
X-Gm-Message-State: APjAAAUpuWSee0jSk2SMwuh5N1xiXEpWLHeJZ8GAAb0KTxhYFTJqC4iz
        JpUmynJQpLeYfslHB1CU4Q==
X-Google-Smtp-Source: APXvYqwkQ1gEbk+bOgm2/fXfvDu4L5fE9n6LUxXNNWIUZdfBZtYFpFr/3T3xbcmVF7Tzj5vHc26FTg==
X-Received: by 2002:a05:6830:1499:: with SMTP id s25mr4838252otq.223.1576706614162;
        Wed, 18 Dec 2019 14:03:34 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m2sm1253207oim.13.2019.12.18.14.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 14:03:33 -0800 (PST)
Date:   Wed, 18 Dec 2019 16:03:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        linux-media@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 5/7] media: dt-bindings: rockchip: Document RK3399
 Video Decoder bindings
Message-ID: <20191218220332.GA3813@bogus>
References: <20191213125414.90725-1-boris.brezillon@collabora.com>
 <20191213125414.90725-6-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191213125414.90725-6-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 13 Dec 2019 13:54:12 +0100, Boris Brezillon wrote:
> Document the Rockchip RK3399 Video Decoder bindings.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Changes in v3:
> * Fix dtbs_check failures
> ---
>  .../bindings/media/rockchip,vdec.yaml         | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
