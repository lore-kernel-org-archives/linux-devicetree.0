Return-Path: <SRS0=GOr1=2C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 725CBC43603
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 21:56:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4455E214D8
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Dec 2019 21:56:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RubV1aPP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731035AbfLLV4h (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Dec 2019 16:56:37 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:44739 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730891AbfLLV4g (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Dec 2019 16:56:36 -0500
Received: by mail-pj1-f67.google.com with SMTP id w5so101835pjh.11
        for <devicetree@vger.kernel.org>; Thu, 12 Dec 2019 13:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:cc:to:subject:user-agent:date;
        bh=Y/oDdJ9vaWTmHiBd0BBwMYbpseDwIlnPRcsdk/YIhLw=;
        b=RubV1aPPV5MwZZB/p/A8BudPeStmQcqRDXmYeQ8QKYBpnAMHf0K7SV3hzoDQ/r6oZ+
         IbedmlCILDuARAk4qRlr21vSCi9GxzU/l4/lctCO8uVEY2XQFbV0NQh/yEe87bK5mSQm
         ysYWhI1tp91fz7Jkq4CMTDU9khX/1ZTUZ4ROE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:cc:to:subject
         :user-agent:date;
        bh=Y/oDdJ9vaWTmHiBd0BBwMYbpseDwIlnPRcsdk/YIhLw=;
        b=BuaWQ/bAtrKEW8GNYHHX1AjLhIFvhYXvgFvjHgnWjHIPdGM7fZkZr86Gop8gI4YMnV
         V+L3tBVw4lRlrhUGLaU1WG9hqPlEH5U+V0U8tLCxZ8DJgVt2+liHpxlsMBbxXYuDjNFU
         YotA9iNXEbnD3XssX8KVgQG92sMS6q8U033DiLw2HJvZeTVHqT4Kdr+O00tPSFJvd0md
         8inPdPtqZEW4vqiwHVD7f2vb6hyzeyUm8MsxuMtSKmzVhlu+3rPI08/Eiz2KiwJ6SZqT
         ccdpOoPb8jCzO5FP/Jtg2N0j5WZqh4mq91Pfh5n337kkMBuW7lMQfr1lqvp62cfxgtWr
         iImw==
X-Gm-Message-State: APjAAAXbqRbsblRRog/X4vRUIFOz6PJaY9KO/wCm+DE1xPabFf6/FCmP
        BqW7booEuA8iKWn/FPi/3kkxUw==
X-Google-Smtp-Source: APXvYqz81olZWLtTn67DezSPYTgvw0RojAmwLUKcy3D/XaEdu4BjmslxBAyek/pCmP7dI15yJs9fDg==
X-Received: by 2002:a17:902:8ecc:: with SMTP id x12mr11900974plo.286.1576187796085;
        Thu, 12 Dec 2019 13:56:36 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id p16sm7888003pgi.50.2019.12.12.13.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 13:56:35 -0800 (PST)
Message-ID: <5df2b793.1c69fb81.2d816.4046@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191212113540.3.Ia530e4065ca81f55ac8f89a400f6a0a084ff6712@changeid>
References: <20191212193544.80640-1-dianders@chromium.org> <20191212113540.3.Ia530e4065ca81f55ac8f89a400f6a0a084ff6712@changeid>
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Vinod Koul <vkoul@kernel.org>, Kiran Gunda <kgunda@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, mka@chromium.org,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 3/7] arm64: dts: qcom: sc7180: Add "#clock-cells" property to usb_1_ssphy
User-Agent: alot/0.8.1
Date:   Thu, 12 Dec 2019 13:56:34 -0800
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Douglas Anderson (2019-12-12 11:35:39)
> Running "dtbs_check" yells:
>   '#clock-cells' is a dependency of 'clock-output-names'
>=20
> ...and sure enough the bindings say we should have "#clock-cells".
> Add it.
>=20
> Fixes: 0b766e7fe5a2 ("arm64: dts: qcom: sc7180: Add USB related nodes")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Good catch!

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

