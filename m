Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A8ECC3F68F
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 15:15:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 40A3320720
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 15:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578496520;
	bh=z+wACr8+bbobxkG990dwpnGEkG+ThcyJ7Ml1MVRgT84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=hoH9Gqy5TMt4GxHK/mqXJ5YTfWtpf2xwzx7XnIsH059gsnMPrexvnFSKSL4POEFSw
	 Il6oHAfJAXw10Z0YO7NBWI6b13VMuPllonW1K519ASzd45Pbnfk9qRui+1R4Qm6s4T
	 tEyhTshU2/Ko+yGPXW/MZ7mYNyIs2TeRMRnkTFmE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726556AbgAHPPT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 10:15:19 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:36371 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726651AbgAHPPT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 10:15:19 -0500
Received: by mail-oi1-f196.google.com with SMTP id c16so2915894oic.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 07:15:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9MKeoU4FP/L/hIFVTYWRTXWHyDcNCL5GfbSqC8Dc1Ew=;
        b=uKnLKwTnZoLM0f9U4I2ESsjCHdvYa0X8l9MeO5dy6BNxNmhZ1ORvmWFkz5Zr5dDB8+
         1AN7l6zJ7IZirbpu7JGm7xe4tBlkrpuI+xGT+r+dra8up6KN5OcGN9jQEdXYRbrdU1XN
         AlZRDPcTE/grNZIbm/yBpr0ABqS6WYHyCciK/lubmgxyT7KkIIuTo5nVt+7QK8vqO4uS
         oTnSoByxj2r8mKNdAP/nGs31IPpvF/uvvAB6uqbMmsOV0gSUAqmvSsZAdrYlgmLi0jX3
         W33NXWexh7HRqXAOSRss2ZiRaZs42w7xLPTQK8f3p9+WhNWCA8EI6TxrOqSNVWRMUqj0
         8p/A==
X-Gm-Message-State: APjAAAWSv7yQ5iaKq2kBYtVPsTFwrJWRwxqGj+D4NWTti3JqYnhW0uJy
        FWK8FQiGFpTnPa6X8RdNtaHhAB4=
X-Google-Smtp-Source: APXvYqwZq6Fe+Ym+f8ew+ic3Hs0wzKsgc4yp76SrmsOZ6HCDc6sXyVExqD+ALnad+GGY6BU/rmDJiQ==
X-Received: by 2002:aca:c68f:: with SMTP id w137mr3488409oif.179.1578496517706;
        Wed, 08 Jan 2020 07:15:17 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 101sm1193937otj.55.2020.01.08.07.15.15
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 07:15:16 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220333
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 09:15:15 -0600
Date:   Wed, 8 Jan 2020 09:15:15 -0600
From:   Rob Herring <robh@kernel.org>
To:     Ming-Fan Chen <ming-fan.chen@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Yong Wu <yong.wu@mediatek.com>,
        Evan Green <evgreen@chromium.org>,
        Joerg Roedel <jroedel@suse.de>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
Subject: Re: [PATCH v3 1/3] dt-bindings: mediatek: Add binding for MT6779 SMI
Message-ID: <20200108151515.GA18724@bogus>
References: <1578465691-30692-1-git-send-email-ming-fan.chen@mediatek.com>
 <1578465691-30692-3-git-send-email-ming-fan.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578465691-30692-3-git-send-email-ming-fan.chen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Jan 08, 2020 at 02:41:29PM +0800, Ming-Fan Chen wrote:
> This patch add description for MT6779 SMI.
> There are GALS in smi-larb but without clock of GALS alone.
> 
> changelog since v2:
> Add GALS for mt6779 in smi-common.txt
> 
> Signed-off-by: Ming-Fan Chen <ming-fan.chen@mediatek.com>
> ---
>  .../memory-controllers/mediatek,smi-common.txt     |    5 +++--
>  .../memory-controllers/mediatek,smi-larb.txt       |    3 ++-
>  2 files changed, 5 insertions(+), 3 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
