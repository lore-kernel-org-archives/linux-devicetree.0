Return-Path: <SRS0=KHEV=2G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA2C3C43603
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 21:09:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B24B521739
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 21:09:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qsmmqdUM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbfLPVJD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Dec 2019 16:09:03 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:32808 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbfLPVJD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Dec 2019 16:09:03 -0500
Received: by mail-io1-f65.google.com with SMTP id z8so6740294ioh.0
        for <devicetree@vger.kernel.org>; Mon, 16 Dec 2019 13:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9XKO95LrgUJdQH2M6aS3B45u9tLfPn3HpUUUiAVQLoA=;
        b=qsmmqdUMVLn9soEO7iljMQx+BdYo1M7b+D/KnFZIAUtStJ7phMHyQXvNKKvaizqu4Y
         wNswTJ7cIGvbgctHA+bF7wHPKODead1bmqQhViZMul47+17Duuw3pcmzUqrq4yv+hOFK
         CD6+k9NgJzy2N/GCHsKvVYBZALzZRKgZbZgm0HokFj33eWRfQqhuBIW9N5mFsTLCraaH
         eBd3dxU6B0VcSfKhQ0jTJzKskfAr91bjJemFUwxT5pbY+6pzqTQXveKPvOR7LGT2vTN/
         I4GTMpUb38nqMz67QfWIOzyHGwj+HI+2n9nJDOlqwgId1E04Yi1+3kGuvL0NZp20/5TB
         NJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9XKO95LrgUJdQH2M6aS3B45u9tLfPn3HpUUUiAVQLoA=;
        b=cw/EbBCiCmla296Mvx6VTr3/o1cFpcChs1lmKE5JwS/LuEEJh2MRvi4jDy3S+TPTVa
         dbtBdgIiKVpnLknxCLBHetNApXlJPzEbWNRbLmS4+YeHpWpBHdCNSdbZcQrQZMW1HZ6u
         bIOvQvji3CNGzvFqaGjAmQgvJmJv+N/c3ZOW56eGpWvlC0leGkmLEVHvvjlvhZg3Z63n
         /o57tLH4fESztTlQdnUJ77TpFck+Kjcl9J8KMX0/KAjj87Sm0GkSRtGhLX5Vk0WVBKVl
         s9qDFC1POLvL09YW0Z58vbonN4mytcJ1aabnQ3LYAHd9H1UcKHmpyaIhiURtmX+lSTNI
         SQAA==
X-Gm-Message-State: APjAAAXh1jYWdXZA5v8N9loW0BivZAt2LBrIlF93pYcLW4yoDUOGqm2e
        +Zx4uH5fqsfgBi8aqUKnZ/WInWi7IQ5VWrNLlLpqtg==
X-Google-Smtp-Source: APXvYqy3FlgcCLF0YbioAtrebMVIf/uIe5yi8WD+zW5eCUIzwob/hzy/Ohu8usZQA0aV9gHzcmfgr9PsKPG9RXOD6hE=
X-Received: by 2002:a6b:8f11:: with SMTP id r17mr1010285iod.50.1576530541898;
 Mon, 16 Dec 2019 13:09:01 -0800 (PST)
MIME-Version: 1.0
References: <20191211230902.5414-1-mike.leach@linaro.org>
In-Reply-To: <20191211230902.5414-1-mike.leach@linaro.org>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Mon, 16 Dec 2019 14:08:51 -0700
Message-ID: <CANLsYkx9UBYOfOjW-jg_CmQrOC-f0z+gUfun72+uYhadyaJAJg@mail.gmail.com>
Subject: Re: [PATCH v6 10/15] dt-bindings: qcom: Add CTI options for qcom msm8916
To:     Mike Leach <mike.leach@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Coresight ML <coresight@lists.linaro.org>,
        devicetree@vger.kernel.org,
        "Suzuki K. Poulose" <suzuki.poulose@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 11 Dec 2019 at 16:09, Mike Leach <mike.leach@linaro.org> wrote:
>
> Adds system and CPU bound CTI definitions for Qualcom msm8916 platform
> (Dragonboard DB410C).
> System CTIs 2-11 are omitted as no information available at present.
>
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 85 +++++++++++++++++++++++++--
>  1 file changed, 81 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 8686e101905c..68587968f5c0 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/reset/qcom,gcc-msm8916.h>
>  #include <dt-bindings/clock/qcom,rpmcc.h>
>  #include <dt-bindings/thermal/thermal.h>
> +#include <dt-bindings/arm/coresight-cti-dt.h>
>
>  / {
>         interrupt-parent = <&intc>;
> @@ -1357,7 +1358,7 @@
>                         cpu = <&CPU3>;
>                 };
>
> -               etm@85c000 {
> +               etm0: etm@85c000 {
>                         compatible = "arm,coresight-etm4x", "arm,primecell";
>                         reg = <0x85c000 0x1000>;
>
> @@ -1375,7 +1376,7 @@
>                         };
>                 };
>
> -               etm@85d000 {
> +               etm1: etm@85d000 {
>                         compatible = "arm,coresight-etm4x", "arm,primecell";
>                         reg = <0x85d000 0x1000>;
>
> @@ -1393,7 +1394,7 @@
>                         };
>                 };
>
> -               etm@85e000 {
> +               etm2: etm@85e000 {
>                         compatible = "arm,coresight-etm4x", "arm,primecell";
>                         reg = <0x85e000 0x1000>;
>
> @@ -1411,7 +1412,7 @@
>                         };
>                 };
>
> -               etm@85f000 {
> +               etm3: etm@85f000 {
>                         compatible = "arm,coresight-etm4x", "arm,primecell";
>                         reg = <0x85f000 0x1000>;
>
> @@ -1429,6 +1430,82 @@
>                         };
>                 };
>
> +               /* System CTIs */
> +               /* CTI 0 - TMC connections */
> +               cti@810000 {
> +                       compatible = "arm,coresight-cti", "arm,primecell";
> +                       reg = <0x810000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_QDSS_CLK>;
> +                       clock-names = "apb_pclk";
> +               };
> +
> +               /* CTI 1 - TPIU connections */
> +               cti@811000 {
> +                       compatible = "arm,coresight-cti", "arm,primecell";
> +                       reg = <0x811000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_QDSS_CLK>;
> +                       clock-names = "apb_pclk";
> +               };
> +
> +               /* CTIs 2-11 - no information - not instantiated */
> +
> +               /* Core CTIs; CTIs 12-15 */
> +               /* CTI - CPU-0 */
> +               cti@858000 {
> +                       compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> +                                    "arm,primecell";
> +                       reg = <0x858000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_QDSS_CLK>;
> +                       clock-names = "apb_pclk";
> +
> +                       cpu = <&CPU0>;
> +                       arm,cs-dev-assoc = <&etm0>;
> +
> +               };
> +
> +               /* CTI - CPU-1 */
> +               cti@859000 {
> +                       compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> +                                    "arm,primecell";
> +                       reg = <0x859000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_QDSS_CLK>;
> +                       clock-names = "apb_pclk";
> +
> +                       cpu = <&CPU1>;
> +                       arm,cs-dev-assoc = <&etm1>;
> +               };
> +
> +               /* CTI - CPU-2 */
> +               cti@85a000 {
> +                       compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> +                                    "arm,primecell";
> +                       reg = <0x85a000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_QDSS_CLK>;
> +                       clock-names = "apb_pclk";
> +
> +                       cpu = <&CPU2>;
> +                       arm,cs-dev-assoc = <&etm2>;
> +               };
> +
> +               /* CTI - CPU-3 */
> +               cti@85b000 {
> +                       compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> +                                    "arm,primecell";
> +                       reg = <0x85b000 0x1000>;
> +
> +                       clocks = <&rpmcc RPM_QDSS_CLK>;
> +                       clock-names = "apb_pclk";
> +
> +                       cpu = <&CPU3>;
> +                       arm,cs-dev-assoc = <&etm3>;
> +               };
> +
> +

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>                 venus: video-codec@1d00000 {
>                         compatible = "qcom,msm8916-venus";
>                         reg = <0x01d00000 0xff000>;
> --
> 2.17.1
>
