Return-Path: <SRS0=+P9T=3M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A55FC32771
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jan 2020 00:46:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0567021569
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jan 2020 00:46:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Tbz+Fbae"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgAWAqY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Jan 2020 19:46:24 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:44832 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgAWAqY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 22 Jan 2020 19:46:24 -0500
Received: by mail-vs1-f66.google.com with SMTP id p6so658443vsj.11
        for <devicetree@vger.kernel.org>; Wed, 22 Jan 2020 16:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ydoFuPBpljdhU9GYVBrNTG5g2giEqOv99/BVh0AaZXo=;
        b=Tbz+FbaetQ32xHZ6PWyG6G0OmqFJ8BHY0F/6O31f6IvQ8yPJwOHzZiJOL25y9Osj9j
         XRvXFU2wBes9O64ewdXon5rfpfGxnHfNNfk50vWx3S2FU9enPTgCEftB8qaFnJJiI0Bm
         I2PJQpxqzSKVQW5KECSFNYXs4Sf6mmMOe7V1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ydoFuPBpljdhU9GYVBrNTG5g2giEqOv99/BVh0AaZXo=;
        b=H8pmm5Qo3ksCgWcCX6gUqfA/bvTjqhZW7hqDwOlpo3cHScWLzB/uO18psCxbkIY5z+
         dquXi0QK7W1Qp79Dy6UCChWO/yQHYfMKg8clCwXz3Ir8xwcpxINedbOSFbFjOlo31kMe
         Fitrj97a3VihN2XVPiFlpvtx6oCktMuQqo1qEeGv1xanIpBCXrg7pGWc1hBEydOOZITp
         nExAT0EVaCSRfRUWfKAdw5tZzBvkobD4ul0vRg3rxR9pyXa/qjcn7L7hbFXmAFOdGoMk
         Fn8t1fWUKBhAZUkpkjWCQNE69ChBeYLPsmi5Ue819EMfa3FhtRnr4bu3uKpVi5ACQbWG
         fkyA==
X-Gm-Message-State: APjAAAVEWlQbkEoiZOtToYjURDfQ+0Z/HEgXuRF9YR8uQCrNobGlauBC
        cHf9JhzhHoje4k6cVcnWJRv3BywUp/k=
X-Google-Smtp-Source: APXvYqza6bDbI87eWwnco8E0TpZ6X/g4PqqQ6oAvasjVpBdz39w/cb7lezIeMQIK5ZtWzMIWno/UOA==
X-Received: by 2002:a05:6102:675:: with SMTP id z21mr4487485vsf.46.1579740382525;
        Wed, 22 Jan 2020 16:46:22 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id y7sm177850vkd.38.2020.01.22.16.46.21
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2020 16:46:21 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id y125so683958vsb.6
        for <devicetree@vger.kernel.org>; Wed, 22 Jan 2020 16:46:21 -0800 (PST)
X-Received: by 2002:a67:ec4a:: with SMTP id z10mr4383812vso.73.1579740381186;
 Wed, 22 Jan 2020 16:46:21 -0800 (PST)
MIME-Version: 1.0
References: <1577435867-32254-1-git-send-email-tdas@codeaurora.org>
In-Reply-To: <1577435867-32254-1-git-send-email-tdas@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 22 Jan 2020 16:46:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X4gW3cpFPTL7KmocP1z7fK1fSRjg7BYjA7D_Uu7p5gnQ@mail.gmail.com>
Message-ID: <CAD=FV=X4gW3cpFPTL7KmocP1z7fK1fSRjg7BYjA7D_Uu7p5gnQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: sc7180: Add clock controller nodes
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        inux-arm-msm@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Fri, Dec 27, 2019 at 12:38 AM Taniya Das <tdas@codeaurora.org> wrote:
>
> Add the display, video & graphics clock controller nodes supported on
> SC7180.
>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)

Can you add these to your patch?

#include <dt-bindings/clock/qcom,dispcc-sc7180.h>
#include <dt-bindings/clock/qcom,gpucc-sc7180.h>

...otherwise the first user of each of the clocks will need to add the
#include and depending on what order patches landed things can get
weird.  I think it's cleaner to assume that there will soon be a user
and proactively add the #includes.

NOTE: at least one user of your patch can be found at
<https://lore.kernel.org/r/1579621928-18619-1-git-send-email-harigovi@codeaurora.org>.
They don't add the #includes which means they don't compile atop your
patch.


> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 3676bfd..3bb7b65 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -931,6 +931,18 @@
>                         };
>                 };
>
> +               gpucc: clock-controller@5090000 {
> +                       compatible = "qcom,sc7180-gpucc";
> +                       reg = <0 0x05090000 0 0x9000>;
> +                       clocks = <&rpmhcc RPMH_CXO_CLK>,
> +                                <&gcc GCC_GPU_GPLL0_CLK_SRC>,
> +                                <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
> +                       clock-names = "bi_tcxo", "gpll0_main", "gpll0_div";
> +                       #clock-cells = <1>;
> +                       #reset-cells = <1>;
> +                       #power-domain-cells = <1>;
> +               };
> +
>                 qspi: spi@88dc000 {
>                         compatible = "qcom,qspi-v1";
>                         reg = <0 0x088dc000 0 0x600>;
> @@ -1043,6 +1055,27 @@
>                         };
>                 };
>
> +               videocc: clock-controller@ab00000 {
> +                       compatible = "qcom,sc7180-videocc";
> +                       reg = <0 0x0ab00000 0 0x10000>;
> +                       clocks = <&rpmhcc RPMH_CXO_CLK>;
> +                       clock-names = "bi_tcxo";
> +                       #clock-cells = <1>;
> +                       #reset-cells = <1>;
> +                       #power-domain-cells = <1>;
> +               };
> +
> +               dispcc: clock-controller@af00000 {
> +                       compatible = "qcom,sc7180-dispcc";
> +                       reg = <0 0x0af00000 0 0x200000>;
> +                       clocks = <&rpmhcc RPMH_CXO_CLK>,
> +                                <&gcc GCC_DISP_GPLL0_CLK_SRC>;
> +                       clock-names = "bi_tcxo", "gpll0";

The above doesn't match your code unless I'm missing a patch
somewhere.  Specifically I find that if I use your dts patch together
with the upstream code I get a nice crash at bootup.  I tracked it
down to the fact that the code uses the name "gcc_disp_gpll0_clk_src"
but your dts uses the name "gpll0".  Specifically this bit of code:

static const struct clk_parent_data disp_cc_parent_data_3[] = {
        { .fw_name = "bi_tcxo" },
        { .hw = &disp_cc_pll0.clkr.hw },
        { .fw_name = "gcc_disp_gpll0_clk_src" },
        { .hw = &disp_cc_pll0_out_even.clkr.hw },
        { .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
};

static const struct clk_parent_data disp_cc_parent_data_4[] = {
        { .fw_name = "bi_tcxo" },
        { .fw_name = "gcc_disp_gpll0_clk_src" },
        { .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
};

If I either change the code to use "gpll0" or change your dts to use
"gcc_disp_gpll0_clk_src" I can avoid the crash.

I believe there is a similar problem with the gpucc with
"gcc_gpu_gpll0_div_clk_src" / "gpll0_div".


-Doug
