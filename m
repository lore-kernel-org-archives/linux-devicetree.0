Return-Path: <SRS0=zDkl=Z2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C431EC43603
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 17:14:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 96E192081B
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Dec 2019 17:14:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UvNanVwY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727958AbfLDROx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Dec 2019 12:14:53 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:46822 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726934AbfLDROx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 4 Dec 2019 12:14:53 -0500
Received: by mail-qk1-f195.google.com with SMTP id f5so575274qkm.13
        for <devicetree@vger.kernel.org>; Wed, 04 Dec 2019 09:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LMCJWJgj3JtLM245DsTOp3ZWCRWTjxWdbv8pYKFWQio=;
        b=UvNanVwYoPSox2uGkTxpyBf4eC+CDY/BgaltnnBYqqIb6W/WoyWbLMqLV7z2ZvJYBc
         YLMRjE4InZVvGvFFMbuOx8xhrTvJEMYdrgfQsuX8ZeLix+FaLaEv4nWxP6EZsW0Ustu8
         NBdr6z/ZyVjwpHcdxsd1NU/uNytcBt92ult7JcU8p+JDx9uxTCnzzR3LeBgizrR3/DYN
         cOSDSUUkv+fNg95Y0XstjdfQ3Yzi+g8maaCsr2+lRhy7vq3hq0WzPIV35qwx73alnlvI
         9AK50TB6Vi3+IHrNkDs/GYLvHb+pOTIQ+lG5lEOVVg3vPpZ8BFGQFpPf1eoU28+kNJKf
         UcCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LMCJWJgj3JtLM245DsTOp3ZWCRWTjxWdbv8pYKFWQio=;
        b=OANCy9tgXA8ke4+bkbHnyMH+xB8fevIryeb3SMhv7ucAClNO917mFjEmGDfKEQp5TC
         Kja+gLlJHbNozYQq0lZVRZLtHnWC9iPcuGICcwZAbf6Qucyex8pzePpnQLrTbWNyAPTB
         sHvpTx1EtmVEz8sUK4xwciZMh0oPaj1w05qvuMToP2yt9nFHAifPT1ikTaqmMBjz6otZ
         Zaud5Q9gnlCMMm8He8h4Ostq+Bj3aB2KzLgcQoyOqV5/Zhc1q2LruMt4n44gLy0wkr+L
         lazOTaqcRYLsqSjw2S7331YlCJZlw7zc7hKfWmEK8kHaeTd6jSTWaJrwR/vKc1lDW8UR
         cgvw==
X-Gm-Message-State: APjAAAWKXMzL4nn86KP0ksKAsEWw4o+ObdRIP3kAgdxhzH0/7Yw5DJRE
        C+83FA912dzUWopOHe9zNyVwYSu14jYsKLo4MyQ=
X-Google-Smtp-Source: APXvYqzZhJKrlhlZi0jdcRzRDG8DgH2KxM9TDusNrmNtsb6knywymir/9J8eGnR/98T2wen2vOMQhRd+knjZ4OW7aJ8=
X-Received: by 2002:a37:9bd3:: with SMTP id d202mr4111546qke.87.1575479691736;
 Wed, 04 Dec 2019 09:14:51 -0800 (PST)
MIME-Version: 1.0
References: <20191204103940.22050-1-miquel.raynal@bootlin.com>
 <CAMdYzYrEmTqvJ6m54EADxLDf70duCtdz3pesV3EZmt67=cbs5g@mail.gmail.com> <20191204164435.2dd1b4fe@xps13>
In-Reply-To: <20191204164435.2dd1b4fe@xps13>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Wed, 4 Dec 2019 12:14:40 -0500
Message-ID: <CAMdYzYoUo_M+qEp3HRsEGrGJDa73JACfH38HG7aY6C8NrQi=5A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Describe PX30 caches
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Dec 4, 2019 at 10:44 AM Miquel Raynal <miquel.raynal@bootlin.com> w=
rote:
>
> Hi Peter,
>
> Peter Geis <pgwipeout@gmail.com> wrote on Wed, 4 Dec 2019 10:36:19
> -0500:
>
> > On Wed, Dec 4, 2019 at 5:40 AM Miquel Raynal <miquel.raynal@bootlin.com=
> wrote:
> > >
> > > PX30 SoCs feature 4 Cortex-A35 CPUs with each of them a L1 data and
> > > instruction cache. Both are 32kiB wide (PX30 TRM) and made of 64-bit
> > > lines (ARM Cortex-A35 manual). I-cache is 2-way set associative (ARM
> > > Cortex-A35 manual), D-cache is 4-way set associative (ARM
> > > Cortex-A35manual).
> > >
> > > An L2 cache is placed after these 4 L1 caches (PX30 TRM), is 256kiB
> > > wide (PX30 TRM) and made of 64-bit lines (ARM Cortex-A35 manual) and
> > > is 8-way set associative (ARM Cortex-A35 manual).
> > >
> > > Describe all of them in the PX30 DTSI.
> > >
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > ---
> > >  arch/arm64/boot/dts/rockchip/px30.dtsi | 35 ++++++++++++++++++++++++=
++
> > >  1 file changed, 35 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot=
/dts/rockchip/px30.dtsi
> > > index 1fd12bd09e83..0e10a224a84b 100644
> > > --- a/arch/arm64/boot/dts/rockchip/px30.dtsi
> > > +++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
> > > @@ -48,6 +48,13 @@
> > >                         cpu-idle-states =3D <&CPU_SLEEP &CLUSTER_SLEE=
P>;
> > >                         dynamic-power-coefficient =3D <90>;
> > >                         operating-points-v2 =3D <&cpu0_opp_table>;
> > > +                       i-cache-size =3D <0x8000>;
> > > +                       i-cache-line-size =3D <64>;
> > > +                       i-cache-sets =3D <256>;
> > > +                       d-cache-size =3D <0x8000>;
> > > +                       d-cache-line-size =3D <64>;
> > > +                       d-cache-sets =3D <128>;
> > > +                       next-level-cache =3D <&l2>;
> >
> > If the i-cache is 2-way associative and the d-cache is 4-way, wouldn't
> > that mean these two values are backwards?
>
> Which value are you referring to? Do you mean cache-sets? The following
> calculation is my understanding of the situation but it is the first
> time I am doing it so I might be totally wrong.
>
> My understanding is that if there are 32768 cache bytes made of 64-byte
> lines, so there are 512 lines in both cases.
>
> Then, if the instruction cache is 2-way associative, it means there are
> 512 / 2 =3D 256 sets. For the data cache (4-way), it would be 512 / 4 =3D
> 128. Am I wrong?

Apologies, you are correct, it was I who was mistaken.
>
> Thanks,
> Miqu=C3=A8l
