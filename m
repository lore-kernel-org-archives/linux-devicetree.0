Return-Path: <SRS0=X1fx=47=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A4F7C4CECE
	for <linux-devicetree@archiver.kernel.org>; Sat, 14 Mar 2020 00:58:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2B3CC2074C
	for <linux-devicetree@archiver.kernel.org>; Sat, 14 Mar 2020 00:58:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hIzbj4ti"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727687AbgCNA6U (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Mar 2020 20:58:20 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:36707 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbgCNA6U (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Mar 2020 20:58:20 -0400
Received: by mail-pj1-f68.google.com with SMTP id nu11so2018611pjb.1
        for <devicetree@vger.kernel.org>; Fri, 13 Mar 2020 17:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XkYkz7olGuMoHjxIYMm5YyzLZkVPwk4ncu3nYGmC0LU=;
        b=hIzbj4tiMzwa7yvFFtYnreJK3Hm4RFPdQYBxc9OLUkJkVaHnGWgdL2WW3Wa2p6TqQe
         jPqXBfZXOQrxKtkIoobRZ7gq4psLmPnMjSSK5yt+utMMVDhdmcqeP6J3iYOn0MXXargV
         wcDJ9Sv78r1FZg64Er4hfwhJixUr9L5uEOVsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XkYkz7olGuMoHjxIYMm5YyzLZkVPwk4ncu3nYGmC0LU=;
        b=ovjjPtOOc4HVYqf1h5gHPiKBIe3JoXiEvHw06OBIbPmkPQhe/XlJXoPBKCQePPDJaB
         MqNA+gT+DHx2DtV2XrL5BeZ1JTcxdhn/hfNB1RFW7Vce2c3REUWlX6eyEdgI3VAyM3bo
         nG/2rCQ3Eu2eyye4B5+Jt80fms7I11r2AllYkksOCKQZ7v6GAMzZXdM1VNhazR7IyUtQ
         jWaEuDKbxRPRVrJN4SBS5UMMakFTvcZY+BHy6rmweNJeW4rhGI930uD04Bo+bD9XxHUG
         /Lla+e1lgbFgwNX9WWDHyFUGtBMQ4HgKSv7hgYRGHRfSxakjnzbGTEoyd609VSbr6O3W
         Qjpw==
X-Gm-Message-State: ANhLgQ3xwpIE6J04qs0Dj1xyBPWf9mTQ3NfyX2URDlfwK9RH82yfpnl0
        vlBiTPZebz54YiH6v+g4X0Jjjg==
X-Google-Smtp-Source: ADFU+vvhBGrL9Xnlfe5/hQ6M3VwsQ+6WfaCs3st09JIB8ufa3kMvrkB86gSREv5L7WsZ80wVjP2TnQ==
X-Received: by 2002:a17:902:bf06:: with SMTP id bi6mr16374090plb.30.1584147499410;
        Fri, 13 Mar 2020 17:58:19 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id f19sm16696202pgn.42.2020.03.13.17.58.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2020 17:58:18 -0700 (PDT)
Date:   Fri, 13 Mar 2020 17:58:17 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, wsa@the-dreams.de, broonie@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, dianders@chromium.org,
        evgreen@chromium.org
Subject: Re: [PATCH V2 7/8] spi: spi-qcom-qspi: Add interconnect support
Message-ID: <20200314005817.GN144492@google.com>
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
 <1584105134-13583-8-git-send-email-akashast@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1584105134-13583-8-git-send-email-akashast@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Fri, Mar 13, 2020 at 06:42:13PM +0530, Akash Asthana wrote:
> Get the interconnect paths for QSPI device and vote according to the
> current bus speed of the driver.
> 
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
>  - As per Bjorn's comment, introduced and using devm_of_icc_get API for getting
>    path handle
>  - As per Matthias comment, added error handling for icc_set_bw call
> 
>  drivers/spi/spi-qcom-qspi.c | 46 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
> index 3c4f83b..ad48f43 100644
> --- a/drivers/spi/spi-qcom-qspi.c
> +++ b/drivers/spi/spi-qcom-qspi.c
> @@ -2,6 +2,7 @@
>  // Copyright (c) 2017-2018, The Linux foundation. All rights reserved.
>  
>  #include <linux/clk.h>
> +#include <linux/interconnect.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> @@ -139,7 +140,10 @@ struct qcom_qspi {
>  	struct device *dev;
>  	struct clk_bulk_data *clks;
>  	struct qspi_xfer xfer;
> -	/* Lock to protect xfer and IRQ accessed registers */
> +	struct icc_path *icc_path_cpu_to_qspi;
> +	unsigned int avg_bw_cpu;
> +	unsigned int peak_bw_cpu;

This triplet is a recurring pattern, and is probably not limited to geni SE/QSPI.
On https://patchwork.kernel.org/patch/11436889/#23221925 I suggested the creation
of a geni SE specific struct, however adding a generic convenience struct to
'linux/interconnect.h' might be the better solution:

struct icc_client {
	struct icc_path *path;
	unsigned int avg_bw;
	unsigned int peak_bw;
};

I'm sure there are better names for it, but this would be the idea.
