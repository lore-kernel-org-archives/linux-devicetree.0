Return-Path: <SRS0=fjOU=5C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A9DDC5ACD6
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 19:07:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6C0D02073E
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 19:07:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RmFy6BxU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbgCQTHO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 17 Mar 2020 15:07:14 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34448 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726494AbgCQTHO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 17 Mar 2020 15:07:14 -0400
Received: by mail-lf1-f68.google.com with SMTP id f3so7949671lfc.1
        for <devicetree@vger.kernel.org>; Tue, 17 Mar 2020 12:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YEEc09trOmH4D9SUDPMbQiadK7H2Qw9VvDkuRLFStZo=;
        b=RmFy6BxUBkaGc+I1s1MbSATu7fVGC1ZDQWtncIWzCCz4160Yptu+BTMXEBd43s7u2y
         FfV8PoCRMC8uuFC8P+RJRqxTnZeDjQyjwhwyodSTiDLsDFaKrrRaYtTB7WFKhmLDmxeq
         s2DEy9aVLpUQogfr+sbRzzhmkkAtNzcoaIR68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YEEc09trOmH4D9SUDPMbQiadK7H2Qw9VvDkuRLFStZo=;
        b=AO/nsLGaMGXs6cLwCVFgQy3GzaNIOYZtsLlt8HSJ0w5XmbTeppXlst1AuJdCayyxnb
         LfQALGiBN/JhMR7KHkul5ctvfGM9Eb7gewNDnF3qPOfwXAyw+Yz7czW7kOsBPnHeUSm0
         INl3L97WkSOKTeuoKibXeYXwy8UAhGoSdge2ibQygFqiw+aoSW88C/SkOo8eFrWrEdqJ
         Ypw2akrzWttK4LE5OueNzeT1McPfkAEkgqtZgl6CrQUd9QB1ingWWv7QCBHeaA9BVrqM
         q4ssfunant5wLHNMa7Iwy3d93t7iYD6y+2b+mXm1j2lAPPcK8bGvhRmm6VFk1+VkD49N
         QrpQ==
X-Gm-Message-State: ANhLgQ1QtSvCFaKPl9NZgJsRXLapL00JRQvxfq3Vz5ZBzxRLWu5N79iu
        9mU7FznhvocbdfhhnKJpsxmOvwKBy9Y=
X-Google-Smtp-Source: ADFU+vvhn2c/8Fr18K8CjYYHea6ddRGw4N37L2vt/QMlXOET3kCekaHlDS4HRc8xJJEwKiCvemlHvA==
X-Received: by 2002:a19:857:: with SMTP id 84mr510033lfi.15.1584472029549;
        Tue, 17 Mar 2020 12:07:09 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id u19sm3002613ljk.12.2020.03.17.12.07.08
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2020 12:07:09 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id t21so18190196lfe.9
        for <devicetree@vger.kernel.org>; Tue, 17 Mar 2020 12:07:08 -0700 (PDT)
X-Received: by 2002:a19:8788:: with SMTP id j130mr521058lfd.130.1584472028241;
 Tue, 17 Mar 2020 12:07:08 -0700 (PDT)
MIME-Version: 1.0
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org> <1584105134-13583-3-git-send-email-akashast@codeaurora.org>
In-Reply-To: <1584105134-13583-3-git-send-email-akashast@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 17 Mar 2020 12:06:31 -0700
X-Gmail-Original-Message-ID: <CAE=gft4_Su4+SXWAW_HWy5BF1mH7QaDHCiwAAhrNaekTeU57rA@mail.gmail.com>
Message-ID: <CAE=gft4_Su4+SXWAW_HWy5BF1mH7QaDHCiwAAhrNaekTeU57rA@mail.gmail.com>
Subject: Re: [PATCH V2 2/8] soc: qcom: geni: Support for ICC voting
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        wsa@the-dreams.de, Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
        Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Mar 13, 2020 at 6:12 AM Akash Asthana <akashast@codeaurora.org> wrote:
>
> Add necessary macros and structure variables to support ICC BW
> voting from individual SE drivers.
>
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
> Changes in V2:
>  - As per Bjorn's comment dropped enums for ICC paths, given the three
>    paths individual members
>
>  include/linux/qcom-geni-se.h | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
> index dd46494..eaae16e 100644
> --- a/include/linux/qcom-geni-se.h
> +++ b/include/linux/qcom-geni-se.h
> @@ -6,6 +6,8 @@
>  #ifndef _LINUX_QCOM_GENI_SE
>  #define _LINUX_QCOM_GENI_SE
>
> +#include <linux/interconnect.h>
> +
>  /* Transfer mode supported by GENI Serial Engines */
>  enum geni_se_xfer_mode {
>         GENI_SE_INVALID,
> @@ -33,6 +35,15 @@ struct clk;
>   * @clk:               Handle to the core serial engine clock
>   * @num_clk_levels:    Number of valid clock levels in clk_perf_tbl
>   * @clk_perf_tbl:      Table of clock frequency input to serial engine clock
> + * @icc_path_geni_to_core:     ICC path handle for geni to core
> + * @icc_path_cpu_to_geni:      ICC path handle for cpu to geni
> + * @icc_path_geni_to_ddr:      ICC path handle for geni to ddr
> + * @avg_bw_core:       Average bus bandwidth value for QUP core 2x clock
> + * @peak_bw_core:      Peak bus bandwidth value for QUP core 2x clock
> + * @avg_bw_cpu:                Average bus bandwidth value for CPU
> + * @peak_bw_cpu:       Peak bus bandwidth value for CPU
> + * @avg_bw_ddr:                Average bus bandwidth value for DDR
> + * @peak_bw_ddr:       Peak bus bandwidth value for DDR
>   */
>  struct geni_se {
>         void __iomem *base;
> @@ -41,6 +52,15 @@ struct geni_se {
>         struct clk *clk;
>         unsigned int num_clk_levels;
>         unsigned long *clk_perf_tbl;
> +       struct icc_path *icc_path_geni_to_core;
> +       struct icc_path *icc_path_cpu_to_geni;
> +       struct icc_path *icc_path_geni_to_ddr;
> +       unsigned int avg_bw_core;
> +       unsigned int peak_bw_core;
> +       unsigned int avg_bw_cpu;
> +       unsigned int peak_bw_cpu;
> +       unsigned int avg_bw_ddr;
> +       unsigned int peak_bw_ddr;
>  };
>
>  /* Common SE registers */
> @@ -229,6 +249,14 @@ struct geni_se {
>  #define GENI_SE_VERSION_MINOR(ver) ((ver & HW_VER_MINOR_MASK) >> HW_VER_MINOR_SHFT)
>  #define GENI_SE_VERSION_STEP(ver) (ver & HW_VER_STEP_MASK)
>
> +/* Core 2X clock frequency to BCM threshold mapping */
> +#define CORE_2X_19_2_MHZ               960
> +#define CORE_2X_50_MHZ                 2500
> +#define CORE_2X_100_MHZ                        5000
> +#define CORE_2X_150_MHZ                        7500
> +#define CORE_2X_200_MHZ                        10000
> +#define CORE_2X_236_MHZ                        16383

These are all just 50 * clock_rate. Can you instead specify that one
define of CLK_TO_BW_RATIO 50, and then use clk_get_rate() to get the
input clock frequency. That way, if these end up getting clocked at a
different rate, the bandwidth also scales appropriately. Also, can you
enumerate why 50 is an appropriate ratio?
-Evan

-Evan
