Return-Path: <SRS0=wLM1=AN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F17ACC433E0
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jul 2020 14:32:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9D3C20899
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jul 2020 14:32:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="HVJ1SQOV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JYRsk+OO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729822AbgGBOcT (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Jul 2020 10:32:19 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:59249 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728179AbgGBOcS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Jul 2020 10:32:18 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id A80EE10C5;
        Thu,  2 Jul 2020 10:32:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 02 Jul 2020 10:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=qqI5aRFRVI9tywsw+l0Nfy6wHfI
        Y8H8ndBqXGYZyMGY=; b=HVJ1SQOVQa/OWlAGx7xTUxOOTJRndRFbdBoYtkaSALH
        eZ92ygzlT3cfAknm5LQgM9a3Vu+4Gqwc4rsto7EIIbgrgptCSC+ZZOT6qzqUSCE6
        EE0tNPnrQWL0OHdSWCrla7fuU1zDr4H7FMfFOYw5CZjyxrNNRoxrZpInxTR82g7Q
        kuQ4N1ZgjqzwCTWc35kx0TQUeHrxF4GKISBZE1tk/ye7CSz9iUNLeF7AnRhnwcCW
        32jg+0qrwaB5zpDVgSMTvpGQwDsbKX9uOqDcMwx/ynPGP6QoVgUP7XS0OZI6f5dh
        BratAuGkHWbzS+Yz+0tgJ8MgvjyW6tQqQW0zl8G7Pxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=qqI5aR
        FRVI9tywsw+l0Nfy6wHfIY8H8ndBqXGYZyMGY=; b=JYRsk+OO0+JCbce5CEpr+m
        hVdPvZebaP8shvkml36pE/VuRP9aVvg51UPXn2yiyarmjWD38XDX1rtQcNBHdDpf
        WhCDo/KVZXuUNz+XtU9j2j4OLimECR6V9QzscQPY/GlGrtd/Jx7XDPxZKUuu/C2c
        ViztgFMcoaVbVedyPK+sZSMWxFnLz31uJDnqSl68OXEB3VOOgaL6lEwlz1FBrjkJ
        1WPjrMOeQpNEmIi1QWFli3g4buPWf7PfsNl0DyGXlexdqnojfTGNl9WaiFYpI/nr
        7xPNSzXIf76+0mtfRSVLoIhV0NgBvkUKYWwDSCCu7/yo/v0uJom8pOXBqcFZ/wMg
        ==
X-ME-Sender: <xms:7-_9XpnqcT6zDfXMMgP2DGWOsw77NCpC7nvgUJ2PH3tSdpA1Bx6aAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrtdeggdejvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleffgfej
    vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdeikedrje
    einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgr
    gihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:7-_9Xk11SCrQNxonEh5WCCT2Y_DrHzQS6lpVG_TP5uTzzu_5uLvTag>
    <xmx:7-_9Xvp3mfq1NLa5Esdl76z0QHScUwJZ48yeqyTgDQmGaR7pvnmI8A>
    <xmx:7-_9XpkdfkD85-n4aVSHFzSQieZMtxFDB5ArWrHxAnocNy9j5a-Hgw>
    <xmx:8O_9XlAUqoswQdjHd6TutIdOBBLw8DMsol5yusQ-mv7xJ_DZ05F3wQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 46B493280060;
        Thu,  2 Jul 2020 10:32:15 -0400 (EDT)
Date:   Thu, 2 Jul 2020 16:32:13 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: Warning coming from raspberrypi,bcm2835-firmware.yaml
Message-ID: <20200702143213.3ep7ol52wjgtfio3@gilmour.lan>
References: <CAOMZO5B0DNuFfgYsiMLRg3eTvt7NsrvyznidwQzgQc=L_ThAxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vhs7mg3tfva6rl7e"
Content-Disposition: inline
In-Reply-To: <CAOMZO5B0DNuFfgYsiMLRg3eTvt7NsrvyznidwQzgQc=L_ThAxQ@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--vhs7mg3tfva6rl7e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Fabio,

On Thu, Jul 02, 2020 at 11:00:25AM -0300, Fabio Estevam wrote:
> Hi Rob,
>=20
> I am getting the following warning on
> Documentation/devicetree/bindings/soc/imx/fsl,aips-bus.yaml:
>=20
> Documentation/devicetree/bindings/soc/imx/fsl,aips-bus.example.dt.yaml:
> bus@30000000: compatible:0: 'raspberrypi,bcm2835-firmware' was
> expected
> Documentation/devicetree/bindings/soc/imx/fsl,aips-bus.example.dt.yaml:
> bus@30000000: 'mboxes' is a required property
>=20
> If I change raspberrypi,bcm2835-firmware.yaml like this the fsl,aips
> warnings is gone:
>=20
> --- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmw=
are.yaml
> +++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmw=
are.yaml
> @@ -14,7 +14,6 @@ properties:
>    compatible:
>      items:
>        - const: raspberrypi,bcm2835-firmware
> -      - const: simple-bus
>=20
>    mboxes:
>      $ref: '/schemas/types.yaml#/definitions/phandle'
> @@ -48,7 +47,7 @@ required:
>  examples:
>    - |
>      firmware {
> -        compatible =3D "raspberrypi,bcm2835-firmware", "simple-bus";
> +        compatible =3D "raspberrypi,bcm2835-firmware";
>          mboxes =3D <&mailbox>;
>=20
>          firmware_clocks: clocks {
>=20
> What is the proper way to fix this issue?

I've sent a patch for it

https://lore.kernel.org/linux-devicetree/20200626115433.125735-1-maxime@cer=
no.tech/

The faulty commit is in the clk-next branch, so the fix should go through t=
here but hasn't been
picked up yet.

Maxime

--vhs7mg3tfva6rl7e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXv3v7QAKCRDj7w1vZxhR
xdO0APwNPl+g69+szS87EkL6Sdu6UK20QNqr1DAhQdu1+nXsIAEA8KGRcxiVMY8a
ANI8VeJpf5vIjnn0KyACL57YyDvBQwg=
=2pxu
-----END PGP SIGNATURE-----

--vhs7mg3tfva6rl7e--
