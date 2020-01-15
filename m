Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63585C33CB1
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 12:45:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 335A4222C3
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 12:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579092337;
	bh=E7wuJUhmoHC3T5x41qqcUUVHqWWjv9oWNJx4ZVn0GoA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-ID:From;
	b=DODz8NZ4oisjoYuA2gQ6wajwTNsZOW3EZW6zCuGrW2s5g3kqRxUu0lz8H5D8rtsGh
	 /+GRCTaWMRaaPkwx9xDyHY4ZAVF23iXxqZEb79WW5Gnm1RbRBtjxcdvMI9lEOlssmD
	 ab+6u1fwqY6HVzEyPMDTFLtZOXpCu+GNnEmUhsc8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgAOMpg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 07:45:36 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37648 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbgAOMpg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jan 2020 07:45:36 -0500
Received: by mail-lj1-f194.google.com with SMTP id o13so18391153ljg.4;
        Wed, 15 Jan 2020 04:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=XrM75ATOZQXz6SoZn1okjiJgULz2HKkhFLxEF09kY14=;
        b=i87EVfYpDyR0g6vMWt7prBmZ7KGPMTqtHHGezpq2RddzuyXhi0ONnCPWA7fezCoUQV
         VU7N1ZWCxkXrrr9TcXBRyjmaz5TaTz7LvISiS0ZbgcTunx8/9OlwORUBamF6uv6PbsN2
         T6NPLh/VHH1Xh0wqSiYSEQomGsiIXziGgSmVHCM2QyM2OU2lbAqrZbV5JCXBGLwyb/Hi
         Z9giZcnBQ0ue9dDd/e4HuBc90b4WFvHXe+DeWRWa4flHgYpdFoTmo5pUtdarg9gfq020
         TF/UD7sAxxckKPY2ArubZVTboAD2Fp5O9bSzHCGzQmNX774KEyA+E5HuvbokiBVC9ffV
         cKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=XrM75ATOZQXz6SoZn1okjiJgULz2HKkhFLxEF09kY14=;
        b=C8j0anokDEBwQqoiEYz/ST1yNVULA4s1QqYsUt0bLwPTirqILJ6xpQeagjoDB3TDJt
         TQr5IWxCtAWxydAZz3jWcVeOxqgxCXj4i/dWKvEDQlPoBpqsP1FkZ8XUxAI/AtsOy50k
         ogl0r9Bx+fHjbjGJvyqettd7WuGzK32CKM5nWMrUGeyx8Ooh7/FNt+yMfHWB9nyV0j9D
         aRUCBGGQdHZ5A1dfxwVip2wo01CTbvFSep8lSEufxTJxO6pRo/xGiymGKjWK8q+IEvkt
         jbaQN1z0bhGBF0i5udWh/tKOiE4YDIo4VqR1Cyex+iv6P9A8MWItW2mCUMA2JNji2ndA
         83Pg==
X-Gm-Message-State: APjAAAWAt9l/8ReW9VPl1c8ZMxSoJzi6cHMrOKaJBkAxMtkuUpYfVtIS
        X22OyCT6yfczhs6x5qpycfOI4PHQnpVvPg==
X-Google-Smtp-Source: APXvYqz4Bq77weyLue1f/qeW9fizhG9jawwzQWA+qQGOtBhhBta8rZc6D9tMPh5Pw9Z5ftzXbPtDHA==
X-Received: by 2002:a2e:9015:: with SMTP id h21mr1716057ljg.69.1579092334547;
        Wed, 15 Jan 2020 04:45:34 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id t10sm9100696lji.61.2020.01.15.04.45.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 04:45:32 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Hanjie Lin <hanjie.lin@amlogic.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Yue Wang <yue.wang@amlogic.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
Subject: Re: [PATCH v4 4/6] usb: dwc3: Add Amlogic A1 DWC3 glue
In-Reply-To: <CAFBinCD0DJgYDhPRHqMQuouq+ZyF6Wg_LkuCMpHj2UG6vvvdbA@mail.gmail.com>
References: <1578537045-23260-1-git-send-email-hanjie.lin@amlogic.com> <1578537045-23260-5-git-send-email-hanjie.lin@amlogic.com> <87pnfl6rdk.fsf@kernel.org> <CAFBinCD0DJgYDhPRHqMQuouq+ZyF6Wg_LkuCMpHj2UG6vvvdbA@mail.gmail.com>
Date:   Wed, 15 Jan 2020 14:46:33 +0200
Message-ID: <87tv4w6g5y.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
> On Wed, Jan 15, 2020 at 9:43 AM Felipe Balbi <balbi@kernel.org> wrote:
> [...]
>> > -     priv->clk =3D devm_clk_get(dev, NULL);
>> > -     if (IS_ERR(priv->clk))
>> > -             return PTR_ERR(priv->clk);
>> > +     priv->soc_id =3D (enum meson_soc_id)of_device_get_match_data(&pd=
ev->dev);
>> > +
>> > +     if (priv->soc_id =3D=3D MESON_SOC_G12A) {
>>
>> you can use of_device_is_compatible() and get rid of the enumeration you=
 added.
> Hanjie switched to a struct (instead of an enum) that is passed as
> "match data" in v5 [0] of this series
> personally I prefer what Hanjie has in v5 over
> of_device_is_compatible() (because that match data pattern is what we
> also use on other Amlogic drivers)

but you end up duplicating functionality that already exists by means of
of_device_is_compatible(). Frankly, I don't have a hard opinion about
this anyway, since it's not touching dwc3 core.

In this case, I'll defer to whatever you guys prefer.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl4fCakACgkQzL64meEa
mQa9FA/9FlpB8k6FjnAZcPKfZiMTE3FBVk31vXpWrefKTxAZmGAzK2MFwzGVSlK4
R2wgfY66niKyT1JW/T+/OOPfyyY+gIz0G44zu5qSmYFq/OAVpLSO/ZLw91EPE1yt
0m7ohRi55RxaWMO3LiTTr4zu7/wSxb3/QP3oAtC1G2PHDXQNzsYp0vMEuH22nS6h
sXXQlHOxBbqWQSnUXYHv7JLcvK+YC9JGBqnjCbP1XDx7KTYjZdgH2UOzF6G0OWGc
kk/RVuCB8fobf1rb4VlE9P3iEWtkiTZx73902YRQA1tMs+yRO4BoMLZTUx7VakCz
as6sTfFDc9trmj/uShxMiMxHpqy80rovEKCR3IxASMMBh3jF3Ohe+ghwLV9Ex+Fi
yyhJjaBYFI3lkXV4gA11MpJdDbeLn554ivLHrdqIX1tgh7NOPwqULQm/kdX4URbR
6gKK+Yj2CwuCmDlrfFZZxrQS9pS2xrdykMDW3guZPmeNdgySgtNrQBEIYtxeQw5+
cjQZ373zf6s6lnZhzspEh2cvGnI0cSrxmvb3TjI2RLFDvjooB8u01fZ1u8O51yPY
ou1IV/vECiO1z8Fxzf8AVVqBo9GTptvLurAWZoNAzqrbxnC27OkN23i9vXlDwP6d
Hff4t0AR2FyQD2J/M12Lz9lHyJeECr9+l56tItScfshwp0Dt6bc=
=a2TN
-----END PGP SIGNATURE-----
--=-=-=--
