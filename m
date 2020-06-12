Return-Path: <SRS0=uNWD=7Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B54E2C433E1
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 21:59:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8CAE9206DC
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 21:59:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nwwYt3Cj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgFLV7h (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 17:59:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726323AbgFLV73 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 17:59:29 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36AB4C08C5C1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2020 14:59:29 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id t132so6175892vst.2
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2020 14:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d7ITOnMUL2jWtuh6dUhbbdg5TKO2HZFhIcQb3JSY0gM=;
        b=nwwYt3CjY63+zN9/TQ443ZnVpVTciypoT5lckDpVhGYhjjaRwaE4WxTDYxkKHVEEpd
         Ll6tw9x0q1COlij/j77TXOHgCFDWB70rZtlg7n3Wk11hCYG0X+2MV9vhGaxZLVw+dNjL
         mGFOKwh24JcvkbS694ZQQuPntZxSSKDTBGFmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d7ITOnMUL2jWtuh6dUhbbdg5TKO2HZFhIcQb3JSY0gM=;
        b=JxST574EShwAS9lco9djHkIzXBRONWzwZho1G849O6lgr+ySAUPAJck3d3l/AMszWo
         N+sXaTfECHoKv3Ulz5/qWBKcnQkscNA1iCjxnaEFi4EEbsRocHH8cJ8Em4smMNpikSDf
         HjaKYwq61XsD4aSEQ8DKyxhmG13disnivIPQfAyJR4txw7gpiHQ4XrfQwOctwUZp8k1c
         L/AcieZGuvpPytvPHD9ZJ/77AxvXoD75y6l9mek65UT5fCYircZFH7VwK2KsvdDcWwaN
         nfvAhPmIQvZzAw5/Q7n20u0KiXZGZ8blYIz4t0iKHvVee3adKN2vcFIN8FPBaPzjVQBH
         zgxQ==
X-Gm-Message-State: AOAM5322qwkMDisRhZG2DSFqApAu21MQ1DwVxN5ItF13UKDWfH4rbrWd
        P0E/qLtMEM/FlOlVRtxvH6TVLZSiQQ4=
X-Google-Smtp-Source: ABdhPJys7JM74u+o4trUcDAMPG7oBVeBOE1fDd0uSr0ElTC/1Rj/Ziapr13ye6N7AdnEDeL2NTKvzg==
X-Received: by 2002:a67:2dc1:: with SMTP id t184mr11629271vst.90.1591999167046;
        Fri, 12 Jun 2020 14:59:27 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id b9sm1110147vsp.24.2020.06.12.14.59.25
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2020 14:59:26 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id 190so6139349vsr.9
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2020 14:59:25 -0700 (PDT)
X-Received: by 2002:a67:1703:: with SMTP id 3mr13000459vsx.169.1591999165480;
 Fri, 12 Jun 2020 14:59:25 -0700 (PDT)
MIME-Version: 1.0
References: <1591868882-16553-1-git-send-email-rbokka@codeaurora.org> <1591868882-16553-2-git-send-email-rbokka@codeaurora.org>
In-Reply-To: <1591868882-16553-2-git-send-email-rbokka@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 12 Jun 2020 14:59:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WjvAWVmq3fTh=_f2p1Dv+sXg1RV-CqZr8KRgHe8_wT0w@mail.gmail.com>
Message-ID: <CAD=FV=WjvAWVmq3fTh=_f2p1Dv+sXg1RV-CqZr8KRgHe8_wT0w@mail.gmail.com>
Subject: Re: [RFC v2 1/3] dt-bindings: nvmem: Add devicetree bindings for qfprom-efuse
To:     Ravi Kumar Bokka <rbokka@codeaurora.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        dhavalp@codeaurora.org, mturney@codeaurora.org,
        sparate@codeaurora.org, c_rbokka@codeaurora.org,
        mkurumel@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Thu, Jun 11, 2020 at 2:49 AM Ravi Kumar Bokka <rbokka@codeaurora.org> wrote:
>
> This patch adds dt-bindings document for qfprom-efuse controller.
>
> Signed-off-by: Ravi Kumar Bokka <rbokka@codeaurora.org>
> ---
>  .../devicetree/bindings/nvmem/qfprom.yaml          | 52 ++++++++++++++++++++++
>  1 file changed, 52 insertions(+)

Overall comment: I reviewed your v1 series and so I'm obviously
interested in your series.  Please CC me on future versions.

I would also note that, since this is relevant to Qualcomm SoCs that
you probably should be CCing "linux-arm-msm@vger.kernel.org" on your
series.


>  create mode 100644 Documentation/devicetree/bindings/nvmem/qfprom.yaml
>
> diff --git a/Documentation/devicetree/bindings/nvmem/qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qfprom.yaml
> new file mode 100644
> index 0000000..7c8fc31
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/qfprom.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/qfprom.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies Inc, QFPROM Efuse bindings
> +
> +maintainers:
> +  - Ravi Kumar Bokka <rbokka@codeaurora.org>
> +
> +allOf:
> +  - $ref: "nvmem.yaml#"
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,qfprom

As per discussion in patch #1, I believe SoC compatible should be here
too in case it is ever needed.  This is standard practice for dts
files for IP blocks embedded in an SoC.  AKA, this should be:

    items:
      - enum:
          - qcom,apq8064-qfprom
          - qcom,apq8084-qfprom
          - qcom,msm8974-qfprom
          - qcom,msm8916-qfprom
          - qcom,msm8996-qfprom
          - qcom,msm8998-qfprom
          - qcom,qcs404-qfprom
          - qcom,sc7180-qfprom
          - qcom,sdm845-qfprom
      - const: qcom,qfprom

NOTE: old SoCs won't have both of these and thus they will get flagged
with "dtbs_check", but I believe that's fine (Rob can correct me if
I'm wrong).  The code should still work OK if the SoC isn't there but
it would be good to fix old dts files to have the SoC specific string
too.


> +
> +  reg:
> +    maxItems: 3

Please address feedback feedback on v1.  If you disagree with my
feedback it's OK to say so (I make no claims of being always right),
but silently ignoring my feedback and sending the next version doesn't
make me feel like it's a good use of my time to keep reviewing your
series.  Specifically I suggested that you actually add descriptions
rather than just putting "maxItems: 3".

With all that has been discussed, I think the current best thing to
put there is:

    # If the QFPROM is read-only OS image then only the corrected region
    # needs to be provided.  If the QFPROM is writable then all 3 regions
    # must be provided.
    oneOf:
      - items:
          - description: The start of the corrected region.
      - items:
          - description: The start of the raw region.
          - description: The start of the config region.
          - description: The start of the corrected region.

> +

You missed a bunch of things that you should document:

  # Clocks must be provided if QFPROM is writable from the OS image.
  clocks:
    maxItems: 1
  clock-names:
    const: sec

  # Supply reference must be provided if QFPROM is writable from the OS image.
  vcc-supply:
    description: Our power supply.

  # Needed if any child nodes are present.
  "#address-cells":
    const: 1
  "#size-cells":
    const: 1

> +required:
> +   - compatible
> +   - reg
> +   - reg-names

reg-names is discouraged.  Please remove.  I always point people here
as a reference:

https://lore.kernel.org/r/CAL_Jsq+MMunmVWqeW9v2RyzsMKP+=kMzeTHNMG4JDHM7Fy0HBg@mail.gmail.com/

You can just figure out whether there are 3 register fields or 1 register field.


> +   - clocks
> +   - clock-names

You can't retroactively make things required.  In read-only mode I
believe we don't require clocks/clock-names.  Presumably the clock is
only needed if we're writing?


> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
> +
> +    qfprom@780000 {
> +       compatible = "qcom,qfprom";

As pointed out by Rob H in v1, you have a whole bunch of tabs in here
that "dt_binding_check" yells about.  Please fix and confirm that you
ran "dt_binding_check" on your bindings and they passed with no
errors.  This is another case where someone took the time to respond
to your v1 but you didn't address their comments in sending v2.


> +       reg = <0 0x00780000 0 0x7a0>,
> +             <0 0x00782000 0 0x100>,
> +             <0 0x00784000 0 0x8ff>;
> +       reg-names = "raw", "conf", "corrected";

You are missing #address-cells and #size-cells, which are required
because you have a sub-node.


> +       clocks = <&gcc GCC_SEC_CTRL_CLK_SRC>;
> +       clock-names = "secclk";

As pointed out in v1, people don't like clock names to end in "clk".
Just call this "sec".


> +       qusb2p_hstx_trim: hstx-trim-primary@25b {
> +               reg = <0x25b 0x1>;
> +               bits = <1 3>;
> +       };
> +    };
> +
> +    &qfprom {
> +        vcc-supply = <&vreg_l11a_1p8>;
> +    };

Just fold the vcc-supply into the above node.  Note that your current
example refers to a phandle that doesn't exist.


> +
> --
> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, hosted by the Linux Foundation.

For your edification, I have placed a patch that fixes all my own
review feedback (and passes dt_binding_check) at:

https://crrev.com/c/2243853

Please either fold this into your next patch or provide comments about
why you aren't taking one of my suggestions.

-Doug
