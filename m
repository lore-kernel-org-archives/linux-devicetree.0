Return-Path: <SRS0=rjyW=3U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 921C1C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jan 2020 13:33:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5C2DF20707
	for <linux-devicetree@archiver.kernel.org>; Fri, 31 Jan 2020 13:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1580477618;
	bh=Ht82EYSFHK40WBNKWexjjAi6ts9bY1pJGIDvXwBlY/8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-ID:From;
	b=dq9QAWlyug/UOIal/ZssDrzWQyHEyfr9e2A7uu4UIrdZN+Gw/Gyawk2NhW7enUBmr
	 xEmjXyRFXeHD+ckLT6KXr+hDprJ25lCypNyqoGuILXXtOtV/h7c0WaHXchaH6z6CHO
	 LI2tOZRwlhj6G9vk9476jb5B5qwGMDSER8SG/uZg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728693AbgAaNdi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 31 Jan 2020 08:33:38 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34158 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728620AbgAaNdh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 31 Jan 2020 08:33:37 -0500
Received: by mail-lj1-f195.google.com with SMTP id x7so7145872ljc.1;
        Fri, 31 Jan 2020 05:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=8xJUVWw1XqMhfXb1cV/Ls5bOc5zsZ/PIs0D4u7u3o1o=;
        b=NWiDXiMhla7cNfbmUDmqE5VH96zQpMJZJ/XNqjF+oM3XyZdpXBlMLIR6/VlUCJLOf+
         vblnrArB05QxSyH6EEU1zCjsdOfs96W8Qj4UdpMDaRzGk5xmFmKPbxyUPOfaNat9SLzr
         vRACKmQCOmEQ4jvPtplfeEW0fV2UbepicWT4qZxx6+Y6bWSlnrZq2G8gGJR1prUf6fS3
         q/FkCL2zzeSh65Yx5pd+QftU83FRyeBgKsoSNbqD2AzVVf5Olm2SNMGCL4kcPwya/4GZ
         milr4W8t92cjlrGQNxFX6HWSN4idpTQMfeuiegnQruBYN1rdV6rT9ADFtNuT6phHgd2M
         VVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=8xJUVWw1XqMhfXb1cV/Ls5bOc5zsZ/PIs0D4u7u3o1o=;
        b=RhYSiMhDfY6DJyNDenD8rL8+Qo1TZB9u3tROTQVEFkzucoSSGRN/qJQdinUxzvhbLc
         nsNpX1KinoOgEUM517rX3xy9MHvMfoUNvgZHd1xFdQwNLm3UJVNugA7eMWbE1Bi6FKIy
         E+wNz3RzKkpstFUMMdnIs7OfvbOXbZvSp7BfYA7IP1g86zxNNTqggJ2AqdeDwsUCj063
         plZ1wMt6VEtepg57QY079ow2iFtc8fFUQeoW6HArwtDpTHQL1n6CCb7AqfST5mczioB8
         tAh2mrv58lqQTHtqKVF5lcKhKpD9AFk1ReLVVnlCB9s0odM2EZ1TaHKfDI3L2Ecbcf58
         5wCQ==
X-Gm-Message-State: APjAAAVtVpSb4nE+KSHGMvEUSaK89r9oHc/z8vkbabYkkvq61G/P2Fwu
        9NWoR6xOW+sp5eDhVquCLmI=
X-Google-Smtp-Source: APXvYqyRAlb719rmnNqIgnPYKeFfkJ4InXdaYjYsK7trRMSyEgx6KBG27EvdjnUbw/Hr9bDCnVnXuA==
X-Received: by 2002:a2e:3619:: with SMTP id d25mr5774534lja.231.1580477613536;
        Fri, 31 Jan 2020 05:33:33 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id w29sm5787316ljd.99.2020.01.31.05.33.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jan 2020 05:33:31 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Hanjie Lin <hanjie.lin@amlogic.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Hanjie Lin <hanjie.lin@amlogic.com>,
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
        Yue Wang <yue.wang@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
Subject: Re: [PATCH v7 0/5] arm64: meson: Add support for USB on Amlogic A1
In-Reply-To: <1579489086-157767-1-git-send-email-hanjie.lin@amlogic.com>
References: <1579489086-157767-1-git-send-email-hanjie.lin@amlogic.com>
Date:   Fri, 31 Jan 2020 15:33:27 +0200
Message-ID: <87lfpn7ntk.fsf@kernel.org>
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

Hanjie Lin <hanjie.lin@amlogic.com> writes:

> This patchset adds support for USB on Amlogic A1 SoCs.
>
> This patchset is composed with :
> - bindings of the PHY
> - bindings of the USB Control Glue
> - PHY Driver
> - USB Control Glue driver
> - dts of the PHY
> - dts of the USB Controller
>
> The Amlogic A1 USB Complex is composed of :
> - 1 DWC3 USB controller for USB2 Host functionality
> - 1 USB2 PHY for USB2 Host functionality
>
> The USB Control Glue setups the clocks and the reset about DWC3 USB
> controller, and binds to the USB2 PHY. It also configures the 8bit
> UTMI interfaces for the USB2 PHY, including setting USB2 phy mode.
>
> The USB2 PHY driver initializes the phy analog settings, phy PLL=20
> setup and phy tuning.
>
> This patchset is based on A1 clock/power domain/reset series at [0].
>
> Changes since v1:[1]
>  - integrate glue and phy drivers into g12a's
>=20=20
> Changes since v2:[2]
>  - modify amlogic,meson-g12a-usb-ctrl.yaml with dt_binding_check tool
>  - phy/glue driver use of_device_get_match_data to distinguish A1 from G1=
2A
>
> Changes since v3:[3]
>  - fix bindings mistakes of the PHY according Rob's comments
>  - fix bindings mistakes of the USB Control Glue according Rob's comments
>  - phy driver add xtal_usb_phy clock which moved from glue driver
>  - glue driver use otg_mode instead of soc_id to support otg function
>
> Changes since v4:[4]
>  - phy driver revert reset-names changes
>  - phy driver change clock name to "xtal" to consistent with g12a
>  - glue driver add drvdata otg_switch_supported
>
> Changes since v5:[5]
>  - integrate phy bindings into g12a
>  - modify glue bindings format according to martin's advices
>  - glue driver add dwc3_meson_g12a_otg_init() do otg related work
>  - glue driver add clk_bulk_disable_unprepare() in remove
>
> Changes since v6:[6]
>  - fix glue bindings dt_check_bindings error.
>  - squash phy and glue dts patches and set usb status to disabled default
>=20=20
> [0]
> https://patchwork.kernel.org/project/linux-amlogic/list/?series=3D185477
> https://patchwork.kernel.org/project/linux-amlogic/list/?series=3D180055
> https://patchwork.kernel.org/project/linux-amlogic/list/?series=3D189643
>
> [1] : https://lore.kernel.org/linux-amlogic/1574405757-76184-1-git-send-e=
mail-hanjie.lin@amlogic.com
>
> [2] : https://lore.kernel.org/linux-amlogic/1576636944-196192-1-git-send-=
email-hanjie.lin@amlogic.com
>
> [3] : https://lore.kernel.org/linux-amlogic/1577428606-69855-1-git-send-e=
mail-hanjie.lin@amlogic.com
>
> [4] : https://lore.kernel.org/linux-amlogic/1578537045-23260-1-git-send-e=
mail-hanjie.lin@amlogic.com
>
> [5] : https://lore.kernel.org/linux-amlogic/1578634957-54826-1-git-send-e=
mail-hanjie.lin@amlogic.com
>
> [6] : https://lore.kernel.org/linux-amlogic/1579220504-110067-1-git-send-=
email-hanjie.lin@amlogic.com
>
> Hanjie Lin (5):
>   dt-bindings: phy: Add Amlogic A1 USB2 PHY Bindings
>   dt-bindings: usb: dwc3: Add the Amlogic A1 Family DWC3 Glue Bindings
>   phy: amlogic: Add Amlogic A1 USB2 PHY Driver
>   usb: dwc3: Add Amlogic A1 DWC3 glue
>   arm64: dts: meson: a1: Enable USB2 PHY and DWC3 controller

I have taken dwc3 bindings and dwc3 patch. PHY parts should go via Kishon

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl40LKcACgkQzL64meEa
mQb/jxAA2qH+Wx14NNofPg4dQrx52qRhgqUpP83dr+5AAiQVmcJogR50DsHpOqaO
eVB41fn/HvWEzLg5+F4LTiDCjj3dThrKrJqT2LAu9CH0hZ08yDAUwCYtA6zl71Kb
SSNqfCImJdeY2VFym/BnHx7mFcCBnmtYsXxecusFOOjW7qhjNiwnSz8pHHvsVox9
Zhbl1xshpndfi+7YO4To7yQxv4SZetoemqKfzK1rAj8QCAbjqtP7HsrAAqfqBTWB
FTMx2Xj/wgGPB7oUrYmyTqURVXtJPcGI8zlLNQB0u4XnsYtIJwrx9vku/24PBHoA
EA7fQebDXjQg4aUeqeSnLaMxi4osnfX5aQ/cBVfV/b0yvG1Pfm1mRbxXdaWcsm4f
JjTdjQ+m5thpcNRN84OSV2Vld1InwRs7xfLG714Ueipg/svlNkw/9dI/0U0WcF/p
thKnpioYNG/q/EQ1XjOZD0SiXVPgYd/HvTRu/7Mhyj1aFKRU6K4InNgPZtZS4fCd
+iRBHJ7NLXtahH2rQYt6Zid3pTOvHnShzVU6n2qTaLkziS/TGL5knuKlvRSAa4w8
D9FkX7gxQP28xaDy0u1kouds9ubvcw8TjBQTS38EAjev6AtZojthwvsJ/4EIYHRt
QBEO9KQEaqqYvGNreNhV/Xex3D2UgwHokcsD1K1MFfVE3WfJ4fs=
=R1Oz
-----END PGP SIGNATURE-----
--=-=-=--
