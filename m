Return-Path: <SRS0=G+GX=2B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7350BC43603
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 13:31:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 446D8208C3
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 13:31:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ShiOcGG9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729238AbfLKNbI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Dec 2019 08:31:08 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46974 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727477AbfLKNbI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Dec 2019 08:31:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576071066;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TV5FAi/Fe1/Rw5238yLkedzxccC6tTFgA5QXvsNOUGA=;
        b=ShiOcGG9yTdsBUieHuHbot6Lj2gLxXolUxLqvH61MiSlzU9UqZE8qzpSYGXjdjtdFtWwGV
        C/4ep0I/QbUW/nIY95IosFtcXZbTGP0k8FeRTVJBFjDLsgCTxou/EWFiTTtBw27gfOefpD
        Ybu9elizxWLUw0lgd6ciXVkZ52uZZ4Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-45__7iX2NVaFNRqZmuGApQ-1; Wed, 11 Dec 2019 08:31:05 -0500
Received: by mail-wr1-f69.google.com with SMTP id v17so10423505wrm.17
        for <devicetree@vger.kernel.org>; Wed, 11 Dec 2019 05:31:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TV5FAi/Fe1/Rw5238yLkedzxccC6tTFgA5QXvsNOUGA=;
        b=q5E+Qu3XQup5CWq/KgmjrqJjLwPQIdyBdvDpbMibeZmmwMsVLfJTceWHjyQc29pRuI
         CjedMGJRbJFie9iznpz8CBWQvjv0c4nkL25HY3JSEvXZ4bzYolXGVQF5zKBAhscDUcF0
         RKANMnBrXkifP1w41ZaZaIOfAuxgWlcUewXvzgjqRCdm9mGMFqWt8bHps1O4UN86R5h1
         JxT2+8hfWXYr97CKaBy3OcuhTJzuXf16DwipUdI6cmB0Oo/WVls6go/CbqdAI8fAOFuY
         7Q9YtE8wirofysgp8hK3YOSNwv4gh9SNaYWSvHdBF0SU4Ut+vCE/gSY8mKWq50/bywyw
         QQ0Q==
X-Gm-Message-State: APjAAAXKFEZJIAGpZaqDnu3she4inIE8QCygbbb2GhQQjO1JtCcCeIW8
        7cTHjXEU7oVyofKaiezopHcMlnT6mYecmHzbDyeEcdBor3MNwzLgvnG8qsjsR1w4e/sC/gndAW6
        2UabPZ+1H+gCXa/SUeH1Dgw==
X-Received: by 2002:a1c:5451:: with SMTP id p17mr3617119wmi.57.1576071064469;
        Wed, 11 Dec 2019 05:31:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqymrCgLwNxNOpQF3dxf3OYmi9fdNcxPA2z09i7pimQR443NM/SqTB9zsjyB+GkU7qbeqV3iXA==
X-Received: by 2002:a1c:5451:: with SMTP id p17mr3617098wmi.57.1576071064298;
        Wed, 11 Dec 2019 05:31:04 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
        by smtp.gmail.com with ESMTPSA id i5sm2281274wml.31.2019.12.11.05.31.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 05:31:03 -0800 (PST)
Subject: Re: [PATCH 0/8] ata: ahci_brcm: Fixes and new device support
To:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     bcm-kernel-feedback-list@broadcom.com,
        Jens Axboe <axboe@kernel.dk>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Tejun Heo <tj@kernel.org>, Jaedon Shin <jaedon.shin@gmail.com>,
        "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" 
        <linux-ide@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <20191210185351.14825-1-f.fainelli@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b65b61a6-3cc7-1e9b-9fa7-83f314e9bbf2@redhat.com>
Date:   Wed, 11 Dec 2019 14:31:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191210185351.14825-1-f.fainelli@gmail.com>
Content-Language: en-US
X-MC-Unique: 45__7iX2NVaFNRqZmuGApQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On 10-12-2019 19:53, Florian Fainelli wrote:
> Hi Jens,
> 
> The first 4 patches are fixes and should ideally be queued up/picked up
> by stable. The last 4 patches add support for BCM7216 which is one of
> our latest devices supported by this driver.
> 
> Patch #2 does a few things, but it was pretty badly broken before and it
> is hard not to fix all call sites (probe, suspend, resume) in one shot.
> 
> Please let me know if you have any comments.
> 
> Thanks!

The entire series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> 
> Florian Fainelli (8):
>    ata: libahci_platform: Export again ahci_platform_<en/dis>able_phys()
>    ata: ahci_brcm: Fix AHCI resources management
>    ata: ahci_brcm: BCM7425 AHCI requires AHCI_HFLAG_DELAY_ENGINE
>    ata: ahci_brcm: Add missing clock management during recovery
>    ata: ahci_brcm: Manage reset line during suspend/resume
>    ata: ahci_brcm: Add a shutdown callback
>    dt-bindings: ata: Document BCM7216 AHCI controller compatible
>    ata: ahci_brcm: Support BCM7216 reset controller name
> 
>   .../bindings/ata/brcm,sata-brcm.txt           |   7 +
>   drivers/ata/ahci_brcm.c                       | 167 ++++++++++++++----
>   drivers/ata/libahci_platform.c                |   6 +-
>   include/linux/ahci_platform.h                 |   2 +
>   4 files changed, 141 insertions(+), 41 deletions(-)
> 

