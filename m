Return-Path: <SRS0=K0Un=3T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6237BC2D0DB
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jan 2020 18:06:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 374422082E
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jan 2020 18:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1580407599;
	bh=cMX2ncNTbZE2SYPt74jUaFO297MXZkPBMsegQpwvrzA=;
	h=In-Reply-To:References:Subject:To:From:Cc:Date:List-ID:From;
	b=uITifJnVIBDo1g4p+MWZfW0Tgg4rDTQmnHLWztlzZnPWKTzluOf1AYYvC1ZftYqqa
	 z7jl6SkjARg8xD4Pyj1VcQrS0QBL09M8fhR3TkVpoS3jbCQxc9ObuHvYJ2148DOpo4
	 TC5dPcx5cgGSgSzoY5Fhna2gP+w4E5lPqDlKi+S8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728011AbgA3SGi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Jan 2020 13:06:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:37900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728006AbgA3SGi (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 30 Jan 2020 13:06:38 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9E02D206F0;
        Thu, 30 Jan 2020 18:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580407597;
        bh=cMX2ncNTbZE2SYPt74jUaFO297MXZkPBMsegQpwvrzA=;
        h=In-Reply-To:References:Subject:To:From:Cc:Date:From;
        b=NnghcJW7vQqO/W4RSF67e6JltA8KsbxwwEEJbGu1aTdDEFlbxpD0n/4szi4TGFp6D
         41WMuKCB6fpAe/NSWK2QiGULYrjPlu9tN0BP1VRbP9mMGApWecEzChAlCY+1cO44M3
         lVOAT8YQavaS5AHppb2ptWUJnJfFp5cH7DWZtlVI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1580357923-19783-2-git-send-email-tdas@codeaurora.org>
References: <1580357923-19783-1-git-send-email-tdas@codeaurora.org> <1580357923-19783-2-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: Add YAML schemas for the QCOM MSS clock bindings
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Thu, 30 Jan 2020 10:06:36 -0800
Message-Id: <20200130180637.9E02D206F0@mail.kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Taniya Das (2020-01-29 20:18:41)
> The Modem Subsystem clock provider have a bunch of generic properties
> that are needed in a device tree. Add a YAML schemas for those.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,mss.yaml        | 58 ++++++++++++++++=
++++++

Please rename to qcom,sc7180-mss.yaml

>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,mss.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/clock/qcom,mss.yaml b/Docu=
mentation/devicetree/bindings/clock/qcom,mss.yaml
> new file mode 100644
> index 0000000..ebb04e1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,mss.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/clock/qcom,mss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Modem Clock Controller Binding
> +
> +maintainers:
> +  - Taniya Das <tdas@codeaurora.org>
> +
> +description: |
> +  Qualcomm modem clock control module which supports the clocks.

Can you point to the header file from here?
include/dt-bindings/clock/qcom,sc7180-mss.h I guess.

> +
> +properties:
> +  compatible:
> +    enum:
> +       - qcom,sc7180-mss
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 3

Why is it optional? Don't these all go there?

> +    items:
> +      - description: gcc_mss_mfab_axi clock from GCC
> +      - description: gcc_mss_nav_axi clock from GCC
> +      - description: gcc_mss_cfg_ahb clock from GCC
> +
> +  clock-names:
> +    items:
> +      - const: gcc_mss_mfab_axis_clk
> +      - const: gcc_mss_nav_axi_clk
> +      - const: cfg_clk

Do these really need _clk at the end? Seems redundant.

> +
> +  '#clock-cells':
> +    const: 1
> +
