Return-Path: <SRS0=wLM1=AN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A32C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jul 2020 16:23:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3AC1720760
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jul 2020 16:23:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="KjbaAm6D";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AopDICZB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgGBQXL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Jul 2020 12:23:11 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:40937 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726140AbgGBQXL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Jul 2020 12:23:11 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 802FF93B;
        Thu,  2 Jul 2020 12:23:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 02 Jul 2020 12:23:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=fWO7XswU/JLsaUvFIet2Z+fniQp
        OPudyqYrM+Tzu6z0=; b=KjbaAm6DFxbgwCB7evinnRr6X77l9l8ts0LQjPug4ue
        FhNUFPC5OLef9dMnHbKj5hOBVLuoBXHh2fqOYVyyPeujFTIptZsNSTzDNja/AfQ5
        L2xPDg5wJX4pQVFPlZgCdXFXQ2lrZg6XkO2sg04M8/Iypy+2ycQIH33aZr+hW7ny
        mNTYlBiD6UQfh4ooyenRPa3u6KrNUUY8RLlT8S0Ouh/mULw+KKW4jbFxejI/FSSv
        WxFbCsD33bfWx9mWJvlmY0LIBB4IdG0bHwnr8vN1fEkd6OM0l7FcB9YPARXpOoLV
        bYOT/4LqxZtdnAMLggPfIaXkbXbGckxbUr684wRpPow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=fWO7Xs
        wU/JLsaUvFIet2Z+fniQpOPudyqYrM+Tzu6z0=; b=AopDICZBJaq3haB+E+v63r
        cxDtz5WqsgbDSWkDxdq3NMxK7TJfElYOIooHEfacsn/3xWPFphymu+PSjpGv7Glj
        EGxQL5Djrom97CeMnIGPXln2syR4VjLTFHGGQpthEoideCW1g/cur/RS7OIDqyi8
        sLxyp4yu3VCMqC8MS21A01IPtfDUW/lFfkc5uz/rlwHJQu6Mlex0gLvrRIe9l9p6
        h5pt5CBkccI+66RSX291DoH0nlxEWLRZSwhOv+oy7GBizQUSnfNmU+ZT66ztvS3Y
        YkpywrdwVAKfvn2f9BPiD9r/LmyJNpdEMCQvuFdBTODhgRwcxmAiHb8FyLW1blJw
        ==
X-ME-Sender: <xms:7Qn-XpqjWegoLIJ-Oh66awIcVrIrL5Ex4RZAnin6YqAbEGUOrbPrsQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrtdeggdelgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleffgfej
    vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdeikedrje
    einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgr
    gihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:7Qn-XrogFR2Qx36JyPvQKp1fBezn8SB_659E07JAKzZRSJtYrlioLw>
    <xmx:7Qn-XmNjPsx2WsZzEdte4cNiaIFj7fGyi0RBZHbuVuqDLN3ntkgo1w>
    <xmx:7Qn-Xk6vAsLwGjWAcFG7Gj-qKmA6RWAsAl9RZfGfU11VV0-L49LxGw>
    <xmx:7gn-XoFNjQcZph9vZ9LX4MmPoMGiSiNVnQ47EOHGkZpD7gyqUjZTCw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6F4543280067;
        Thu,  2 Jul 2020 12:23:09 -0400 (EDT)
Date:   Thu, 2 Jul 2020 18:23:07 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: Warning coming from raspberrypi,bcm2835-firmware.yaml
Message-ID: <20200702162307.bg5s6qldlrgraai6@gilmour.lan>
References: <CAOMZO5B0DNuFfgYsiMLRg3eTvt7NsrvyznidwQzgQc=L_ThAxQ@mail.gmail.com>
 <20200702143213.3ep7ol52wjgtfio3@gilmour.lan>
 <CAOMZO5DUe-qJL08iv7zw_Pj7mBTr211SWynm8UtUR6A7dbtExw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tyzr7idkns6qlojq"
Content-Disposition: inline
In-Reply-To: <CAOMZO5DUe-qJL08iv7zw_Pj7mBTr211SWynm8UtUR6A7dbtExw@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--tyzr7idkns6qlojq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 02, 2020 at 01:20:28PM -0300, Fabio Estevam wrote:
> Hi Maxime,
>=20
> On Thu, Jul 2, 2020 at 11:32 AM Maxime Ripard <maxime@cerno.tech> wrote:
>=20
> > I've sent a patch for it
> >
> > https://lore.kernel.org/linux-devicetree/20200626115433.125735-1-maxime=
@cerno.tech/
>=20
> Thanks. Yes, this fixes the warning in
> Documentation/devicetree/bindings/soc/imx/fsl,aips-bus.yaml
>=20
> BTW, there are still warnings coming from bcm2835-firmware.example.yaml:
>=20
> $ make dt_binding_check
> DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/arm/bcm/raspberrypi,b=
cm2835-firmware.yaml
>   CHKDT   Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-f=
irmware.yaml
>   SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.yaml
>   DTC     Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-f=
irmware.example.dt.yaml
> Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.ex=
ample.dts:23.37-26.15:
> Warning (simple_bus_reg): /example-0/firmware/clocks: missing or empty
> reg/ranges property
>   CHECK   Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-f=
irmware.example.dt.yaml
> /home/fabio/linux-next/Documentation/devicetree/bindings/arm/bcm/raspberr=
ypi,bcm2835-firmware.example.dt.yaml:
> firmware: $nodename:0: 'firmware' does not match
> '^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
> /home/fabio/linux-next/Documentation/devicetree/bindings/arm/bcm/raspberr=
ypi,bcm2835-firmware.example.dt.yaml:
> firmware: '#address-cells' is a required property
> /home/fabio/linux-next/Documentation/devicetree/bindings/arm/bcm/raspberr=
ypi,bcm2835-firmware.example.dt.yaml:
> firmware: '#size-cells' is a required property
> /home/fabio/linux-next/Documentation/devicetree/bindings/arm/bcm/raspberr=
ypi,bcm2835-firmware.example.dt.yaml:
> firmware: 'ranges' is a required property

Yes, as mentionned in the patch above, we can't fix that without changing t=
he binding.

Maxime

--tyzr7idkns6qlojq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXv4J6wAKCRDj7w1vZxhR
xRMzAP9RNiSYrj++YIprm3y++IxHHUSfZHYgq+JMvnSEJGAqOAD/fPC/O1SpAeqr
79IxRs+mF1DNCKgwjd0Opc+lQispEwc=
=rjow
-----END PGP SIGNATURE-----

--tyzr7idkns6qlojq--
