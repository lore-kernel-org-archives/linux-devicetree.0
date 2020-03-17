Return-Path: <SRS0=fjOU=5C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F80C5ACD6
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 19:09:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 134D12073E
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 19:09:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WBBI5+Fk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbgCQTJk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 17 Mar 2020 15:09:40 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:43782 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbgCQTJk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 17 Mar 2020 15:09:40 -0400
Received: by mail-lf1-f67.google.com with SMTP id n20so14853730lfl.10
        for <devicetree@vger.kernel.org>; Tue, 17 Mar 2020 12:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HslPcJIo3S/gfJwOLWKAp+bbJPCMegwoA4gAtpRTBpw=;
        b=WBBI5+Fk6wbTGUQap4Fu6dRsazuD8ff8Gu5e+6AmXv7XDo742Zy9lrXGtOEjOpQ/7s
         Cip6Ty0dP3Ku+FzFfqT1DYN7Wr/tDh0ULC5Me0NCdG0TvwtkKB+CXrk5SN4IYPafjx2N
         fbbtkOKGR7y/cFKVvyGFODV5onhx7IGXNfDCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HslPcJIo3S/gfJwOLWKAp+bbJPCMegwoA4gAtpRTBpw=;
        b=Rv7OjjMz5XiNn4nndotgQt0VlB/FZBqVv9tM7eb5tAL7PLaFVhjuGV3OqKCLqzHEHY
         mt8hbtl1SPstAQQfeKdtfUDmUgmd9UGGSJtlmBB4Zpodgrrl+NPUCuaLT20ISrWG1cPI
         7hIshG5fwtZMG5KTiYuUaErdYJvKv3b4tslnxxqgsvVtiJHrLFA2kP7hoko8nSMiIucM
         GZlHdAZV1mn0t/TkXQuEz+in8XMcKF3p+NSXA++O7YafNJPSdmRzX7rbnavTBfyTuYe+
         YFIWXZ4NHvbwyZZR+WzcExHuuKCec6jX+cClO/YVXzlTjGYmSNHXKKTnNJAfL5yjpQhu
         hBRA==
X-Gm-Message-State: ANhLgQ3XnoPFpF+m1Hgs7poRPBNMxUmrvKgTU4oyzO8L9pKaT4tEhMw/
        slZFIpFxtr6J1UvZMU/i95oO9quqpf0=
X-Google-Smtp-Source: ADFU+vs4bHIUdZK5dsSeQXpXNzYxjW7FaAsLIZyqM1AhC8VsoMSwBzQV6ZIePwB3pJSniBYy5T4NRg==
X-Received: by 2002:a05:6512:10c4:: with SMTP id k4mr524947lfg.98.1584472177156;
        Tue, 17 Mar 2020 12:09:37 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id l11sm3159765lfg.87.2020.03.17.12.09.35
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2020 12:09:35 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id m15so205996lfp.2
        for <devicetree@vger.kernel.org>; Tue, 17 Mar 2020 12:09:35 -0700 (PDT)
X-Received: by 2002:a19:ec08:: with SMTP id b8mr536794lfa.34.1584472174941;
 Tue, 17 Mar 2020 12:09:34 -0700 (PDT)
MIME-Version: 1.0
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
 <1584105134-13583-8-git-send-email-akashast@codeaurora.org>
 <20200314005817.GN144492@google.com> <3aeb3083-2a31-b269-510d-eb608ff14ce5@codeaurora.org>
In-Reply-To: <3aeb3083-2a31-b269-510d-eb608ff14ce5@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 17 Mar 2020 12:08:56 -0700
X-Gmail-Original-Message-ID: <CAE=gft58QsgTCUHMHKJhcM9ZxAeMiY16CrbNv2HaTCRqwtmt7A@mail.gmail.com>
Message-ID: <CAE=gft58QsgTCUHMHKJhcM9ZxAeMiY16CrbNv2HaTCRqwtmt7A@mail.gmail.com>
Subject: Re: [PATCH V2 7/8] spi: spi-qcom-qspi: Add interconnect support
To:     Akash Asthana <akashast@codeaurora.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
        linux-serial@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>,
        Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Mar 17, 2020 at 5:13 AM Akash Asthana <akashast@codeaurora.org> wrote:
>
> Hi Matthias,
>
> On 3/14/2020 6:28 AM, Matthias Kaehlcke wrote:
> > Hi,
> >
> > On Fri, Mar 13, 2020 at 06:42:13PM +0530, Akash Asthana wrote:
> >> Get the interconnect paths for QSPI device and vote according to the
> >> current bus speed of the driver.
> >>
> >> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> >> ---
> >>   - As per Bjorn's comment, introduced and using devm_of_icc_get API for getting
> >>     path handle
> >>   - As per Matthias comment, added error handling for icc_set_bw call
> >>
> >>   drivers/spi/spi-qcom-qspi.c | 46 ++++++++++++++++++++++++++++++++++++++++++++-
> >>   1 file changed, 45 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
> >> index 3c4f83b..ad48f43 100644
> >> --- a/drivers/spi/spi-qcom-qspi.c
> >> +++ b/drivers/spi/spi-qcom-qspi.c
> >> @@ -2,6 +2,7 @@
> >>   // Copyright (c) 2017-2018, The Linux foundation. All rights reserved.
> >>
> >>   #include <linux/clk.h>
> >> +#include <linux/interconnect.h>
> >>   #include <linux/interrupt.h>
> >>   #include <linux/io.h>
> >>   #include <linux/module.h>
> >> @@ -139,7 +140,10 @@ struct qcom_qspi {
> >>      struct device *dev;
> >>      struct clk_bulk_data *clks;
> >>      struct qspi_xfer xfer;
> >> -    /* Lock to protect xfer and IRQ accessed registers */
> >> +    struct icc_path *icc_path_cpu_to_qspi;
> >> +    unsigned int avg_bw_cpu;
> >> +    unsigned int peak_bw_cpu;
> > This triplet is a recurring pattern, and is probably not limited to geni SE/QSPI.
> > On https://patchwork.kernel.org/patch/11436889/#23221925 I suggested the creation
> > of a geni SE specific struct, however adding a generic convenience struct to
> > 'linux/interconnect.h' might be the better solution:
> >
> > struct icc_client {
> >       struct icc_path *path;
> >       unsigned int avg_bw;
> >       unsigned int peak_bw;
> > };
> >
> > I'm sure there are better names for it, but this would be the idea.
>
> Yeah, I think introducing this to ICC header would be better solution.

+Georgi

I'm not as convinced this structure is generally useful and belongs in
the interconnect core. The thing that strikes me as weird with putting
it in the core is now we're saving these values both inside and
outside the interconnect core. In the GENI case here, we only really
need them to undo the 0 votes we cast during suspend. If "vote for 0
in suspend and whatever it was before at resume" is a recurring theme,
maybe the core should give us path_disable() and path_enable() calls
instead. I'm thinking out loud, maybe Georgi has some thoughts.

Akash, for now if you want to avoid wading into a larger discussion
maybe just refactor to a common structure local to GENI.


-Evan
