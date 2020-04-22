Return-Path: <SRS0=0pfk=6G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A2EBC54FCB
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Apr 2020 15:36:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DBFBC2076E
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Apr 2020 15:36:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AZwYjSI/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgDVPgH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Apr 2020 11:36:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725980AbgDVPgG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 22 Apr 2020 11:36:06 -0400
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAFE1C03C1A9
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2020 08:36:06 -0700 (PDT)
Received: by mail-yb1-xb44.google.com with SMTP id e17so1413723ybq.0
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2020 08:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+AjFfEvExopko5vrpG5TAim2gTw/nPEygKLzyKFqNHY=;
        b=AZwYjSI/UXuxNN7NJfejVcVD/JWxuHM2HmXpNcbCNlVy7r0ba+rutav8Pn70cdoLm0
         ZimhlWIZFJLZoreLu1R0uij5j3if46a95rh73L6nnVX93jPCdyyS6RgQ8Y913UgQqmVA
         ft7vBx0lpwpTK0DAKv1Wkk60mkzZB/TgGJ7m2AJmeaSEbTTAaWpzr3LNQEitU3/8EsS3
         /5D6pyqQFfFInaEOc79FLV5OBYUtJcrcN8TIWGPpD0lixpvNavePd4Sa+EVsSgAol1By
         knki3pld00nBrwMullmQNE8o+Rx5FL5SWT8Vp4QStnwTo/d3Sgath6WRHePUhBavNDyZ
         DT2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+AjFfEvExopko5vrpG5TAim2gTw/nPEygKLzyKFqNHY=;
        b=bWV6iWulQMOUowTn3U4fhx5Z4qSJK+MmG6MPzSGABckPKZuv2vlLXL6Iy5GZR+DXzp
         94td0iidtZal1GHvf4a/r9DrbO10/qYYJKA+SRpk4CuSIm1B7YQ/S3LpyHRidI2lrlDw
         oFog9KXwTIGuOK390BUk8FTQWu67HzwD+K3RQXuHcAYieqSwJHBojscH86/7oKdz9pph
         pr9Dcz7bM8BywhlwYgIlpGeMHM+I98d3Uvg4RzvtRDwgBa82PG+xZ3W2Ktp86S1nQuk0
         hb6/UXHEKVzwktvyiX3Pa396KJvdV8TGr+Sn5a6sW3jWOZ7K5wgIXxPN+hoO10G9JJvM
         Fupg==
X-Gm-Message-State: AGi0PuaG68rXy17Fq2/ASKQxa7KdmtF+ktqjAb+xuEZEYlk0NdhOTzwT
        wbqZJYrbibGnvioMxpZ+YNjjUBtm4z69PJr1PKqGVA==
X-Google-Smtp-Source: APiQypI//eHnV/pEir7WM2H9X+55MxxgsM/Mje90OxuP3GH+OrpvQW5vERdQQ1tXEJCI8NvO99y+KCXOrOB2lzalJVM=
X-Received: by 2002:a25:374d:: with SMTP id e74mr35541070yba.343.1587569766048;
 Wed, 22 Apr 2020 08:36:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200422114429.0b1a6f1a3366bae5964f3e10@linaro.org>
 <20200422115035.2f8d48843793d0d6f6724522@linaro.org> <CAK7LNAQL1ZkHKwODW2VYnpRw+y5Eg4abg+xCDa=PfQktHLnW_w@mail.gmail.com>
In-Reply-To: <CAK7LNAQL1ZkHKwODW2VYnpRw+y5Eg4abg+xCDa=PfQktHLnW_w@mail.gmail.com>
From:   Masami Hiramatsu <masami.hiramatsu@linaro.org>
Date:   Thu, 23 Apr 2020 00:35:54 +0900
Message-ID: <CAA93ih2rqCGEJT91iMQrEK-8BDNd_z_DP52OSF6Ps=HbUjTz4g@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: uniphier: Add support for Akebi96
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Rob Herring <robh@kernel.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        DTML <devicetree@vger.kernel.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hello Yamada-san,

2020=E5=B9=B44=E6=9C=8823=E6=97=A5(=E6=9C=A8) 0:10 Masahiro Yamada <masahir=
oy@kernel.org>:
>
> Hiramatsu-san
>
> On Wed, Apr 22, 2020 at 11:50 AM Masami Hiramatsu
> <masami.hiramatsu@linaro.org> wrote:
>
> > +
> > +&eth {
> > +       status =3D "okay";
> > +       phy-mode =3D "rgmii";
> > +       pinctrl-0 =3D <&pinctrl_ether_rgmii>;
>
> These two lines are actually redundant because RGMII
> is the default in uniphier-ld20.dtsi
> (and uniphier-ld20-ref.dts skips them.)
>
> Did you intentionally make it verbose?

Oops, no, we don't need it. It's a legacy code (IIRC, there's a
historical reason).


> > +&spi3 {
> > +       status =3D "okay";
> > +       #address-cells =3D <1>;
> > +       #size-cells =3D <0>;
>
> Adding #address-cells and #size-sizes to a board DTS
> is strange.

Indeed.

> I will apply this:
> https://lore.kernel.org/patchwork/patch/1229497/
> then delete the lines above.

OK, I'll update.

Thank you,



--=20
Masami Hiramatsu
