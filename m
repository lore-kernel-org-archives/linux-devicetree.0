Return-Path: <SRS0=G+GX=2B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F513C00454
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 19:02:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 31AC420836
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 19:02:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m4SCZ81T"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728017AbfLKTCP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Dec 2019 14:02:15 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:40977 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727897AbfLKTCO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Dec 2019 14:02:14 -0500
Received: by mail-io1-f65.google.com with SMTP id c16so2526289ioo.8
        for <devicetree@vger.kernel.org>; Wed, 11 Dec 2019 11:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GwbAYQSBDv5Za0vCTAus/0vbiDud+PECBHWsA3f5N58=;
        b=m4SCZ81T05WMOj5zXCA1EeXNaycmm/je1x3e3/n+nJ5zkdeOt6Qw6Gcr+o738uc7Yp
         tlEYg26Gcr9+R0/w7V/6/8xOU0HGKbqKEcet2aXmPN/Ijth3iXw8rgpQOjzdySdroiFt
         nCKVa3XbP17RN8brOD8jKv+becFkZyUnPd4PM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GwbAYQSBDv5Za0vCTAus/0vbiDud+PECBHWsA3f5N58=;
        b=aEsmayjHVWhHBJacYSOudWy/mfrBRdyLK9oJpOEUv7C95apcZId15O4Le2/qpI/v1O
         NWlwc7FLlvfeCCgYrb27vKrYAM5bDBs5GNF3B+rsKyLJr6D2n3Ae8Me18cQ7H8xd3HJZ
         BPmEVd7LMVnTI+XVTp5xTGtpGiWgVPr2J8/2e7c8fQuF3LAkQeofFrVepEVngQlittTS
         j8GQH4sg0lJ3YycXTCA6+A3ghiXcZkDExOWlgUvkIofXDUg9lv665SdfYT20ZcN5Bdx+
         Ftsl0vErxWlWr19humnQABt3J7ow3Pkad5ZulThfNHSiStHLdgl0N6zG/N4Lt5jaaDwS
         9eFQ==
X-Gm-Message-State: APjAAAWzNnMdfKJs/ZmWIDNDDKPNT/icVcv9AZaqQYwDP/QaOVetrZ+/
        lFBNBDm7uUiRWK+PUfORQW7RlMCbSmQ=
X-Google-Smtp-Source: APXvYqyHKgA/c8/rLs0EU9WUmQF2XVLXyWl+aBri6/uiCP6/iLozZ4bFHDnM1Gl3UnufIe6ea1qTzw==
X-Received: by 2002:a5e:8516:: with SMTP id i22mr4032343ioj.130.1576090933778;
        Wed, 11 Dec 2019 11:02:13 -0800 (PST)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com. [209.85.166.41])
        by smtp.gmail.com with ESMTPSA id z11sm962962ilm.69.2019.12.11.11.02.11
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 11:02:11 -0800 (PST)
Received: by mail-io1-f41.google.com with SMTP id f82so23798440ioa.9
        for <devicetree@vger.kernel.org>; Wed, 11 Dec 2019 11:02:11 -0800 (PST)
X-Received: by 2002:a6b:b941:: with SMTP id j62mr2661633iof.168.1576090931323;
 Wed, 11 Dec 2019 11:02:11 -0800 (PST)
MIME-Version: 1.0
References: <1574934847-30372-1-git-send-email-rkambl@codeaurora.org> <1574934847-30372-2-git-send-email-rkambl@codeaurora.org>
In-Reply-To: <1574934847-30372-2-git-send-email-rkambl@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 11 Dec 2019 11:01:59 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UXC3UT78vGBr9rRuRxz=8iwH4tOkFx6NC-pSs+Z5+7Xw@mail.gmail.com>
Message-ID: <CAD=FV=UXC3UT78vGBr9rRuRxz=8iwH4tOkFx6NC-pSs+Z5+7Xw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: sc7180: Add device node support
 for TSENS in SC7180
To:     Rajeshwari <rkambl@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        sivaa@codeaurora.org, sanm@codeaurora.org,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Thu, Nov 28, 2019 at 1:55 AM Rajeshwari <rkambl@codeaurora.org> wrote:
>
> Add TSENS node and user thermal zone for TSENS sensors in SC7180.
>
> Signed-off-by: Rajeshwari <rkambl@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 527 +++++++++++++++++++++++++++++++++++
>  1 file changed, 527 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 666e9b9..6656ffc 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -911,6 +911,26 @@
>                         status = "disabled";
>                 };
>
> +               tsens0: thermal-sensor@c263000 {
> +                       compatible = "qcom,sc7180-tsens","qcom,tsens-v2";

Can you please send a patch listing this configuration in
"Documentation/devicetree/bindings/thermal/qcom-tsens.yaml"?  You
shouldn't need to re-send the dts since it looks like it's already
landed, but it's good to get the bindings happy.

Thanks!

-Doug
