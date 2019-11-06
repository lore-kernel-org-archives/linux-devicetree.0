Return-Path: <SRS0=r6ca=Y6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E51FC6194
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 Nov 2019 23:43:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D098D2178F
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 Nov 2019 23:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573083806;
	bh=xmUf5TTGIZHKhZY1L6EJt9efx0s06xdFPP4fRLBryho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=CxwWoBORBJEDdBkZQ4C5vK34lCvXLZ4lkd2qF65Z/1G0yZVnMG3plessinmwK1gPD
	 txByBE5YuP0J3iNcjoIEk9nvSTDKXSH7T8fFj6OxjHy0vt4VZB9qi0rRtn6H/F1pz7
	 lPsTxpa0wm9/wOwF0QM6ytKpDn0atHHvEeM3RLFM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732816AbfKFXn0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 Nov 2019 18:43:26 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:34091 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732713AbfKFXn0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 Nov 2019 18:43:26 -0500
Received: by mail-ot1-f66.google.com with SMTP id t4so398554otr.1
        for <devicetree@vger.kernel.org>; Wed, 06 Nov 2019 15:43:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/ePVqLiMv/XLhWqb7uFyuQxMQJJ8bYGV+ezhzmk6w14=;
        b=Sq980tga25O1Gdy05a7i6GniY3KjNpXDt70rB1E9YGuE/8TTXXUxv2fvwDLqkIr4pI
         EiGb9mUmqm8ybDXv/Q2tVFfR+hYAxS7IVPosOM3ONQohJyuV41nT2De0SIR4mGBy5m8m
         oJS1wFpu9+aR/A7fjCgAyzIpMC+SC7rBcNkM4KumaSrNp6CKQmgee/ZVaxxJ0qJ9/pKA
         OoaQJjPkMU6cYP9nwVOsEhuplub3ucJsAxGoAkK95+ZiohWhiKhjOyn+jFLGX7Jzus/G
         lv0MPcnJmoa43/vEuKttaEhq+7M6yoOcMleJmuS1ykl+NOTekhOiETA4SKC7nSJIKSig
         BvjQ==
X-Gm-Message-State: APjAAAVfl7hF/s5xMHhZScpYLOw2akTA5zFAe51ygdJccnpsC5Q6eQf3
        RkktrgDOX47qGwVUgK5aNXEm1lc=
X-Google-Smtp-Source: APXvYqzZuDk0stZnqZ5y78l6lFdAiraLSYQ4UjixO2XmqpK5SHQBPOjg3yVK1lC5f5j4/VL0j59Suw==
X-Received: by 2002:a9d:6d0a:: with SMTP id o10mr325988otp.35.1573083803862;
        Wed, 06 Nov 2019 15:43:23 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f9sm149436otq.52.2019.11.06.15.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 15:43:23 -0800 (PST)
Date:   Wed, 6 Nov 2019 17:43:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     Andrew Murray <andrew.murray@arm.com>
Cc:     Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/7] PCI: dt: Add legacy PCI IRQ defines
Message-ID: <20191106234322.GA23508@bogus>
References: <20191104163834.8932-1-andrew.murray@arm.com>
 <20191104163834.8932-2-andrew.murray@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104163834.8932-2-andrew.murray@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon,  4 Nov 2019 16:38:15 +0000, Andrew Murray wrote:
> PCI devices can trigger interrupts via 4 physical/virtual lines known
> as INTA, INTB, INTC or INTD. Due to interrupt swizzling it is often
> required to describe the interrupt mapping in the device tree. Let's
> add a define for each type to improve device tree clarity.
> 
> Signed-off-by: Andrew Murray <andrew.murray@arm.com>
> ---
>  include/dt-bindings/interrupt-controller/irq.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
