Return-Path: <SRS0=BM7I=BC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59831C433E8
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 09:22:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37AF720709
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 09:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595496144;
	bh=B3UE38wWggDXAvEfi3ocQcg+mrnAy3oPLxUgR5kPVF4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-ID:From;
	b=TiS6ZzCo+uZkWFhSTm0/O9W1cjM2WL4/kGYsQw5BvexZKsrkv+9ijhpeYZzzi4Eo4
	 /8Y4RHantREKaNnpY9VsqlfeUvIBe837PHn59dC1Xuzr/VBVGDarlwfPjO7apR130G
	 25cY0a4t9QaStVUtwLc+raPEg8tRO++HPLUFRibo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728175AbgGWJWX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jul 2020 05:22:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725984AbgGWJWX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 23 Jul 2020 05:22:23 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE96DC0619DC;
        Thu, 23 Jul 2020 02:22:22 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id k17so2897898lfg.3;
        Thu, 23 Jul 2020 02:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=XvcKynrAqO64jDpC8rXFTuj/dKk+qiTN+T9dWEvAtxc=;
        b=S4AhXunyLyzCvttdEP0lHg79NiI8x2rN7v5vr5tZWrBNhnHq8dZqaGGts0UMrYKMZR
         pdHmEaCvziSeqmM8ClLwcBfgaRB7ZwYo+lU/y6ShCbzUfItxrVlUAw66KmjVW4WCAgNW
         is6DO6kAXsPA8u0GmhrWGh7KzQnkbvgGAg/MwSQXgt4Umz25XuzvlP0MCz+XSNOI88wF
         vNT27LmNPB6occfeHKtWA6mpm/GSqhD4qb94f6m2WQ5loOzsvEXhuTVYn4EUfFtkXNtn
         zKT3L7W6DBBvJ/rdamodnz8iN1QeywLHRnMnDWJ/xnszln22r6PkYqxcd8u3tpQ8FyBD
         gVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=XvcKynrAqO64jDpC8rXFTuj/dKk+qiTN+T9dWEvAtxc=;
        b=cyoxVh1OROE+FSHzd5l28eO5pd2Cew5ryIey5Uvo3xxnufaN3zTbw8NtfozjAr4l3Z
         zK/L4GxbQjqr1/ZebJxU5pJMGTWceD1e8mpSdpvq8XiJ0yYoZhhcIQuosU/jWTB8VdX2
         t71vh+/HQ88rRzfQB/YZP9M2MsuEvpfrLhn+P2s5iTftLiWm6SelsKGhRYTRqSbQyd1h
         BdeslKCBdQu/gYcyfSFHNcBXInx+zxzj2stqRsxAK5c+pyZ4qQXk/ohqexeGGs1A2Mjm
         WfbeueNEW+v7WiiyZHicjrYlemKAnFmZQaUlp3HAsl5uFoqAbhGwJO2SgW1Nnmh5W5f+
         RNRQ==
X-Gm-Message-State: AOAM533V6YhlWE6cOGky2bBD2/8zheZ/lrbIiYhdS9JPlPJGrt+xokqN
        141/RMmzmknW5lRtg+nU22c=
X-Google-Smtp-Source: ABdhPJz/q1d2N92Gvcbi/36LZ3e25H6+JolBjAiy3RzcxRita7lk14lAd0B4uewMO9o4dqee1cz8ug==
X-Received: by 2002:a19:654c:: with SMTP id c12mr1860082lfj.132.1595496141134;
        Thu, 23 Jul 2020 02:22:21 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id i5sm359918lfe.5.2020.07.23.02.22.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jul 2020 02:22:20 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Li Jun <jun.li@nxp.com>, shawnguo@kernel.org, robh+dt@kernel.org
Cc:     gregkh@linuxfoundation.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, peter.chen@nxp.com,
        Anson.Huang@nxp.com, peng.fan@nxp.com, horia.geanta@nxp.com
Subject: Re: [PATCH v2 1/5] usb: dwc3: add platform data to dwc3 core device to pass data
In-Reply-To: <1594028699-1055-2-git-send-email-jun.li@nxp.com>
References: <1594028699-1055-1-git-send-email-jun.li@nxp.com> <1594028699-1055-2-git-send-email-jun.li@nxp.com>
Date:   Thu, 23 Jul 2020 12:22:15 +0300
Message-ID: <87r1t2oabc.fsf@kernel.org>
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

Li Jun <jun.li@nxp.com> writes:
> In case dwc3 has SoC specific customizations, dwc3 glue driver can base on
> compatible string and pass it via platform data to dwc3 core driver; and
> pass xhci private data further to xhci-plat like quirks.
>
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  drivers/usb/dwc3/core.h | 5 +++++
>  drivers/usb/dwc3/host.c | 9 +++++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 0b8ea8c..3146697 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -29,6 +29,7 @@
>  #include <linux/ulpi/interface.h>
>=20=20
>  #include <linux/phy/phy.h>
> +#include "../host/xhci-plat.h"
>=20=20
>  #define DWC3_MSG_MAX	500
>=20=20
> @@ -924,6 +925,10 @@ struct dwc3_scratchpad_array {
>  	__le64	dma_adr[DWC3_MAX_HIBER_SCRATCHBUFS];
>  };
>=20=20
> +struct dwc3_platform_data {
> +	struct xhci_plat_priv *xhci_priv;
> +};

why? We should rely on properties, no?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl8ZVscACgkQzL64meEa
mQZq4w//e21Lo4ff7jZDTYI4GNKwH8wGmrPPmEocHEMLnDb55BHDFolJp0dFTNg5
tj06t+ukHPltpMdJB2NBhAT3hAwTFOuyl3SiTtnWkFAT5Pr/s+juL4qmOwCBrFwb
/OSnwtgXr3b3wM88Wil8O6XqolUPe1rCWprGv+PAMnmnmFe6WALjbUoIfts/gvxY
WPyGDnKLFyGhCt89CbAhCNpnhsqOzg4Ic1RTLMxARM5s+m8BZrfPSPS0L/5npKq3
+SxdlQgnCnrmOZrUkVbw+w9PF1XbR2elsQOiBnSADYIx7azi6DcBtqe+ClLImb4Q
wsfDmCrZ+yp8/BMW7MR+YvcPp8JsTH5scbv6owSu7FF9uZA9wk44kbzSL4aA0La5
yWWmyGdkWiloxzMQCODq7sd+tizcTqZADhKylQ8YKF+7sEtDuyaNowoC6fV50Zk+
/oTqCr6lwGkWiwE2M/FsWeXZo4+DdkXKobQx0OvyJjyqJ/26SQKyOEGoZO+xZVg/
fDkoV/GPbgdBc89tB6HG5FiTyCXLY1oqAuNwWiZcSA03YSbBglCQGwDEh4hvGW16
CTrT8kMATxUvTYlwMnfTwGRQwQtCp+veazjD9ZgEtfk0aB9Bwwl1qlTgok31xDI1
uZlB9d0GbnabH8BceuyeCwgaBjFDexRPuAXVQI9TcB5ON5rZUSY=
=yp3d
-----END PGP SIGNATURE-----
--=-=-=--
