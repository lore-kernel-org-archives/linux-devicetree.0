Return-Path: <SRS0=I+Xt=7E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 990C3C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 May 2020 12:58:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B9F220723
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 May 2020 12:58:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="isa5h5d8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729446AbgEVM6l (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 22 May 2020 08:58:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728898AbgEVM6k (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 22 May 2020 08:58:40 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31071C061A0E;
        Fri, 22 May 2020 05:58:40 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id x20so12872516ejb.11;
        Fri, 22 May 2020 05:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=083/bmHRDXygd4/MzLC/9dtPIR1z5YtbgqhfCD9CK8w=;
        b=isa5h5d8hfcLS9KFEWlDOYsYcjVCvWqpXEOArG3qplX1hTmL4RhTt1HYWQlJafNukl
         AxMrFz66VxguCK5i7inkDPAC8YXJWuG3GOsC13ZtTWya2Uazby6Tj/JlUzH5mhsAhbJD
         vs/BabZYfoAdUZ+OgewQ3CDS4ac3PtVQyrYlxa4gfN9YjGCl90+UctVCWkblWwaG34ZN
         TsEB++a59lTuIrG/AdgF3elNDu70YoqJ8D+bjQ2JLLFvljuBAW0dNzPKx0B+d1Qgq7Sd
         SmGOWyyFnUR+OxEpdANshplxJj7tCEscIUlVvGGaU4AKsey+72wPuGIx14CDWTW+xPB0
         Sq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=083/bmHRDXygd4/MzLC/9dtPIR1z5YtbgqhfCD9CK8w=;
        b=acuYbQRs3HqMEBHrjrCXqaY8bcg06EwE/oo904IYp+sw1GDYqSoACwWypC1o6rOMZT
         LtI7e6+sVgKY6xnRb2nHO3ARkvUQ5GszuNQ7Hb4jocrdx2Q+81VT2FXr/eMB9cB/enmK
         7I+ANZdfJXSDvl1RaTYoS88JHy6DxUmRWL/8EltbWKzhCMcpWBw2vp0uarH6iC5GsKl4
         KKTxoEGIkV31WpbWOUodiApmDy8FbBBkRr6+BjaNR6lThXiREMxLQ+pyDykAAYtCCFek
         1HYP1NbLJHIYyhFhQRe1LvtK9EVvRDcsDq/oyw2vAd2euEokhkiXymhO+LClLFrdM4CG
         BWIA==
X-Gm-Message-State: AOAM5303VuPuhf/r9Mp1LWzU4CC+c97qVv3o4S3ROIQzSN8M1a7kZrRT
        HCEKbPR9z9TPywPeBsAt8FY=
X-Google-Smtp-Source: ABdhPJymsY2uNrOI+UmsBHGmgS9sGxW91GS1wyetzAYqbXvUSg8sYneiuYa6gN7iKkP9tlhZVPQ8PA==
X-Received: by 2002:a17:906:9383:: with SMTP id l3mr8097948ejx.520.1590152318892;
        Fri, 22 May 2020 05:58:38 -0700 (PDT)
Received: from localhost (pd9e51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id a13sm6790430eds.6.2020.05.22.05.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 05:58:37 -0700 (PDT)
Date:   Fri, 22 May 2020 14:58:36 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] soc/tegra: pmc: Enable PMIC wake event on Tegra210
Message-ID: <20200522125836.GI2163848@ulmo>
References: <20200520151318.15493-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="CNK/L7dwKXQ4Ub8J"
Content-Disposition: inline
In-Reply-To: <20200520151318.15493-1-jonathanh@nvidia.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--CNK/L7dwKXQ4Ub8J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2020 at 04:13:17PM +0100, Jon Hunter wrote:
> The PMIC wake event can be used to bring the system out of suspend based
> on certain events happening on the PMIC (such as an RTC alarm).
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 1 +
>  1 file changed, 1 insertion(+)

Both patches applied, thanks.

Thierry

--CNK/L7dwKXQ4Ub8J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7HzHwACgkQ3SOs138+
s6HXQw/8D/SZ3WfX5sBNTqkmRFehr6dWaN9H1d/VMEK1RtC2KKGf34thI8wwFsJo
pUT39671Mkhtzn/85uDXkrO/8Jpeh930Ki+GmZT8EeG8HLYtg1BpGjEqVtJps7dU
9cIkUCmbC+IZvM9/VKFD3xp8dWKFJWzwEhZtK5ICfqOe00Lo1JObrrFsoYMOAfyS
Zn22h1LlzxVCI4tCOMh5d1PUc2q2NiF0bQDxlBhm8PANO4FaCYhoyNXQlE+K/4Vo
5WFYn/9hlu5gPX/W/MBEKNGXsEeq72D8BjpX4dnZPgF63bCHiqJ8eUYeCfAq9wfQ
i7wI9tcL4smFHPKbNZ6oBWgg9HdHSzSQRrM0vMue0VGHfKvmQj8CbI/m5dOxBziN
FVlz77RoxwuKmBM7fhZnVHZc+T04ejiMi/IqzxbCsQfNmBPClAX2vK99Ic6cTv5N
yXjmZ/jbEx+S/wQj9SWMjeYlnej7OmhtTFOKlP8KFoig0yt8zGkPo48AnR+cs+4M
vrsmhqOEDvlZSYOsnMcnqG/7Jsby9NQ2GRzKZpnDBMLYYz69nXR+TxfA2lPaI9lB
bU/cSXw5l8ngo+JwfGBmJCKToZdhunFRQz6xg1d4IkPCPH1TcVBH79l6J3IZbNXZ
WzZGqWVudywJB1R07vgyM9hgbu9MHuRWaQfNsqZhy9HO5lX/jbE=
=5M1d
-----END PGP SIGNATURE-----

--CNK/L7dwKXQ4Ub8J--
