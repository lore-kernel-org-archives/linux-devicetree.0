Return-Path: <SRS0=d5cD=3G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 007AEC33C9E
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 20:37:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C98252082F
	for <linux-devicetree@archiver.kernel.org>; Fri, 17 Jan 2020 20:37:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Px4A/Lo9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729758AbgAQUhR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 17 Jan 2020 15:37:17 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:38137 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727519AbgAQUhQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 17 Jan 2020 15:37:16 -0500
Received: by mail-pl1-f194.google.com with SMTP id f20so10310406plj.5
        for <devicetree@vger.kernel.org>; Fri, 17 Jan 2020 12:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5+F24Ve03N3iru6WLb9O9UGGQzx5QThGIigVPheCHEI=;
        b=Px4A/Lo9Bx1gRoPpdJ45NRqKxxRBroCMy/4BAe8VHJRFpq3AhWgpAh6IN5B10IV4mM
         np3DXIhTiaCxtuEkflx/In1YydznNrGshqXioqtR6MkXsP9kltHDfDmSKAFChXnml7n6
         Y6IMTxMLTxfEMCqXxZPT/2/nm5jUrEkwRZqyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5+F24Ve03N3iru6WLb9O9UGGQzx5QThGIigVPheCHEI=;
        b=CthdA8Efx/NphxJKzPzYXCJFQa1JANZK32lJZGYWigrkurtkwCwqA+Ko0sCpIFsLqm
         BZIwKbtXG7epoPGHT3yxNje3pzRyr/p195VQD3X/k5549B+deymC/fHSUNt0QZThvPR0
         AZInB4/ZOoWIFJ70aB+r6l95YzXAKO4xlG8YlSMwScNfOKFGJ4VXHsizhhPMz1IcYTKz
         vC5kOwhAOwmKUj5fXqTBJpDnIVYdc8Ck7mm+iD86uGNH4lXFESexWyjgmOpqQ/oq4zaT
         qYIc70hEfGZZ41ka/WKGA9R0opOdi2HM8UL6Wxd5sZ6mtFb5MjzSFtUisuX8zO4kaOUd
         yCJQ==
X-Gm-Message-State: APjAAAUx01gR3qqQHoeZNtKG710cDnSPk0Gp/iryxuRIsTIyIIHSEkZe
        WCIG1h8nnLSm4DWWI7wUZL0B5Q==
X-Google-Smtp-Source: APXvYqzqDjmjRyDoSEVHKOIZxsyaBgmKTK4HpsmjC1fvt5QMTcaJQ7R7T3INoHxNfIDw364kwCy+pg==
X-Received: by 2002:a17:90a:31cc:: with SMTP id j12mr7730223pjf.103.1579293436306;
        Fri, 17 Jan 2020 12:37:16 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id r20sm29058711pgu.89.2020.01.17.12.37.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2020 12:37:15 -0800 (PST)
Date:   Fri, 17 Jan 2020 12:37:14 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: phy: qcom,qusb2: Convert QUSB2 phy
 bindings to yaml
Message-ID: <20200117203714.GQ89495@google.com>
References: <1578658699-30458-1-git-send-email-sanm@codeaurora.org>
 <1578658699-30458-3-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1578658699-30458-3-git-send-email-sanm@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Fri, Jan 10, 2020 at 05:48:16PM +0530, Sandeep Maheswaram wrote:
> Convert QUSB2 phy  bindings to DT schema format using json-schema.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    | 152 +++++++++++++++++++++
>  .../devicetree/bindings/phy/qcom-qusb2-phy.txt     |  68 ---------
>  2 files changed, 152 insertions(+), 68 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> new file mode 100644
> index 0000000..83cd01d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> @@ -0,0 +1,152 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm QUSB2 phy controller
> +
> +maintainers:
> +  - Manu Gautam <mgautam@codeaurora.org>
> +
> +description:
> +  QUSB2 controller supports LS/FS/HS usb connectivity on Qualcomm chipsets.
> +
> +properties:
> +  compatible:
> +    anyOf:
> +      - items:
> +        - const: qcom,msm8996-qusb2-phy
> +      - items:
> +        - const: qcom,msm8998-qusb2-phy
> +      - items:
> +        - const: qcom,sc7180-qusb2-phy
> +      - items:
> +        - const: qcom,sdm845-qusb2-phy
> +      - items:
> +        - enum:
> +          - qcom,sc7180-qusb2-phy
> +          - qcom,sdm845-qusb2-phy
> +        - const: qcom,qusb2-v2-phy

The subject says this patch converts the binding to YAML, however you are also
changing the binding (by adding 'qcom,sc7180-qusb2-phy' and 'qcom,qusb2-v2-phy'),
which is misleading. Please change this to one patch that does the 1:1 conversion
to YAML, and another that adds the new compatible strings.

Thanks

Matthias
