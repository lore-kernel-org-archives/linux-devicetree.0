Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B11CC33CB1
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 14:52:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C77F52084D
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 14:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579099926;
	bh=Yde4qFdoldMm3hzDpS+nZtrVyQWWEnZHNMPGJPZso/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=qaIpmbBGzGv+3vWFu7VuKzYQj6LifWpRafOPvmQDGlOzjGybW3SIVIFL7RtT13zz4
	 gNXtSB5dz5HItzJzPLgyD8O6xQI/NjxMtpCWXsdCMRmNzKtZyMHCDzkNuxxgxlW9Ij
	 //MLPXubkbkJOSGmnquzNYRfyuHQsGknPy7xZQsk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgAOOwG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 09:52:06 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46571 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbgAOOwG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jan 2020 09:52:06 -0500
Received: by mail-oi1-f195.google.com with SMTP id 13so15565448oij.13
        for <devicetree@vger.kernel.org>; Wed, 15 Jan 2020 06:52:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=n8ZOYkpIoAOQdlGT8sz2BDJ8ZlJ/E1aAe+yKBj0gCtM=;
        b=gRMCaosCpVz8an1uDcr/IqxaWzACax/c+dex1c3d8pk4STlr9AYcgfBpjw7un9nTLK
         BYYCNtkQfRqexJcKLsxp5ypYmOEBJZuyvqDNOR0fujgeM0zfhzhhlbtnio5JEk/+BzpV
         /CdzhY+4EcPCDb9bVjYpQFjMP96wjOAyXugBbrKt34PngWbdhqYCK9OZ8gYzDIyP3E4i
         OpSJvtO7lWQSjxos5l7Wh0evYmnnuMhl7ImJX5X/DY0N1ash1lgAeFdYgeBo/KL1VZyd
         TGCHB5xoWFBECflqC2+OxVlmdw22vnVv3goI/CXNAxSOjP4O8HXNJnZDbquCKYKfjIAZ
         BJ1w==
X-Gm-Message-State: APjAAAUiZyPAB8YTdVNc52I6h3pul+3KSJFfNHcbNjI/3KXcjAi2garI
        bB+0UB44v9Wa1dkKLo55kzdqUOM=
X-Google-Smtp-Source: APXvYqyFEY5vf+BbjDpHrW1wO2AasccytoSltczrWImdsv3gq+wHxvzNuB1Avo/iIVL1N1kLwPOr2g==
X-Received: by 2002:aca:503:: with SMTP id 3mr118623oif.24.1579099924537;
        Wed, 15 Jan 2020 06:52:04 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 26sm5810527oij.9.2020.01.15.06.52.03
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 06:52:03 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220379
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 15 Jan 2020 08:52:02 -0600
Date:   Wed, 15 Jan 2020 08:52:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Hsin-Yi Wang <hsinyi@chromium.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Nicolas Boichat <drinkcat@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm64: dts: mediatek: Add mt8173 elm
 and hana
Message-ID: <20200115145202.GA27021@bogus>
References: <20200110073730.213789-1-hsinyi@chromium.org>
 <20200110073730.213789-2-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200110073730.213789-2-hsinyi@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, 10 Jan 2020 15:37:29 +0800, Hsin-Yi Wang wrote:
> Elm is Acer Chromebook R13. Hana is Lenovo Chromebook. Both uses mt8173
> SoC.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> Changes in v2:
> - fix dtbs_check errors, use const instead of enum
> ---
>  .../devicetree/bindings/arm/mediatek.yaml     | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
