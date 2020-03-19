Return-Path: <SRS0=Rh3i=5E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD06FC4332D
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 09:55:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7929E20724
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 09:55:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="GrBHXnWz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="0PX8jKjt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbgCSJzH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Mar 2020 05:55:07 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:44331 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725601AbgCSJzH (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 19 Mar 2020 05:55:07 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 4101F788;
        Thu, 19 Mar 2020 05:55:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 19 Mar 2020 05:55:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=2zPO6pe7Ecd8t7OkrNzReoEK0xf
        bEFBsjkpF9cdVtOo=; b=GrBHXnWzLOHGJP0Y6z2aOgamjAloQ4SRGQMHKA8eYDs
        ZT7ZSTconM7dPfdl/yk3OFyxIRKicQrr3Azo50UrQTFE70tWmtbSGG6fiIRxY7Ja
        N3rlGGWAe44I9GPlbJyBGUTOpFcYdjwHRptwupF0kFnvty/smNxlZzCht6qkBpJ8
        9IEYBPqb13hIY0GvL3LpM/JrEfqil1D4vnRB0l5wIe4+ad/wm1/qRXkB99CrkPyI
        iUycqrdpO7OCaXxX2oVgufqpj0pS0nyiytvXux3mH6/DsDjJikYf0tQvGnC3DFcl
        iQtpP2eCksD8WPrj7Q+42DbyFmPkaPmQmR3vPIKmHfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=2zPO6p
        e7Ecd8t7OkrNzReoEK0xfbEFBsjkpF9cdVtOo=; b=0PX8jKjtJz4WlnIvFgxliz
        s0TeAxnIPu9Ja51kx9I3fD3HQq3hQL550Zm8TYp1Ni+eiYn1QuE9U4z9hCby5ydS
        VgEQiQBMUiy+THceYhV1g2MmpYSy0hYi9s0paAHziyrQQsnZs1w8dUnpdgcgADFm
        bWzfJxe7baJt+oAEJ3fPTcR16xRN2lC7zVmkt5TKhixTLL0bpUkAH39kQ8MKhbTr
        9GuSe4gm2BBwWVaJ0VOZlkozevB4h+5MU0a7BYyH1mEbFptu9cOhPbUXvYIiuU54
        hKEJPusdC2XzVnjBrYqEMe7m6mvlJGNBTXo5WLpO+WmztT254pySEtf/LH44HsFg
        ==
X-ME-Sender: <xms:eUFzXnyR2-f4WD3kwrcYC-51k101uP3W-RtSeZSNy2gnj2bT2_GC7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudefledguddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
    drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:eUFzXiVlx6qQTTSS5Jcr6ZTYqPR732O-RvsC8RvPcXuxesrMDc0Hrw>
    <xmx:eUFzXvZy_SLck3rGwznCpRf92PrsFTvhz99U_KWyXrcGHk7Enc1mxw>
    <xmx:eUFzXk83Q5CqM0J_fVBO5Fd9bAWeU3jlXzxgcvhDVVtTKRdZELY2Tg>
    <xmx:eUFzXvjAnEVBX-iFiGdG3pb0ym5TSEIiHQiT53Xmso92_5xvIMhTgA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 692B13061856;
        Thu, 19 Mar 2020 05:55:05 -0400 (EDT)
Date:   Thu, 19 Mar 2020 10:55:03 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: display: drop data-mapping from
 panel-dpi
Message-ID: <20200319095503.zuaant5b5zqfeitf@gilmour.lan>
References: <20200314153047.2486-1-sam@ravnborg.org>
 <20200314153047.2486-2-sam@ravnborg.org>
 <20200317084959.atqs2anx56kamrsy@gilmour.lan>
 <20200317112231.GA7981@ravnborg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mqbfokpgn5nf657v"
Content-Disposition: inline
In-Reply-To: <20200317112231.GA7981@ravnborg.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--mqbfokpgn5nf657v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 17, 2020 at 12:22:31PM +0100, Sam Ravnborg wrote:
> Hi Maxime.
>
> On Tue, Mar 17, 2020 at 09:49:59AM +0100, Maxime Ripard wrote:
> > Hi Sam,
> >
> > On Sat, Mar 14, 2020 at 04:30:45PM +0100, Sam Ravnborg wrote:
> > > data-mapping may not be the best way to describe the
> > > data format used between panels and display interface.
> > >
> > > Drop it from the panel-dpi binding so we do not start to rely on it.
> > > We can then work out how to best describe this mapping and when
> > > we know it, we can add it to this binding.
> > >
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Rob Herring <robh@kernel.org>
> >
> > I can't say whether it's the right decision or not, but if you want to
> > go forward with this, you should maintain the backward compatibility,
> > so leave the code to deal with this as a fallback solution...
>
> This was all introduced very recently and is for now only present in
> drm-misc-next.
> The idea was to revert is *before* people started to rely on this new
> mapping. So we avoid all the backward compatibility fun.
> I had hoped the revert could land before the 5.7 pull, alas that was not
> the case.

My bad, it works for me then :)

Maxime

--mqbfokpgn5nf657v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXnNBdwAKCRDj7w1vZxhR
xeJHAP9At5xT1i1Su+fYt/q5RiN5YoBB7McCxiGi7o89WXT+twEAqkn8kQYGVhOM
27371fsnrf/kDKfdvVhDvPIbZy+TsAQ=
=hfEc
-----END PGP SIGNATURE-----

--mqbfokpgn5nf657v--
