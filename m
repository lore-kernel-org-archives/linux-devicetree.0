Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D7EFA372C
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 19:12:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C78B9206A3
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 19:12:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="D61jjhVf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391279AbfKHTJY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 Nov 2019 14:09:24 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38582 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387556AbfKHTJX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 8 Nov 2019 14:09:23 -0500
Received: by mail-pf1-f194.google.com with SMTP id c13so5241835pfp.5
        for <devicetree@vger.kernel.org>; Fri, 08 Nov 2019 11:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=rJ1urZ8T7mCJHoBlOuQT5kf7O0+8075YXJJdXtDtH7U=;
        b=D61jjhVfWDWSMveOGbAsO21SqjPj0dRPXQmK22xQFY1GOYifueuPRNL45P6whbv76d
         +koe7VPSRs9Hh0QYnbedzWgk8x0eJhqNXE50FDnKgoM8VYb8R3vRcxEYY962NbGNzyAH
         ZozKEI0ik3vBEAuReccVPRkzTxDkUVmi0rZRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=rJ1urZ8T7mCJHoBlOuQT5kf7O0+8075YXJJdXtDtH7U=;
        b=Ax85FhnZHqWe9YJfEmW9x2CRzStrgRCRHXqmkI/D7Rt1x6oPdYemRi325Ju6aigGRc
         i/BlYbOtdBvRc/2bv6orVI4xDEEGI2xRg9qYOdlxmBGNk7hvnvXHUpuePDycLwqNb0N0
         QZdczy4zF7hs88naIddax1dJCL8AF0SJMRrrPpNJDgXdG7S3N3QD88oltbU7URMPxYkJ
         L/0UC3PH2fV9T1zmmQ0RArc1hnShKwzEQKh/T0uVXYp68HILU5L47Rqgoiv9LkrfGbqS
         XzJN6AErvxEU+gRM+IX95wKNVQYj/5QocUtuRvHpGrrR4vA+jF37MwpddLO9HtYqGAGK
         5xqQ==
X-Gm-Message-State: APjAAAWSZvWQ3nkuTxOqFOdVSKKSw4EnAGksMxscjsJhuBpI/D0X9EWp
        eFsRkiIfakA0XOdB3mxxfIVVnA==
X-Google-Smtp-Source: APXvYqwF6BcI+PSkqcZ1hzG3Fq8z2hINUeBNu1KSX2QSnhuU5EyKjQGpElD+ZP55Yu2cmAcXBJIhOg==
X-Received: by 2002:a62:174d:: with SMTP id 74mr13732051pfx.145.1573240163193;
        Fri, 08 Nov 2019 11:09:23 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id l72sm6138763pjb.18.2019.11.08.11.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 11:09:22 -0800 (PST)
Message-ID: <5dc5bd62.1c69fb81.682a4.0fa6@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5790f59f-951a-f1b4-bb31-f9cefec0c642@codeaurora.org>
References: <20191106065017.22144-1-rnayak@codeaurora.org> <20191106065017.22144-3-rnayak@codeaurora.org> <5dc4588e.1c69fb81.5f75c.83ad@mx.google.com> <5790f59f-951a-f1b4-bb31-f9cefec0c642@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v4 02/14] arm64: dts: sc7180: Add minimal dts/dtsi files for SC7180 soc
User-Agent: alot/0.8.1
Date:   Fri, 08 Nov 2019 11:09:21 -0800
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Rajendra Nayak (2019-11-07 19:48:57)
>=20
> On 11/7/2019 11:16 PM, Stephen Boyd wrote:
> > Quoting Rajendra Nayak (2019-11-05 22:50:05)
> >> +                       qup_uart8_default: qup-uart8-default {
> >> +                               pinmux {
> >> +                                       pins =3D "gpio44", "gpio45";
> >> +                                       function =3D "qup12";
> >=20
> > That looks weird to have qup12 function on uart8. It's right?
>=20
> So we have 2 qup instances each with 6 SEs on sc7180.
> So the i2c/uart/spi SE instances are numbered from 0 to 5 in the first qup
> and 6 to 11 in the next.
> The pinctrl functions however have it named qup0 to 5 for first and
> qup10 to 15 for the next which is weird. Now all data in the pinctrl
> driver is autogenerated using hw description so its coming from that.
>=20
> Just for comparison, on sdm845 we had 2 qup instances with 8 SE's
> and the function names were qup0 to 8 for first and 9 to 15 for the
> second.
>=20

Alright. Good to know the hardware description is all messed up.

