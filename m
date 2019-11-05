Return-Path: <SRS0=ig8w=Y5=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09108C5DF61
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 Nov 2019 15:21:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D486721A4A
	for <linux-devicetree@archiver.kernel.org>; Tue,  5 Nov 2019 15:21:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yjVjEaHt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389634AbfKEPVo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 5 Nov 2019 10:21:44 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45086 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389577AbfKEPVo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 5 Nov 2019 10:21:44 -0500
Received: by mail-lf1-f65.google.com with SMTP id v8so15396718lfa.12
        for <devicetree@vger.kernel.org>; Tue, 05 Nov 2019 07:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HE1j4EtAZgGRg2QaYSvsLMcxRZaA6CCtizB7Yqa+lWg=;
        b=yjVjEaHtAP37kp9++HI7ooPq2Y4a2G1TuFHB456QcKsOAWsht/SSIaQ5zJJ0YN12h8
         XF/yRHE7xMSI5rQdhsesegEM0MW6p9EBhGy81i+iG1LwwCoRLfoYF1vRflGBGChYrGsW
         PcbY4ld2re/6E2h4DmOGk3mRqrZzftZCUc+ndsiVOG+szOyKpP++6gClynU+4Rfqj0Ft
         Zw+BFf3ICmF1XlKsHK8qEMcz/CUFnVxBa3rPZw4VnZ010RfX4HJu2d0ZGYISpo6HBVcs
         aGU+UUdxac1QHujhQqn7PSuX83+l4GyWxgfYvPCCBaNI+JL5mNv5FTBTl63DHOETbwu/
         3teg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HE1j4EtAZgGRg2QaYSvsLMcxRZaA6CCtizB7Yqa+lWg=;
        b=IOVmrgvJs9oIG3dnlVM1ZcGQTCDSs3/JBt5Zl8vQ8RtY4o6RQFJT4UtXFeCk22GtYh
         O88q2Cu1ov9AUHFEz4aybbH2Ih1s9SxZapX/bdI0f/sdZu2lUY8VJDGhBnBE8n+cONKc
         fX3jNOza1RnhXvzFL4m43z3yEPf0/tktFRlxJ8vpwFDdSlSXH8rxIF82U0/n0uYcAkVH
         vbuDzE6Hr2EG5adVSKJPquoYoM7mJxKBilMET52GXogSw7p5Qd7SuAyOw0nB/jfeWu7c
         X0Z2j6H+d3vEZBfYzDBorGmsnhyc5wOD+K+bjVJMWTkLY53T2wbNxTztfHGCH8c8nHWv
         sXPQ==
X-Gm-Message-State: APjAAAXsJHidr/dcJD71BwMgFrFZ/SjgqVveek6gin2FMSlerGNseZkx
        Ba7UzhP9X58w1raBFRt/M2xotCp6NkIsI/K8Lun59A==
X-Google-Smtp-Source: APXvYqxI0StnJAOryNZBbjRziDjLEli5haRZAFZ6MAJbKJDs42vGLZDjqlF/VP7raZrFQk6Inyr11J2n6egFJpUaxOg=
X-Received: by 2002:ac2:51dd:: with SMTP id u29mr21264199lfm.135.1572967300804;
 Tue, 05 Nov 2019 07:21:40 -0800 (PST)
MIME-Version: 1.0
References: <20191103205459.24965-1-linus.walleij@linaro.org>
 <20191103205459.24965-2-linus.walleij@linaro.org> <20191104231946.GA14609@bogus>
In-Reply-To: <20191104231946.GA14609@bogus>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 5 Nov 2019 16:21:29 +0100
Message-ID: <CACRpkdb+uP+j5RmUkeXjioAUaFW3C5kLYUQ9O2NOcb8fOvd=4A@mail.gmail.com>
Subject: Re: [PATCH 2/2 v5] drm/panel: Add DT bindings for Sony ACX424AKP
To:     Rob Herring <robh@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Nov 5, 2019 at 12:19 AM Rob Herring <robh@kernel.org> wrote:
> On Sun, Nov 03, 2019 at 09:54:59PM +0100, Linus Walleij wrote:

> I thought I told you what the problem is on the last version. See below.

It was pretty hard to get from context I'd say :D

> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +  - $ref: ../dsi-controller.yaml#
>
> This schema is for a panel node, not the dsi-controller. You need to
> drop this line. It should be included by DSI controllers.

Yeah and since I am submitting a panel binding and not a DSI
controller binding that was something that was pretty out-of-context
to me.

Anyways, since patch 1 with the DSI controller bindings is then
completely unrelated to the rest of the series, I'll work on that
separately and just resend this one with the panel driver.

Yours,
Linus Walleij
