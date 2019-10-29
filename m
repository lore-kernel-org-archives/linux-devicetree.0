Return-Path: <SRS0=TSDT=YW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC499CA9EAE
	for <linux-devicetree@archiver.kernel.org>; Tue, 29 Oct 2019 15:28:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF3522087F
	for <linux-devicetree@archiver.kernel.org>; Tue, 29 Oct 2019 15:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572362893;
	bh=5861sn5IwTbjJ499+Fmxn6CIGQZ77hkKzCyZk2RCsy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Iri9fK4vWvwTnIUY1pCOHCSrvyyXr5XTNY9IIcv9GgzA3xB4zx1qrFkvdBG4kdH08
	 lN5AHDo3GlrTYfNGXBdZs5/HaEjsOUmtE3HfI++E8WRxdVIgFVcCgoE1MgiZOe9K+g
	 ZXj7g3fuqSzrQEyKfeLqwyDVBbK1QmNUbXGXyej4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390033AbfJ2P2N (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 29 Oct 2019 11:28:13 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:35216 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390027AbfJ2P2M (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 29 Oct 2019 11:28:12 -0400
Received: by mail-oi1-f194.google.com with SMTP id n16so6997764oig.2;
        Tue, 29 Oct 2019 08:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7+lSX9rGuethOBMhP54PVdLPKRXbrDChQjUhpYAoRrk=;
        b=L0EGE7gwIjOpYoxNx/Aj3yfOZ0CmJTg3gyV3iuIZyyn+7YoshioniyygeNg4abvINs
         +bGnzU9NjCRamn7LagnmNOn2HdQiHfbX+zq5uMmdGPoCR9W7i4j8ooKoeZ5+MWfkJud2
         Kbwu/sr8nO9rc2wOJ312SGYGB3kHds/drs0ao+/hrt8zGxEbxHdBIsLIB693GZqt/5gI
         sje7LpcNBcA+42BB148MWVBIyKnNOJMPraO30gGPSBJ0WOSGk79bWrqLKxJolh4x6tMk
         oJUXsjwxobTv618QjoCbsaG8aQ1pfvJt/D7gECBmLdkj0K6UWIDvrqv/SIGBp+Yq8+Hd
         UJ6g==
X-Gm-Message-State: APjAAAX04k5CWkxmquvkk4ZYkrGymeeXmTsWFn5Eq9gfGY/iyj58hfIY
        nPjgOtMsR8J3iVRmBJ3l2w==
X-Google-Smtp-Source: APXvYqz4gVrjCheiBZWYt4V73gfeXWOkVCTqZRS9xkcWi5yng+jnjQx6eiARsy0dT3T32JZ//wuxgg==
X-Received: by 2002:aca:4f4f:: with SMTP id d76mr4638649oib.167.1572362891837;
        Tue, 29 Oct 2019 08:28:11 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z1sm3037006oih.14.2019.10.29.08.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 08:28:10 -0700 (PDT)
Date:   Tue, 29 Oct 2019 10:28:09 -0500
From:   Rob Herring <robh@kernel.org>
To:     kholk11@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ccross@android.com, mark.rutland@arm.com, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org, marijns95@gmail.com,
        kholk11@gmail.com
Subject: Re: [PATCH 1/5] dt-bindings: iio: spmi-vadc: Add definitions for USB
 DP/DM VADCs
Message-ID: <20191029152809.GA17307@bogus>
References: <20191020150746.64114-1-kholk11@gmail.com>
 <20191020150746.64114-2-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191020150746.64114-2-kholk11@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, 20 Oct 2019 17:07:42 +0200, kholk11@gmail.com wrote:
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> Some PMICs, like PMI8950, feature two ADCs, at 0x43 and 0x44,
> respectively used for USB D+ and USB D- (DP/DM): add the definition
> for them as VADC_USB_DP and VADC_USB_DM.
> 
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  include/dt-bindings/iio/qcom,spmi-vadc.h | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
