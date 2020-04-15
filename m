Return-Path: <SRS0=bvxT=57=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A63BC3815B
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 19:27:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C85F20771
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Apr 2020 19:27:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="la6Ifd5m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405528AbgDOT1K (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Apr 2020 15:27:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2404530AbgDOT0H (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 15 Apr 2020 15:26:07 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49B67C061A0F
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 12:26:07 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id u6so3405972ljl.6
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 12:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yEerOtnVW9ReUwhRZoIaZrpuT6uVSPq8/qTkpaJjzuA=;
        b=la6Ifd5mctiojkxzlf3AZj7V6OkRYDgq28hif+VciJJN1wUH96THFJ23JXYosHaMWx
         NjR3wB8DgAL53DLVyDdlCePvXfn7oyccyILjV2iwRbWrR9YM2dVp3JANlsgJ/dhm4dQw
         DfrAKi2Hz7xaSg4SMlt1+qcrsIiSpg8EcxaUaF0kqGGyQbm/Bkty91BuMJ+ynyFHjx7g
         r0yaWYI8a4fEdvxBrKi4vuBwkxg6jWC4dDEW5oy7LlQAwaXPrI7YcevVmUGAWy04/m9g
         /FFzls0Tky61cMNOO2WNKdD9FkTrHvnLEDVyGlutqk+bw2eckX+vhwHQXPqxWBAnRgQ4
         Da7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yEerOtnVW9ReUwhRZoIaZrpuT6uVSPq8/qTkpaJjzuA=;
        b=nBy5v5CKgCIPu+OWBEvYuEozf+EJB7T4NYcttzG98az1t3kvyxthdKT9TT+BHUXDMA
         fQM72sEgeqf95H5lF0/vPU5lDaa5PKesSYABR6Zqc0B59AkBuvNbIHCIgDAOvoRjXO6S
         Yfan7jN1y1MnTO1OnG86DovLDY5GDhBcDohRU/Tu6xCpwG7ktjgqIcjVRg0Gheg8MwHT
         c1G7kJU/RUSUoOXhHO2ulfS3cICRcHqEuXDsYgjP8mIWBpavoxyrkI7bIlLLChK86pBN
         L4ukn8xSuFoml6GExFmg0J+azdEP4MLH3tZHZPPavsfwGa2tBAfepHIBRJnInIgihVl3
         BH0A==
X-Gm-Message-State: AGi0PubzHUc7CU4sWhoDult6Z/PNY65w/w+pSxp+ThNE3qxP1dl2y5oT
        X076UMvqQVg9P+L7kEqOQtbZJURde8xd6QMewjk=
X-Google-Smtp-Source: APiQypJXYy+GeInxhHxdIoYEC7BRlvmB+2gusgqFCjO+/tFRcwuY8FsLZ2/VepirEG/UjnrzbEuus26C3gedMNa7o0g=
X-Received: by 2002:a2e:7006:: with SMTP id l6mr4088422ljc.269.1586978765639;
 Wed, 15 Apr 2020 12:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <E1jOkD3-00067R-RZ@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1jOkD3-00067R-RZ@rmk-PC.armlinux.org.uk>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 15 Apr 2020 16:26:35 -0300
Message-ID: <CAOMZO5Ahj9XRk-hG8ZxVzQP1424qPCkNX4BuWDJs-NW5f-jvAg@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: imx6-sr-som: add ethernet PHY configuration
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Oleksij Rempel <o.rempel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Russell,

On Wed, Apr 15, 2020 at 12:44 PM Russell King
<rmk+kernel@armlinux.org.uk> wrote:
>
> Add ethernet PHY configuration ahead of removing the quirk that
> configures the clocking mode for the PHY.  The RGMII delay is
> already set correctly.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
