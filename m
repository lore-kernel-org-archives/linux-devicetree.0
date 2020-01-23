Return-Path: <SRS0=+P9T=3M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 943EEC2D0DB
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jan 2020 11:56:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6702624673
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jan 2020 11:56:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0REIlpZV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbgAWL4U (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jan 2020 06:56:20 -0500
Received: from mail-qv1-f66.google.com ([209.85.219.66]:34304 "EHLO
        mail-qv1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbgAWL4U (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 23 Jan 2020 06:56:20 -0500
Received: by mail-qv1-f66.google.com with SMTP id o18so1351456qvf.1
        for <devicetree@vger.kernel.org>; Thu, 23 Jan 2020 03:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=E3fMtGGO856lGM1PhiLZZhQc22C1nseMPeO3dxb+GLA=;
        b=0REIlpZVRZhBUBb1A6pWKfpE0zWzwb9I2G2r/VtAioTBIwqE/SXwtwiei2vJPQ6zNv
         o53+nRmuQWZv1zBLSmzbLDdpojfx0Z3UqLinnxtilZT6CeOhRt24ViuEHHRdmIxEn2IC
         Nd0rmzr2NjcVl5WULuScg2oCcVZZz9rt6Pkv8CypXfrY4vyEGCiGMkbKlpWTFjLlQ5AM
         p0F9WZpM/IG2LYFOTPRgXFRBN62+KHiTQIQKFicHj6b/ta2ExBc0+iUgcxJhHUph0rJu
         6oachBSoYdpcPOUnwmIRNPgX3GRU4znoc3XhCnyr8qSs4jouEQcPiAoJ1IcPXO1L4G+R
         oBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=E3fMtGGO856lGM1PhiLZZhQc22C1nseMPeO3dxb+GLA=;
        b=RrWcycZy2VF7QeK+74c67JcaCq10Vkz5S/7Qetmh81onFaJLs8oxXea47Xsd+vWVmZ
         9bk1InU3wI73ZUvCOLFkikIX35XM3bkt4k+zkjZFam5gJ9zhJa3+MnDedGh6u8uD48Bt
         xtfc8MIlYMVEXhnVsmsaHV8U36TizaNMM0fHM8rEQIkTYz1m7Z1nns88z1iOHgday88v
         JvmdPCSuqdV8JpjNMXoOG400yDCgYt3jG3VA2L0WfyjwIBPqzz5JzMMlez9z2Du7yr69
         jLimpTSA/4l1jbUx04UW5TCveh9gJfbu4Esm0Y1zCCoXsQ6FjO35INvyEXN8GG4EK/NO
         7k/A==
X-Gm-Message-State: APjAAAVaFP+0Iso8aXlimEsLAY/dhbZzmJU8TQbSiw+gaJ2NaIqWKEoJ
        mP2w9rhpwYfkTQU3x+qzHer/bOqEbIW4sDsfLf+H1A==
X-Google-Smtp-Source: APXvYqyADb9YmjOzth3SnYMaulW2ettSIeSZNksKWx2BGDXwrzojRFgX+xKf5iLx+x20ML0MwvzYaGdXs+huu5uohtk=
X-Received: by 2002:a0c:d60e:: with SMTP id c14mr15254880qvj.76.1579780579275;
 Thu, 23 Jan 2020 03:56:19 -0800 (PST)
MIME-Version: 1.0
References: <20200116025637.3524-1-bibby.hsieh@mediatek.com> <20200116025637.3524-2-bibby.hsieh@mediatek.com>
In-Reply-To: <20200116025637.3524-2-bibby.hsieh@mediatek.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 23 Jan 2020 12:56:08 +0100
Message-ID: <CAMpxmJUuCbHjsx493L6+nv0KShoqhoS3dfMXGYaGmQ+JQKBipA@mail.gmail.com>
Subject: Re: [PATCH v10 1/4] dt-binding: eeprom: at24: add vcc-supply property
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

czw., 16 sty 2020 o 03:56 Bibby Hsieh <bibby.hsieh@mediatek.com> napisa=C5=
=82(a):
>
> In some platforms, they disable the power-supply of eeprom due
> to power consumption reduction. This patch add vcc-supply property.
>
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Patch applied.

Bartosz
