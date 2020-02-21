Return-Path: <SRS0=98KY=4J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52BAEC35656
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 15:04:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1E2BA24650
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 15:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582297450;
	bh=XjbX3ABHME7O4C3tUHcQ6q3DE6Funkki9N8+FvacTFg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=1ygqpaqyeXBUzv2XiJTTHEQ56dFVV+EaVT0DUj2QZ/3L0eu3cnXPinvf+5CoCcFfY
	 WFioB0HllfcZgPBXMvrYHrlpDMGUE/EEZ0UM3TtlZH8TVLhLVeFd+61mTmUSkQlM9a
	 Au3km/Bdo4FQNGVwkuLUL0qjJzGNZf4G58xPxB2s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729015AbgBUPEJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Feb 2020 10:04:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:36914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727315AbgBUPEJ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 21 Feb 2020 10:04:09 -0500
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E137824673
        for <devicetree@vger.kernel.org>; Fri, 21 Feb 2020 15:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582297449;
        bh=XjbX3ABHME7O4C3tUHcQ6q3DE6Funkki9N8+FvacTFg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IBrp/TyfPQdZs6CqwP0oc4LWIppxgUaz1GtXmEwN1MyaI6HLsschvKgJakyskSTne
         3kmtEILbCtk0rX5IxttfgrKjM3sd1D3OvE7ZJxkFUSsnfsUYZuK9/G64sffSRbM+pk
         r81p3KbrcrWJRIIrmj4RGvNAlKbo8Qq/G1YPbMGA=
Received: by mail-qt1-f173.google.com with SMTP id i23so1463606qtr.5
        for <devicetree@vger.kernel.org>; Fri, 21 Feb 2020 07:04:08 -0800 (PST)
X-Gm-Message-State: APjAAAUtUBld+1gACw8FoLyBHPSuh4n0qrVltbEmTrAZMfzMER+aDa1+
        saL6rXaQJ2/rNztcSCo8KZXSW/cLt0HNKQHAQQ==
X-Google-Smtp-Source: APXvYqzLxqKFCIpBLyraSMLiDxatxEF/d7aKJ2wuDPHFP3RIxNLjdn+cFEKHetm5avETg2TxS5D8S+pIWijZ9eWlphs=
X-Received: by 2002:ac8:1415:: with SMTP id k21mr32896313qtj.300.1582297448018;
 Fri, 21 Feb 2020 07:04:08 -0800 (PST)
MIME-Version: 1.0
References: <20200221122133.32024-1-geert+renesas@glider.be> <20200221122133.32024-4-geert+renesas@glider.be>
In-Reply-To: <20200221122133.32024-4-geert+renesas@glider.be>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 21 Feb 2020 09:03:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJb=6vq8DFFjcEN3uJg3e4i8sHShAkTZeAUyNhx9y=Svw@mail.gmail.com>
Message-ID: <CAL_JsqJb=6vq8DFFjcEN3uJg3e4i8sHShAkTZeAUyNhx9y=Svw@mail.gmail.com>
Subject: Re: [PATCH 3/3] staging: pi433: overlay: Convert to sugar syntax
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Marcus Wolf <linux@wolf-entwicklungen.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Feb 21, 2020 at 6:21 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Using overlay sugar syntax makes the DTS overlay files easier to read
> (and write).
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Why are there two separate fragments for spi0? Can't they be combined?
> Why do you need the spidev@1 entry?
> ---
>  .../devicetree/pi433-overlay.dts              | 79 ++++++++-----------
>  1 file changed, 35 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/staging/pi433/Documentation/devicetree/pi433-overlay.dts b/drivers/staging/pi433/Documentation/devicetree/pi433-overlay.dts

We have overlays in staging? Who sneaked this in?

Maybe the path should be fixed at least as this isn't documentation.

Rob
