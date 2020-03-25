Return-Path: <SRS0=vtFV=5K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B840C1975A
	for <linux-devicetree@archiver.kernel.org>; Wed, 25 Mar 2020 17:08:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6BBA420740
	for <linux-devicetree@archiver.kernel.org>; Wed, 25 Mar 2020 17:08:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rRKgRr5J"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727177AbgCYRIF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 25 Mar 2020 13:08:05 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:33541 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbgCYRIE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 25 Mar 2020 13:08:04 -0400
Received: by mail-lj1-f196.google.com with SMTP id f20so3351573ljm.0
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2020 10:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=600/ZX+MXM/TMsIs1XX7CkmCtp0K7z5KZXUXr8Gs7Hg=;
        b=rRKgRr5Jnyl7HxB3olqq6jFXS0WdFWFQnInzVomqkuvmAaC5V2Vea6f2E/Sq65LWcj
         uKGrcjI01BnHmCH3PusaCNieeBBsXSux6pmw/pSYGCjVvD5qHQi6tPyuqayvxygaAayW
         sjUpf+/3frRBl2xnx3kb5brnXjrkkjQmga3z2TCGG64LryF7gUujp+vB+AbedXMaU+iH
         ey+IXzbsz4tIvmEeTlzG4wo4dhC5JcTF5Cewo5i99AgXsPKECXmtYSqK3o5V/Odyho4T
         NMk63S2XT52Qx+Y+WIEZ94ubqFsQq0bDPbdLj3YVf/sB037RjMxV5D5ZzppmV23zDfji
         c6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=600/ZX+MXM/TMsIs1XX7CkmCtp0K7z5KZXUXr8Gs7Hg=;
        b=NjcZZClbBlJFnjGB9kLMkIxgVM4NtcJBVqiHfuSBswXHY8y+wk4YskxyAkq0hxDGw7
         VKZTjR8X6xdGn0h4F/KUZtjSLaGNPkZDLqu7915jGI08wk7m4I0XmTcq0DojCyLRhOeW
         D3vNZx7PnDv9y3uYnhClWEdLVXqIwaoR44kn/CRDsSrMRBf0ah3vtvOqMoONuHvdmWPv
         dxoNNA+R7XArNAyusQ2T6Cs7dY2Vg+zZuBFT6H5cvM5l6DOd1Vgn62R6qS0AJkVeCgNe
         2vx8nMFn9NQrh7ynu1/yLIZDKYuXtm2xAFKGKnW08jOq8EqXuLQqaKZoZ0FO1geDW1nE
         oxFA==
X-Gm-Message-State: AGi0PubNGbDvUiO61cr7xQpZNWb89sTepM6oUh1ssTX8ZUeG4pTX6Tno
        Gy25lQFa8XairsF7W5Q/wNr6wAVxi6OliAlV5eY=
X-Google-Smtp-Source: APiQypLgprDFyeg9zyYsI/utcFejWPg2CkEwryZZEk3z9PPhdmklTvXiftwi+mmWkXFKvkUs/UNHYJD+Fg/3B7VKg5g=
X-Received: by 2002:a2e:9757:: with SMTP id f23mr2525601ljj.269.1585156082224;
 Wed, 25 Mar 2020 10:08:02 -0700 (PDT)
MIME-Version: 1.0
References: <1584651135-29266-1-git-send-email-tharvey@gateworks.com> <1585153582-21127-1-git-send-email-tharvey@gateworks.com>
In-Reply-To: <1585153582-21127-1-git-send-email-tharvey@gateworks.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 25 Mar 2020 14:07:54 -0300
Message-ID: <CAOMZO5DLLPtbVp=nZ9B6O78F8pSGH7Oj9bfmtSQ_MayGi2SyuQ@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: imx: fix audio SSI on GW551x
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
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

Hi Tim,

On Wed, Mar 25, 2020 at 1:26 PM Tim Harvey <tharvey@gateworks.com> wrote:
>
> The audio codec on the GW551x routes to ssi1
>
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>

You could also add a Fixes tag so that this could be ported to stable kernels.
