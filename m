Return-Path: <SRS0=wnEW=6Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 789FDC47255
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 21:36:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BE3D206D9
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 21:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589232970;
	bh=C5qvE3kgt/mT1IpKt6MxV+u1Rrra7P91vAU/+cbudBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=x1x3bX6NfzSVnIMQKZBDEF/Guc0lRcIpZIdD6yyCMlcxtK3uLoKIeUuNNbXDU8+wo
	 UGz7I3LBWMbMnl66/N2xOumpAafWQR+Ha/2owcrtzcEQlMzKoXYCzp8f5UmuijboM6
	 KDmdd1C5Dht9pj8/MroF0JAg0Zkq18cLlw8BVT8A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgEKVgK (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 May 2020 17:36:10 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:39822 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726033AbgEKVgJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 11 May 2020 17:36:09 -0400
Received: by mail-oi1-f194.google.com with SMTP id b18so16449101oic.6;
        Mon, 11 May 2020 14:36:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FjgEarEiw8gpO2P3GZKZGo+NkDIbuBcwR3XmcT/vJlk=;
        b=h7JJI4o8NGt17jIa461sTF3Fj4DESPITolNAOjGbs6TjlQ6Qu8eHPfhhaRvxFSiW5I
         DKe8AfWTcVnKwvh+K0B/mrbgfX0MEpx9MMDhBv8gNCexQc1fp4swHonhWCkGfYgtv9rH
         jFHvLwwXDgvQ9TSHX624tU/ruQuoFbjlMHV5sLe30sv6rJDA1l1H1F1KYM0nH6PD1uJI
         bSPtF1PDlpc3Lux8mq+/BryZWBF/0XIXWCcKl/Zg+Xb3DVa07Sl3+elZSRKyQQk16Gdv
         dXbNI09xlnmjrBvLpRz7pSKiQPFiEo1TU7NrGBJcV8KJJIne33fDRo4Hb7jSzJJIY+yu
         4IXw==
X-Gm-Message-State: AGi0PuaNJSHkT6klxYTAWEfgeUhYnNLBSXvk90jfQ5m0Ke3PeTF26nt0
        J3YGYZ+qivFOGDap6VmUHQ==
X-Google-Smtp-Source: APiQypJVxHvagye2SWlcA4PbLnWPYs5aNGR2f4pg1Hg11puPuSBuWPVLc2xQed2Ra6zvS+x6U10Cgg==
X-Received: by 2002:aca:b6c2:: with SMTP id g185mr21124643oif.156.1589232967266;
        Mon, 11 May 2020 14:36:07 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r21sm2935693otg.67.2020.05.11.14.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 14:36:06 -0700 (PDT)
Received: (nullmailer pid 20619 invoked by uid 1000);
        Mon, 11 May 2020 21:36:05 -0000
Date:   Mon, 11 May 2020 16:36:05 -0500
From:   Rob Herring <robh@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     heiko@sntech.de, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] include: dt-bindings: rockchip: mark RK_GPIO defines as
 deprecated
Message-ID: <20200511213605.GA14679@bogus>
References: <20200424151105.18736-1-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200424151105.18736-1-jbx6244@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Apr 24, 2020 at 05:11:05PM +0200, Johan Jonker wrote:
> The defines RK_GPIO0, RK_GPIO1, RK_GPIO2, RK_GPIO3,
> RK_GPIO4 and RK_GPIO6 are no longer used. Mark them as
> "deprecated" to prevent that someone start using them again.

What changed exactly? The binding changed, or just using raw 0-6 instead 
of the defines? 

If there's not anything using these in tree, just delete them.

It is still used in the binding doc.

Rob
