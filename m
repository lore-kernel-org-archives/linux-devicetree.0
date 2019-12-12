Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 156F8C43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 08:19:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D8D32214AF
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 08:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1576138748;
	bh=UD1WcuUQ16Z4NnOJgpbBnSskmXJ/SLnt7jIhevPNPKs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-ID:From;
	b=SL/DJ00ZDLDzux/UYgN7cXcOR7H+BdQTt+JYQOakFmP5YUTFRKQ0jm5Rmxh05hzgj
	 ZerFJnI32dR65leBKZ+3Pv1wtrX7xEJNMXlB/7VVXpw0h6Hs8Gn1imfKebzfWFZN8Q
	 0pLwPEmzmkUCICyRtpr0PtIBA211N+ViAB1IrWLM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728174AbfLLITI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 03:19:08 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34522 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728129AbfLLITI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Dec 2019 03:19:08 -0500
Received: by mail-lf1-f65.google.com with SMTP id l18so1008312lfc.1;
        Thu, 12 Dec 2019 00:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=oGfQkQb+qSVD45UszFgkJBvL5DndufT7t/2w3VyYt4I=;
        b=I2Dieg+H63P4A5C6y6ySauhYT4DRGKXnUVXkAzcUNtwgM62gOj8S1RDae7NltFzZYT
         xd82QlERdzsOJmnbtiK2dolh1rdZ2I+KzOU7wkOboLkh9vcPZoEnEoXCOpGGLrrZ+Fzl
         k+gXp6BxxNloXA/fZNjyg+8mVg3mJi0wbhD8Aj0SMdkKdzxoh15ubRJiopB1Nwn3im2Y
         kNecItNQJbtpbO1gSVDjxz5rAW5THz+AkszN3UBQaND5t/BG/zSaTJun69GtwOYnIUmP
         MgE1rircNTPXLRQaD+tAsc9PuX8L9nGOQlu7/LAMRnPb1uwRKoazxwc4Z625pw9SQpjs
         oONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=oGfQkQb+qSVD45UszFgkJBvL5DndufT7t/2w3VyYt4I=;
        b=M6q+GihUpqQFSHhemSgIY4SJpjeTX4a/e8LLgggER93nmq0k4fMv351zwtleiJSBO4
         FqEIgbNqFaNKFqJ+eZdrBc2NOSZEBB0Lc+y6CTQ3g3jZiKFMRVASOImNd1k2ET9065iP
         9nlJOlTkSjWXol38ohkvBCLr28bkelWfR0+iTFAbK0Neb7PfrP8nlMUBH/8Mp1FrScKd
         V6ohgdY7V/pnYx21PcxMv3GR2QaEz/zfdmq7phEddbjC1898hBTxQg29tdX8vHYJIONL
         U2HPLZdMabA8fNsBifPwE2ptxVd9gmmg+luNXVzZaPtCuwBVXyHtXyr5mCxzHUO0QfAb
         vEzQ==
X-Gm-Message-State: APjAAAV7aEx1ANhRpDjj1K7VK/K34/LI76u1kwRin2Ibv7X76m9ETx4s
        FO5sQIVLL2cIWJQYPtJx2wM=
X-Google-Smtp-Source: APXvYqwBsX6Df+KMzWhUSH6U/J6Fa+UvBmZluR+VoMgaU9wIJOuie0vlQsS6ZuZ2pHuPR46CM2/x+g==
X-Received: by 2002:ac2:5c4b:: with SMTP id s11mr4751192lfp.133.1576138745975;
        Thu, 12 Dec 2019 00:19:05 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id z7sm2791037lfa.81.2019.12.12.00.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 00:19:05 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH 13/14] usb: devicetree: dwc3: Add property to disable mult TRB fetch
In-Reply-To: <b791f032edb8e6a739c342dbd0d2d5faa66ddfb8.1576118671.git.thinhn@synopsys.com>
References: <cover.1576118671.git.thinhn@synopsys.com> <b791f032edb8e6a739c342dbd0d2d5faa66ddfb8.1576118671.git.thinhn@synopsys.com>
Date:   Thu, 12 Dec 2019 10:19:50 +0200
Message-ID: <87mubyvtuh.fsf@kernel.org>
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
> DWC_usb32 has a feature where it can issue multiple TRB fetch requests.
> Add a new property to limit and only do only single TRB fetch request.
>
> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc3.txt | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentati=
on/devicetree/bindings/usb/dwc3.txt
> index ff35fa6de2eb..29d6f9b1fc70 100644
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
> @@ -108,6 +108,8 @@ Optional properties:
>   - snps,num-trb-prefetch: max value to do TRBs cache for DWC_usb32. The =
value
>  			can be from 1 to DWC_USB32_CACHE_TRBS_PER_TRANSFER.
>  			Default value is DWC_USB32_CACHE_TRBS_PER_TRANSFER.
> + - snps,dis-mult-trb-fetch: set to issue only single TRB fetch request in
> +			DWC_usb32.

two questions:

=2D how is this different from passing 1 to the previous DT binding
=2D do we know of anybody having issues with multi-trb prefetch?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl3x+CYACgkQzL64meEa
mQb0HBAA3L/LffH8+b3EL5yPsoWNT8i2KENKIFVWIMyIBAyCA4yoIVvZo0oukQhY
stJ/1DjEX0XhdjKFzA+XU6pQpP3XRmMubYY1rWqF6GhSoQU6VR/eIeECe8OaFD/L
hXQbn2cC7G52N+IBqP0e3RLDknhWD0JKPW5IsziRPpZhmau/Yu3JB3bBo1eCEKQ0
1ECXeX87cYAKFtv1judsHH2fHB2CMmViWDPwRaWmYwcKsoI1b2sGC37mp2jE5ZeC
9A4T95nrtkCTLv2uOHW/UjS+vvyxXuYX+q/M96C+ZM6/k++q9dJzSjOgw3X3PTB3
rERhz9NRHD8hyouiW0zN/HPRbQMX3XZE/PFTPFMdA753dsstcKGTYe4MgyiyF2zn
7jnPCXW3FU9k2YDEFjmjF3Kt4rN0rcppkJpCHPn5pTXbavLO2HQLqqX4rqEA6N59
7zclIwSM+ekbu7RpUx/xW34/ii/MAwLhWR0/ddFmjr08jyS5YJAVtL2P1pXD6o8b
yAtJEDRlglRVoRrSrVVwam8s9gMLUR58VRweKBNJoSf5Gk3BObw9VfheVhrxStP4
rGTunWH6RH+9LY+KQzjjiqekoMOHVwr3tl23B76Cw/o3ZmIx8HLDv5YDS+o9FbWS
XzCuqyaHc06XDUHchbVtR9zHR2oGBSGJsloVu9dyDQwb6/rk0w0=
=K5vC
-----END PGP SIGNATURE-----
--=-=-=--
