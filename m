Return-Path: <SRS0=0idb=ZZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 079A3C432C3
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 03:11:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D458B206E1
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Dec 2019 03:11:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WNEu9DlX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbfLCDLp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 22:11:45 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:46813 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726142AbfLCDLp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Dec 2019 22:11:45 -0500
Received: by mail-io1-f67.google.com with SMTP id i11so1934471iol.13
        for <devicetree@vger.kernel.org>; Mon, 02 Dec 2019 19:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XOeBq8NTJnyQees1/O7Dsyz9vUFmGtTsKefvd2BETVU=;
        b=WNEu9DlXH2JDzhmnGUWP8E1dPclr7eLVOk7kqkDMRATr7aFRk1tjhmNTjXflj1jYWQ
         IR2SjXGnpd++0N6o6FEfCqWlYqQxw9DQ7cYZJtfol3De3Vz///qHWR+MOHhfn+iMf1oS
         /Mt8+5ALYd+dFnzUXgIw9RqGK4zI1Z/vytt3o2cOZycns1xD6AmYFSIN/me//xhFvb2p
         JGoWKUKBSP3VkGh+bstBqL/Taj5O4Cu1fWff+mY48+u1IcB24FPQGh46GgIilunWB4Dr
         HV42EgXo5RzwWSBEadIlPKSTrGQi9+5ucQU2C1q87bTYuWABnUCaYBlk80WDSFFtU6y9
         apag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XOeBq8NTJnyQees1/O7Dsyz9vUFmGtTsKefvd2BETVU=;
        b=op3GJwXHgTzTlfn6Vz/J5Ozla3PaVJH82bl2u1Hntc/7y5C6Z75y0xBcTfJEViKhNB
         k6Ehlks8fw59Y8K+sSc6uFvSyUzV1Nlhv+cdKXyQaony+SrEL0RBlrB5im+HiHOg7pxE
         acwdnl4IP3eqLLVmrhCKd4nzsQzH+y9jnhJ6bjahp1JohpeCf1bMINY/+WH5d0xeLPwN
         KhIUfaxrULiaxNmPKaj3nx5TKXrFWj3GZ1Js93FhyzfX5dYoffLbBoRVTSA8Dhe8UA3+
         PF6Y0x/0dlhz5YeonpFAp5SD4nCgbWqw32yLwVmnWnKZ+r20BTvDkU/zL/LqbJ2aGusT
         OX9w==
X-Gm-Message-State: APjAAAV0s2bpILkmJpcXMIQueP/7XwSONOFz3wh+0k8v2lwGlhHYIfF5
        UM+4ZcCAKzi5PoMgMzJOFKxkClzCOzqEy7Z0ghvaSw==
X-Google-Smtp-Source: APXvYqw0/gmLO11IfoRmR3xJH+l8Yv2EPBBkCt627OYn2NWTQXSYIYAozYs13O+oMGdSwI79/NJD0Kl5AjdTDEFKs5I=
X-Received: by 2002:a02:ab90:: with SMTP id t16mr3767723jan.106.1575342704169;
 Mon, 02 Dec 2019 19:11:44 -0800 (PST)
MIME-Version: 1.0
References: <20191202144524.5391-1-jun.nie@linaro.org> <20191202144524.5391-2-jun.nie@linaro.org>
 <cd0fae1a6b88a37e034876b53b350e79f58c654f.camel@pengutronix.de>
In-Reply-To: <cd0fae1a6b88a37e034876b53b350e79f58c654f.camel@pengutronix.de>
From:   Jun Nie <jun.nie@linaro.org>
Date:   Tue, 3 Dec 2019 11:11:33 +0800
Message-ID: <CABymUCOoTZ0MAmtb9O2N+KZj+XF=073C9=BxBgbL9RXwMCuuMA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: Update Hisilicon reset doc
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Michael Turquette <mturquette@baylibre.com>, sboyd@kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wei Xu <xuwei5@hisilicon.com>, opensource@jilayne.com,
        swinslow@gmail.com, allison@lohutok.net, yuehaibing@huawei.com,
        tglx@linutronix.de, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        xuejiancheng@hisilicon.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Philipp Zabel <p.zabel@pengutronix.de> =E4=BA=8E2019=E5=B9=B412=E6=9C=883=
=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8A=E5=8D=881:04=E5=86=99=E9=81=93=EF=BC=
=9A
>
> Hi Jun,
>
> I have a few questions and comments about these patches. I notice that
> the changed device trees only use the default setting. Are these new
> features something that is required for the present SoCs, or is this in
> preparation for a new SoC?

Yes, this patch set is prepared for new SoC.

>
> On Mon, 2019-12-02 at 22:45 +0800, Jun Nie wrote:
> > Document the update of Hisilicon reset operation extension.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  .../devicetree/bindings/clock/hisi-crg.txt    | 12 ++++----
> >  include/dt-bindings/reset/hisilicon-resets.h  | 28 +++++++++++++++++++
> >  2 files changed, 35 insertions(+), 5 deletions(-)
> >  create mode 100644 include/dt-bindings/reset/hisilicon-resets.h
> >
> > diff --git a/Documentation/devicetree/bindings/clock/hisi-crg.txt b/Doc=
umentation/devicetree/bindings/clock/hisi-crg.txt
> > index cc60b3d423f3..fd8b0a964806 100644
> > --- a/Documentation/devicetree/bindings/clock/hisi-crg.txt
> > +++ b/Documentation/devicetree/bindings/clock/hisi-crg.txt
> > @@ -26,19 +26,21 @@ to specify the clock which they consume.
> >
> >  All these identifier could be found in <dt-bindings/clock/hi3519-clock=
.h>.
> >
> > -- #reset-cells: should be 2.
> > +- #reset-cells: should be 3.
> >
> >  A reset signal can be controlled by writing a bit register in the CRG =
module.
> > -The reset specifier consists of two cells. The first cell represents t=
he
> > +The reset specifier consists of three cells. The first cell represents=
 the
> >  register offset relative to the base address. The second cell represen=
ts the
> > -bit index in the register.
> > +bit index in the register. The third represent the flags to operation =
type.
> > +
> > +All reset flags could be found in <dt-bindings/reset/hisilicon-resets.=
h>
> >
> >  Example: CRG nodes
> >  CRG: clock-reset-controller@12010000 {
> >       compatible =3D "hisilicon,hi3519-crg";
> >       reg =3D <0x12010000 0x10000>;
> >       #clock-cells =3D <1>;
> > -     #reset-cells =3D <2>;
> > +     #reset-cells =3D <3>;
> >  };
> >
> >  Example: consumer nodes
> > @@ -46,5 +48,5 @@ i2c0: i2c@12110000 {
> >       compatible =3D "hisilicon,hi3519-i2c";
> >       reg =3D <0x12110000 0x1000>;
> >       clocks =3D <&CRG HI3519_I2C0_RST>;
> > -     resets =3D <&CRG 0xe4 0>;
> > +     resets =3D <&CRG 0xe4 0 (HISI_ASSERT_SET | HISI_DEASSERT_CLEAR)>;
> >  };
> > diff --git a/include/dt-bindings/reset/hisilicon-resets.h b/include/dt-=
bindings/reset/hisilicon-resets.h
> > new file mode 100644
> > index 000000000000..983e42a0c318
> > --- /dev/null
> > +++ b/include/dt-bindings/reset/hisilicon-resets.h
> > @@ -0,0 +1,28 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Hisilicon Reset definitions
> > + *
> > + * Copyright (c) 2019 HiSilicon Technologies Co., Ltd.
> > + */
> > +
> > +#ifndef __DT_BINDINGS_RESET_HISILICON_H__
> > +#define __DT_BINDINGS_RESET_HISILICON_H__
> > +
> > +/*
> > + * The reset does not support the feature and corresponding
> > + * values are not valid
> > + */
> > +#define HISI_ASSERT_NONE             (1 << 0)
> > +#define HISI_DEASSERT_NONE           (1 << 1)
>
> What is the purpose of these two? Surely a reset control that does
> nothing is not useful?
>
> > +
> > +/* When set this function is activated by polling/setting/clearing thi=
s bit */
> > +#define HISI_ASSERT_SET              (1 << 2)
> > +#define HISI_DEASSERT_SET            (1 << 3)
>
> > +#define HISI_ASSERT_CLEAR            (0 << 4)
> > +#define HISI_DEASSERT_CLEAR          (0 << 5)
> > +#define HISI_ASSERT_POLL             (0 << 6)
> > +#define HISI_DEASSERT_POLL           (0 << 7)
>
> These are all zero, checking for them with an & operation in the code
> always returns false.

Thanks for pointing out this! This is a typo in the early version
patch. I made some
mistake when preparing the patch for upstream. Will fix this issue.
>
> > +
> > +#define HISI_RESET_DEFAULT           (HISI_ASSERT_SET | HISI_DEASSERT_=
CLEAR)
> > +
> > +#endif
>
> regards
> Philipp
>
