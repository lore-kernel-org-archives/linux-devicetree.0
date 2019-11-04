Return-Path: <SRS0=deyM=Y4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 372CEC47E49
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 Nov 2019 15:35:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 031292080F
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 Nov 2019 15:35:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vb5swnB0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727861AbfKDPfs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 4 Nov 2019 10:35:48 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38392 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727891AbfKDPfs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 4 Nov 2019 10:35:48 -0500
Received: by mail-lj1-f196.google.com with SMTP id v8so2470135ljh.5
        for <devicetree@vger.kernel.org>; Mon, 04 Nov 2019 07:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2gHuiLO7og745XJNw3g0G5hTaWSPN2O4Py1ymt1s8lA=;
        b=vb5swnB0Zimxbp54PAEDpN3fc2ntGzlfDiHa8SXTG2MOqiyFiNssKaM/gRQWP/VGa6
         pdHMrlrzamAiYWXRgNhIJ8ixJOHZYktydfH6ch0OVlSO2mtEY4czBLE62CrphXEbV5Ao
         oxG/y8hTaGG5uDF+I2YwBu+uL3nP4rbAomHLh/888PFfgGdhDDagdDCj0+I6Y5gjz1b5
         4zTNIbX6tPYatPkizcnBfwQLe7Dz/Q987/GLd+YtMq7M1sykhoUelbIsiVbZFqmUIAyB
         vnpVglev5zvAIR89jWwrUcUCZPfxDHP2GgpFk2CRRHyR7sw8llAV9pwP2PduTQMSBT/Z
         wBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2gHuiLO7og745XJNw3g0G5hTaWSPN2O4Py1ymt1s8lA=;
        b=ERq/3j9ulZiqbot+ANwftUCzOWXO2NN5RyMeatsHefVPUxVT375h2wlGUi6Ay36DJ4
         fMSpk28wUUroeKOvKY0K7NQS8tSNk5xZcOJwprw20bsq8h/jvnTd1J1LXFrwcczgB++H
         IkwVi2uTkA8dy6pgpGYkeqSaV56/vKsud1EK9LePhbDOX2ZNEvDC2gsZEmEBj7tPXBGA
         wPjCJll5ZFw6hxR+qJT0ZZHOzahJ87Y5mkl4w4z7qdxliCHMGxX1I5uRQXWz5H0N6Yp9
         bVpNAa33Naiilvvp+kKHfFpVDaXh5116jz9qtqfAbxPXfxGAyiIjBYlmNMSOrh0lnqBT
         O9IA==
X-Gm-Message-State: APjAAAWAWBfhSZCbJB1EpdQoOJi7Ospevr6nXHk5hjvQBIywq29HbR10
        SsmaekqK6sAVE/g+LpBW0YFFrgwfzVycRQxxu3b8TLqXBF8=
X-Google-Smtp-Source: APXvYqyQYB/lSdek2O3HcmnK0Sy6vuSnsziarHtWr7U82KwjasLBk664GvWgm//Wp0sc1sz+wrYTLu0epXxiUArFPCo=
X-Received: by 2002:a2e:161b:: with SMTP id w27mr19390165ljd.183.1572881746505;
 Mon, 04 Nov 2019 07:35:46 -0800 (PST)
MIME-Version: 1.0
References: <20191022160806.42971-1-mripard@kernel.org>
In-Reply-To: <20191022160806.42971-1-mripard@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Nov 2019 16:35:35 +0100
Message-ID: <CACRpkdbf+RPu9FGp+cAhEJFdXNXdXvmawFCwTyi3t9+4F-yLkQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: Convert Allwinner Pin Controller
 to a schema
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Oct 22, 2019 at 6:08 PM Maxime Ripard <mripard@kernel.org> wrote:

> The Allwinner SoCs have a pin controller supported in Linux, with a
> matching Device Tree binding.
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Patch applied with Rob's review tag.

Yours,
Linus Walleij
