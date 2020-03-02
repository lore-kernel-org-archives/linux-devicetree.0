Return-Path: <SRS0=6Sr8=4T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA72C3F2D1
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 17:18:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 438A72173E
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 17:18:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ebJ61xS+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727268AbgCBRSR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Mar 2020 12:18:17 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39634 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727261AbgCBRSR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Mar 2020 12:18:17 -0500
Received: by mail-lf1-f65.google.com with SMTP id n30so178466lfh.6
        for <devicetree@vger.kernel.org>; Mon, 02 Mar 2020 09:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=npGRpScsdzHp8hgTy3Ps74UkwY+poievW07XcCbJvc0=;
        b=ebJ61xS+vL/anKTgYhyj3v89k9aMBeSSoLH+wKzBO/S86yKF89gKCKg7d/T5ghZQO6
         +a7PZAXrmEoeGO248GhMWE3cgvwTIUcVWQzR/jVNcI0VwOEuuZKQ0URpuwFE7IVWGJ40
         D57EqEp5VTqez4S9ZsbQOiPRsz1PaSYy4x1yJoPimD/MykwsyJXM/xJF5JA3WOcejp1a
         ExnK7LOikVBhE67OBKW7+0sXOxmO3wM9eoPofdWEt6t/ienlxNiNHGDzgaI22x0jJn7n
         /PmBXSTpvmPWtJZ/yDGf4en7SPaNazMzuTWmD3SEOlD2mWe1oCpDvl/9SzkA0Kx8nWnQ
         xI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=npGRpScsdzHp8hgTy3Ps74UkwY+poievW07XcCbJvc0=;
        b=Sbiwuv18B21DReaQnqcZPGCMxS8akdOBd0VjXDlI8u97qLZMS8kjziQM+nu5gPkSxL
         QKTyPW3/2YutmKmyRPNU7B0NDJWjSZrIHRplFVBLdJyfnuqKS/300qsd3hhQ4sM5SDyW
         N/vSM8AmveQVLGmf7BBvCwLCLQrWosTdQFUtAI/4/4c/ShuK53VGKxLI3saaQ+QoSG7B
         N8rlnOOGHyO1WVgTdIJWB+J8wcmrRiinasUZItojXa7XhP16xBWrucG4pRRKCcF/YhfU
         NClMFhGmTY2ZlZLidSSXu0afA++M67aHnQGlkcGtBkmuZanq9vlkqBBMZ8aR8EpbNA+M
         Rjzw==
X-Gm-Message-State: ANhLgQ1pnIyGH2g3XklFkyMaeGrUs9K7as9KRnOFONjIs5Sx87phUv7k
        Ml4iLw/It2eZfqoGWso5IIQ22NwFYkzDUayyG44=
X-Google-Smtp-Source: ADFU+vszH2JfjSmjLotcDHOUoYo/EKH07bWd7PS9PsgNKeQL71BQ17mRqsIl5rJ9QOMXX2EJ4Kf/MKCl/CggfQ55q0w=
X-Received: by 2002:a05:6512:1054:: with SMTP id c20mr77851lfb.69.1583169495560;
 Mon, 02 Mar 2020 09:18:15 -0800 (PST)
MIME-Version: 1.0
References: <20200302001150.27952-1-vitor@massaru.org>
In-Reply-To: <20200302001150.27952-1-vitor@massaru.org>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 2 Mar 2020 14:18:04 -0300
Message-ID: <CAOMZO5CETSigeAkCpewdrmeogBhvVs3XP+A4fg823bSkeGxqCw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: freescale: add gpio-fan/thermal support
 for Google i.MX 8MQ Phanbell
To:     Vitor Massaru Iha <vitor@massaru.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Marco Franchi <marco.franchi@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        lkcamp@lists.libreplanetbr.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Vitor,

One more comment:

On Sun, Mar 1, 2020 at 9:11 PM Vitor Massaru Iha <vitor@massaru.org> wrote:

> +
> +       pinctrl_gpio_fan: gpiofanp {

This should be:
pinctrl_gpio_fan: gpiofangrp {

Thanks
