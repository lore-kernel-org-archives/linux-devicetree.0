Return-Path: <SRS0=Rh3i=5E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B96C43332
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 20:30:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3605520663
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 20:30:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lWmsiQ6L"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727383AbgCSUaH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Mar 2020 16:30:07 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36066 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727414AbgCSUaG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Mar 2020 16:30:06 -0400
Received: by mail-pf1-f195.google.com with SMTP id i13so2045765pfe.3
        for <devicetree@vger.kernel.org>; Thu, 19 Mar 2020 13:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=jWRRL5fJU84goaEEMPwzMKuUagdNByNPY2GPzz3BqUo=;
        b=lWmsiQ6Lb12qslAwJviWPgtxxPbMSrg+pf/z7L753FhqBwUjeQBLJhoTf8/lddF/he
         xOvVxA7tlABxLQiOJrogLhHZqlWH9NMdQK6z4QFWYrq0WhNVbIDT1NPcMDNKDlbpBIGY
         esQgYzmhVXZOC2O6GW91aUxmqMwf/hxeKNtH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=jWRRL5fJU84goaEEMPwzMKuUagdNByNPY2GPzz3BqUo=;
        b=ONEcvg+2hbFM7wjcPBVPZ2lJkVxa+bClqbVMdeddvuR3bzMkoo2ExYwdljW8VFPgWb
         SmT8MZYJsXZB7TaOT9t0qqvgb0232fBg89GwL8u7zDY9l3Pjlqf7Imnw+teyQKM3yyqo
         /wCvsQyanuiQz+LdDenxzvLEkXtPoHIhVX1HaMg/lmiptsUzI1gnNN4ak/x98SLDUUlj
         L+MQuUKQ6dj6/2Ixo58hV1bSMujcxl+X/WFktdij9Unf8XUU7puvQx36+FGnBU1fuCDY
         aRc95/itsR5eHIK++gjSQdtk0LUBXr9Pilv83L3+uOJoNIOq5f8Fqg7fuP8AZKnMThRK
         9RYQ==
X-Gm-Message-State: ANhLgQ2+r1/WG3U5c6EqmrwH4WHwFuQsmfrwuYc5xA13yVIS8nFGNo0q
        /kjNGOzwB/I5H/WpW05yy1Fisg==
X-Google-Smtp-Source: ADFU+vvXN5rPoEsslES8Yzt/IbFnT4RPQKMhfYMmFrcParmX/mJcnSp+G095zu6wuQaOYpmLGqW8Lw==
X-Received: by 2002:a62:7a88:: with SMTP id v130mr5681312pfc.129.1584649804565;
        Thu, 19 Mar 2020 13:30:04 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id z16sm3343326pfr.138.2020.03.19.13.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 13:30:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f6e948cb-7d3f-72b6-b153-58afb1304c49@linaro.org>
References: <20200311191501.8165-1-bryan.odonoghue@linaro.org> <20200311191501.8165-3-bryan.odonoghue@linaro.org> <158458013177.152100.17920784952083533825@swboyd.mtv.corp.google.com> <aa6aa234-e2d1-bdcd-0f0e-64b2a7e497d3@linaro.org> <158463604559.152100.9219030962819234620@swboyd.mtv.corp.google.com> <f6e948cb-7d3f-72b6-b153-58afb1304c49@linaro.org>
Subject: Re: [PATCH 2/7] dt-bindings: usb: dwc3: Add a gpio-usb-connector example
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, jackp@codeaurora.org, robh@kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, balbi@kernel.org,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Date:   Thu, 19 Mar 2020 13:30:02 -0700
Message-ID: <158464980279.152100.13680630167113607572@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Bryan O'Donoghue (2020-03-19 11:03:58)
> On 19/03/2020 16:40, Stephen Boyd wrote:
> > the gpio for the connector?
>=20
> Previous version of the PHY from 2019 had extcon toggling vbus.
>=20
> Since extcon is going away, we moved go usb-gpio
>=20
> https://lwn.net/ml/devicetree/20190905175802.GA19599@jackp-linux.qualcomm=
.com/
>=20
> https://lwn.net/ml/devicetree/5d71edf5.1c69fb81.1f307.fdd6@mx.google.com/
>=20
> usb-gpio-conn handle VBUS and notifies via the USB role switch API.
>=20
> Which if the connector is a child of the controller "just works" but,=20
> maybe with a little bit of work DT <port> references could do the same=20
> thing and the connector wouldn't need to be declared as a child.
>=20
> > We (ChromeOS) need to integrate the type-c connector class, etc. on
> > sc7180 with the dwc3 driver and the current thinking has the type-c
> > connectors underneath the cros_ec node because the EC is the type-c
> > manager. The EC will have a type-c driver associated with it.
>=20
> right and you don't want, doesn't work or doesn't make sense, to declare =

> cros_ec as a child of DWC3, fair enough.
>=20
> I guess a DT remote-endpoint{} will do the job.
>=20
> Something like:
> arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
>=20

Yes something like that, but it looks like that dtsi file has the usb
host controller connected through a remote-endpoint to the type-c
connector. I was under the impression that it would only be the phy that
is connected this way because it's possible for there to be multiple
different phys that drive data out through one connector. For example,
in type-c the DP phy can be different from the USB2 phy or USB3 phy and
there could even be other things like an HDMI phy too that all go to the
same connector.
