Return-Path: <SRS0=kWYo=3E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AD69C33CB1
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 08:43:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D15082187F
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jan 2020 08:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579077806;
	bh=/FLsJUJ31mzuqYFMdvkkSWnUismo+bkfJF/TXKu+Xng=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-ID:From;
	b=YiWxoTwMtSZZ8RmkBsU3LyIB9A9mgGQ1bOQoWm0PuQX8WW8/iUqDSc7ict1t6ldfs
	 EIGhewqUwyXiPur5pmJfe4D6SfXLQN5vvqkxBDd2kYXkrBBbuXDYjZBUnoGRfOyvU3
	 PRM3vk3M/Vc9HK2mfL2ZfwgQOrYZX52Hq1lsjI58=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728927AbgAOIn0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jan 2020 03:43:26 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45679 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728911AbgAOIn0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jan 2020 03:43:26 -0500
Received: by mail-lf1-f68.google.com with SMTP id 203so12030834lfa.12;
        Wed, 15 Jan 2020 00:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=Z/YS02c1TwDm4fzEdyAro9aD0jq2KhJ8uk8GHgLnCGk=;
        b=fQa/lqqe1G4ZA5nZyEaSWefREZoNM3o2XddUf51vA48tYZ8nt2SpLGiTC3Yx8JL7rY
         2BS7pZKcgnit8y7b5JTX0okELFgiZMp+17SwVjG0IL0ck6gGX7s4LZIcVBr0GbOX8qrx
         PR5WPkZBqZO/SBLtwvkcVXCrm8oi6/gQv988ZHXX8SKH3oqimuJAlyOmoYQFSIA1NJ8M
         zjVfgLHPFzdwGKfcjXB1K9eoI7luM2ROaK7aFlqJG+0/xKOxroj6mDMFDwr9LwIh7qof
         Y4OaTSYfrqPR2J32rt75LHSpZG7K6uCQRQ5/MFz2xkRT2u1oQzx/dJPowXJ3owlpXJiW
         IsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=Z/YS02c1TwDm4fzEdyAro9aD0jq2KhJ8uk8GHgLnCGk=;
        b=VLswKvhBlX1a7Z4TDOQVJxB/UvrU+HYSKNgwuZvJV8Tw7t4mbbMmjO88TkrSZwc+nZ
         iXSe4GT39DeO4CPb5++k/h+ecC8RPxOyHWHuZDctbgVrH1C6ypYbEe84azCWeqyHvoqi
         Sra0KJvsQp0AtptuZcYtkgonru5dAfK8m3XxNnDx+YaAeGR/ZOwW9o60VDqeKQ1juLT2
         xY56v84nWfmotxm6wGftiMHj+pIHn/wh8h42qBw94yd427YOWCJSszOq5w2M6t3zhb28
         0mPgGTmkla1df3ErMaoKvSOTGWJRJGLKsoTJV1E6f8k3JmMEq8O5VlNjzRH+6Emf3Nuh
         kB/A==
X-Gm-Message-State: APjAAAVhJaIcRl0hRl0v9AEWr+V/5oquD7I9v2Kv5Ee2rMMly6yVMm/9
        Vm56hjGuBeqgaJsAhR9lsUg=
X-Google-Smtp-Source: APXvYqyopiD+cXnqJ096h1Jrq1D8XyPRz5Dh2ChG/ePnwC7zEu53MzS8S88Fo9mm2rYEdlGUpXrqBA==
X-Received: by 2002:ac2:4194:: with SMTP id z20mr4115478lfh.20.1579077803634;
        Wed, 15 Jan 2020 00:43:23 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id x23sm8491572lff.24.2020.01.15.00.43.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 00:43:22 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Hanjie Lin <hanjie.lin@amlogic.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     Hanjie Lin <hanjie.lin@amlogic.com>,
        Yue Wang <yue.wang@amlogic.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
Subject: Re: [PATCH v4 4/6] usb: dwc3: Add Amlogic A1 DWC3 glue
In-Reply-To: <1578537045-23260-5-git-send-email-hanjie.lin@amlogic.com>
References: <1578537045-23260-1-git-send-email-hanjie.lin@amlogic.com> <1578537045-23260-5-git-send-email-hanjie.lin@amlogic.com>
Date:   Wed, 15 Jan 2020 10:44:23 +0200
Message-ID: <87pnfl6rdk.fsf@kernel.org>
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

Hanjie Lin <hanjie.lin@amlogic.com> writes:

> Adds support for Amlogic A1 USB Control Glue HW.
>
> The Amlogic A1 SoC Family embeds 1 USB Controllers:
> - a DWC3 IP configured as Host for USB2 and USB3
>
> A glue connects the controllers to the USB2 PHY of A1 SoC.
>
> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
> Signed-off-by: Yue Wang <yue.wang@amlogic.com>

you're not really adding a new glue. Rather, you're adding support for a
new platform in an existing glue. Make sure subject is clearer

> @@ -409,17 +426,32 @@ static int dwc3_meson_g12a_probe(struct platform_de=
vice *pdev)
>  		priv->vbus =3D NULL;
>  	}
>=20=20
> -	priv->clk =3D devm_clk_get(dev, NULL);
> -	if (IS_ERR(priv->clk))
> -		return PTR_ERR(priv->clk);
> +	priv->soc_id =3D (enum meson_soc_id)of_device_get_match_data(&pdev->dev=
);
> +
> +	if (priv->soc_id =3D=3D MESON_SOC_G12A) {

you can use of_device_is_compatible() and get rid of the enumeration you ad=
ded.


=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl4e0OcACgkQzL64meEa
mQYg7hAA3b0X6pzchiGHghxKiosXFmzOQiX2dHylXsAnC1vrb2qhE18bHFR+1bBV
R2w3SJE9PG0ohQN7JGOhL0SFHXbMs1DkRODizU6bvahZdgZy+/303lGKoKHwROaY
xY0BVakqO6it+5Kvuk0HR4FcHRNKmePWF3Eh86UBClVON/O8xxGaIiUaTzGNM8d4
thCM+xTDuBqhUsucX2VStmiL7I0vfFXVk8K/vWPLPEEoYvVZVkU4fEu0RZQnLXtn
yqrGAw/YNEG9e1RLiLILZeNEA0d22hQS3tFiS3bi6AOe124C0Cmok592uypCyhaI
+9kllsLmVroR26xEw1edqA2aQ/WzQV5ALagTa1QAjRwp72Do2ls8efc1lyyRgxro
JlH/XiRV4vS+Rt8E5Z1Sz7uteVU32Qnvc6vEqAXa0DBRAnDxSNL/zEfZe4mvI5jx
hE+0NNRbyK+cvmvzAIinsAueFgngGMUxr/ssX8Gogibipp2yCYs5QWMQ6iXRDdWU
TG2J39+gfrJWHmd9fJp8hsb/lxTwEe1qhZCQPNH3YB7PcIiyNbDDnjhqPNm3DtbQ
771yDsiOxNo0lfb135GHYW+HblXqLHbmRlW0c8SZ9gm0Bs5V4eppjDUVdWyL1W1P
3fk3G2/nxHKRTD8sc8T3EPCIc19dbCTOKrO9rHnM/aOuzE9TXmU=
=/llC
-----END PGP SIGNATURE-----
--=-=-=--
