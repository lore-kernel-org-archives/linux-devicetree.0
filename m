Return-Path: <SRS0=kwC1=3S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC1E0C33CB2
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jan 2020 09:36:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9DCBF2071E
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Jan 2020 09:36:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EAk8gMAE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbgA2JgH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Jan 2020 04:36:07 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53724 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbgA2JgH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 29 Jan 2020 04:36:07 -0500
Received: by mail-wm1-f66.google.com with SMTP id s10so5426074wmh.3;
        Wed, 29 Jan 2020 01:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8pHzbh0S3mwJ9sZmFwW+OVbIXW7Hd7FamonfwSPK3O8=;
        b=EAk8gMAENaRCtn/l3YlahcPXvc4pMulR1JZmK0xjRrhfxU4ja8B2eUdxo2Ziw7JCj1
         KZ1h3BNmAKB9E4Y1vZjuyj3mgFLJ//d438IYE/dw4b5TeEYN0neVIs2y5mqeJZ4stUIb
         VsOoOiiINyLSmQipuGPE54EWpJS6++qTJBdkoivPXA5B639m1rUZIjzyOv77BtXMV//x
         PYLw2Uyw8L543nuQgZdjioTl/0507chvXUL6slST6OYjFEkcS8+FA5G9nAlbpond+UAS
         XEMwmWSkc4Oan4Lgi5C/oZZjRqoN5Q09qjOGc9iRodn3OKXre9VKcL1CUt9Vp4sJx4Pk
         B9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8pHzbh0S3mwJ9sZmFwW+OVbIXW7Hd7FamonfwSPK3O8=;
        b=QgUNGozb35Kq0NMlfkRiW6OSOEQ4iM1fKCU5+zxQhnyZCQBOn9zi4NaPy48niv8iNd
         2/jng1hjwKMHsKPGvj7Ve290FqlhQi7QJnW5qx1Ly+LEVKF0cx0nUgYMjd9H8L9EPmXS
         Uyat5lKKG5teqSZhDEiQ+Gl0yWs9qEX5yqzc+gn6ls1sg3my7XC588pjKC+xEzOHCSNq
         TbdZfA6HC6E1Bv0T0PLMRmyInr9Vm7ggObZeEmCayfjEOZy0R5Ot8P9+uAETySJwDYio
         KdERFa2jZwrMReRqOKDmITS1vYOrtWL+TvrIaTGBpInIvPM8Lq764rcnAagozc+srq6p
         Lfng==
X-Gm-Message-State: APjAAAVGGdw+fqoJ2kjkmJjNGtRoSYWA4EEGD/3igBO95Y2M54SmUiUw
        e6HIRjVhmFu/cPUQ/2ERUX4=
X-Google-Smtp-Source: APXvYqx++cPF4H8zuPfo+s/IxnY5RWH2sSMH0NQjylAZv1MftTAaupVbJpYJoZUgdnTZu67SvVYNig==
X-Received: by 2002:a1c:81d3:: with SMTP id c202mr10179155wmd.14.1580290564873;
        Wed, 29 Jan 2020 01:36:04 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id v5sm2116580wrv.86.2020.01.29.01.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2020 01:36:03 -0800 (PST)
Date:   Wed, 29 Jan 2020 10:36:02 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [RFC 2/2] dt-bindings: firmware: tegra186-bpmp: Document
 interconnects property
Message-ID: <20200129093602.GC2479935@ulmo>
References: <20200114181519.3402385-2-thierry.reding@gmail.com>
 <7aefac6c-092c-b5a6-2fa6-e283d2147fc3@linaro.org>
 <20200120150605.GA712203@ulmo>
 <57c37b3c-1473-d444-db59-8c6650241188@gmail.com>
 <20200121141027.GE899558@ulmo>
 <83d94918-bc01-131b-924c-9750767d3b29@linaro.org>
 <20200121155432.GA912205@ulmo>
 <ffc22502-0e7e-522c-543d-0e74cc25f4b1@gmail.com>
 <20200127122115.GA2117209@ulmo>
 <d56618e1-8940-65ae-381e-796e44bcf537@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yLVHuoLXiP9kZBkt"
Content-Disposition: inline
In-Reply-To: <d56618e1-8940-65ae-381e-796e44bcf537@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--yLVHuoLXiP9kZBkt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2020 at 10:27:00PM +0300, Dmitry Osipenko wrote:
> 27.01.2020 15:21, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, Jan 21, 2020 at 11:12:11PM +0300, Dmitry Osipenko wrote:
> >> 21.01.2020 18:54, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> On Tue, Jan 21, 2020 at 05:18:43PM +0200, Georgi Djakov wrote:
> >>>> On 1/21/20 16:10, Thierry Reding wrote:
> > [...]
> >>>>> I'm not sure if that TEGRA_ICC_EMEM makes a lot of sense. It's alwa=
ys
> >>>>> going to be the same and it's arbitrarily defined, so it's effectiv=
ely
> >>>>> useless. But other than that it looks good.
> >>>>
> >>>> Well, in most cases the target would be the EMEM, so that's fine. I =
have seen
> >>>> that other vendors that may have an additional internal memory, espe=
cially
> >>>> dedicated to some DSPs and in such cases the bandwidth needs are dif=
ferent for
> >>>> the two paths (to internal memory and DDR).
> >>>
> >>> Most chips have a small internal memory that can be used, though it
> >>> seldomly is. However, in that case I would expect the target to be a
> >>> completely different device, so it'd look more like this:
> >>>
> >>> 	interconnects =3D <&mc TEGRA186_MEMORY_CLIENT_BPMPR &iram>,
> >>> 			...;
> >>>
> >>> I don't think EMEM has any "downstream" other than external memory.
> >>
> >> The node ID should be mandatory in terms of interconnect, even if it's=
 a
> >> single node. EMC (provider) !=3D EMEM (endpoint).
> >=20
> > I don't understand why. An ID only makes sense if you've got multiple
> > endpoints. For example, a regulator is a provider with a single endpoint
> > so we don't specify an ID.
>=20
> Because this is how ICC binding is defined, unless I'm missing something.

I don't think so. It's defined as "pairs of phandles and interconnect
provider specifiers", which is equivalent to what pretty much all of the
resource bindings define. The #interconnect-cells property defines the
number of cells used for the specifier. In the normal case this would be
1, and the value of the one cell would be the ID of the endpoint. But if
there's only a single endpoint, it's customary to set the number of
cells to 0, in which case only the phandle is required.

Thierry

--yLVHuoLXiP9kZBkt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4xUgIACgkQ3SOs138+
s6HhvA//QjDP9iHRZnLDv+FLgl58pyhW4dkxH9ZiiH+bUzB4Wn2j6Oq9MTsKB5Pf
FZcziCb5JgRqxzySzFR/MuJlad+riTX+wKkdTEUQIhgrBdfaVvP/ZVsdQtuo6RDm
SyLuAFL14gJBncJ2bO8i4AJ269LXuowJvJK8TxZaTdD1KqnkIh/jwSoqJyPa+ibi
XSDBtFYI+PtFeSsLhhvC5T3YTAHLFzV4sHO2WS5XvWjdvSWDEnxF/OV+bBLTZAWA
htUKUPaHDDdkc8uX/WYhTqsae5L7f6kw2HrkGHJiRu1dwKMP/C8u5mO4g5ItvpGs
dqEwG0DAuPbTJVsNKv4GE6T3QqCRHtWBSmz/NbUdj40v+jmNmcKp7vEwc4IL9cp+
sTY1yywWFP4NrcZqIqR/bHinGTs0sdhM8Z/V0oKd01sf4tu0UORKEv1wLN7F8Y84
l8D19oJ73bRKbodGuHa/zxFNHDGOWnUVTBCh+BCd+XtX/jPaoFAs6y838WIP2oAC
RB4r8hyeQcIo1Up5B1rIhJxaIORR2/f6z+OqmzVsNsu6HO+ELQScW9vuOTgQqgbT
iO8qEYfRzNWibSUeZ20sCb+Qp8Ei15va+RtYZ7X2+4lAjjS+wk8Rsemksm6L8/mY
R6egPQm6XfsP4PTySBK1F6r/nLuMaj06p8yH9U7Vc/iq8aL3NoA=
=xa9N
-----END PGP SIGNATURE-----

--yLVHuoLXiP9kZBkt--
