Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C495C3815B
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 15:41:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6AA2D20767
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 15:41:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0QPf8Px"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440730AbgDNPlP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 11:41:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2440720AbgDNPlL (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 14 Apr 2020 11:41:11 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3BFEC061A0C;
        Tue, 14 Apr 2020 08:41:10 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id x25so13485395wmc.0;
        Tue, 14 Apr 2020 08:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4KIJ7Z8QHneV0X1Aw4cw4TnPAzva6UVqk+ohip+aCHA=;
        b=k0QPf8PxlgXVPpJeiGFRQvzeNwPtNMq/M+I+z3/RCveZTGKN3Jp4LnWp3yGCLYnF0J
         p36x6AQsPX16Y8kvI5oKO6rgAdrdaJza5uJQZRjrSB1R05vNVHhmyqpaL5xUzZCYO+HO
         CsIaVwf+5l/Ohau25PHYSI/DNF39ETHOkjyW8O92rdHb7+nWHJCw9R413+c4H7z2CW32
         WB+HLHuC5RhYC58wVLvLAX/OreOkCQbTVVLdIXXmg1lCpaiM/tfk9Jgkull45zTq58LQ
         TpKVGYxSBLRT+7YcnvUIDF3JT5fZoQV75gH0Ji8aReL24iA2Mf86LtRD7joGMJbGUNwL
         tQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4KIJ7Z8QHneV0X1Aw4cw4TnPAzva6UVqk+ohip+aCHA=;
        b=gwOnMooD+erCN9dCEVKqtk8nqL9oRJI05GtYnAYJV/n2BpwE/fTrYaOER1ULMj3Twd
         2nwS6HxAVuCY0V9Oi1jle/e5PWoDHckPz5k3A6gmhiD7ztU5QqxMiL8Xzo4DAPZ3hpEa
         Oc6aGY923tQjMa1lMeOAMW6PHFljaP8p2rAUApIhDaC+nSAMObrx1GDqqx9k92bndH0U
         jqvHEujsgXUa2rrxEscVLnPskL5wZCAur5yhCbse/FzuTNXaBjjXlMJ76JYXhVlEDf3f
         1vXhU+XpW0Dy6d+8ZAFel5woj5lxKUZ4UZVObnuOR8L/WRV3MfU34zXU3tpaSakXHTKE
         /vgA==
X-Gm-Message-State: AGi0PubArUNS537xr3xWM1o084oeM5mVniWNEQLBWG46czDxEAHfWVyb
        FWR8WBpX8HzH4kzOosshb/s=
X-Google-Smtp-Source: APiQypJyzx/6HOKMI1u7Om4PgjL1eVsXXm4Nj7wfOsqql9qJ2/n8u8KebAVlElgJl6KhF7QVc8mSCg==
X-Received: by 2002:a1c:a794:: with SMTP id q142mr476428wme.4.1586878869402;
        Tue, 14 Apr 2020 08:41:09 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id h2sm971602wro.9.2020.04.14.08.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 08:41:08 -0700 (PDT)
Date:   Tue, 14 Apr 2020 17:41:07 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 09/14] memory: tegra: Add EMC scaling support code for
 Tegra210
Message-ID: <20200414154107.GO3593749@ulmo>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-10-thierry.reding@gmail.com>
 <fae8e1f5-753b-b2ce-d14f-c6e8b2061fdd@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="TMgB3/Ch1aWgZB1L"
Content-Disposition: inline
In-Reply-To: <fae8e1f5-753b-b2ce-d14f-c6e8b2061fdd@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--TMgB3/Ch1aWgZB1L
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2020 at 11:46:25PM +0300, Dmitry Osipenko wrote:
> 09.04.2020 20:52, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> > ---
> > Changes in v6:
> > - use __maybe_unused instead of #ifdef'ery for suspend/resume callbacks
> > - take exclusive control of EMC clock during suspend/resume
> > - move EMC driver changes from clk patch to this patch
> > - make the driver buildable as a module
> > - remove unnecessary suspend tracking
> > - remove duplicate register defines
> > - add tegra210-emc.h for Tegra210-specific registers
> > - detect number of channels, number of devices and DRAM type at probe
> >   time and store them in struct tegra210_emc, remove the corresponding
> >   function parameters where no longer needed
> > - properly clean up on failure
> >=20
> > Changes in v5:
> > - major rework and cleanup
>=20
> I happened to notice that the patches have an individual changelog only
> by accident :)
>=20
> Next time will be nice if at least you could mention about this in the
> cover-letter, or move (or duplicate) the whole log in the cover-letter.

Given the amount of changes that seemed a little impractical. I can try
to give a high-level overview of the changes and perhaps mention in the
cover letter that there will be individual changelogs for each patch.

Thierry

--TMgB3/Ch1aWgZB1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6V2ZMACgkQ3SOs138+
s6FVCw/+MTxlJhCzaf3mRbl2CqipZNHLKX5jAJK8K1SPWAv0fTVLuIKTFNVz1KY3
wuxrgDZT+97eeXS8w7J0B83iLgKEeX5hCepqnOzb716x9sU95XgAfQUZsHsJhBYQ
hjQycXgvlRXLMpEsbHuA87JT4ILV2DsxSngVdbK8GaKCZSkfj0g5Ov8g2H8SghAs
Tv4POtJpUnDWR0ypK8+1o0OzFS7vuy6ctew+8wTAnEqTW8I4bd/RCFMCBqhD+4oS
JuchrTdRRy23tQ3h+QxXhXHxXA3IsZiGzaQ5PL+/AKkebj6k5UR3GgnowBnJyB5m
/i8TQDHGGrw2MPW3VrTKKI5gKqpUYPBKOZirL+MEdY02jOmaUcCkA9cSfKyFPidf
pOfGPi5LhuNmkEAChJItWNJaRALrNcKjcKqV38xeMT94ji/1jAA8cjVPukMs/Clr
kfKba0UOAWTVDZDp1MnxQrNK1E+LJN+hE2qPpKLB2ZI4H9UaKR9uATh/JhmxcnJp
wJB25m9eHTUymsuAfenvL2nwBoato1jHeYiitEkntbfD6ybAjq0PDCotq4/2bBWU
VwoMjKVEW6FgL+LYTAbLAyDva0ckCp07aEVZzXBeOhFVtd2BuQP0PLvfDbDcsBnV
37mhZq5lYyKiL93hNyb/GGwm47r+bcNMl+zRvGTHXQf/ifMdrqo=
=l66T
-----END PGP SIGNATURE-----

--TMgB3/Ch1aWgZB1L--
