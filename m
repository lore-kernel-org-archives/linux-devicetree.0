Return-Path: <SRS0=83Av=24=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45729C33C9E
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 12:15:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1BAF6206F0
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 12:15:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhpeMaFy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727559AbgAGMPL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jan 2020 07:15:11 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35326 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727177AbgAGMPL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 7 Jan 2020 07:15:11 -0500
Received: by mail-wr1-f65.google.com with SMTP id g17so53648856wro.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jan 2020 04:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4Vcrc9kPwEMI1qMY97ZKxc5ORffAx/A/CKvvB8bb9HU=;
        b=EhpeMaFyUHCBnnfIlkhHmvYes0eM1ZWephawKnNl2g0DdN5tHsMvsQ/4FsRIcI1ViF
         V3/zNmW1WqptpoasSr9aVQONe03NmK6y+Cy/hq3dcavQYK9NWmkl9yncPAucoZVWqrm1
         gPX2TUOOvSfAT4nSupIbsHctrqzFpJbV4AK55H+WRQ8pzAHVKBqX9fYkFNQB9KymoiAu
         5pckxvxkWMzCezBHVm0PXp2+q61yOoT7RtNKrwGmk0N/cZXrCFPvvmA3KGehcXEty84s
         qYp/wXsXFzMl6wnmBGudBncGbsTHnH+veG76aeSlYrgEJeARwZvgabwFPoH7F/fJylJz
         0ufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4Vcrc9kPwEMI1qMY97ZKxc5ORffAx/A/CKvvB8bb9HU=;
        b=nMFfozsu6LKF/2JZTyLJ2zJCWpRBBxqh5FIh5yOs+KvPPWWimtV1+/P2EDVfryx1Le
         k0PUfPIusSCfikA8baNv1mABxD0LkhiTXo2vPxsDWGwalrF/+gxE6x1Lrs/jTHAUQ8Kf
         RHbcBPOz6Trb1U/6qusIqZt+znVuSSR6ZbJu/wyQw1bCyO3qrQofh3RyvFoq2dWpZChl
         LPevYYQngdA+izd7ZELB30RowHKvXyn+4t8wHQ5y5WCy0dQ+2jxWy8ScXWQW1cRo9S7K
         aZYr7nwCkpb6LTm00d3KVVBjqB33aYeLCidBgnPEedIKluvBlZTJ9J572d7mrgJHxWoa
         F5kw==
X-Gm-Message-State: APjAAAX85w6c1b1Kry4/AXmqAu5Za6Rp4DtLI06Ck38jvK5uua44kikH
        tQ1eUFobmtieMbS25Cnz5Gk=
X-Google-Smtp-Source: APXvYqxE9TizJBrkadc+zJOygaNd5/9MmQLFuKw9E9v9SnmDj4SWvg+X9NC/e2sfNSFX1wfVgHOQoQ==
X-Received: by 2002:adf:ef92:: with SMTP id d18mr105419063wro.234.1578399308307;
        Tue, 07 Jan 2020 04:15:08 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id b10sm78937461wrt.90.2020.01.07.04.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 04:15:07 -0800 (PST)
Date:   Tue, 7 Jan 2020 13:15:06 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Rob Herring <robh@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Yannick Fertre <yannick.fertre@st.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] combine bindings for simple panels in a few files
Message-ID: <20200107121506.GC1964183@ulmo>
References: <20200102101712.5085-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="32u276st3Jlj2kUU"
Content-Disposition: inline
In-Reply-To: <20200102101712.5085-1-sam@ravnborg.org>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--32u276st3Jlj2kUU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 02, 2020 at 11:17:10AM +0100, Sam Ravnborg wrote:
> This patchset introduces two files:
>=20
>     panel-simple.yaml
>     panel-simple-dsi.yaml
>=20
> The two files will be used for bindings for simple
> panels that have only a single power-supply.
>=20
> For now only a few bindings are migrated - the
> reamining bindings will be migrated when we have agreed
> on the format.
>=20
> v2:
>   - updated binding description in panel-simple.yaml
>   - fixed exampe in panel-simple.yaml
>     (I was missing libyaml-dev - now the examples are checked properly he=
re)
>   - added panel-simple-dsi.yaml
>=20
> 	Sam=20
>=20
> Sam Ravnborg (2):
>       dt-bindings: one binding file for all simple panels
>       dt-bindings: one file of all simple DSI panels
>=20
>  .../display/panel/ampire,am-480272h3tmqw-t01h.yaml | 42 --------------
>  .../display/panel/ampire,am800480r3tmqwa1h.txt     |  7 ---
>  .../display/panel/panasonic,vvx10f034n00.txt       | 20 -------
>  .../bindings/display/panel/panel-simple-dsi.yaml   | 67 ++++++++++++++++=
++++++
>  .../bindings/display/panel/panel-simple.yaml       | 59 ++++++++++++++++=
+++
>  5 files changed, 126 insertions(+), 69 deletions(-)

I like this. With the improved structure that the YAML bindings provide
this becomes rather neat. You may want to update the subject of the
patches to better reflect the style (most seem to use "dt-bindings:
display: " as prefix, for example). But overall, looks good:

Acked-by: Thierry Reding <treding@nvidia.com>

--32u276st3Jlj2kUU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4UdkgACgkQ3SOs138+
s6HTnxAAm2DXdt4nuIiLcds9qXXf1V3A+d0r/Qya5SmQkUW7UZQ6X4PMvIZKHUQx
rTdXlrytFDfJgX6oGy0x3vd6fTTOLpTEiMNNORnj0/6TXtcVihVvF+HzkBvbeVKt
zcDjCZN41KpimIsTEww1I/HUD/+iy/1s/ekjvxogcpzXLo/a2pMR5aAICgPp+Kni
Q/zgsMNefCwqTJCBz37uxNBUJ5grcyHThuIp+dwfvcrTRbBN6qlMvylVJ6W5K8Al
KKkG4HvFmTucPg7UgiE80wZWZgOdLFRleXtN7/7arIWrPNzyh5769hhcRlXR9Nm1
/U6YR5XXImyNeWlKLV6H6Eo2Gmw2sHOC3OwtfDgGkQun9dyRhoIPdFV1DZlaymS+
PF5F379d5piQT39BtDTUn00K/8drc8QjIzYxi2ko+aZPFj7oL3yYz6ZkCoycB4F9
HwIrGjyNbxmto6UBvY3LPDEZV6tbfv+OWDfjYY/Itf74sUYjvivQjLUUZNIMsR9Q
rhw+9MpDxx9o6MfO4Zgr+//7F+X3zDQuG+a4S/1GLJnV+ryYay7FJuH52GfO24Og
q/exUWQONwXywghxZ58/QbBBDSAoJT/nH6NUKcFl5vn+gPO8rDVYu8EN7NJ74Qbl
XWHW36sT/ZpMwzTBkQDpNwN+92nerIJYxVXYQq9RBG9tfVax6OE=
=1Z06
-----END PGP SIGNATURE-----

--32u276st3Jlj2kUU--
