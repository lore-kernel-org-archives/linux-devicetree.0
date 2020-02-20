Return-Path: <SRS0=21hy=4I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF08C11D0C
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 18:00:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AC5E124673
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 18:00:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="xROZRlrv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JhT8mtKH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728415AbgBTSAP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 Feb 2020 13:00:15 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:41075 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727298AbgBTSAP (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 20 Feb 2020 13:00:15 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id B66DD56C7;
        Thu, 20 Feb 2020 13:00:13 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 20 Feb 2020 13:00:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=3iVZpI1OxXxQS2+5cTW4IrNcV5c
        F9OxDP+rQ8UJEwO8=; b=xROZRlrvRLpbuKTf7VVAF515Y3a3vu7WPZ7jx0QgY6F
        tvZAHye/3hKTvCHKfHoz6SDsGab9+J4J6C4dmLzEdqFW5XT1YyONXJQb0SrI5myB
        pMJOn6wCcO8pnyDEGyPwLa1zEN0osN1ECGqUa+Hf5AJNxYgyP3PNGW4yU8JOSrIb
        WgCvL02SkA0ZukAYD4YbQjxzRCDmQILIhJ2ZnWeVZZ7ZkH2utSZ7+kOGelXV+rqD
        kMzAx3cZ2sKybmJaji6baVN3//M8HQy27x0nyAM/x3aKPXgTubCmXzFqvY1C8Bgi
        ++fAJoBKlIy6uFRAryEIHTHkmvS+mfflUJIL4mLA1UQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=3iVZpI
        1OxXxQS2+5cTW4IrNcV5cF9OxDP+rQ8UJEwO8=; b=JhT8mtKHS1kel2Jve1v6Cm
        tzEFJQmKFJLY2lXkDtCG5h8CIYx48fcHj9gfzYyyNzIFfQZmqH0sdAERvmQsTyl2
        Q3BtlHbbGV8dT21vB9nGQcHKmopPktYTeGsNEWCfmzFRiAdK3xL8RM/DkpPYOI0N
        VYv+0la9bb4e7vgljOAdrrMf6pjWH9drLsFrHOvvcJhvICkdISEt5eWEtw5KmOOO
        te2GMzaTzNqNu6XdLrPblyrW3w//ReNcdWATBsBodhkt/j7gnB9lCXbwW3fPiv08
        x4AoYMIiJHShR9XIoLAxzZnCaGnNuE6+FL7BpSmZMryzE11IkG+WD+eyTmqEOUOQ
        ==
X-ME-Sender: <xms:KclOXglDO_oxqApfDRUGzu17fuwLMsP6-OANHX6HAg7BeUDIYBttuQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkedvgdduuddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
    drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:KclOXnSYkxXSwxoSDl7CV6KgxF34YCtKGpbSXUkQaJtRori60SgNkw>
    <xmx:KclOXsApPiLw8ZwHDPH49U7BUCGT8NsqBUrhvj1Cr4Kcq_4Nkgk-hA>
    <xmx:KclOXmTKxFPmLQeR09YROPaScynFunYEZgqLKM5L0yaesI-J4erFPw>
    <xmx:LclOXrHApIyF1i4BfvXVZ7k3EqIpb0XQ3AubpxKTGEe90K3CWTlgUg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 92F9A3060D1A;
        Thu, 20 Feb 2020 13:00:09 -0500 (EST)
Date:   Thu, 20 Feb 2020 19:00:08 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] drm/connector: Add data polarity flags
Message-ID: <20200220180008.mfl2pfcea6rafmt5@gilmour.lan>
References: <cover.b12a054012ce067fa2094894147f953ab816d8d0.1581682983.git-series.maxime@cerno.tech>
 <b541006fa0a1c34ac5f668dc561aa1598f8fd86c.1581682983.git-series.maxime@cerno.tech>
 <20200214161359.GB18287@ravnborg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="djjcychys4abfub2"
Content-Disposition: inline
In-Reply-To: <20200214161359.GB18287@ravnborg.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--djjcychys4abfub2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 14, 2020 at 05:13:59PM +0100, Sam Ravnborg wrote:
> Hi Maxime.
>
> On Fri, Feb 14, 2020 at 01:24:38PM +0100, Maxime Ripard wrote:
> > Some LVDS encoders can change the polarity of the data signals being
> > sent. Add a DRM bus flag to reflect this.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  include/drm/drm_connector.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > index 221910948b37..9a08fe6ab7c2 100644
> > --- a/include/drm/drm_connector.h
> > +++ b/include/drm/drm_connector.h
> > @@ -330,6 +330,8 @@ enum drm_panel_orientation {
> >   *					edge of the pixel clock
> >   * @DRM_BUS_FLAG_SHARP_SIGNALS:		Set if the Sharp-specific signals
> >   *					(SPL, CLS, PS, REV) must be used
> > + * @DRM_BUS_FLAG_DATA_LOW:		The Data signals are active low
> > + * @DRM_BUS_FLAG_DATA_HIGH:		The Data signals are active high
> Reading the description of these falgs always confuses me.
> In this case if neither bit 9 nor bit 10 is set then the data signals
> are netiher active low nor active high.
> So what can I then expect?
>
> We have the same logic loophole for DRM_BUS_FLAG_SYNC_SAMPLE_POSEDGE
> and DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE.
> So it is not new, but can we do better here?

Honestly, I don't really get it either. I *think* this is to handle
the sampling / output inversion properly which wouldn't be possible if
this was only a bit set or not.

Maxime

--djjcychys4abfub2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXk7JKAAKCRDj7w1vZxhR
xQxeAPwLFn41l30eKqukNP84sFPMXbLHQVADj+Faro+XxhjBGQEA4Y58gz6z1NXr
ic+uREN12TeqDmmfkPeNrnAd17ffFQ8=
=EVQZ
-----END PGP SIGNATURE-----

--djjcychys4abfub2--
