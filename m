Return-Path: <SRS0=YUp6=BH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B5FC433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 02:01:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E00720714
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jul 2020 02:01:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="euyrUyjG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbgG1CBj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jul 2020 22:01:39 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:40714 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbgG1CBj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jul 2020 22:01:39 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06S21J05028510;
        Mon, 27 Jul 2020 21:01:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595901679;
        bh=/DEzhGCZ80qo2cNy8CvwVXA12uEz5BdlSDpo13GOpcs=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=euyrUyjGe8/fGfpXrN4FyI26Xr+uTxZRNTyez7MgDq2zr8N9IYeO+kU/WrnIKqP7p
         B1cVFJGFGaX/3SEx2aiihZ572cISVhvvzICxPX4ikZ9ssdtJYNnRQclDXv1A1FU35z
         JivNqoL0NqoSrbxWM5crDHdOJmTBDJLpvdesJYfU=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06S21JWl035015
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 27 Jul 2020 21:01:19 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 27
 Jul 2020 21:01:18 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 27 Jul 2020 21:01:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06S21IIt037251;
        Mon, 27 Jul 2020 21:01:18 -0500
Date:   Mon, 27 Jul 2020 21:01:18 -0500
From:   Nishanth Menon <nm@ti.com>
To:     Lokesh Vutla <lokeshvutla@ti.com>
CC:     Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tero Kristo <t-kristo@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>
Subject: Re: [PATCH v4 00/10] irqchip: ti, sci-intr/inta: Update the dt
 bindings to accept different interrupt parents
Message-ID: <20200728020118.4htkwg2ge4xdiyg6@akan>
References: <20200725163700.20583-1-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7hchlkj56sfzpj2v"
Content-Disposition: inline
In-Reply-To: <20200725163700.20583-1-lokeshvutla@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

--7hchlkj56sfzpj2v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 22:06-20200725, Lokesh Vutla wrote:
> Lokesh Vutla (10):
>   firmware: ti_sci: Drop the device id to resource type translation
>   firmware: ti_sci: Drop unused structure ti_sci_rm_type_map
>   firmware: ti_sci: Add support for getting resource with subtype
>   dt-bindings: irqchip: ti,sci-intr: Update bindings to drop the usage
>     of gic as parent
>   dt-bindings: irqchip: Convert ti,sci-intr bindings to yaml
>   irqchip/ti-sci-intr: Add support for INTR being a parent to INTR
>   dt-bindings: irqchip: ti,sci-inta: Update docs to support different
>     parent.
>   dt-bindings: irqchip: Convert ti,sci-inta bindings to yaml
>   irqchip/ti-sci-inta: Do not store TISCI device id in platform device
>     id field
>   irqchip/ti-sci-inta: Add support for INTA directly connecting to GIC
>=20
>  .../interrupt-controller/ti,sci-inta.txt      |  66 --------
>  .../interrupt-controller/ti,sci-inta.yaml     |  98 +++++++++++
>  .../interrupt-controller/ti,sci-intr.txt      |  82 ---------
>  .../interrupt-controller/ti,sci-intr.yaml     | 102 ++++++++++++
>  MAINTAINERS                                   |   4 +-
>  drivers/firmware/ti_sci.c                     | 155 ++++++++----------
>  drivers/irqchip/irq-ti-sci-inta.c             |  95 +++++++++--
>  drivers/irqchip/irq-ti-sci-intr.c             | 152 ++++++++++-------
>  include/linux/soc/ti/ti_sci_protocol.h        |  13 ++

For the firmware related changes:

Acked-by: Nishanth Menon <nm@ti.com>

I assume you will take care of the comments from Rob for the yaml
conversion and get his ack as well.

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D

--7hchlkj56sfzpj2v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAl8fhtEACgkQ3bWEnRc2
JJ2GEw/9HDbBuK5t72A525ISoKmGLOeMFChcqWHDVeMCKfdiClctQbtx2eBnxnjR
3gdv8ysT+7Ps2Hft9rJswrK9Cj/nZEz+0q07wQCKCvRI9WHXAUObEzl/vk8KL14n
0C/RYjtEglWYdYA/AdY1r7h2m7+71vNLi9wB9CPU8Ia7Uq8Hr23BenGtXOWhgeYH
T+iOdjlai2jOj5HgzUWyNOTkfncBuy152U2x8VYvkJf+fEFYMVEEw0I5HGM2P8r9
bpdorQej+UGEQviw8ATvcnT4V27QCHPcOuBeb8QROJGUxEs6r54fAESPU97krK4S
RE7TPLBmUl/tCIQnb6s0JMCZKDWaZCjImyzILX7H34H/bMN13ypFxs0xJOAgtfpe
GN3EpFEAHuXEXFkHr4tSaDHVQjAiLaCCl6kD5otscc/g7d/c+ZxX4zNIqs+QO1Zw
oYNSyCXtDv08Eb0ejSLkZVBSOgNACgzCfvSU7JrsXhOJnuxpQiBaWHi05INcSvJ2
bnpMxf2LPeQ8Q7ruM+ILQjBIVYDIl28zZiURudsAt1g1Q+xuY6fyjMItWzZAOmBu
ln+aLJla36XDfG8UtnTolawHn7LhSEICmOGdqAiQSqXZeCj2dVqpQ80MEbbfLfNB
RCqOzzMoLXR1JbGJzApU9f/o+0n9HzruTpPeMHqqEmrZ9mSIqRA=
=Y44g
-----END PGP SIGNATURE-----

--7hchlkj56sfzpj2v--
