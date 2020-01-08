Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3CBFC282DD
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 16:58:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C7D4A2072A
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 16:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578502728;
	bh=ev4OtAv5m7KBEoeVj5ulwIojbIh9mARQUXB6SdZeY1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=RaR2dkmWONbCjd1iY40jKNIS+BTWUAMf80esuqNEnh2DL63lNYZWTyRLNm3BXFn8i
	 PoJlkhrrtwogAH6HAGiAT8kJguQ3iPq7xBBM96of3oYvdvrG1ok9+U9D/wLojB+1ax
	 KtBpdSANVBvZbOOj44PfxikwkzSESVNfX6C2U/w8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729617AbgAHQ6s (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 11:58:48 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37769 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727308AbgAHQ6r (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 11:58:47 -0500
Received: by mail-ot1-f68.google.com with SMTP id k14so4250185otn.4
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 08:58:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TEWqrKckxXi7QmpFNDQI2lr/8vlOr4RUJSG6WcBUQm8=;
        b=SBwl5C3QjpMxDgPbYsI0sLmd1WAhC3TQNtqtutPfZEyJ6kG2eoCJJiBY1NI5BSu88H
         CMWdFmtq7X/mLhM1LDcCvDlvAcAPZ553GCDLa5ADqLROcJfl5sSYufQm31oAaAZfZYEC
         Z5njE6u5cJlJQi3v768IXZkFpM1BCeE/2mB7TgzP0hFthDuJRyxl73s9o5I+EgoHl+HL
         b5j4a4b5UEekcJcoiondK5H4MK3pCTMQQxRcNtANv7tOrjxL03nl9OpPHwp85fRrQVIR
         t5Wu6u0xk17X6Q8wsoO2eO3jt0P2fq9VzdGggo45jddthIiDXKtA6EaH7BqYU77cx3na
         a2ow==
X-Gm-Message-State: APjAAAW1JfC8ZivoB9TWMDQ9w5bqLIByDRYJQkS9/ZCBoCGlIpCGeRi1
        oGkWOaf5Jkvs6JzhX9LcrJ7lia0=
X-Google-Smtp-Source: APXvYqwm8bdJmRRL11nwJ6OrZUNHsNaQvAnVAWIj9h9pR7S9T3nMSYD1uhfYIPOUj9SOiqJkFkMZNw==
X-Received: by 2002:a9d:784b:: with SMTP id c11mr4669218otm.246.1578502726884;
        Wed, 08 Jan 2020 08:58:46 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p83sm1234718oia.51.2020.01.08.08.58.45
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 08:58:46 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220333
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 10:58:45 -0600
Date:   Wed, 8 Jan 2020 10:58:45 -0600
From:   Rob Herring <robh@kernel.org>
To:     Fabien Parent <fparent@baylibre.com>
Cc:     iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, joro@8bytes.org,
        robh+dt@kernel.org, mark.rutland@arm.com, matthias.bgg@gmail.com,
        Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: iommu: Add binding for MediaTek MT8167
 IOMMU
Message-ID: <20200108165845.GA8360@bogus>
References: <20200103162632.109553-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200103162632.109553-1-fparent@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri,  3 Jan 2020 17:26:31 +0100, Fabien Parent wrote:
> This commit adds IOMMU binding documentation for the MT8167 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/iommu/mediatek,iommu.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
