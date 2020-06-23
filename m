Return-Path: <SRS0=lOvj=AE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E61C433E2
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 05:07:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B0C6A20724
	for <linux-devicetree@archiver.kernel.org>; Tue, 23 Jun 2020 05:07:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GyM4fscQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728536AbgFWFHE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 23 Jun 2020 01:07:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728390AbgFWFHD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 23 Jun 2020 01:07:03 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7739BC061796
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 22:07:02 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id r5so8428719vso.11
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 22:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7oiDqnOGO+TssYLUtaiAkGZqbTLTe8VBFV4/hAXcsaU=;
        b=GyM4fscQ4q5oq3dAVNcL2LKqjcJve7N0SZ8ZZHhGKk95SJESE5mehZloXDB+bNh5tp
         eD5Q2sXcgazzYyaHEaIXxhs4bl/B9ZozpMBCMbM9FGCgjMOGrLh5IWUNBHtQBXkGEfTQ
         01Z4/4we8JqKj06ttdbLoGxTzqNX9heQz4EGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7oiDqnOGO+TssYLUtaiAkGZqbTLTe8VBFV4/hAXcsaU=;
        b=AY2iQKxhS7deM18mps3OjnXFssVWdS+mcA8gJ/uY/gLUy5UYSCilNgP6XxAmAFg6yl
         1QLcLwJX7hgNE9b1I0dL8YX7onz0iFBsqV/j1ygYpWXJ10t/sK0LKo31QNj4VJR1MdOY
         CEVZ0lmXODgKUzxzfIsDQtseMSlLwe6/59IlxC2uCwXS4QNC/hrl+0CXXaUnSxfJ2Jy5
         eDPHfn70LSfpTMzHsrZ29Rt/QER/ZKT8mRxeBlxPFxeC9Ns2IyxEhNUjCAuoP1oMzyHO
         zWtCWCE4Szc5/P1pKtZEqgB/9ktgbBcXyOCsbpiryE5oD7Is86E4BV+0Ix/O1IHDOFRe
         IPUQ==
X-Gm-Message-State: AOAM5306P7TrDKdjC06gdd4c3NATDvZc/eYoMWKi/kngQfHJqSH4UMT4
        EX/mqkEFpuTZWLRB9HjhvUCeTTh4Bnw=
X-Google-Smtp-Source: ABdhPJxgP2uB6wA+SIIqIp8c73Cwt4iSVBvDFePPtRYSzHKpTQs66/xmG2wE4583mI/hrHfJvWk8BQ==
X-Received: by 2002:a67:8dc8:: with SMTP id p191mr3078977vsd.68.1592888821426;
        Mon, 22 Jun 2020 22:07:01 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id v4sm2089781vsk.9.2020.06.22.22.07.00
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2020 22:07:00 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id j13so10993441vsn.3
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2020 22:07:00 -0700 (PDT)
X-Received: by 2002:a67:e445:: with SMTP id n5mr18647007vsm.73.1592888819511;
 Mon, 22 Jun 2020 22:06:59 -0700 (PDT)
MIME-Version: 1.0
References: <1591682194-32388-1-git-send-email-akashast@codeaurora.org> <1591682194-32388-5-git-send-email-akashast@codeaurora.org>
In-Reply-To: <1591682194-32388-5-git-send-email-akashast@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 22 Jun 2020 22:06:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XwV-8J9-j1j2gwQ08oF8izDv=hB9vj_SogbagOBQfN6Q@mail.gmail.com>
Message-ID: <CAD=FV=XwV-8J9-j1j2gwQ08oF8izDv=hB9vj_SogbagOBQfN6Q@mail.gmail.com>
Subject: Re: [PATCH V7 RESEND 4/7] spi: spi-geni-qcom: Add interconnect support
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        linux-spi <linux-spi@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-serial@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
        Evan Green <evgreen@chromium.org>, msavaliy@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Mon, Jun 8, 2020 at 10:57 PM Akash Asthana <akashast@codeaurora.org> wrote:
>
> Get the interconnect paths for SPI based Serial Engine device
> and vote according to the current bus speed of the driver.
>
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Changes in V2:
>  - As per Bjorn's comment, removed se == NULL check from geni_spi_icc_get
>  - As per Bjorn's comment, removed code to set se->icc_path* to NULL in failure
>  - As per Bjorn's comment, introduced and using devm_of_icc_get API for getting
>    path handle
>  - As per Matthias comment, added error handling for icc_set_bw call
>
> Changes in V3:
>  - As per Matthias's comment, use helper ICC function from geni-se driver.
>
> Changes in V4:
>  - Move peak_bw guess as twice of avg_bw if nothing mentioned explicitly
>    to ICC core.
>
> Changes in V5:
>  - Use icc_enable/disable in power on/off call.
>  - Save some non-zero avg/peak value to ICC core by calling geni_icc_set_bw
>    from probe so that when resume/icc_enable is called NOC are running at
>    some non-zero value. No need to call icc_disable after BW vote because
>    device will resume and suspend before probe return and will leave ICC in
>    disabled state.
>
> Changes in V6:
>  - No change
>
> Changes in V7:
>  - As per Matthias's comment removed usage of peak_bw variable because we don't
>    have explicit peak requirement, we were voting peak = avg and this can be
>    tracked using single variable for avg bw.
>
>  drivers/spi/spi-geni-qcom.c | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index c397242..2ace5c5 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -234,6 +234,12 @@ static int setup_fifo_params(struct spi_device *spi_slv,
>                 return ret;
>         }
>
> +       /* Set BW quota for CPU as driver supports FIFO mode only. */
> +       se->icc_paths[CPU_TO_GENI].avg_bw = Bps_to_icc(mas->cur_speed_hz);
> +       ret = geni_icc_set_bw(se);
> +       if (ret)
> +               return ret;
> +

I haven't done a deep review of your patch, but a quick drive-by
review since I happened to notice it while looking at this driver.
You should probably also update the other path that's adjusting the
"mas->cur_speed_hz" variable.  Specifically see setup_fifo_xfer().

For bonus points, you could even unify the two paths.  Perhaps you
could pick <https://crrev.com/c/2259624> and include it in your series
(remove the WIP if you do).


-Doug
