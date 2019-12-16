Return-Path: <SRS0=KHEV=2G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E40DAC43603
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 21:09:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A3DA021739
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Dec 2019 21:09:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PQaekCoV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbfLPVJw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Dec 2019 16:09:52 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:35284 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbfLPVJw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Dec 2019 16:09:52 -0500
Received: by mail-io1-f65.google.com with SMTP id v18so7580343iol.2
        for <devicetree@vger.kernel.org>; Mon, 16 Dec 2019 13:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OC6dg+LyOUqf3B+KdcQshHYleKkReK1YVRJDMZcRz98=;
        b=PQaekCoVnVt0izSYDpfP670QGROJZaXV3HrKHr9fRCxFs9oNtSzszeYc0ROvIPGrqT
         tX/rVC0LE7e7MG533M6L5cCJZOSp0XYtH2dQIqmWd1TV02Wa4el1eKwCUcSOoHq2B1dO
         1+ihGXFk+YgSQS9SK7SfktK6Mq3Qe5qiVuHszXj8wm2k6M75TGblfbw2eTQPOZjwK0v/
         2y7vp4CsuKQbYC7l/hIuBM17mMahYyYAOYj30pM5+6fE3qxwpIt3Mbl3Pg0N0VH9mXQ6
         k7PqCsqKafPYobGgNTnlmgbdvF1I29dBrQoDbQe/A7dJ8wix8DSRfAVqRqhC46dJXVyM
         f7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OC6dg+LyOUqf3B+KdcQshHYleKkReK1YVRJDMZcRz98=;
        b=cIH2zE5MuISTzd1EFg4Ni3+jailelMKcViPdCP/zxcpWyf0FBpFB6uDsz7KAksLUET
         NcJFTPn1e0rOJrldW2mcdWshD0z6+Gs+LdcgHvzEeVN3wMx03Q/bXV37kxp47L1hC/Ir
         srNxzAv3ngLk2HqTAEyGFVSyxeArhnL57VRnl7lRuSKEetyvw9AG7hTbpxZreYCADl0i
         O7ySjWGYI1TVOJZyMDNDOjKlvMH6qVrx2sio1mfgC4JvX+t6bXw+1DIZtLfvel+2ArfF
         AKGVKoUXmyj0llTvfR+VNr8kkte/pQZKi9JRWSw7FuPwc3VIDKnftQgQV6qC6953PZuI
         YoIQ==
X-Gm-Message-State: APjAAAVKcg1ybcSdN72gC8rpQ/IAbuyFhTtl7PEOndIr0wxNMstqtg2F
        3va+OWob+NF6kKSOC6t4LmYCiu8Kq3yxVtip94uHDA==
X-Google-Smtp-Source: APXvYqy+t8iNuAnaIa7sVk7jLsqm58CTXVz4KlgHb3nVjaxrdDBS6fXoh0OhFg44zPPKSd0zcIp7AHZe82mzIZTNX2c=
X-Received: by 2002:a02:6c41:: with SMTP id w62mr6954440jab.52.1576530591061;
 Mon, 16 Dec 2019 13:09:51 -0800 (PST)
MIME-Version: 1.0
References: <20191211230911.5467-1-mike.leach@linaro.org>
In-Reply-To: <20191211230911.5467-1-mike.leach@linaro.org>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Mon, 16 Dec 2019 14:09:40 -0700
Message-ID: <CANLsYkzGZde=2WhWhVqJGRBZbNy1EQUEAg2W_L9ek6JtNGGc2Q@mail.gmail.com>
Subject: Re: [PATCH v6 11/15] dt-bindings: arm: Juno platform - add CTI
 entries to device tree.
To:     Mike Leach <mike.leach@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>
Cc:     linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Coresight ML <coresight@lists.linaro.org>,
        devicetree@vger.kernel.org,
        "Suzuki K. Poulose" <suzuki.poulose@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 11 Dec 2019 at 16:09, Mike Leach <mike.leach@linaro.org> wrote:
>
> Add in CTI entries for Juno r0, r1 and r2 to device tree entries.
>
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> ---
>  arch/arm64/boot/dts/arm/juno-base.dtsi    | 149 +++++++++++++++++++++-
>  arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi |  31 ++++-
>  arch/arm64/boot/dts/arm/juno-r1.dts       |  25 ++++
>  arch/arm64/boot/dts/arm/juno-r2.dts       |  25 ++++
>  arch/arm64/boot/dts/arm/juno.dts          |  25 ++++
>  5 files changed, 250 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
> index 1f3c80aafbd7..07d6395a2194 100644
> --- a/arch/arm64/boot/dts/arm/juno-base.dtsi
> +++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
> @@ -119,7 +119,7 @@
>          * The actual size is just 4K though 64K is reserved. Access to the
>          * unmapped reserved region results in a DECERR response.
>          */
> -       etf@20010000 { /* etf0 */
> +       etf_sys0: etf@20010000 { /* etf0 */
>                 compatible = "arm,coresight-tmc", "arm,primecell";
>                 reg = <0 0x20010000 0 0x1000>;
>
> @@ -143,7 +143,7 @@
>                 };
>         };
>
> -       tpiu@20030000 {
> +       tpiu_sys: tpiu@20030000 {
>                 compatible = "arm,coresight-tpiu", "arm,primecell";
>                 reg = <0 0x20030000 0 0x1000>;
>
> @@ -196,7 +196,7 @@
>                 };
>         };
>
> -       etr@20070000 {
> +       etr_sys: etr@20070000 {
>                 compatible = "arm,coresight-tmc", "arm,primecell";
>                 reg = <0 0x20070000 0 0x1000>;
>                 iommus = <&smmu_etr 0>;
> @@ -214,7 +214,7 @@
>                 };
>         };
>
> -       stm@20100000 {
> +       stm_sys: stm@20100000 {
>                 compatible = "arm,coresight-stm", "arm,primecell";
>                 reg = <0 0x20100000 0 0x1000>,
>                       <0 0x28000000 0 0x1000000>;
> @@ -291,6 +291,18 @@
>                 };
>         };
>
> +       cti0: cti@22020000 {
> +               compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> +                            "arm,primecell";
> +               reg = <0 0x22020000 0 0x1000>;
> +
> +               clocks = <&soc_smc50mhz>;
> +               clock-names = "apb_pclk";
> +               power-domains = <&scpi_devpd 0>;
> +
> +               arm,cs-dev-assoc = <&etm0>;
> +       };
> +
>         funnel@220c0000 { /* cluster0 funnel */
>                 compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>                 reg = <0 0x220c0000 0 0x1000>;
> @@ -351,6 +363,18 @@
>                 };
>         };
>
> +       cti1: cti@22120000 {
> +               compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> +                            "arm,primecell";
> +               reg = <0 0x22120000 0 0x1000>;
> +
> +               clocks = <&soc_smc50mhz>;
> +               clock-names = "apb_pclk";
> +               power-domains = <&scpi_devpd 0>;
> +
> +               arm,cs-dev-assoc = <&etm1>;
> +       };
> +
>         cpu_debug2: cpu-debug@23010000 {
>                 compatible = "arm,coresight-cpu-debug", "arm,primecell";
>                 reg = <0x0 0x23010000 0x0 0x1000>;
> @@ -376,6 +400,18 @@
>                 };
>         };
>
> +       cti2: cti@23020000 {
> +               compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> +                            "arm,primecell";
> +               reg = <0 0x23020000 0 0x1000>;
> +
> +               clocks = <&soc_smc50mhz>;
> +               clock-names = "apb_pclk";
> +               power-domains = <&scpi_devpd 0>;
> +
> +               arm,cs-dev-assoc = <&etm2>;
> +       };
> +
>         funnel@230c0000 { /* cluster1 funnel */
>                 compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>                 reg = <0 0x230c0000 0 0x1000>;
> @@ -448,6 +484,18 @@
>                 };
>         };
>
> +       cti3: cti@23120000 {
> +               compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> +                            "arm,primecell";
> +               reg = <0 0x23120000 0 0x1000>;
> +
> +               clocks = <&soc_smc50mhz>;
> +               clock-names = "apb_pclk";
> +               power-domains = <&scpi_devpd 0>;
> +
> +               arm,cs-dev-assoc = <&etm3>;
> +       };
> +
>         cpu_debug4: cpu-debug@23210000 {
>                 compatible = "arm,coresight-cpu-debug", "arm,primecell";
>                 reg = <0x0 0x23210000 0x0 0x1000>;
> @@ -473,6 +521,18 @@
>                 };
>         };
>
> +       cti4: cti@23220000 {
> +               compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> +                            "arm,primecell";
> +               reg = <0 0x23220000 0 0x1000>;
> +
> +               clocks = <&soc_smc50mhz>;
> +               clock-names = "apb_pclk";
> +               power-domains = <&scpi_devpd 0>;
> +
> +               arm,cs-dev-assoc = <&etm4>;
> +       };
> +
>         cpu_debug5: cpu-debug@23310000 {
>                 compatible = "arm,coresight-cpu-debug", "arm,primecell";
>                 reg = <0x0 0x23310000 0x0 0x1000>;
> @@ -498,6 +558,87 @@
>                 };
>         };
>
> +       cti5: cti@23320000 {
> +               compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> +                            "arm,primecell";
> +               reg = <0 0x23320000 0 0x1000>;
> +
> +               clocks = <&soc_smc50mhz>;
> +               clock-names = "apb_pclk";
> +               power-domains = <&scpi_devpd 0>;
> +
> +               arm,cs-dev-assoc = <&etm5>;
> +       };
> +
> +       cti@20020000 { /* sys_cti_0 */
> +               compatible = "arm,coresight-cti", "arm,primecell";
> +               reg = <0 0x20020000 0 0x1000>;
> +
> +               clocks = <&soc_smc50mhz>;
> +               clock-names = "apb_pclk";
> +               power-domains = <&scpi_devpd 0>;
> +
> +               trig-conns@0 {
> +                       arm,trig-in-sigs=<2 3>;
> +                       arm,trig-in-types=<SNK_FULL SNK_ACQCOMP>;
> +                       arm,trig-out-sigs=<0 1>;
> +                       arm,trig-out-types=<SNK_FLUSHIN SNK_TRIGIN>;
> +                       arm,cs-dev-assoc = <&etr_sys>;
> +               };
> +
> +               trig-conns@1 {
> +                       arm,trig-in-sigs=<0 1>;
> +                       arm,trig-in-types=<SNK_FULL SNK_ACQCOMP>;
> +                       arm,trig-out-sigs=<7 6>;
> +                       arm,trig-out-types=<SNK_FLUSHIN SNK_TRIGIN>;
> +                       arm,cs-dev-assoc = <&etf_sys0>;
> +               };
> +
> +               trig-conns@2 {
> +                       arm,trig-in-sigs=<4 5 6 7>;
> +                       arm,trig-in-types=<STM_TOUT_SPTE STM_TOUT_SW
> +                                          STM_TOUT_HETE STM_ASYNCOUT>;
> +                       arm,trig-out-sigs=<4 5>;
> +                       arm,trig-out-types=<STM_HWEVENT STM_HWEVENT>;
> +                       arm,cs-dev-assoc = <&stm_sys>;
> +               };
> +
> +               trig-conns@3 {
> +                       arm,trig-out-sigs=<2 3>;
> +                       arm,trig-out-types=<SNK_FLUSHIN SNK_TRIGIN>;
> +                       arm,cs-dev-assoc = <&tpiu_sys>;
> +               };
> +       };
> +
> +       cti@20110000 { /* sys_cti_1 */
> +               compatible = "arm,coresight-cti", "arm,primecell";
> +               reg = <0 0x20110000 0 0x1000>;
> +
> +               clocks = <&soc_smc50mhz>;
> +               clock-names = "apb_pclk";
> +               power-domains = <&scpi_devpd 0>;
> +
> +               trig-conns@0 {
> +                       arm,trig-in-sigs=<0>;
> +                       arm,trig-in-types=<GEN_INTREQ>;
> +                       arm,trig-out-sigs=<0>;
> +                       arm,trig-out-types=<GEN_HALTREQ>;
> +                       arm,trig-conn-name = "sys_profiler";
> +               };
> +
> +               trig-conns@1 {
> +                       arm,trig-out-sigs=<2 3>;
> +                       arm,trig-out-types=<GEN_HALTREQ GEN_RESTARTREQ>;
> +                       arm,trig-conn-name = "watchdog";
> +               };
> +
> +               trig-conns@2 {
> +                       arm,trig-out-sigs=<1 6>;
> +                       arm,trig-out-types=<GEN_HALTREQ GEN_RESTARTREQ>;
> +                       arm,trig-conn-name = "g_counter";
> +               };
> +       };
> +
>         gpu: gpu@2d000000 {
>                 compatible = "arm,juno-mali", "arm,mali-t624";
>                 reg = <0 0x2d000000 0 0x10000>;
> diff --git a/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi b/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi
> index eda3d9e18af6..308f4eee8b29 100644
> --- a/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi
> +++ b/arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi
> @@ -23,7 +23,7 @@
>                 };
>         };
>
> -       etf@20140000 { /* etf1 */
> +       etf_sys1: etf@20140000 { /* etf1 */
>                 compatible = "arm,coresight-tmc", "arm,primecell";
>                 reg = <0 0x20140000 0 0x1000>;
>
> @@ -82,4 +82,33 @@
>
>                 };
>         };
> +
> +       cti@20160000 { /* sys_cti_2 */
> +               compatible = "arm,coresight-cti", "arm,primecell";
> +               reg = <0 0x20160000 0 0x1000>;
> +
> +               clocks = <&soc_smc50mhz>;
> +               clock-names = "apb_pclk";
> +               power-domains = <&scpi_devpd 0>;
> +
> +               trig-conns@0 {
> +                       arm,trig-in-sigs=<0 1>;
> +                       arm,trig-in-types=<SNK_FULL SNK_ACQCOMP>;
> +                       arm,trig-out-sigs=<0 1>;
> +                       arm,trig-out-types=<SNK_FLUSHIN SNK_TRIGIN>;
> +                       arm,cs-dev-assoc = <&etf_sys1>;
> +               };
> +
> +               trig-conns@1 {
> +                       arm,trig-in-sigs=<2 3 4>;
> +                       arm,trig-in-types=<ELA_DBGREQ ELA_TSTART ELA_TSTOP>;
> +                       arm,trig-conn-name = "ela_clus_0";
> +               };
> +
> +               trig-conns@2 {
> +                       arm,trig-in-sigs=<5 6 7>;
> +                       arm,trig-in-types=<ELA_DBGREQ ELA_TSTART ELA_TSTOP>;
> +                       arm,trig-conn-name = "ela_clus_1";
> +               };
> +       };
>  };
> diff --git a/arch/arm64/boot/dts/arm/juno-r1.dts b/arch/arm64/boot/dts/arm/juno-r1.dts
> index 5f290090b0cf..02aa51eb311d 100644
> --- a/arch/arm64/boot/dts/arm/juno-r1.dts
> +++ b/arch/arm64/boot/dts/arm/juno-r1.dts
> @@ -9,6 +9,7 @@
>  /dts-v1/;
>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/arm/coresight-cti-dt.h>
>  #include "juno-base.dtsi"
>  #include "juno-cs-r1r2.dtsi"
>
> @@ -309,3 +310,27 @@
>  &cpu_debug5 {
>         cpu = <&A53_3>;
>  };
> +
> +&cti0 {
> +       cpu = <&A57_0>;
> +};
> +
> +&cti1 {
> +       cpu = <&A57_1>;
> +};
> +
> +&cti2 {
> +       cpu = <&A53_0>;
> +};
> +
> +&cti3 {
> +       cpu = <&A53_1>;
> +};
> +
> +&cti4 {
> +       cpu = <&A53_2>;
> +};
> +
> +&cti5 {
> +       cpu = <&A53_3>;
> +};
> diff --git a/arch/arm64/boot/dts/arm/juno-r2.dts b/arch/arm64/boot/dts/arm/juno-r2.dts
> index 305300dd521c..75bb27c2d4dc 100644
> --- a/arch/arm64/boot/dts/arm/juno-r2.dts
> +++ b/arch/arm64/boot/dts/arm/juno-r2.dts
> @@ -9,6 +9,7 @@
>  /dts-v1/;
>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/arm/coresight-cti-dt.h>
>  #include "juno-base.dtsi"
>  #include "juno-cs-r1r2.dtsi"
>
> @@ -315,3 +316,27 @@
>  &cpu_debug5 {
>         cpu = <&A53_3>;
>  };
> +
> +&cti0 {
> +       cpu = <&A72_0>;
> +};
> +
> +&cti1 {
> +       cpu = <&A72_1>;
> +};
> +
> +&cti2 {
> +       cpu = <&A53_0>;
> +};
> +
> +&cti3 {
> +       cpu = <&A53_1>;
> +};
> +
> +&cti4 {
> +       cpu = <&A53_2>;
> +};
> +
> +&cti5 {
> +       cpu = <&A53_3>;
> +};
> diff --git a/arch/arm64/boot/dts/arm/juno.dts b/arch/arm64/boot/dts/arm/juno.dts
> index f00cffbd032c..dbc22e70b62c 100644
> --- a/arch/arm64/boot/dts/arm/juno.dts
> +++ b/arch/arm64/boot/dts/arm/juno.dts
> @@ -9,6 +9,7 @@
>  /dts-v1/;
>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/arm/coresight-cti-dt.h>
>  #include "juno-base.dtsi"
>
>  / {
> @@ -295,3 +296,27 @@
>  &cpu_debug5 {
>         cpu = <&A53_3>;
>  };
> +
> +&cti0 {
> +       cpu = <&A57_0>;
> +};
> +
> +&cti1 {
> +       cpu = <&A57_1>;
> +};
> +
> +&cti2 {
> +       cpu = <&A53_0>;
> +};
> +
> +&cti3 {
> +       cpu = <&A53_1>;
> +};
> +
> +&cti4 {
> +       cpu = <&A53_2>;
> +};
> +
> +&cti5 {
> +       cpu = <&A53_3>;
> +};

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> --
> 2.17.1
>
