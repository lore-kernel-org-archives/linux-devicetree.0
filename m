Return-Path: <SRS0=0cLU=CD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A65C433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 16:03:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56BE720786
	for <linux-devicetree@archiver.kernel.org>; Tue, 25 Aug 2020 16:03:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="okyPVVy7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726749AbgHYQDf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 25 Aug 2020 12:03:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726351AbgHYQDN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 25 Aug 2020 12:03:13 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEC2EC06179A
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2020 09:02:55 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id j13so1462188pjd.4
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2020 09:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=Ev7YebnrMJC5hGp27fNNwdoImL+JDFARELNBma0/uAA=;
        b=okyPVVy74yhlMZQCWF4kzfTd4X55KXDYOqzLJQnAIW0h1IFAYQXbSPLOVAMXMA3C3j
         tL/HLBWDHQzpJj4ci2GUYu5lisDQtceXxLtpRS3C1N6QiXc629q7MzAhIlKzsE/O6Jxp
         hxXjODLVSsA6omJuJUBYBjG3837I0mbscmwd9DDiSmJNrH7kgNiRNwtZuorFkk/LFb9S
         8UetkH/uOhJseG0AECV3EuEvJy1vGwu2TbWICNUOLQB0uPtfvydMA8RjobjPyJ5HGasI
         na6uzBxKd/6d/1odYvw97QotgbrYy+3q+PDbivrnLe7VTnK7Y1ItmndVIMa2H90PXS1/
         vWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=Ev7YebnrMJC5hGp27fNNwdoImL+JDFARELNBma0/uAA=;
        b=Dmku7v//PjaSMnSh8C0exGgjSyyNBszFlkYeU9G7Ys29Q2mGwRZHosya8GOGnm3tvS
         KvJjWESeVxFq0aYGnjrTxxw4Cgt1L8OWMrOSkBhDho7BHOA4xyKtf6O/Q86CjysQxCCA
         dpY0Q44yR46Ef4cQW9DDM87fLOIyUg8B652PIZAPj9x6xcVbN8+YB0/hyV4yjkceXsbf
         YOtP5Li4UflfdcRBN0wpoW6y20BLye0dTW71Fniz9xy2ZEyJX9W/WXkqeIDqCzGLf6Va
         Czdj44PJ67UjJcmJrSLSydz5OAxOBzXSz/vsVo1bP+NFYNq2GlIXpN3taaGi2pxfVSP+
         euWg==
X-Gm-Message-State: AOAM533jvpNqwrh8k2trr2AyBH0vKU3JhnvB2Xh5qFQIVR10AkZRWQ2K
        ThT6e9mYiIxhLDq73N9cDqDjfA==
X-Google-Smtp-Source: ABdhPJxVMLNNcoGNUamsRb6XNuw5Pw/vE4Xo0oCs/JaO+Bek+U4WRn0q62JXgjoWyYfGNhJmC9XG0Q==
X-Received: by 2002:a17:90a:f994:: with SMTP id cq20mr2218207pjb.229.1598371375255;
        Tue, 25 Aug 2020 09:02:55 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id t19sm15483792pfq.179.2020.08.25.09.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 09:02:54 -0700 (PDT)
Date:   Tue, 25 Aug 2020 09:02:54 -0700 (PDT)
X-Google-Original-Date: Tue, 25 Aug 2020 09:02:48 PDT (-0700)
Subject:     Re: [PATCH 0/3] SiFive DDR controller and EDAC support
In-Reply-To: <1598357182-4226-1-git-send-email-yash.shah@sifive.com>
CC:     robh+dt@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        bp@alien8.de, mchehab@kernel.org, tony.luck@intel.com,
        aou@eecs.berkeley.edu, james.morse@arm.com, rrichter@marvell.com,
        devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        sachin.ghadi@sifive.com, yash.shah@sifive.com
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     yash.shah@sifive.com
Message-ID: <mhng-eeb15e05-0af6-42bd-8c35-0b7e9bbedba7@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, 25 Aug 2020 05:06:19 PDT (-0700), yash.shah@sifive.com wrote:
> The series add supports for SiFive DDR controller driver. This driver
> is use to manage the Cadence DDR controller present in SiFive SoCs.
> Currently it manages only the EDAC feature of the DDR controller.
> The series also adds Memory controller EDAC support for SiFive platform.
> It register for notifier event from SiFive DDR controller driver.
>
> The series is tested and based on Linux v5.8.
>
> For testing on Hifive Unleashed:
> 1. Enable the ECC bit of DDR controller during DDR initialization
> 2. Erase the entire DRAM in bootloader stage
> 3. Using FWC feature of DDR controller force ecc error to test
>
> Yash Shah (3):
>   dt-bindings: riscv: Add DT documentation for DDR Controller in SiFive
>     SoCs
>   soc: sifive: Add SiFive specific Cadence DDR controller driver
>   edac: sifive: Add EDAC support for Memory Controller in SiFive SoCs
>
>  .../devicetree/bindings/riscv/sifive-ddr.yaml      |  41 ++++
>  drivers/edac/Kconfig                               |   2 +-
>  drivers/edac/sifive_edac.c                         | 117 ++++++++++++
>  drivers/soc/sifive/Kconfig                         |   6 +
>  drivers/soc/sifive/Makefile                        |   3 +-
>  drivers/soc/sifive/sifive_ddr.c                    | 207 +++++++++++++++++++++
>  include/soc/sifive/sifive_ddr.h                    |  73 ++++++++
>  7 files changed, 447 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/riscv/sifive-ddr.yaml
>  create mode 100644 drivers/soc/sifive/sifive_ddr.c
>  create mode 100644 include/soc/sifive/sifive_ddr.h

Thanks.  These look good to me and I'm happy to take them through the RISC-V
tree, but I'm going to wait for a bit to see if there are any comments from the
maintainers of the various subsystems before doing so.
