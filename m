Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF63C2BA19
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 15:11:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57F9020768
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 15:11:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s8K8q5iR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440262AbgDNPLJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 11:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440254AbgDNPIT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 11:08:19 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EA3FC061A0C;
        Tue, 14 Apr 2020 08:08:18 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id k11so14110403wrp.5;
        Tue, 14 Apr 2020 08:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=k7q0i04JrV/LeWRv8qAlwGssC6S97Ez37RZ9eJFf4jw=;
        b=s8K8q5iRtggqNP5qEoyp9NKhh1FcI+I/WpvocM2IwWOsRGN2OhmPWCtRPpKF0pSqur
         kk6vqF/IOvEFrkaVsK25+SsTVR3Q33zsGE500TdhYf4fhtYvOROG/nhZJGYsK8vBIzQw
         jTdQSgEfOfsUMZkimdJNkyvA2AyPfUP607BuhA2QDyUpyaTAgDwODdgJne/fIoF4Wax+
         njNtUfZ0TJJX6fUbBlsxihKkggxTV5g+hv8GKrdrrUqpfu6QshbWFu9rtMQrmS5kxVss
         BbkYk/46kdC1TtrT4Zte7uDcDIN0OYATpc38YKttt6+IXg1ZQFuaOdgwqY8bNqBQdBWr
         xuZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=k7q0i04JrV/LeWRv8qAlwGssC6S97Ez37RZ9eJFf4jw=;
        b=QioGmIUUQHT58s8g5U9htyI0Oifnb6KvLFEmoRzcHFs1Roe16AakPSlSr97mbOgJuZ
         wXWyxaV6TODaG2qmeMsNFNT/RXdXVcv1YV4tD3VkD9YHoRwKkbeUWJ5KmKfIKyCk1GUC
         H+AxaQEj/FKBQuVHMJq9b8I/WE4f9M4AFl25HDcJSuy0PjtkX9IV5cXv5WLmQ9j7t+zt
         VWCCYp9uOsq1H+r0cBbauukHh+Tz36ZvL1tfiqVUkoL/zqFR8mLxD1y9ILEGZXScI+gO
         1P3vTHB7mZ7zqycryYpRZptFD5IfcQuQJ+pMZt4HYcGi89RU/WtQmpKB+2KwT/UjFPIl
         96ng==
X-Gm-Message-State: AGi0PubG8xeHGWT8/PGOAofts4D9W7PXFDzt+gkIDVB0UCcVhzl0WvXV
        ivdO9hQ8Z+n6CSOwquEJums=
X-Google-Smtp-Source: APiQypLR+uWxiXs63aPjYfFPWMFe2n0Nn/f6HhopnZJbUeLcgUQfMkrWPO84Tz3WWOc4Hxo4F/dUmA==
X-Received: by 2002:a5d:658e:: with SMTP id q14mr25214585wru.92.1586876897235;
        Tue, 14 Apr 2020 08:08:17 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id m14sm17431931wrs.76.2020.04.14.08.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 08:08:15 -0700 (PDT)
Date:   Tue, 14 Apr 2020 17:08:15 +0200
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
Message-ID: <20200414150815.GM3593749@ulmo>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-10-thierry.reding@gmail.com>
 <e015e35b-3f82-56e1-2d86-ebc467eb92f7@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="75WsOQSofUOhcSOp"
Content-Disposition: inline
In-Reply-To: <e015e35b-3f82-56e1-2d86-ebc467eb92f7@gmail.com>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


--75WsOQSofUOhcSOp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2020 at 05:25:06PM +0300, Dmitry Osipenko wrote:
> 09.04.2020 20:52, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> > +static int tegra210_emc_remove(struct platform_device *pdev)
> > +{
> > +	struct tegra210_emc *emc =3D platform_get_drvdata(pdev);
> > +
> > +	debugfs_remove_recursive(emc->debugfs.root);
> > +	tegra210_clk_emc_detach(emc->clk);
>=20
> It's great that you want to make this driver modular, but I don't think
> that it's a good idea to suddenly rip off the EMC clock from the users.
>=20
> It should be better to simply disallow unloading of this driver once
> it's loaded.

That's not what we're doing. The clock is going to stay around and users
will be able to access it. The only thing that the above does is take
away the possibility to change the rate of the EMC clock.

So I think this actually makes this really nice both for testing that
unload/reload works and it also gives users an easy way to disable EMC
frequency scaling by simply blacklisting the module.

Thierry

--75WsOQSofUOhcSOp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6V0d4ACgkQ3SOs138+
s6GsWw/+M5/HCC6YVqevVHN5rlOJp1Ymn8G8PfobgyJaQ+IQ5YBian1VcklzBhNx
jqEPh0NaQTMm8Lq30si3Es6lnPugjOhhsYpGP2PVQ8Fpgr33hqoileVYzHYe4uMP
uk7SUYzZMoBAdO936koxzvfVIS86NGqzVciHH7xDQqndF1PoRShxkHA+Fmg7FuwA
BNKrTPyYObiEZD0KO45fHkyWxrBl7lfk6Qm9gMyM5wpp80JHI/gGkmE3kUocMW/w
zYXnGLES5NcrDgBDv1aRAlt8pafa1TrFtZIpADX2Y3q533/TEojbb3f9BtYkLCAP
8cfmAfFdHK9gOo68OGpPFePzFZRYdxEH3xCGOsISgMoE5PRIKpLhVZW1/zlaVGHG
yQUuKR2c/G+qlPgD1vb42B7b7cPmA3DU7KGZn7aUhDTuR8ovDd29Xzzqzvf9Gq52
CKZFYirYrVuNF4Yu81JCQejfoOy3dah1EILZ/H4rwsIZGbNmzNt8uMPJ9/b0UAht
9aCgJJC05SNFFeWT7PYgleJHLLl5zpdStTbZgSHdjyS7az2+hTCU/ZxEFVUbfARp
yMauGoTgjC+Tmlo2i8u/TO91xvVVLx0jnhAT9QETnjYkTZtr1T5h8jh9u2EIguHb
oFtPdGtkf4+73XZxomkd6XA3sThbRwKYCuzJUIupCz+fwe2ByZQ=
=UtAs
-----END PGP SIGNATURE-----

--75WsOQSofUOhcSOp--
