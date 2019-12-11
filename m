Return-Path: <SRS0=G+GX=2B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87CC4C43603
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 16:59:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 59096222C4
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 16:59:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="jurDyqf3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730158AbfLKQ7Q (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Dec 2019 11:59:16 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38905 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729524AbfLKQ7Q (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Dec 2019 11:59:16 -0500
Received: by mail-lf1-f65.google.com with SMTP id r14so17276761lfm.5
        for <devicetree@vger.kernel.org>; Wed, 11 Dec 2019 08:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+OBvsbhhaV/Nkh0t6XL7r4WLvzMB1HQ/Vdl1HVxYR18=;
        b=jurDyqf3tIog/ejAUZaLycO34N8KiI4Awp+FQOlcOCL238YDJudC7F3OP9g6wE1QdC
         d1mDfawrQGCzvbehV5vFrb/I1d11Zg/1w3p1uQU617TDv5eKzPFYxCYvSaN0XIZ5Zyqj
         0IIf3LxAm+hHSX4rEfjyi6cOKJxW2jNpG5sC4/EXU0+PNGz5yz4ic1Gqm9E+21+I90/3
         cej9yMP3MKqaNbhaaNiQ5gOx3B5oZRzMYGzrIp61LTCeeqFzE6A3EVKLcbwTbLtDD2hr
         Afn657Ar+x3b9Lk1RXu0SRI86EhXErhv+uxnJ8j3PNqIamKAGtGDQ08tYsPCm4tcXeLQ
         hr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+OBvsbhhaV/Nkh0t6XL7r4WLvzMB1HQ/Vdl1HVxYR18=;
        b=iY/3uWX8NqImHykdZx/ittcGPUWY598jlqvoPJFyFRHKhC544vJmpNS5fjnOwwFeaP
         tPSH/eTU2qr5W4b3kusmnrpp8ue/T3fVllijcIHcizJZMyij55JJJdMDjD7DgV1BDkd4
         Zde5wUsah72EhlijgXMykQ4uLLBYfMT5XgiS2epp0y2SX9CAc9rlIXflSMdjMF4x5K64
         shPkXUmzF2gztpWpiLqUWAE/2UDmGdtv9t1KojisW+YlLuMAmQgJRIsQ2PeQ8FqqRqLV
         3DJgq342W8+nhSvJ13vDwq5J+dhrsNdvu9Ty/Zjr8ws4wuqgpoyOb/rpuRGyYcY9j8X6
         aU7A==
X-Gm-Message-State: APjAAAVhmh/yC5+KBWtWcKnLYmEDuU4inaADbIrXnzeMat1zxVkwrMqx
        na7obin2o+j6nLONAwKYv2efCQ==
X-Google-Smtp-Source: APXvYqyLrrNTZ+ZczBugvf7NBEXUx+ADh5x/GWtLiz70XCnE+brPzuR8g/rq/yJ2AZjQPtsI5l9Htg==
X-Received: by 2002:ac2:4553:: with SMTP id j19mr3042430lfm.142.1576083554279;
        Wed, 11 Dec 2019 08:59:14 -0800 (PST)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id m13sm1492536lfo.40.2019.12.11.08.59.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2019 08:59:13 -0800 (PST)
Date:   Wed, 11 Dec 2019 08:58:55 -0800
From:   Olof Johansson <olof@lixom.net>
To:     Andrew Murray <andrew.murray@arm.com>
Cc:     soc@kernel.org, Rob Herring <robh@kernel.org>,
        devicetree@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [GIT PULL] PCI: dt: Remove magic numbers for legacy PCI IRQ
 interrupts
Message-ID: <20191211165855.kfoz2x63kw3gnlmm@localhost>
References: <20191211161808.7566-1-andrew.murray@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191211161808.7566-1-andrew.murray@arm.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Dec 11, 2019 at 04:18:08PM +0000, Andrew Murray wrote:
> Hi Arnd,
> 
> Please consider this pull request.
> 
> The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:
> 
>   Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)
> 
> are available in the Git repository at:
> 
>   git://linux-arm.org/linux-am.git tags/pci-dt-intx-defines-5.5-rc1
> 
> for you to fetch changes up to d50e85b9ad3d4287ab3c5108b7b36ad4fd50e5b4:
> 
>   dt-bindings: PCI: Use IRQ flags for legacy PCI IRQ interrupts (2019-12-11 16:05:55 +0000)
> 
> ----------------------------------------------------------------
> PCI: dt: Remove magic numbers for legacy PCI IRQ interrupts
> 
> PCI devices can trigger interrupts via 4 physical/virtual lines known
> as INTA, INTB, INTC or INTD. Due to interrupt swizzling it is often
> required to describe the interrupt mapping in the device tree. Let's
> avoid the existing magic numbers and replace them with a #define to
> improve clarity.
> 
> This is based on v5.5-rc1. As this series covers multiple architectures
> and updates include/dt-bindings it was felt that it may be more
> convenient to merge in one go.

That's a pretty high-effort way of doing this, with potential for messy
conflicts.

The standard way of making sweeping changes across the tree is usually to
get the new interface/definition added in one release, and then moving
usage over through the various maintainers in the release after since
the define is then in the base tree for everybody. Would you mind using
the same approach here, please? Especially since this is mostly a cleanup.


Thanks,

-Olof
