Return-Path: <SRS0=tkJE=4P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F6EC4BA3B
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 12:57:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D502B2469C
	for <linux-devicetree@archiver.kernel.org>; Thu, 27 Feb 2020 12:57:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IGoCE1Pu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729112AbgB0M5q (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Feb 2020 07:57:46 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46871 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729075AbgB0M5p (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Feb 2020 07:57:45 -0500
Received: by mail-lj1-f194.google.com with SMTP id w19so3249230lje.13
        for <devicetree@vger.kernel.org>; Thu, 27 Feb 2020 04:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qPHGYMWXhRCjMw8nub6othNeVZMlmf1o3qpvhzZTWP4=;
        b=IGoCE1Pu3APJ3EgCMizw96kVnO8vfe8DEBfP/o7uYSZiBmffgujZ9ZjJYlgpXDZ/vK
         lphT5Z4Z6/56y+52goiTUoaD51hTNd12sexKA8onoOx6rpppiiTj2Gx+w8ISVJDvKISc
         WpMUIUP5l+3f9R34NBhl+5gjsQT/6swCYRZL/iGwAqxM+3dpsk/rWY/4MjznnGvvIywt
         SA8YCS/hduuxbD4a5CqD+byHGm9F1fAJgSQePGzQ9qWjIZNXWA99HS3T0cX7jA+2pr+B
         PW91AmgfwpmU0NfqYHm6VDFLpup95oUgYHz34D47IfQvv4AEkYdmImzsQgou63Dr0k0v
         73LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qPHGYMWXhRCjMw8nub6othNeVZMlmf1o3qpvhzZTWP4=;
        b=ZQeH3sSTpFOEtPUNTWWimbLpWFqsw336vxfkvyNa1SBZQus7GCEqeI3ND++R374xgI
         S6yn8NxOS/Ub7f7pW3R4YnqJEjw4ebsamlrQGBcGJ6beWvZy+HmyRH+iRQ/O8DWNIDzZ
         5byGI8Nx5ZTDmuhGw+fRgfKvU6O97oDHmzyd+BOoyiCKA539e9rjGT67Or6Rogitm1Dl
         EFsqEViY07X/XvIY/hHvW+lJ/p/1MSg+CEsGosd0fRiwyHxU+hIaRVKW0Qwylvc4DDr7
         1UPRihQAjeJQZMZSWK6UJJMXDaHUhWKowY5z/nCqzZm32qxsH1WmXn9k68YB0gBflF+u
         lA2Q==
X-Gm-Message-State: ANhLgQ0MWVWH7zKdrm4hrSy5QCcNnAyrDL32r4PPRT7u1qCh40AOKbRS
        TZ1tthADXxCHLhgh9iYZ/qgVx8IhG6KFfLQNaYE=
X-Google-Smtp-Source: ADFU+vtH81bmx540dWe9YXVHht1EBT4kZQqIAFzMb39QR1G4ruYs6oEq8tXvhWekr9qSWRvMH4g/SmsT4T62564KGOo=
X-Received: by 2002:a2e:7818:: with SMTP id t24mr2717287ljc.195.1582808263182;
 Thu, 27 Feb 2020 04:57:43 -0800 (PST)
MIME-Version: 1.0
References: <E1j7I7v-0004dS-5u@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1j7I7v-0004dS-5u@rmk-PC.armlinux.org.uk>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Thu, 27 Feb 2020 09:57:40 -0300
Message-ID: <CAOMZO5A6os4myE41ZLBvW639bjRudg8Tax4yBa5JOyY5+oJW+g@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: imx6qdl-sr-som-ti: indicate powering off wifi
 is safe
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Russell,

On Thu, Feb 27, 2020 at 9:19 AM Russell King <rmk+kernel@armlinux.org.uk> wrote:
>
> We need to indicate that powering off the TI WiFi is safe, to avoid:
>
> wl18xx_driver wl18xx.2.auto: Unbalanced pm_runtime_enable!
> wl1271_sdio mmc0:0001:2: wl12xx_sdio_power_on: failed to get_sync(-13)
>
> which prevents the WiFi being functional.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Shouldn't this have a Fixes tag so that it can be backported to stable kernels?
