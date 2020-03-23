Return-Path: <SRS0=2gCm=5I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 792FCC54FCE
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 11:05:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4F77820787
	for <linux-devicetree@archiver.kernel.org>; Mon, 23 Mar 2020 11:05:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rQ0VIgnW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728087AbgCWLFg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 23 Mar 2020 07:05:36 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43629 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727987AbgCWLFg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 23 Mar 2020 07:05:36 -0400
Received: by mail-wr1-f67.google.com with SMTP id b2so16447311wrj.10;
        Mon, 23 Mar 2020 04:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=n5IqmciM7J1/WUmGc31nCBaJXVIdQHzoRYVr2A+AxaM=;
        b=rQ0VIgnWmRV8twfDfXP66SOHYe+QLeXBW1nRKp+3zp/v6sR8SPjPpOUQ6pGN+wAGL6
         kXw5BWubN206D1fdTHorlcpnbvusMqFmm4xxd06eWUAmBG6+dFltey56gtV63AMQ2rHh
         mkW3V+Y8/bbsCgihxH9ANjUYNhGZba+VwQzhJYTr0NK8zS4D+COpgeDwO48MeXagJ0Zf
         k7glDhcxpZUDM8UpDsNE/ScnLGRZCDTPNi34CmxKBq0Cio7wKt4wwHSa0mPXcAKQJVGr
         pYZ6putsCwxwD2CRd+Y1ZsruJ4lt3FdEkJ9WmybEXLcRGeccV12Ep8Sp5aEh+CtlX08O
         OpVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=n5IqmciM7J1/WUmGc31nCBaJXVIdQHzoRYVr2A+AxaM=;
        b=JUB2p+wivkl+Dwq+jUfa6yaNNNPu0wkQ1V/fqKsEhmBQPx8Aazgiyi52431BYurAeO
         IiN/ElJ5ah7JNv0xHyfqsZ0J5YGWSk6fTOjRZVjZ8M7xUCGjKjpthNSPUsnRoC87oDFs
         IQqrKu75IfG9gjCMWfI23wSeIrdAWP7PPqkfVFkkG3C1uEDCo6M734lIAVK6StKCp7gz
         UsM8JnRKjrrlmyzVCeO1A8oW4IVEpB6rsCZZSdZyf2mkhdMiqoGDl/QQmJVS5br15ZU+
         sfNzEadcQeA6cWMGPGk5EKqgRO+VIehc1noRckoyA599uyo/ReBET4dlsDOEd3QrQpbo
         hz2A==
X-Gm-Message-State: ANhLgQ2lGQmfuoqDrL9hD0Y/A8i3KhgWpF7O7og9CiG4/Tq/KeaVT9Jv
        o38TGb9ozGfiey9bERrwp20=
X-Google-Smtp-Source: ADFU+vvQjV0wjKEwuIh9yioJEL7NAU3DgdAsS2sGZo3vAEWFH1x+NECd8Au8y1mbHKvmGstmp8Rnpw==
X-Received: by 2002:adf:9796:: with SMTP id s22mr28506678wrb.31.1584961533542;
        Mon, 23 Mar 2020 04:05:33 -0700 (PDT)
Received: from localhost (pD9E51CDC.dip0.t-ipconnect.de. [217.229.28.220])
        by smtp.gmail.com with ESMTPSA id n1sm23059060wrj.77.2020.03.23.04.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 04:05:32 -0700 (PDT)
Date:   Mon, 23 Mar 2020 12:05:31 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 3/8] clk: tegra: Implement Tegra210 EMC clock
Message-ID: <20200323110531.GD3883508@ulmo>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-4-thierry.reding@gmail.com>
 <b5fb83d8-003c-d76b-9dac-7c8ef15f2ab1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="C1iGAkRnbeBonpVg"
Content-Disposition: inline
In-Reply-To: <b5fb83d8-003c-d76b-9dac-7c8ef15f2ab1@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--C1iGAkRnbeBonpVg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 07:55:39PM +0300, Dmitry Osipenko wrote:
> 10.03.2020 18:19, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Joseph Lo <josephl@nvidia.com>
> >=20
> > The EMC clock needs to carefully coordinate with the EMC controller
> > programming to make sure external memory can be properly clocked. Do so
> > by hooking up the EMC clock with an EMC provider that will specify which
> > rates are supported by the EMC and provide a callback to use for setting
> > the clock rate at the EMC.
> >=20
> > Based on work by Peter De Schrijver <pdeschrijver@nvidia.com>.
> >=20
> > Signed-off-by: Joseph Lo <josephl@nvidia.com>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Changes in v5:
> > - major rework and cleanup
>=20
> ...
>=20
> > +static int tegra210_emc_resume(struct device *dev)
> > +{
> > +	struct tegra_emc *emc =3D dev_get_drvdata(dev);
> > +
> > +	emc->emc_suspend =3D false;
>=20
> Looks like the 'emc->emc_suspend' isn't really needed, nothing in kernel
> shall touch EMC rate at this point.

I've removed this.

> Perhaps should be better to make EMC clk exlusive in order to catch
> abusers, please see tegra30-emc suspend/resume for an example.

Good idea. Done.

> > +	clk_set_rate(emc->emc_clk, emc->emc_resume_rate);
> > +
> > +	pr_debug("%s at rate %lu\n", __func__, clk_get_rate(emc->emc_clk));
> > +
> > +	return 0;
> > +}
> > +#endif
> > +
> > +static const struct dev_pm_ops tegra210_emc_pm_ops =3D {
> > +	SET_SYSTEM_SLEEP_PM_OPS(tegra210_emc_suspend, tegra210_emc_resume)
> > +};
> What about to use the default suspend/resume level?

I don't understand. This is already the default suspend/resume level,
isn't it?

Thierry

--C1iGAkRnbeBonpVg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl54l/sACgkQ3SOs138+
s6Gcgg//XEFAg5FXQke9ezCAmIWt0qxVXLKGIpJAn6Own9QsP/hoyD89LVQwfmMI
JMow5JKbPdySRmJJ4Nb4ZLF1nT3Ma8eIPW58fGjaAlWodsmAdTpQTrD5s2dLsQRr
Pu5GuDUR+7rVAz7fpBZl+DJREyq0DThvnN5ojtGnAqaYJ8LSbJuJuG2+7VNLCGF/
YGIcH/xTYr+UvjPSQcnyxIjYLSqj6Y2KWJnCHeMeYm/5LFfsZ3l5p4fxAcVyS1E8
pw2ejNhajSx+6MbolV/2j0/4flKzFs5FTWdq8mJOpuPwsVO6a3vJAahl1Y2xzOib
BH8VZboNjnF1DYIO4QfqAzm116b2sTlm7rOV3czv3HYVtrrhIMX7RXNYHsTq5y+z
TkwBqnt9uYjRHFgR/H1z7aNRcyBeW6ec0oc7Xl2wZ7AZoSDojbrdmI9gEqjSQryu
DG1S484D0Tht+dhpHjYH3dIblsrfZiVJ9e3vyocFl8zdwRGOdbKXWl5gClF33yaN
5kgIJWWXbGakpSF0JguWG2NLdpvdhvCJqCl9Y1fmqPs6yull0ptPW/mwPl02Bi/8
5l9wo+QiUsg4PYWZf6NQ1Z77NXVyQCPmPJlO7RyWvQEyCJJIcpGAIxCfCbNSskZ5
hCGvCUvxx05WtqmhAw3jtaXzbmtg1DrYXeouAxUz0G2TjXi/46U=
=k3Qa
-----END PGP SIGNATURE-----

--C1iGAkRnbeBonpVg--
