Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1323EC43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 21:56:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D7820214D8
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 21:56:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jApF8wDt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731236AbfLLV4t (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 16:56:49 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37771 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730811AbfLLV4t (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Dec 2019 16:56:49 -0500
Received: by mail-pf1-f194.google.com with SMTP id p14so99729pfn.4
        for <devicetree@vger.kernel.org>; Thu, 12 Dec 2019 13:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:cc:to:subject:user-agent:date;
        bh=R504xzcVz+CgAl5xRon/DrsTzkWasdrV6fbsiIR7GPY=;
        b=jApF8wDtz44pbe7YQynFmRFce0I/fjN6RAuS8ZCmw0NGt3HCZ5yX5LjPYioFyLTITM
         rtlwl1Y3z3XOz08vPoBAIqbbwrPKqKODSS5hc6Dr+19/yX6IrfpMl3aUXHDaeZrQpnfN
         QEw6ZXGPFysyyyVjGadqzDoIIpkmxkTEteJik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:cc:to:subject
         :user-agent:date;
        bh=R504xzcVz+CgAl5xRon/DrsTzkWasdrV6fbsiIR7GPY=;
        b=ika2X1vdqT1hf1UDRwJrNBNI2quSltbxtwpX46yetyzakn1bcul4ql5rEJlyPR/qFF
         G3RO6+E9zMpXUKcEJZDuNX57jzoMLc6jEohXanBFZXbo2BeJmnnEHGS/D51McC/P7J9H
         DagoI0RQOBqa4iVSAFOgn2OcdQMjy8kOISgopq9VAN54cqnDP2GBh6nHkkjO+dftwQvf
         K1jAe4TcYpJjbhpVfhXYJrcuwG9EPvMy4K5nUU3oaM9TzFteW1rEKUKgce6ByOiR3Jkq
         ohZiQ7IZeOP6HIlYCfddPRjER5FgAxSOaa4BB25UsO4RXo0SR3ly6U09Bl9sa4Pl5mBO
         NfFQ==
X-Gm-Message-State: APjAAAVcRN1Fg2KkugjRogx497ZbSSCKF8B38st3mK4jQqPCfHzBHu9H
        9Y4iGEs44MLhhMUqIj+emFUVMQ==
X-Google-Smtp-Source: APXvYqyzBzZHqigvl/nRwOiBG4spBHBcMMBa2OMSb9eLLysTGsB2DUuYWrNZaR4eXzpnp8M6S+gVZw==
X-Received: by 2002:a63:4723:: with SMTP id u35mr12630015pga.194.1576187808586;
        Thu, 12 Dec 2019 13:56:48 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id w6sm9136180pfq.99.2019.12.12.13.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 13:56:48 -0800 (PST)
Message-ID: <5df2b7a0.1c69fb81.8e18e.6b3d@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191212113540.4.I5f67a5ed7665f658c95447a837cbd0021e1dc689@changeid>
References: <20191212193544.80640-1-dianders@chromium.org> <20191212113540.4.I5f67a5ed7665f658c95447a837cbd0021e1dc689@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Vinod Koul <vkoul@kernel.org>, Kiran Gunda <kgunda@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, mka@chromium.org,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 4/7] arm64: dts: qcom: pm6150: Remove macro from unit name of adc-chan
User-Agent: alot/0.8.1
Date:   Thu, 12 Dec 2019 13:56:47 -0800
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Douglas Anderson (2019-12-12 11:35:40)
> This is just like commit e77cc85ee390 ("arm64: dts: qcom: sdm845:
> remove macro from unit name").  It fixes the error in 'make
> dtbs_check':
>=20
> arch/arm64/boot/dts/qcom/sc7180-idp.dt.yaml: adc@3100: 'adc-chan@0x06' do=
es not match any of the regexes: ...
>=20
> Fixes: a727ec1232d9 ("arm64: dts: qcom: pm6150: Add PM6150/PM6150L PMIC p=
eripherals")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

