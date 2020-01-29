Return-Path: <SRS0=kwC1=3S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64BBDC2D0DB
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jan 2020 17:27:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3EFE820732
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jan 2020 17:27:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="knH7SXZ2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vURkPiIP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726750AbgA2R1l (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Jan 2020 12:27:41 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:56595 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726679AbgA2R1l (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 29 Jan 2020 12:27:41 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id BD78F21FA9;
        Wed, 29 Jan 2020 12:27:40 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 29 Jan 2020 12:27:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=A
        TygRAmR8d0jm0J6iRWxiOTnzUg+8li3NtuuF+gdI88=; b=knH7SXZ2Ky9/jgpjW
        qsSyPhtCAzEVMXmtvWjHXObc465bJai1kiB+E8W5Aq/QUk3uKBHAkUH3V4atBYND
        QjNnAHkFJwBPn/g4jMqMw+KP1wjJUM0JNowwrC9Mf7mhcJZAp8fuvEfoKKtUzTaO
        nLWlwPKeAXGmhnOXdZcg5WGG78+PuqlS+U/RNDJxBP7ziObaKUJSKUnafs2mOLyy
        RQIMgpqmWKzCiOn0fmxFNegTqBrJu1hspKKg1cqWu1E2KhDya79kZoxfxVyDPrHy
        gKEBuxVDhMRcrlkmkMTtTjCu3S0FRnfi5PUT4Qp16FMSUa3gIJpSaPDdgcAl6uz8
        mR6vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=ATygRAmR8d0jm0J6iRWxiOTnzUg+8li3NtuuF+gdI
        88=; b=vURkPiIP/F2udeKUc3p/VuDwL0RPeNtU5avUVS3mvad1nksQr/GMip53y
        AHwWpxG0tCRgwo3xTHdvEt9pedN5jcHVnki8lts9xU/INm5LeoLFdKYL2S/JrHgB
        KS53MvkfPe3K34+DfDbkEVIqW6qhUhzfxTZp6QmMyFPuMIWvkvzLWwkT5XnbHpUt
        Ngok+eOiIdSQJQyzF46DueYr0hk7hIjyUyF9o+IHHmsiJzWMU6Awiropclsaq9As
        LogLW3kVKjoMQvA2asNE4ui7xgd2u1hqSDSPvazBQbOAEc0WiSFwYCaXfS40+rOM
        nbCgCoU7hozntAaEXzgiW++vKY6lg==
X-ME-Sender: <xms:i8AxXmt5TzlnOWXJ3tqS7NdviWXw0A-TKshPlsjHp-ZG5iy1YM66ig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrfeeigdellecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggugfgjsehtqhertddttdejnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
    drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:i8AxXtSiXAirVtD8MDZwBJYybRy1nsoaSa52025S95lxc9aqZpyzVg>
    <xmx:i8AxXg7qMNQ4XXZcaqFpRtbLs-NmSYejulSIHRXCiNG_EqE0xmkDEg>
    <xmx:i8AxXkjF3QcRjtQR_z11Zzb8RbOIVYgf2QTpfgmiOaIUIrZJOqaZxw>
    <xmx:jMAxXrkr3wysvoBaE8BuFczY-AdOI0V2oEG5VbsBPv9ZRTdhuwNnIA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 8346E3280059;
        Wed, 29 Jan 2020 12:27:39 -0500 (EST)
Date:   Wed, 29 Jan 2020 18:27:38 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Chen-Yu Tsai <wens@csie.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org
Subject: Re: [PATCH 3/3] arm64: dts: allwinner: h6: Add IOMMU
Message-ID: <20200129172738.c53f5du2byreze2n@gilmour.lan>
References: <cover.b2a9e1507135d81e726fcbb65137665a7f0ab74f.1579696927.git-series.maxime@cerno.tech>
 <5320339.DvuYhMxLoT@jernej-laptop>
 <20200127142339.crxsuunzec5drfe2@gilmour.lan>
 <2140600.ElGaqSPkdT@jernej-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2140600.ElGaqSPkdT@jernej-laptop>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Mon, Jan 27, 2020 at 08:04:02PM +0100, Jernej =C5=A0krabec wrote:
> Dne ponedeljek, 27. januar 2020 ob 15:23:39 CET je Maxime Ripard napisal(=
a):
> > Hi Jernej,
> >
> > On Fri, Jan 24, 2020 at 09:54:23PM +0100, Jernej =C5=A0krabec wrote:
> > > Dne sreda, 22. januar 2020 ob 13:44:09 CET je Maxime Ripard napisal(a=
):
> > > > Now that we have a driver for the IOMMU, let's start using it.
> > > >
> > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > > ---
> > > >
> > > >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 11 +++++++++++
> > > >  1 file changed, 11 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi index
> > > > 29824081b43b..8608bcf1c52c 100644
> > > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > @@ -53,6 +53,7 @@
> > > >
> > > >  	de: display-engine {
> > > >
> > > >  		compatible =3D "allwinner,sun50i-h6-display-engine";
> > > >  		allwinner,pipelines =3D <&mixer0>;
> > > >
> > > > +		iommus =3D <&iommu 0>;
> > > >
> > > >  		status =3D "disabled";
> > > >
> > > >  	};
> > >
> > > Isn't iommu property of the mixer node? After all, mixer is the one w=
hich
> > > reads one or more framebuffers. Once second mixer is defined, would y=
ou
> > > put
> > > another iommu phandle here?
> >
> > You're right. I added it during the early dev, and forgot to remove
> > it. Thanks!
>
> Remove it or move it? I guess enabling iommu support in each driver needs=
 a
> bit more work than just referencing iommu node, right? At least in such c=
ase
> buffers don't need to be allocated by CMA, which sun4i-drm driver current=
ly
> use.
>
> I just take another look at BSP kernel and it seems that only one channel=
 is
> used for whole display stack. That would mean that both mixers would have=
 same
> iommu phandle, right? Confusingly enough, DE2 iommu channel seems to be f=
or
> deinterlace core.

To add on Robin's answer, yeah, it looks like the display engine is
called DE (and I've checked that this is indeed the master 0), while
the deinterlace is called DE2 (and probably is the master 2).

Maxime
