Return-Path: <SRS0=m/6z=3Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E9E6C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 12:49:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EB35E20716
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jan 2020 12:49:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJygLHS9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729923AbgA0MtJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jan 2020 07:49:09 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39109 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726145AbgA0MtJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 27 Jan 2020 07:49:09 -0500
Received: by mail-wm1-f65.google.com with SMTP id c84so6926124wme.4;
        Mon, 27 Jan 2020 04:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lmAtq4HOjSqSOjIOlNqUlSEH7PPPQnmI6LnjBYqNz/M=;
        b=GJygLHS9wZXEOSjP1k//SHrVi5Oo30hOS2NDNGsBv1s9vTkRFuRPGawmcL/MJZKIgF
         zgrPt7LGQSqDI5y3qQA6ihafC+9kDPdUhDZyjz5WNUtK6Y1Jqwawmkyu8kktp5bV4Lmh
         YAP8zCzATbU0/GmaFMbwcYvjhurUc80JI+t3IWVkLBwH7g39wgEYrIkEgve/OVTRI9t0
         s7BUjMt3orDADLKW3cmiY4B3SZI3YM+HVGpPq9Q+n4lPvTNBut66c0n6/sFcw7JdQ40p
         DHbHVLyAsFZEU08H3W83fXBgRhwNhaJ92uEAzdWvZScVSRT/nyTuRQvsc5jgl6nYDDHo
         u5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lmAtq4HOjSqSOjIOlNqUlSEH7PPPQnmI6LnjBYqNz/M=;
        b=N9yxUzsu7mGSjUJt2oQvG4HP/rOmr2uekNGIJYd1Ru4HhJMDj0qa0tJVJ4EB8xQuE4
         DHnvbiWTz3nprwOQmJjSOi9B6q1BxDki8waMqb8tWa7NdDKpxiHgyHpsDlqFiH861iEG
         rufbzpE65IoWJsjzj3hM1UalRJNh4ZMswqAdezx//3AZpKdebSI/EiR7JiRaeMlqT+Qj
         t4VFRa4n7MpRKMeb69h/+wXxN6rC9opTrcghw6qRhAdLiewAGJhhlCxflvgLczYxNg7C
         SAiRG6K9wnshUEpqhSjIvhH0rRz1DtQbGLvY5WOQTXFJ/RuRnkjmLE5sfvZD7g/Vj1AM
         1Qug==
X-Gm-Message-State: APjAAAUeSxUluEvVf2KiSDXTOlP3xPCP6VfdCm1u+BgLJKnYy1uTcEtZ
        q5R/Kk5v5/gP8QMmDkudqas=
X-Google-Smtp-Source: APXvYqw5Ok2iiE6coMU27c24WPAuZNzwexyQ3VPNaKvVvYhnng2mWiYApazNOmfW0LpyZDEtpV6Xnw==
X-Received: by 2002:a1c:4c10:: with SMTP id z16mr13513432wmf.136.1580129346183;
        Mon, 27 Jan 2020 04:49:06 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id y12sm6540003wmj.6.2020.01.27.04.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 04:49:04 -0800 (PST)
Date:   Mon, 27 Jan 2020 13:49:03 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [RFC 2/2] dt-bindings: firmware: tegra186-bpmp: Document
 interconnects property
Message-ID: <20200127124903.GB2117209@ulmo>
References: <20200114181519.3402385-1-thierry.reding@gmail.com>
 <20200114181519.3402385-2-thierry.reding@gmail.com>
 <7aefac6c-092c-b5a6-2fa6-e283d2147fc3@linaro.org>
 <20200120150605.GA712203@ulmo>
 <57c37b3c-1473-d444-db59-8c6650241188@gmail.com>
 <20200121141027.GE899558@ulmo>
 <83d94918-bc01-131b-924c-9750767d3b29@linaro.org>
 <20200121155432.GA912205@ulmo>
 <ffc22502-0e7e-522c-543d-0e74cc25f4b1@gmail.com>
 <853bb7bd-8e04-38ac-d0d6-a958135a49be@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="XF85m9dhOBO43t/C"
Content-Disposition: inline
In-Reply-To: <853bb7bd-8e04-38ac-d0d6-a958135a49be@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--XF85m9dhOBO43t/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2020 at 12:56:24AM +0300, Dmitry Osipenko wrote:
[...]
> Thinking a bit more about how to define the ICC, I'm now leaning to a
> variant like this:
>=20
> interconnects =3D
>     <&mc TEGRA186_MEMORY_CLIENT_BPMP &emc TEGRA_ICC_EMEM>,
>     <&mc TEGRA186_MEMORY_CLIENT_BPMPR>,
>     <&mc TEGRA186_MEMORY_CLIENT_BPMPW>,
>     <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAR>,
>     <&mc TEGRA186_MEMORY_CLIENT_BPMPDMAW>;
>=20
> interconnect-names =3D "dma-mem", "read", "write", "dma-read", "dma-write=
";
>=20
> Looks like there is a problem with having a full MC-EMEM path being
> defined for each memory client.. it's not very practical in terms of
> memory frequency scaling.
>=20
> Take Display Controller for example, it has a memory client for each
> display (overlay) plane. If planes are not overlapping on the displayed
> area, then the required total memory bandwidth equals to the peak
> bandwidth selected among of the visible planes. But if planes are
> overlapping, then the bandwidths of each overlapped plane are
> accumulated because overlapping planes will issue read request
> simultaneously for the overlapping areas.
>=20
> The Memory Controller doesn't have any knowledge about the Display
> Controller's specifics. Thus in the end it should be a responsibility of
> Display Controller's driver to calculate the required bandwidth for the
> hardware unit, since only the driver has all required knowledge about
> planes overlapping state and whatnot.

I agree that the device-specific knowledge should live in the device-
specific drivers. However, what you're doing above is basically putting
the OS-specific knowledge into the device tree.

The memory client interfaces are a real thing in hardware that can be
described using the corresponding IDs. But there is no such thing as the
"BPMP" memory client. Rather it's composed of the other four.

So I think a better thing to do would be for the consumer driver to deal
with all of that. If looking at only bandwidth, the consumer driver can
simply pick any one of the clients/paths for any of the bandwidth
requests and for per-interface settings like latency allowance the
consumer would choose the appropriate path.

> The similar applies to multimedia things, like GPU or Video Decoder.
> They have multiple memory clients and (I'm pretty sure that) nobody is
> going to calculate memory bandwidth requirements for every client, it's
> simply impractical.
>=20
> So, I'm suggesting that we should have a single "dma-mem" ICC path for
> every hardware unit.
>=20
> The rest of the ICC paths could be memory_client -> memory_controller
> paths, providing knobs for things like MC arbitration (latency)
> configuration for each memory client. I think this variant of
> description is actually closer to the hardware, since the client's
> arbitration configuration ends in the Memory Controller.

Not necessarily. The target of the access doesn't always have to be the
EMC. It could equally well be IRAM, in which case there are additional
controls that need to be programmed within the MC to allow the memory
client to access IRAM. If you don't have a phandle to IRAM in the
interconnect properties, there's no way to make this distinction.

Thierry

--XF85m9dhOBO43t/C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4u3D0ACgkQ3SOs138+
s6HVrBAAllY6XJC31bhcQOTy/PNyJWwKHz2AnxUe9HMT1NoaptLoUI4sxrXeQuu6
g/ArOcievZlMJ+oF89YqsAV0zS2Xpk2cSRvlPr2j2yXr2s5Aj9glvD0Yd+yR3O4u
NgKlRezSZ2R6ZUPMiCF4YzyQ+rA43Hb+oyTxZfin9cLoL6VZOx0qLaMf/L5CqJaZ
3OrDjmF7eS4Haf+SSY8ja6qAJj+vMiscV+8eo3VXP+QShErD7XTXNUf3a2oEbRFV
RX/eqGvXSZCmvLyFKZSHg7eLsOCLLhSJrMPP1Uzz7Er3ipBLuY8LSsWDe4NWX7qi
d/9WCsjiQ7Uvi6r+ZajkfdYmzru7vjn8Xy6ne/TMFKcVmDTe5hQ3TehVhuUMhrrS
ZG8uRlx3Tn6Pb9Uxfw6HrHBlabLF96mPJdfqjSenu5A27tadrfje/n4yOjoZ3HtW
/qoEqRlFcdoLy89Ep2qAJKaOm2a2ZjH3hvlPsg7tnJHlCDpnFWqvE7ZWachzTKzW
3QPe/8FcIsNUggolflUFpKyH2S4t+wi0/wvb6viRsAQEm8gRK/7seHyDj912gk07
lSk3ZvPxEpqBwZyov+3FHUp2xa1tRte58L8InrHkpGNdvb66nl/wxDsRiQLb83ZF
Tw0hwdxFblMAhf+WQKrHhL9qPXUxIgYN5tX68puvBZKhByXPuMw=
=jzAi
-----END PGP SIGNATURE-----

--XF85m9dhOBO43t/C--
