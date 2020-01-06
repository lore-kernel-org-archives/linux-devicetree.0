Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5544C33C8C
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 18:05:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B79C92072A
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 18:05:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LM3saJbh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgAFSFz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 13:05:55 -0500
Received: from mail-il1-f173.google.com ([209.85.166.173]:46180 "EHLO
        mail-il1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgAFSFy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 13:05:54 -0500
Received: by mail-il1-f173.google.com with SMTP id t17so43262335ilm.13
        for <devicetree@vger.kernel.org>; Mon, 06 Jan 2020 10:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=oMgY/4Zj2ZMKH4fOP631QHQbax0u8j2cAdva9Wh7vB4=;
        b=LM3saJbhvfalyxq1/tbruKHFUda406JcV4ciTLXCLrscnL7zdj3W8BYbCWPyb8kQEH
         bh4c4396yTx120YxPvO6F6OJs2u0Nnd+BvEeTf+/4r9GBl/esm3gRv7VUTpngWayc77r
         x5o3Y0SjdSypENmP+Jyk8Ue28fqbYL1zSVLW44H6kzK9yVYykVP5rClyZNuqtgRZG7jZ
         WvIwtEauCDaeA3DL3TZwnBe0ioKZcDjXkFYkEGewTnDv5bd+B6g+P+rurFUnH42G7DJM
         tYemzomiv9mPKcl48jk4b3VDYg+I7f9RJZwAnnFgs1PXZ62uOVx5AClmNjcR9qT5BWEN
         kBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=oMgY/4Zj2ZMKH4fOP631QHQbax0u8j2cAdva9Wh7vB4=;
        b=inCX58SEbCcgzf3iNRO8AEBwOT1VwEtp5vNN9AK7+3XHIS4/RHmf6aqvxkaGsvNtO6
         z91SjMLGElXYpKAdXCsDmIRJ5fbWFHoU06aHfB1Rr/TTivVsWL9/KxY7NAhgdQALSVzv
         ZBXE246V8QHDrPGga15AvtcSJDpp1fsRP8iqCovn+ataUJuy+aCjyr6CYp3SUe1d8aAE
         4+QNyVpFvvs5/jJQHFIRCOyJ1rfXIlGinkt1Cx5U0Z/TX+ksIk1prErKcGHRunxr3lSc
         NhITAJQQ4jKtqNaGeYUxMfrtb8KadOCsI/iWh8OZtSAtMJ2yTJMRB9862y91A9GD/RBQ
         +osw==
X-Gm-Message-State: APjAAAXlQoS4/9ELTqdwBMb2Puxfr5TeC7MIdB1Ngbmgfts7xf/jhQDF
        FgNf0Hm1w79ZvV28nMZFVETU+M1z9TlSb6i053FO+0V2xI0=
X-Google-Smtp-Source: APXvYqzilRhjsBsE/4L+L9Z1Vpq0WAyh/6fmUuRiciaCegmVR/HvHOTQJWVnsjoVn6UTB5E7XmKubatSwwt0Kn9lMy0=
X-Received: by 2002:a92:ca8b:: with SMTP id t11mr91772277ilo.227.1578333954194;
 Mon, 06 Jan 2020 10:05:54 -0800 (PST)
MIME-Version: 1.0
From:   Daniele Alessandrelli <daniele.alessandrelli@gmail.com>
Date:   Mon, 6 Jan 2020 18:05:43 +0000
Message-ID: <CAA2QUqKK+XcR5oqpZPrMNnQmgk=BV7s05UR7Efc2kCcYUs8=2w@mail.gmail.com>
Subject: [RFC] MAX_RESERVED_REGIONS hard-coded value
To:     Miles Chen <miles.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

I'm using a Device Tree with more then 32 reserved memory regions and
I'm seeing the following error while booting the Kernel:
[    0.000000] OF: reserved mem: not enough space all defined regions.

My understanding is that this is due to the hard-coded value of
MAX_RESERVED_REGIONS in drivers/of/of_reserved_mem.c

Googling around, I found this old discussion [1] in which Miles
suggests to add a CONFIG_MAX_OF_RESERVED_REGIONS kconfig option to
configure MAX_RESERVED_REGIONS. Rob replied to Miles' email saying
that he would prefer MAX_RESERVED_REGIONS to be dynamic. However,
later in the thread, it looks like making MAX_RESERVED_REGIONS dynamic
poses some implementation issues [2]. At that point the discussion
seemed to have stopped.

Is there any chance for the patch proposed by Miles to be reconsidered?

Regards,
Daniele

[1] https://lkml.org/lkml/2018/11/21/423
[2] https://lkml.org/lkml/2018/11/28/275
