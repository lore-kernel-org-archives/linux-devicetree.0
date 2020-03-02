Return-Path: <SRS0=6Sr8=4T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA00FC3F2D1
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 08:42:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9DCFB246BB
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Mar 2020 08:42:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e/pUlbcQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbgCBImd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Mar 2020 03:42:33 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39818 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726313AbgCBImc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Mar 2020 03:42:32 -0500
Received: by mail-lj1-f194.google.com with SMTP id o15so10751537ljg.6
        for <devicetree@vger.kernel.org>; Mon, 02 Mar 2020 00:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g29XyuwOKIs/sEqqYbL4oYNrFf9RHLiVPNCz/UCehWQ=;
        b=e/pUlbcQmcm0oyU3Y02zwylI4JrIeXc779uRry4j8hsXzctEL1xDwKZ72PpcJERVpR
         JMdOrU3ejtO0UqlSL4L7q72XGFWKL6mCkYBaz191Astmalsh4dpNWXmfq82ObYeNs4xE
         LaSyWROJ/uo9K3VFd//AHUI+H7f8SJJaxM4uCpmgB0Nn9Isw5WsIKHNUQvYaiHli7v0H
         12bebEYKkd04dwjWcG2JCGtlj3x3g2qpMBT/3cWbQSHNBZCgZ+1tx1MAF7BJc8u05UJR
         Xa9qrJfOfzPWu8FlGhcWZrNSYhC3knLoUA6Uuo0Q0LXre0ggFjj1RFTyNtJoj+PJZPp9
         9Vvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g29XyuwOKIs/sEqqYbL4oYNrFf9RHLiVPNCz/UCehWQ=;
        b=efDY/y76U911Oxq5iA//hBskAx075DF7h23QzGhHBuk3gOgNSDa6FB9v0HqhSuEGRW
         WXFO2Bg/3D0HJd4ijLKibwUDuMUnMeuDlMa90yKlLTIeGdzPEWkpFY2Bc6MsXW3U34iK
         oxLpHDBbFLvrju2UDQ/DlVtlvCVF48LWZ1GRlNUa/TAKufM0XmhT5zR9Wz2f+4Ki/be+
         BX0JWgRFA0F5rfDsKNK/pbiCXEkyRMB8grqLKmMIiSRKLfwsPh0LG+k6YjVVIueQgiGA
         Tm9xrvhuctNAcK+3RuRp7JDr2wyywnKJOpiP7W0Glhb083p7BjJ7wnz6slVOzDa4ZesQ
         kIGw==
X-Gm-Message-State: ANhLgQ1cKneORGsudGwHWKoPSnXnMVpMWEQSZegSt/b0pS5521DcK4ey
        kQWesR2wRghnWbVwVGzsBr3+coDj/2w+5NCwJTXj7w==
X-Google-Smtp-Source: ADFU+vt1Kci8gmkDhxlBgMDvyCvVWOL0VcOHJ/mrOCVqKw9mApHmYjif5ezTZ7tN8fRIiZstU7VWpvTxnPc4wH/TCqM=
X-Received: by 2002:a05:651c:2049:: with SMTP id t9mr10777873ljo.39.1583138550738;
 Mon, 02 Mar 2020 00:42:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582913973.git.hns@goldelico.com> <010d6ad3473fb4b1f1041888a071796180cdd838.1582913973.git.hns@goldelico.com>
In-Reply-To: <010d6ad3473fb4b1f1041888a071796180cdd838.1582913973.git.hns@goldelico.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 2 Mar 2020 09:42:19 +0100
Message-ID: <CACRpkdaP59S1uzGVKTHkJAyv_jSs6GQY1KBxgfrvmPq2c74iGg@mail.gmail.com>
Subject: Re: [RFC v2 5/8] pinctrl: ingenic: add hdmi-ddc pin control group
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Paul Boddie <paul@boddie.org.uk>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Andi Kleen <ak@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Feb 28, 2020 at 7:19 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:

> From: Paul Boddie <paul@boddie.org.uk>
>
> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

Patch applied to the pinctrl tree, it should be fine to merge the rest
of the patches in another tree since there are no compile-time
dependencies.

Yours,
Linus Walleij
