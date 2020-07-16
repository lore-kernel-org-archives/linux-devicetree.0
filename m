Return-Path: <SRS0=XaEl=A3=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 535F9C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 17:34:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 324142071B
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Jul 2020 17:34:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DgIAFh9x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729027AbgGPRex (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Jul 2020 13:34:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728867AbgGPRew (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Jul 2020 13:34:52 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DAFFC08C5C0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 10:34:52 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id l12so2024274uak.7
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 10:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+YZ4K32ILO0YG7+Onb9+bb1wbPOZ0IsAwcOMvX1Wf1U=;
        b=DgIAFh9xOdcGljTcbCAE1IcHuv2aaa2mBbzzoSyx+PkPEnrbCyvTBNyFXPYLKiG9Pm
         8pVv0O31SbSSnI5+44WNuLdO577HNgfluZBBRqvKCeX59P3Z6sO4UXk0PT8vXh6Lx/2V
         3FtSeQB0FwxrAc1mp5ySe0Pf0i5r+sXaq8c6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+YZ4K32ILO0YG7+Onb9+bb1wbPOZ0IsAwcOMvX1Wf1U=;
        b=tkWwIQ7D/NZBy2UYGCH3JOYFZO9lt4x7DsHd5b9njm86xWal1OkpvXrIfgqPplA+Yv
         IDjwquhMxUjwnrJDqT8M6EGA7RaQVFEBQXt0hroOpz0MSo4mEKjjxXFPZFwuwjDVnk0D
         ylM2SvzJWubEckMWFd2aMy3CT9eEfWJdc0ghdQUyIinKiwdeTAj6STTI1UxAbu1VRldO
         UDEJ4aa8RiJ3EDXVWnjIibo3duBgpTURskIzt9VbZA9OI6Uzm24Smbqqbm+DsLcwZH/Q
         +nK37/IyC7NjqTTuqlWlqjyk1ljToIzB1OwDtLqQtZ4B7a4DHxI6UodtWa5r8t1KvsSY
         XwGg==
X-Gm-Message-State: AOAM532xezPWnsn/6TO39lGdAibT3TNwWzChS//xphQ+/2AuTty02M0T
        54urUVU98tWWm2zal0s17P61O6bpZ1o=
X-Google-Smtp-Source: ABdhPJwH3TTB9/psVabPTTzPCw+Bib55qfTf9LIQcohq/riuhWP9JGU0bhgNCiWP2jQ31fzov3cQHg==
X-Received: by 2002:ab0:4d67:: with SMTP id k39mr4461564uag.132.1594920890901;
        Thu, 16 Jul 2020 10:34:50 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id n11sm554595uaj.20.2020.07.16.10.34.48
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2020 10:34:50 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id n4so2026293uae.5
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2020 10:34:48 -0700 (PDT)
X-Received: by 2002:ab0:150c:: with SMTP id o12mr4397825uae.90.1594920887766;
 Thu, 16 Jul 2020 10:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <1594796149-14778-1-git-send-email-tdas@codeaurora.org>
In-Reply-To: <1594796149-14778-1-git-send-email-tdas@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 16 Jul 2020 10:34:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XwYQxkKQruVPnO9Nbsv_3uyD75-dcyOeB62zLVjJE5+Q@mail.gmail.com>
Message-ID: <CAD=FV=XwYQxkKQruVPnO9Nbsv_3uyD75-dcyOeB62zLVjJE5+Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Add LPASS clock controller nodes
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Tue, Jul 14, 2020 at 11:56 PM Taniya Das <tdas@codeaurora.org> wrote:
>
> Update the clock controller nodes for Low power audio subsystem
> functionality.
>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Somewhere here you should be pointing to the unlanded bindings patch, AKA:

https://lore.kernel.org/r/1594795010-9074-3-git-send-email-tdas@codeaurora.org

As per usual the fact that are using a new bindings #include file
means Qualcomm maintainers and clock maintainers will need to
coordinate landing and this needs to be pointed out.


>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 2be81a2..8c30a17 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
>  #include <dt-bindings/clock/qcom,gcc-sc7180.h>
>  #include <dt-bindings/clock/qcom,gpucc-sc7180.h>
> +#include <dt-bindings/clock/qcom,lpasscorecc-sc7180.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,videocc-sc7180.h>
>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
> @@ -2136,6 +2137,27 @@
>                         };
>                 };
>
> +               lpasscc: clock-controller@62d00000 {
> +                       compatible = "qcom,sc7180-lpasscorecc";
> +                       reg = <0 0x62d00000 0 0x50000>,
> +                           <0 0x62780000 0 0x30000>;
> +                       reg-names = "lpass_core_cc", "lpass_audio_cc";
> +                       clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>;
> +                       clock-names = "iface";
> +                       power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
> +                       #clock-cells = <1>;
> +                       #power-domain-cells = <1>;
> +               };
> +
> +               lpass_hm: clock-controller@63000000 {
> +                       compatible = "qcom,sc7180-lpasshm";
> +                       reg = <0 0x63000000 0 0x28>;
> +                       clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>;
> +                       clock-names = "iface";
> +                       #clock-cells = <1>;
> +                       #power-domain-cells = <1>;
> +               };

Question: would it ever make sense for a board not to need this clock
controller?  I ask because the sdm845 "lpass" clock controller is
"disabled" by default but yours here isn't.  I know sc7180 and sdm845
work pretty differently and perhaps the sdm845's default of "disabled"
was just overkill, but I thought I'd ask.


> +
>                 etm@7040000 {
>                         compatible = "arm,coresight-etm4x", "arm,primecell";
>                         reg = <0 0x07040000 0 0x1000>;

Your sort order is off.  You should be sorting by unit address.  Note
that the "ETM" has an extra 0 before its 7, so you're comparing 63 to
07 and you should be after.

Other than those small things above this patch looks like it matches
the example in the bindings, so as long as Rob / the clock guys are
fine with the bindings then this seems good to go.

-Doug
