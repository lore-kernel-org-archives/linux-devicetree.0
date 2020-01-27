Return-Path: <SRS0=m/6z=3Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87613C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 19:04:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 582DF2467F
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 19:04:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCrKmB53"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgA0TEI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jan 2020 14:04:08 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51909 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbgA0TEH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jan 2020 14:04:07 -0500
Received: by mail-wm1-f65.google.com with SMTP id t23so7957050wmi.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jan 2020 11:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FEVoEiqONVVEfRgrb4jYFHNXvstm/3IJLIBoszrG8E8=;
        b=mCrKmB53Tc8iXS9VK6XdMGjA634XC/YrxWJI6kWx0EyRC3mlIiDUWG0YtTtscfrhJl
         HWXf5VzTITxzN1RDZ2YtEyqd3Jxvn4x7x3t9+YLslM8g6RyE1qZbIYtEfJBq2ifYlUOL
         cdhoOJuEYhdch6nOdg6OGGgvTU/DTaFZpkPydtvo0isqqYZCVwZop87i/3QM/WWtKNbq
         mTsVDJTdvECQiEV/o4uiktCZVYa420zzZqrIDRP2PyAmL/+RBo3vXuBwqYhfthZ3pkMo
         0TQ42M/jgrUCTPE9KJxjUj2X0LDA36ji0T9B0veXAckKtrpmj8ixlViguUqRueyno0VG
         j5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FEVoEiqONVVEfRgrb4jYFHNXvstm/3IJLIBoszrG8E8=;
        b=WWZ4d9IRHwuRnVyC9/F9YrmjmNMgahAA3zs+VLEtfugrK8ODSRU7JjfNn3tYpUI15r
         CmOrH9h31g73KFGgf+wHry/zfc+wUjryJGkg3RND3vPwtkHdrm5+U/T9+xKxY8FGn41d
         c1vZXBb1A/gI65HhIde9V+sMrqx4sp5Z2kjEUoUriuF0OHF7D2XCi5DpRVZ9r6QJ9gSI
         KQWbTu7aaicLzKaFrHsyAfyd95hSWUXdSfLZshyc6vQM2DM5lMhJzTM8U7UVou/9pQP3
         rXpX3LnutPiADm7QyhXKQDYftnESb4GiXzYotKkKQdQ+rNoVjDntrQ07hDx45u7h09wY
         xnfw==
X-Gm-Message-State: APjAAAX7c6Gj9RyJ+2q1LcM1g+m+pf+aNrXVS/5SnPyIrV6/GctTAouI
        mc/K7Gp4Ke5Xnk02RqQpkB8=
X-Google-Smtp-Source: APXvYqz2IG4netFWL6hQ+QROxWQ2m1AXRn8u0EXsRRZIHAxWXGl4qEsNsa1ggsEuZ+frMCNqLyEHcA==
X-Received: by 2002:a1c:a515:: with SMTP id o21mr81724wme.85.1580151845654;
        Mon, 27 Jan 2020 11:04:05 -0800 (PST)
Received: from jernej-laptop.localnet (cpe-194-152-20-232.static.triera.net. [194.152.20.232])
        by smtp.gmail.com with ESMTPSA id i8sm22085691wro.47.2020.01.27.11.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 11:04:04 -0800 (PST)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Joerg Roedel <joro@8bytes.org>, Chen-Yu Tsai <wens@csie.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org
Subject: Re: [PATCH 3/3] arm64: dts: allwinner: h6: Add IOMMU
Date:   Mon, 27 Jan 2020 20:04:02 +0100
Message-ID: <2140600.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20200127142339.crxsuunzec5drfe2@gilmour.lan>
References: <cover.b2a9e1507135d81e726fcbb65137665a7f0ab74f.1579696927.git-series.maxime@cerno.tech> <5320339.DvuYhMxLoT@jernej-laptop> <20200127142339.crxsuunzec5drfe2@gilmour.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi!

Dne ponedeljek, 27. januar 2020 ob 15:23:39 CET je Maxime Ripard napisal(a):
> Hi Jernej,
>=20
> On Fri, Jan 24, 2020 at 09:54:23PM +0100, Jernej =C5=A0krabec wrote:
> > Dne sreda, 22. januar 2020 ob 13:44:09 CET je Maxime Ripard napisal(a):
> > > Now that we have a driver for the IOMMU, let's start using it.
> > >=20
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > ---
> > >=20
> > >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 11 +++++++++++
> > >  1 file changed, 11 insertions(+)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi index
> > > 29824081b43b..8608bcf1c52c 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > @@ -53,6 +53,7 @@
> > >=20
> > >  	de: display-engine {
> > >  =09
> > >  		compatible =3D "allwinner,sun50i-h6-display-engine";
> > >  		allwinner,pipelines =3D <&mixer0>;
> > >=20
> > > +		iommus =3D <&iommu 0>;
> > >=20
> > >  		status =3D "disabled";
> > >  =09
> > >  	};
> >=20
> > Isn't iommu property of the mixer node? After all, mixer is the one whi=
ch
> > reads one or more framebuffers. Once second mixer is defined, would you
> > put
> > another iommu phandle here?
>=20
> You're right. I added it during the early dev, and forgot to remove
> it. Thanks!

Remove it or move it? I guess enabling iommu support in each driver needs a=
=20
bit more work than just referencing iommu node, right? At least in such cas=
e=20
buffers don't need to be allocated by CMA, which sun4i-drm driver currently=
=20
use.

I just take another look at BSP kernel and it seems that only one channel i=
s=20
used for whole display stack. That would mean that both mixers would have s=
ame=20
iommu phandle, right? Confusingly enough, DE2 iommu channel seems to be for=
=20
deinterlace core.

Best regards,
Jernej



