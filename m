Return-Path: <SRS0=UHbD=BI=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B5A0C433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 12:06:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1AC9520809
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jul 2020 12:06:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMnVUSoI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbgG2MGt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Jul 2020 08:06:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgG2MGt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 Jul 2020 08:06:49 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F3EDC061794
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2020 05:06:49 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id h21so10980239qtp.11
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2020 05:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=qNSwASMkMUifbmwofB2fyerOf+E6WRc9tOja/xCYRO0=;
        b=nMnVUSoIAMMnI1Lu1nRPqlexTMZWac4fBQ/TLf7oy3+jupDRRek4FA86RlQS8nlFEJ
         8WUf8JUrunQ8KsPic8BzygJpVpYmj21wh+i2yg+UNVYwnHe7sAT2FkTt/TKmQk2vUPdf
         osk1uoivRwyAZt+g9dnAkPxgcvFvXAOcd9vExtPPJzqKUiX/10SDpQ8a9H592HoKhCR+
         DYSSjB9b6B45ecOn2fpWbU6AWhxsdVZ+YLhrQ5ivNYJfqNFe9chagABWSbBGc5s6mfdS
         Voj/4SyZ/gmULlThTTS+wjT8EjAumnCLAtb32X6yvg6X97vqvCFmeKQww0BNaPsr2Cax
         AMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=qNSwASMkMUifbmwofB2fyerOf+E6WRc9tOja/xCYRO0=;
        b=ZJ+8GO9fYAGuTQ+X4FXrdcwfvQPH4VP0NwP42GADs4ppCK1Tas7gc858Ce2iavJ1fp
         1XGjVsne/zccWQoVCkRa6+EdSTNG9McWQWJdh/6QFyI6SA9VNhf2tT8Vx4sbBeGU6o9S
         G35tWLe2ApI1ko3FPnCpqAA0G/aGFFjaqy47Gx2A/x2uvw/BiXsIyjBY/FI1BiXnss2A
         l5MWco6FCO4m/MYm6lkxvWueYV3CkYGAB/5Gta9h3+yCLguq4MP5hRwFs+ZVl8Jc49z+
         r13K42m7rLV7z6SeBuVdovzEtruNJM7uYR86IPNk/y0t4nPbbs64qbTYlDgBghYkOcE3
         p4uA==
X-Gm-Message-State: AOAM532Klh+qxqDQ1ZzEZoadlCNsO9K6W6STKD1bxK7vSCZFSIDwU0qk
        aJvVCIHRLvBOo87X+h5ua5KUwM66vV6t74ju0ao2C4s=
X-Google-Smtp-Source: ABdhPJzwkyC+r8FpNB5+uBDVTl1KYBYNospqo28wGUYg4tya+eXsRxCscl3d7qR4cPP5ApyJyc1QMGge3xFmaQD4Czo=
X-Received: by 2002:ac8:51d7:: with SMTP id d23mr14592450qtn.382.1596024407954;
 Wed, 29 Jul 2020 05:06:47 -0700 (PDT)
MIME-Version: 1.0
From:   Alif Ilhan <alifilhan2@gmail.com>
Date:   Wed, 29 Jul 2020 18:06:35 +0600
Message-ID: <CAKfYjimLYPYqus=52g8+doTAjbZDmTsus4audM5T4+SvsUceyA@mail.gmail.com>
Subject: Generating Device Tree
To:     devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Pardon me for being a noob. I have an ARM Cortex-A7 based system for
which I have the board/platform files, drivers and kernel sources. But
I want to build a device tree source (dts and dtsi) from those files.
Or in simple, I want to convert those board files an drivers into
device tree. Is there any way I could generate a device tree source
from those files? Or is it possible to generate a device tree from
those files from the running system? Or is there any way to generate
ACPI tables for the device by porting and using U-Boot or UEFI? Please
guide me.

Thanks,
Alif
