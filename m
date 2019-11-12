Return-Path: <SRS0=p3dD=ZE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1AACC43331
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 19:28:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8865121925
	for <linux-devicetree@archiver.kernel.org>; Tue, 12 Nov 2019 19:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573586912;
	bh=5p8XaoqnDn3/iL5vGAHtPWuIHUH5n/w1YYsHYGnDe/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=tMLQ+uEynbCFcsiEtXhWbwG0z8I5pT4RcIFy7PIp5UmqZxW/Qo6bBayUeo6giUAWz
	 D0KG9iYgNDoQW3YDt/M6+vNM1pQIXLT0RCA+Xq+IGhB09IgoZ9SOEiLtd95YPy5ixD
	 HtEhBuG76wH95jrnX2YoiW6UtdEWNHR/JN0cul9o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbfKLT2c (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 12 Nov 2019 14:28:32 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:35199 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726718AbfKLT2b (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 12 Nov 2019 14:28:31 -0500
Received: by mail-oi1-f196.google.com with SMTP id n16so15934636oig.2;
        Tue, 12 Nov 2019 11:28:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1f1t/vx7cjzieQA+2HB6mtVDWaZlhCcx6hNFD68YUMg=;
        b=Yxs6MFSLpJl6axfGYa0cnwQgyr+jRb4IPt0DQjwcXVDGthrxCeW4CS+6WFzerlJzDW
         D6Qr2t64lCRWBST54K7LaePANpRLrNua1S99RnB/mgzdwZZmYwYJymV46z1L7k7cnXij
         VgB0ZOkAan+olyL1QjyA7eaeoMmKluvPgTapaVNExhRaopGUeJIB3Cq9KmQPIFJCMbae
         NpK8czZhpt0MEM1x73xeqYiX3NHqzSbc1TzY/ZZKSqpgFrL9jRiFAOQRle+0eEKwML18
         vSks4NoNkY+WRPQDyxLV6bENNrO++GcYgnvj1Gx9RrZi0sK3yVIt42TGhRpsZ+ymU1As
         P1MQ==
X-Gm-Message-State: APjAAAWJTnJD29pmLgD3+zwNqIPlQmyjrnjfS9V1GztRIKwhPah7eOYC
        UsGPAo0JUdocqX/jH7P2HA==
X-Google-Smtp-Source: APXvYqzGgQOQC2/469EBUJJsFsEKSD9Q14S9vX3Bn2KAqFS+UEKvvAoHAngSDKJXbrXmpNbXhc15CQ==
X-Received: by 2002:a05:6808:8d3:: with SMTP id k19mr466822oij.171.1573586909412;
        Tue, 12 Nov 2019 11:28:29 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t2sm5366972otm.75.2019.11.12.11.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 11:28:28 -0800 (PST)
Date:   Tue, 12 Nov 2019 13:28:28 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stefan Wahren <wahrenst@gmx.net>
Cc:     Matthias Brugger <matthias.bgg@kernel.org>,
        Matthias Brugger <mbrugger@suse.com>,
        "David S . Miller" <davem@davemloft.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Eric Anholt <eric@anholt.net>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Doug Berger <opendmb@gmail.com>, netdev@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH V5 net-next 3/7] dt-bindings: net: bcmgenet: Add BCM2711
 support
Message-ID: <20191112192828.GA21918@bogus>
References: <1573501766-21154-1-git-send-email-wahrenst@gmx.net>
 <1573501766-21154-4-git-send-email-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573501766-21154-4-git-send-email-wahrenst@gmx.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 11 Nov 2019 20:49:22 +0100, Stefan Wahren wrote:
> 
> The BCM2711 has some modifications to the GENET v5. So add this SoC
> specific compatible.
> 
> Suggested-by: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  Documentation/devicetree/bindings/net/brcm,bcmgenet.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
