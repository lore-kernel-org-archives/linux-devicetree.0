Return-Path: <SRS0=jmN2=2I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE35C43603
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 19:09:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 33E0821D7D
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Dec 2019 19:09:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XIcQqioy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbfLRTJq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 18 Dec 2019 14:09:46 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:37985 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727297AbfLRTJq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 18 Dec 2019 14:09:46 -0500
Received: by mail-io1-f67.google.com with SMTP id v3so3145447ioj.5
        for <devicetree@vger.kernel.org>; Wed, 18 Dec 2019 11:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MjSvp3Dx9u84GVaJpyyyeaGaP0H57BE7CyJr7SSOs5g=;
        b=XIcQqioy8tqWx8jv9ksRQ/fgieMfgKKKIp3ywAYh1a58vOSB2qEGoad6XCSce9DM6h
         EsI2IIF0ChjDxU/kKx/iDhsOw1cGnGjRLQYgj9YjFXigW2y1f4KshZQZ6ZfqF1Njpqcv
         lQfSIyPvo9TnNkabONpQoAmrkQZmQBPcm9K0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MjSvp3Dx9u84GVaJpyyyeaGaP0H57BE7CyJr7SSOs5g=;
        b=g4NAUgEJrjt6L/tGX5qPINz01qq8AOJI+mr7q/kclf5omjUS+PAQyUU2FWpKeRB+tq
         M4zbtXhgNKR8kTrhwQvhUk6vOsUtpmfDqCbw0gGbNFTeeupc5scgVSdxTEaART2/tTcs
         GgsTjZfiFfI2yi8CsFQ+9tSfhpXXJssYxa1u7VdV2aXlQVu7HeRcatxpNNM3SWwXc3aK
         wXk0Vj7jNVui3XuHnvRbRnkc9EcyALFM9ZVpDab7CQFT57xDvi5+X21oCsHAB+RZs5o+
         +IkoQBqF53LH7RT9A020vk7YzFYpJuwUgIWow0PjxG0zjq78VZa9sLNQ9xgIt9r4P1vN
         Dx0w==
X-Gm-Message-State: APjAAAVVHSPYflvScl7nKbm5SgtAYeaIJaBdskdm2kBkCAgcHskyJJkg
        lx71fDQ19eY0w2rIVyEGondGKtUOaMM=
X-Google-Smtp-Source: APXvYqxJB5XdjtbXNHTtHdqkZS/sPsHhhWYEVWFBenXdh3J8JzJkxFknGPxHCDkHf/OoPYgd2oZBBg==
X-Received: by 2002:a5d:8d10:: with SMTP id p16mr2746337ioj.21.1576696184360;
        Wed, 18 Dec 2019 11:09:44 -0800 (PST)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com. [209.85.166.182])
        by smtp.gmail.com with ESMTPSA id r14sm945029ilg.59.2019.12.18.11.09.42
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2019 11:09:43 -0800 (PST)
Received: by mail-il1-f182.google.com with SMTP id t17so2600137ilm.13
        for <devicetree@vger.kernel.org>; Wed, 18 Dec 2019 11:09:42 -0800 (PST)
X-Received: by 2002:a92:1547:: with SMTP id v68mr3226767ilk.58.1576696182341;
 Wed, 18 Dec 2019 11:09:42 -0800 (PST)
MIME-Version: 1.0
References: <1575520881-31458-1-git-send-email-sanm@codeaurora.org> <1575520881-31458-4-git-send-email-sanm@codeaurora.org>
In-Reply-To: <1575520881-31458-4-git-send-email-sanm@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 18 Dec 2019 11:09:31 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V7SEqLWQh29eHh=a5q6Q2_bWwhMViyhFvWwGQN1p7fjw@mail.gmail.com>
Message-ID: <CAD=FV=V7SEqLWQh29eHh=a5q6Q2_bWwhMViyhFvWwGQN1p7fjw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: phy: qcom-qusb2: Add SC7180 QUSB2 phy support
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Manu Gautam <mgautam@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Wed, Dec 4, 2019 at 8:43 PM Sandeep Maheswaram <sanm@codeaurora.org> wrote:
>
> Add QUSB2 phy entries for SC7180 in device tree bindings.
>
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom-qusb2-phy.yaml | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.yaml
> index 3ef94bc..5eff9016 100644
> --- a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.yaml
> @@ -18,6 +18,7 @@ properties:
>      enum:
>        - qcom,msm8996-qusb2-phy
>        - qcom,msm8998-qusb2-phy
> +      - qcom,sc7180-qusb2-phy
>        - qcom,sdm845-qusb2-phy

I would propose that we add generic PHY v2 tagging here, like this:

properties:
  compatible:
    anyOf:
      - items:
        - const: qcom,msm8996-qusb2-phy
      - items:
        - const: qcom,msm8998-qusb2-phy
      - items:
        # Suggested to also add "qcom,qusb2-v2-phy" as below.
        - const: qcom,sdm845-qusb2-phy
      - items:
        - enum:
          - qcom,sc7180-qusb2-phy
          - qcom,sdm845-qusb2-phy
        - const: qcom,qusb2-v2-phy

Given that this PHY has a fairly linear versioning within Qualcomm
(right?) this should make sense and should make code / adding new
device trees easier.  This is probably better than what I suggested in
the driver review [1] where I suggested that the compatible for sc7180
should be:

  compatible: "qcom,sc7180-qusb2-phy", "qcom,sdm845-qusb2-phy"


>    reg:
> @@ -66,7 +67,7 @@ properties:
>          It is a 6 bit value that specifies offset to be
>          added to PHY refgen RESCODE via IMP_CTRL1 register. It is a PHY
>          tuning parameter that may vary for different boards of same SOC.
> -        This property is applicable to only QUSB2 v2 PHY (sdm845).
> +        This property is applicable to only QUSB2 v2 PHY (sc7180, sdm845).

If you add my tagging, change this and other similar to just remove sdm845.


[1] https://lore.kernel.org/r/CAD=FV=W_z=_j==DSFbtCmTihmSyRtH85VnKpw03E=gATcqJx2Q@mail.gmail.com

-Doug
