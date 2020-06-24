Return-Path: <SRS0=ldLf=AF=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75468C433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 24 Jun 2020 06:41:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5013820706
	for <linux-devicetree@archiver.kernel.org>; Wed, 24 Jun 2020 06:41:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F4Y63FKJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388668AbgFXGlt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 24 Jun 2020 02:41:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388262AbgFXGlt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 24 Jun 2020 02:41:49 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 107EFC061573
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2020 23:41:49 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id 17so1375036wmo.1
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2020 23:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=w1X7TJT+/NZGp2t1UBcnbW7TryORo1uDGLtiSLF2dX0=;
        b=F4Y63FKJ0cwNYtuBYuYFD1B6IQvmC0jQveupwHMhBrEzsAnXu0x/XQF0xp02M5Kb/R
         CAvgMujEExgWFUbK/o0mkv3Umjwp+GunX+r3ArbVP9whHFM6+F352dVdcqcGGFPD9W6x
         3zcNl8gc0XQ0obe0wywYkBtMgZlt+oDQ0PQkNzqHUby4hIXM4JkzWFINsYObXDlmblzH
         d1IlV+fJArOOwHCcrgSlePJru0KeizSTypNVzd5JZEMNmfbjlZWx6Dl8gRNLFq9HDc9I
         SlMcxJnFQvkiRKGOd/+G/3D3mNNXbUC96HfOk4HdarpWLIhRu4OTSIky/PO0jZxi7J+j
         dKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=w1X7TJT+/NZGp2t1UBcnbW7TryORo1uDGLtiSLF2dX0=;
        b=fbRKH61Dkk1tJReeXTmtSEG7BKrpbuBMJjW4JC1DBhRMSg359QdzA5FWW4R6D4c58I
         z48LJE+0H+bJGYdaCrjKw1sw6/8LwPOrIy+ST0Bmlox9RzfXYBCf8Oj9lkU2GloQLfor
         j44sxeBfMWRjHWdiWZLKTor9lPUvQlVziyhdxvDTErA10N9sj/iUwzZVBKojcmzDz6L2
         Dg97NXDKest5YiLl5xskBO6zZ47jXUeNsc6M56vioGNEQTzAS9aZwpsboyqS539AuWjW
         PNmvZGgQOrfFH3NknkLV1+QSPkgIhix5bx60YEo7HeUDjX3zbS1lDbrqY3TsqgRFC7MI
         eLUA==
X-Gm-Message-State: AOAM532vvpwcXGjPcuUrQCa3brEvcEinWiWfvYmw6ej525OuKG41TODU
        DQG7A5pR9ppsvmb030LYSIXoFzWYO5M=
X-Google-Smtp-Source: ABdhPJxxesv3DV42KX9DFPvWgoXognYEeA7BPVgHrFM5XpvKgLlqY6E6cmhuf8i1uDbBZ3dy3VUIng==
X-Received: by 2002:a1c:cc03:: with SMTP id h3mr27931892wmb.87.1592980907725;
        Tue, 23 Jun 2020 23:41:47 -0700 (PDT)
Received: from dell ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id b18sm25196379wrn.88.2020.06.23.23.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 23:41:46 -0700 (PDT)
Date:   Wed, 24 Jun 2020 07:41:45 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     andy.shevchenko@gmail.com, michael@walle.cc, robh+dt@kernel.org,
        broonie@kernel.org, devicetree@vger.kernel.org,
        linus.walleij@linaro.org, linux@roeck-us.net,
        andriy.shevchenko@linux.intel.com, robin.murphy@arm.com,
        gregkh@linuxfoundation.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] mfd: core: Make a best effort attempt to match
 devices with the correct of_nodes
Message-ID: <20200624064145.GC954398@dell>
References: <20200611191002.2256570-1-lee.jones@linaro.org>
 <30f03734-61fd-1b6b-bf11-21b6423a7c50@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30f03734-61fd-1b6b-bf11-21b6423a7c50@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 23 Jun 2020, Frank Rowand wrote:

> On 2020-06-11 14:10, Lee Jones wrote:
> > Currently, when a child platform device (sometimes referred to as a
> > sub-device) is registered via the Multi-Functional Device (MFD) API,
> > the framework attempts to match the newly registered platform device
> > with its associated Device Tree (OF) node.  Until now, the device has
> > been allocated the first node found with an identical OF compatible
> > string.  Unfortunately, if there are, say for example '3' devices
> > which are to be handled by the same driver and therefore have the same
> > compatible string, each of them will be allocated a pointer to the
> > *first* node.
> 
> As you mentioned elsewhere in this thread, this series "fixes" the
> problem related to the "stericsson,ab8500-pwm" compatible.
> 
> I know, I said I would drop discussion of that compatible, but bear
> with me for a second.  :-)
> 
> The "problem" is that the devices for multiple mfd child nodes with
> the same compatible value of "stericsson,ab8500-pwm" will all have
> a pointer to the first child node.  At the moment the same child
> of_node being used by more than one device does not cause any
> incorrect behavior.
> 
> Just in case the driver for "stericsson,ab8500-pwm" is modified
> in a way that the child of_node needs to be distinct for each
> device, and that changes gets back ported, it would be useful
> to have Fixes: tags for this patch series.
> 
> So, at your discretion (and I'll let you worry about the correct
> Fixes: tag format), this series fixes:
> 
> bad76991d7847b7877ae797cc79745d82ffd9120 mfd: Register ab8500 devices using the newly DT:ed MFD API

This patch isn't actually broken.

The issue is the DTB, which [0] addresses.

[0]
https://lkml.kernel.org/lkml/20200622083432.1491715-1-lee.jones@linaro.org/

> c94bb233a9fee3314dc5d9c7de9fa702e91283f2 mfd: Make MFD core code Device Tree and IRQ domain aware

It sounds reasonable to list this one, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
