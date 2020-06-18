Return-Path: <SRS0=Lhmw=77=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D47BC433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 14:18:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 628AF20739
	for <linux-devicetree@archiver.kernel.org>; Thu, 18 Jun 2020 14:18:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQQymQmF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730477AbgFROSq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 18 Jun 2020 10:18:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728033AbgFROSm (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 18 Jun 2020 10:18:42 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21610C0613ED;
        Thu, 18 Jun 2020 07:18:42 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id t18so6253255wru.6;
        Thu, 18 Jun 2020 07:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3uCMEhUUfaA4BCjkjkjqJ0lwAEGqaqva/Z+vF0ysVdE=;
        b=KQQymQmF5Wbkg8S8i8MDHLkDMjG/q9PiP2iUcTJpXoRqdEFJe0FQrd1znujArhmW6o
         MK5o/rtOsM9v7KDzLIFTxDLsH4qesNEOyMTmX1NLElDvLbJw/S0Y2ybGkXyL7ZdPCWEJ
         3J9HPs6czZoOOwcdxC865YdI+y9BK5XnKhilPk8Ma6ZuAtdSnMerTOpN+lmntxCIasPs
         iVBsK0ZeYOwf+jqjQFD/eV1NvAISplEVkOnkKvQDbyouwtUWK8xnK3bX5uq11DLBfX7z
         BHcowOHvUsdxNrg1YJZ4AfQg5m7BsLtj4Z5OSODOA85polIz93d+YeIM/Lc8pIQCqQkB
         mYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3uCMEhUUfaA4BCjkjkjqJ0lwAEGqaqva/Z+vF0ysVdE=;
        b=M+mktYeqIQcXMlqWKEqE1BFpqCPszDLbS0y86pdhg83fHLb2gQgsRqYnDyhiCOz5v+
         sAjCsfyENH4vjLXRO75BgD9P6V3+vPIJ4gmFPXYvhKreIpGpBfXNpj9SDqP6SSUt1oPW
         8I33AF0g+04o6VvlKAPYhVWJDEqT25dKSUoTmP/R7iEiK/aUfPp2nnS7TVBzqWzVUwuc
         g8oocyssi/Ep1pqRQXAPjPOHwgaBGRo+XRRQLp6Et0Cb+LdzVz6tQ1TDTqUuNdmVBBpg
         sf9J3P9Ksz9cCrPAF/TciymNZUcSH6sRjWsFAoQp28VDxwBHOdKRHXXsDArpXlBCXeuh
         RT1w==
X-Gm-Message-State: AOAM531W5gh/ixEhbxIRc5BQ1fRTi1AW3ciA/Xzt4IQz9kdAcW+G849y
        JaqN6OUrH7diJV2MrdH+wFQ=
X-Google-Smtp-Source: ABdhPJx0S7yPB8Y6yc3E5ZfkCOSmMJY+ex4Ff1vPQ7qbfTNSq/blLK3D4NzKhA5jRZsVRkNJmUYVBw==
X-Received: by 2002:adf:9286:: with SMTP id 6mr4859013wrn.361.1592489920582;
        Thu, 18 Jun 2020 07:18:40 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id t7sm3687899wrq.41.2020.06.18.07.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 07:18:39 -0700 (PDT)
Date:   Thu, 18 Jun 2020 16:18:37 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 26/38] dt-bindings: pci: iommu: Convert to json-schema
Message-ID: <20200618141837.GC3663225@ulmo>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
 <20200612141903.2391044-27-thierry.reding@gmail.com>
 <20200618023457.GA3343853@bogus>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rQ2U398070+RC21q"
Content-Disposition: inline
In-Reply-To: <20200618023457.GA3343853@bogus>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--rQ2U398070+RC21q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2020 at 08:34:57PM -0600, Rob Herring wrote:
> On Fri, Jun 12, 2020 at 04:18:51PM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Convert the PCI IOMMU device tree bindings from free-form text format to
> > json-schema.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  .../devicetree/bindings/pci/pci-iommu.txt     | 171 ------------------
> >  .../devicetree/bindings/pci/pci-iommu.yaml    | 168 +++++++++++++++++
> >  2 files changed, 168 insertions(+), 171 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/pci/pci-iommu.txt
> >  create mode 100644 Documentation/devicetree/bindings/pci/pci-iommu.yaml
>=20
> This needs to come before you use it.

Of course, will rearrange the patches.

Thierry

--rQ2U398070+RC21q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7rd70ACgkQ3SOs138+
s6E/Bg//RRvzule+iB5OmSwtBkbTLAFMGY0VImkZFaBaLIn6krNmYE5NLg4naT7i
9TYu5tpBj/FyPHA/CtkoZ2yAIZNzYrB3UoBaK1eTJNWpVAmwvxzDTCRcl+moDunX
CZ3braHx0qlTNTMw7xMpJRqHaahmGF/IVmb58XIKhDZWo3d8W66BNK+4dm3xL4cH
/PEaA080/3EkKtNURgFABJ0ygpDIFkho0WghFBQ8qlLv+y9DUv8BkdIpybawN6QI
v2cFKs8LZJlm5SO0KdSr/3epqBnGtSpqoprP/3zQ/B5hplm/G2cEfm/mlMu3U7YD
3+vVjlVnjH6MPJmucr15MyiKjN7jzQcs5fXMyHR51efSgSJGFU3B5Gcrt/0ldK9V
064nbvpUCiOpdTAbADvrkm+hM47Dp5SXiZM1R2MkdcacTD3s2V8Wx8xQXs+zE3Nm
vx5od4iKb4rSQ5DhE5LQWRBuJHcpJ/VB7+f9Xwr319bMfFo0Oz+gFquDgdrdnE/z
5UGlqo1rHt+haYUTFUzMJzHaOWxe0PW1gR3d/yN8YKr/A+MKaaOApblIraVmqj2S
RXyAeNLLtN504MBbB0HygQ1LCEE+DhaGq3S4MqfE1jBvnuJVzcaSpu/H12++4Oze
0M1Rr6PVfr81kbpcpyGA+bvoSCuA9dSVLDBrVD5VJM+c67wn6IY=
=hFVF
-----END PGP SIGNATURE-----

--rQ2U398070+RC21q--
