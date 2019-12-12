Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F0E0C43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 08:18:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F41C52173E
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 08:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576138683;
	bh=aRxgfzcMY/rhrsdoJUu0f5LB6X36Bq9gSAWQu+fdFCA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-ID:From;
	b=nrt/4akMNYzy9WBl38l6W/VqWeWLp80ObXn6T/IOZqh2bh8SB1SmCgjaH/rMLTNic
	 Ka1PLiZxb+M0yT5oCmGYDun1ng+JbJS9x3pa04lI6p29bxn5Rxm9qc6xeCNOC+tM+E
	 aXuQJJsQ1ShlRGF3eNprViPWTKEYM6CK38eJvaFk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbfLLISC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 03:18:02 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37295 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbfLLISC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Dec 2019 03:18:02 -0500
Received: by mail-lf1-f67.google.com with SMTP id b15so993146lfc.4;
        Thu, 12 Dec 2019 00:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=5EnIFiXZh/Iu4A4WLSxDoAN6XfjbowqqgnmFCQOC6Ks=;
        b=XADuIgBefyNRbvFGsOescfiGExAAP4UfpYuRWj6ER4zWPnqhC6qjHoC57D2BRkeunJ
         xn8f6etkRlursLTze5hp9naXJ9T+u4DGnDj8JDma+Xng0jwgYf1B4Wcu7li1VdqkktOG
         Hv9hdXELek2WELKbRTRWaaFO3MfUE/Xrw/CWXkfc8nfyyzz/e01ezV1HuE81JD9GqqT6
         Z+vKkeX9G1gv8wa2OXmyiOCEpbmxHHXx3xU6H48G10iKQqgJalL4OFg/OrPvSPlqrVjb
         i2h+bq0MGFKl0hiUkAnhEnAIQfGNjjXEJs3qFAIsKDD2b5+3HdqEirrHK4yXXnxZ2e16
         9QDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=5EnIFiXZh/Iu4A4WLSxDoAN6XfjbowqqgnmFCQOC6Ks=;
        b=FDFy309spGnQWpKRu4fsBScujmrrvPF8HVPiIJ78X7ylTqcvyMSF2h0r2H8hEnIj1B
         cCK5AEBsIfRQCxrDAYCcG/HWRGUx+LK7pUUwV06AO4AYk9UL+uPiWT9YX+hOUwpN7hjA
         fZ43fp49r3/csr63ntaGAcpEnbTccJtZT4KRE5LhXCtQL2hlwmZKbwMZegV1HZx97s3d
         clmb/VL0XXfQPtCGsLjtrr1SHoIDCuh0y8z82E/QulE+iY8TEQv07adxYf933S8CaVz0
         hEwQuwdWYH/C7AjHoTpXReYvbNPdIxpB6vf3awsoIUs0WQQrP+WT7tFV+8Z1joh08pRt
         G29g==
X-Gm-Message-State: APjAAAVz9pobRFXRdnc4Xi+V0e2X4kCWfuoq6roPUNTK7VVQW0wf1qQ5
        WCR+e4HTOxKTFT4YT6s0Em8=
X-Google-Smtp-Source: APXvYqwn/IITTaBb6NFu2GrVumFrSApCYyDJDP7vgctcMwCNwDWCPXvziZmsoL5KYgOuskWZoJ6qww==
X-Received: by 2002:a19:f514:: with SMTP id j20mr4529061lfb.31.1576138680073;
        Thu, 12 Dec 2019 00:18:00 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id d25sm2550188ljj.51.2019.12.12.00.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 00:17:59 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH 11/14] usb: devicetree: dwc3: Add TRB prefetch count
In-Reply-To: <7098386bb19ebfee02027555d86fc47822b617d4.1576118671.git.thinhn@synopsys.com>
References: <cover.1576118671.git.thinhn@synopsys.com> <7098386bb19ebfee02027555d86fc47822b617d4.1576118671.git.thinhn@synopsys.com>
Date:   Thu, 12 Dec 2019 10:18:44 +0200
Message-ID: <87pnguvtwb.fsf@kernel.org>
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

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
> DWC_usb32 has an enhancement that allows the controller to cache
> multiple TRBs for non-control endpoints. Introduce a new property to
> DWC3 to set the maximum number of TRBs to cache in advance. The property
> can be set from 1 to DWC_USB32_CACHE_TRBS_PER_TRANSFER (CoreConsultant
> value). By default, the number of cache TRB is
> DWC_USB32_CACHE_TRBS_PER_TRANSFER.
>
> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentati=
on/devicetree/bindings/usb/dwc3.txt
> index 7da1c4e7d380..ff35fa6de2eb 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -105,6 +105,9 @@ Optional properties:
>  			this and tx-thr-num-pkt-prd to a valid, non-zero value
>  			1-16 (DWC_usb31 programming guide section 1.2.3) to
>  			enable periodic ESS TX threshold.
> + - snps,num-trb-prefetch: max value to do TRBs cache for DWC_usb32. The =
value
> +			can be from 1 to DWC_USB32_CACHE_TRBS_PER_TRANSFER.
> +			Default value is DWC_USB32_CACHE_TRBS_PER_TRANSFER.

how about we just leave it at the maximum and in case someone notices
problems, then we consider adding more DT bindings?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl3x9+QACgkQzL64meEa
mQb2gxAAmAz+yGkB9zy8zX5+7CfRGLlsPvQVP3uveDLKxXgzzXAny/X0zGktLL3C
UhH8Hn+PP6KINULq65Fnz4YojB3ZB/mY2ZbMhkDLxNbxjqlUlpjc3Q3MtpT3xgKu
GIhxT6R5s4oa3kRXWhGpjdhJevRQwJN3l05Pxe40gaaeAHJKwGxQWuhiol48Qc3A
9Yhm9dJEiyi9t1LTDDnnOVuUUsroo2qRfpozS1VcsGrmy81elzkN3S5hUnFM8lox
QTr/zmt62tnAqKcMeo+OeyO/Ugu/0Tptn1xkG87E8hDFHd/2rj0tQjddi4yE/PGJ
uvFKNxWKMXSEuuQrzjl8GDSF48xCw01A/uU7KCGWmVifvc8Gm2ZaZXaAabw4OBG2
sboZKVlkwputTsSXyBzbe7ZPe2WrJ04LWpcZuI9s8HP/7KHp8hCKlCJxzwIzNXrh
P1h3idpSz40isXZJwlL/5rwu/hkS24MKUym0P52gwMlPOPG5OYq9ide9r1bykf1l
5pEz3aZB1+G4+WhyAQJ9Jm1CzaggWdaNLs1xL9KKi3zvOaz3jb6HGAJCyPZZ1hNZ
JU6FqVrAoTQQkyuNxsEKTBN3g9nhXkAleGFadymXf6YMDPS2xnyKArd32ajlJSHi
kOyTEJ9ZPkIETsNCRZo2N6BQqpq03+4chNlTcRJeiIMZYVrBidA=
=CKsw
-----END PGP SIGNATURE-----
--=-=-=--
