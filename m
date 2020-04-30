Return-Path: <SRS0=mzwU=6O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0273C47257
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Apr 2020 20:45:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ABFDE207DD
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Apr 2020 20:45:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="BByDysgP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726616AbgD3UpI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Apr 2020 16:45:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726548AbgD3UpH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 30 Apr 2020 16:45:07 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 675C5C035495
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2020 13:45:07 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id d25so2382032lfi.11
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2020 13:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=BmSBD7h3njitpLi5QsmTDnHJWiGkucDb02pMa3UrBRI=;
        b=BByDysgPi+X1do2xqrwAOLh0HEdR2agc0tWWki02+6dJfEOyJdv7UB5MrlBL/7Ixey
         NfLIPqu1ByMfCl6/2xN9VH0fkOplnQDTYEpGsU7Tu+L+W+EDW1K80ELxTMUUKMOLxD99
         GM1eUFRgDXM1iEyyoqyNVnuk2JP6x6gcm4Ow/yDgunn2DxN7Ft8DTpwRg01d3631C2oY
         q8O4Qh8HE8XTf7DcBZiJ8la5isNoejM/gkmlSBnxwpM3LySpf8H5gUYTNPpH9WfllVHA
         /Dpav8Z+v7kaVD2qRJ+/cL6OI02Ypflw0/gl3zqItuzkmZR79Y1vFOi6d0A2ya4V6Hij
         kw4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=BmSBD7h3njitpLi5QsmTDnHJWiGkucDb02pMa3UrBRI=;
        b=IcH93D+7CKngVvhOpfebA9R4G3UreUqJYqUcJv92hNKptm9BFsA4LUkOe4EKW1SfQZ
         4RnTmutR8HsIoSchSbJrmH+TEfF3Oj53xU4oOSS7w7A5I0h4zxn/0ic2zbN6ltThvYxs
         jv7G9whHnQm49utIYeYWLxNNMCIROGQHczeBN+PySkl4qXBk65fHZnNT1hlSiX64MMYw
         kdhWWw0ocO9p2y8YB6hQT79sRM2Fc3UUU0LP6gYOEWtdV4lS7cXQVXrzZdf87b2A1NYW
         n7DoCBnvO/oABvi/6ZA/OS2IsvydgpKr1XRx5jOfQ5WaOlOSkApHuQpD1eRcHZtJ39Uu
         +EnA==
X-Gm-Message-State: AGi0PuYE55ybAugL1UjiClL9ThCr6mMJd9R3BgMFwQmr6PokOzkKYFTY
        +EW3jgSJi1wXJUasugRzLWPCvA==
X-Google-Smtp-Source: APiQypI0RQNqWlNHDVtNIFy45lDwuwOyMBSNaVaz8UyZAB4gxqzn881PlNEa1qMPlbNBmRRjX79/bA==
X-Received: by 2002:ac2:5988:: with SMTP id w8mr304392lfn.75.1588279504553;
        Thu, 30 Apr 2020 13:45:04 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:880:89c5:86ed:91e3:4d28:af08])
        by smtp.gmail.com with ESMTPSA id i20sm650562lfe.15.2020.04.30.13.45.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Apr 2020 13:45:03 -0700 (PDT)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/2] Add Renesas RPC-IF support
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mason Yang <masonccyang@mxic.com.tw>,
        linux-spi@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
        "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Organization: Cogent Embedded
Message-ID: <812e6e58-d13f-3f44-5f55-22266b690c57@cogentembedded.com>
Date:   Thu, 30 Apr 2020 23:45:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello!

Here's a set of 2 patches against Linus' repo. Renesas Reduced Pin Count
Interface (RPC-IF) allows a SPI flash or HyperFlash connected to the SoC
to be accessed via the external address space read mode or the manual mode.
The memory controller driver for RPC-IF registers either SPI or HyperFLash
subdevice, depending on the contents of the device tree subnode; it also
provides the abstract "back end" API that can be used by the "front end"
SPI/MTD drivers to talk to the real hardware...

Based on the original patch by Mason Yang <masonccyang@mxic.com.tw>.

[1/2] dt-bindings: memory: document Renesas RPC-IF bindings
[2/2] memory: add Renesas RPC-IF driver

MBR, Sergei
