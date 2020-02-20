Return-Path: <SRS0=21hy=4I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ACABC11D0C
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 17:57:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C8B7524673
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Feb 2020 17:57:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="FSixFcAe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="0nGLSUnV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728146AbgBTR5d (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 Feb 2020 12:57:33 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:51049 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726959AbgBTR5d (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 20 Feb 2020 12:57:33 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 1A6C8A41;
        Thu, 20 Feb 2020 12:57:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 20 Feb 2020 12:57:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=wXvR2MOzGGKMeex/rwCGSt8o0uR
        MlmGZ+1htdhsNHVY=; b=FSixFcAeLhxoF0aMmTSsOSCcuHNvzK2b/uENeMaYkai
        aTwkNC+U9KiGSozW1N7u1MImfDF6vueb+FnJ9v0i+FOXWRyqIa3beGiQQuUTb5wF
        j+mA3nGrpNBKvhDr2dx1W9AKH36zVV82ZIS5NRwgNNWf7P+uokKWB3rJTiX+0TIS
        2OUslNvZYKRu7LJdn0y3IF/CXxv/CeTYOs94VGGXXdy8MhUeDyf/Q/NsmdDc58Ra
        c2s6msJhE9Z8z3pMMTv3W3LPwah7WpC5QzLSARoSJ3QKG/B1IOqtq2vI87Wm8ec5
        EFk4tkrMDWAl/ixyqkZLI2bVBMEYo0NYqHdkOryenbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=wXvR2M
        OzGGKMeex/rwCGSt8o0uRMlmGZ+1htdhsNHVY=; b=0nGLSUnVDW/VMUcgt2BawK
        xswGcY8U5iAG/QBsP+afDXx1XYg70g3XSGK7BoF6AIrw2lOxqWdcdFCZ1ar0XEkh
        9wH9zc7dVS62gKop1r9mjSLec0fjW4GeZZHpP2rI8i4E91uNmfJXa8+JwuG3l5Fx
        IKzgsF4vJyD1mhrQyXC7RxHaol54YcRScX/ROfj3tLUmGTCYLRVFJPjxoSGfj7P+
        nojvaxrIKnGY1/2b3pBOmitWda4qe20DSiAdLub8j682h671/Z5S07upvZ1A4hZa
        8bFggf+Cz+iqWPBa6GQJlLLOnrocr88SiSlqt9fpgqR25TEubCBYxfJsNqWjxmug
        ==
X-ME-Sender: <xms:ishOXlXOEgfsMi6848XIHWWUltCnrx29K_fKr55njtnzc8K9kDWZew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkedvgddutdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
    drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ishOXkWdoSgqt2HIcRZQnZ60R1ygMg4IAL1JueheI8jXmC-kte1mRw>
    <xmx:ishOXl_rN6h0hRN7zhFeYfvZnNtLPqJYIaaiAj7397by2QmGoWZ7kg>
    <xmx:ishOXkaGvA8c7M7IFtuoZ1uOLcPRgUXf1jKan9xr9FXPtZcfPPIYkQ>
    <xmx:jMhOXtESZmyQrq5gR0B_rWD0mb4JMGwh_lYgGqt-zMV3XO9XnvNuTg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id F27E63060BD1;
        Thu, 20 Feb 2020 12:57:29 -0500 (EST)
Date:   Thu, 20 Feb 2020 18:57:28 +0100
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
Subject: Re: [PATCH 2/4] dt-bindings: panel: lvds: Add properties for clock
 and data polarities
Message-ID: <20200220175728.6wuipezjp23coevq@gilmour.lan>
References: <cover.b12a054012ce067fa2094894147f953ab816d8d0.1581682983.git-series.maxime@cerno.tech>
 <620a740cec4186177ce346b092d4ba451e1420dc.1581682983.git-series.maxime@cerno.tech>
 <20200214161156.GA18287@ravnborg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jmue7eu7rmn5vtgj"
Content-Disposition: inline
In-Reply-To: <20200214161156.GA18287@ravnborg.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--jmue7eu7rmn5vtgj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 14, 2020 at 05:11:56PM +0100, Sam Ravnborg wrote:
> Hi Maxime.
>
> On Fri, Feb 14, 2020 at 01:24:39PM +0100, Maxime Ripard wrote:
> > Some LVDS encoders can support multiple polarities on the data and
> > clock lanes, and similarly some panels require a given polarity on
> > their inputs. Add a property on the panel to configure the encoder
> > properly.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> Not a fan of this binding...
> In display-timing.txt we have a specification/description of
> the panel-timing node.
>
> The panel-timing node already include information such as:
> - hsync-active:
> - vsync-active:
> - de-active:
> - pixelclk-active:
> - syncclk-active:
>
> But clock-active-low and data-active-low refer to the bus
> more than an individual timing.
> So maybe OK not to have it in a panel-timing node.
> But then it would IMO be better to include
> this in the display-timing node - so we make
> this available and standard for all users of the
> display-timing node.
>
> I will dig up my patchset to make proper bindings for panel-timing and
> display-timing this weeked and resend them.
> Then we can discuss if this goes on top or this is specific for the
> lvds binding.

That makes sense, I'll wait for them to be merged then :)

>
> > ---
> >  Documentation/devicetree/bindings/display/panel/lvds.yaml | 10 ++++++++-
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> > index d0083301acbe..4a1111a1ab38 100644
> > --- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> > @@ -90,6 +90,16 @@ properties:
> >        CTL2: Data Enable
> >        CTL3: 0
> >
> > +  clock-active-low:
> > +    type: boolean
> > +    description: >
>
> Should this be "|" and not ">"?
> Did this pass dt_binding_check?

Yes. > means that this is a multi-line string that will drop the \n
between each line, while | will keep it

For a string like this, I believe it makes more sense to let whatever
is using to handle the wrapping, but I don't really have a strong
opinion :)

>
> > +      If set, reverse the clock polarity on the clock lane.
> This text could be a bit more specific. If this is set then
> what?
> And it seems strange that a clock is active low.
> For a clock we often talk about raising or falling edge.
>
> > +
> > +  data-active-low:
> > +    type: boolean
> > +    description: >
> Same comment with ">"
>
> > +      If set, reverse the bit polarity on all data lanes.
> Same comment about a more explicit description.

I'll try to come up with something better. Thanks!
Maxime

--jmue7eu7rmn5vtgj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXk7IiAAKCRDj7w1vZxhR
xcZiAQDFmtyS5WHek/hmzjWFFwIPRkMeuRUG6dZvUn8HIDH6uQD9EvR2HxBQfUVQ
a2jdAtufNDa8xmkO5CE+KyDuJBeH6wA=
=puow
-----END PGP SIGNATURE-----

--jmue7eu7rmn5vtgj--
