Return-Path: <SRS0=uBtF=5D=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B076C10DCE
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Mar 2020 16:31:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 360EC205ED
	for <linux-devicetree@archiver.kernel.org>; Wed, 18 Mar 2020 16:31:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FGK222es"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726954AbgCRQbP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 18 Mar 2020 12:31:15 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34306 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbgCRQbP (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 18 Mar 2020 12:31:15 -0400
Received: by mail-lj1-f196.google.com with SMTP id s13so27789958ljm.1
        for <devicetree@vger.kernel.org>; Wed, 18 Mar 2020 09:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TnhTytcg8/2Cxze55Eg3TEpzriYoiMzt5B1xeuc9CoY=;
        b=FGK222eshqJqCPvE2m2PuKqq+bjIHzU2tnb5kXur4flSPtAfo4pp9ZgJvNZNB7M4+E
         dPLzdS6HZrLY+LVoKNQVV8HWEnhXFMk+h2uQFclD5ic0GzsQzn3gr8b3EVh18LxZ7Iwc
         6hl3OQ3EZglFarqVOjy1An2rgBl9kpceeR9QY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TnhTytcg8/2Cxze55Eg3TEpzriYoiMzt5B1xeuc9CoY=;
        b=ropBPkxJ2cTNrZyEe1HElYEEPPorH2cAkC55AWLJ8UzzBupSS7A0q+a7r7wS06ZHiv
         Deol4/Qlq89b7Qv60tijG0/T5mXwVpRvJzbcXWIRclVWhbyuM/TctBujcHP2uYcxRUhp
         dmysmZFvmqNmqMnw5EmiKn9IeFkjAL86u+7qgJUZ4+bXjQpAbruc8Yie2yo8gN6+cXay
         GJC3mHSYC6J40BlaL6mSkMk/AoobexhAxCvJr5a4ifn6i5TgCaukqwLTtbRWHrh9PQDE
         Kq2iGmqXk9PXBJaK9oCZl6mEwpYCkXdSCmlaLdToszs5HLcdicFIr1NGiK/laNoSCjHZ
         iZiQ==
X-Gm-Message-State: ANhLgQ3v7rtMkUuq0xRvpMlMYI+cxD1IvB3+nWjlvAgiCwH+9CKQFskX
        4j1RuQth2yu2GezFbyVkrRyH7JCCt8o=
X-Google-Smtp-Source: ADFU+vt5FEKjyTuDuLIZbrqFxZTd5m5y3ZAGExM894I81mqvuBgwE+fl1XiRL6Pux2cZWykWO3Pt9g==
X-Received: by 2002:a2e:9816:: with SMTP id a22mr2970024ljj.76.1584549071399;
        Wed, 18 Mar 2020 09:31:11 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id j124sm5636162lfj.27.2020.03.18.09.31.09
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2020 09:31:09 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id 19so27731445ljj.7
        for <devicetree@vger.kernel.org>; Wed, 18 Mar 2020 09:31:09 -0700 (PDT)
X-Received: by 2002:a2e:8991:: with SMTP id c17mr2989954lji.278.1584549068513;
 Wed, 18 Mar 2020 09:31:08 -0700 (PDT)
MIME-Version: 1.0
References: <1584105134-13583-1-git-send-email-akashast@codeaurora.org>
 <1584105134-13583-8-git-send-email-akashast@codeaurora.org>
 <20200314005817.GN144492@google.com> <3aeb3083-2a31-b269-510d-eb608ff14ce5@codeaurora.org>
 <CAE=gft58QsgTCUHMHKJhcM9ZxAeMiY16CrbNv2HaTCRqwtmt7A@mail.gmail.com> <e2ee1a60-a379-5c78-355a-64aad451a944@codeaurora.org>
In-Reply-To: <e2ee1a60-a379-5c78-355a-64aad451a944@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Wed, 18 Mar 2020 09:30:31 -0700
X-Gmail-Original-Message-ID: <CAE=gft4xL9+GN2NrM9ewyPg0Fog3pnf_sLGjWRNOg7KynNh-Dg@mail.gmail.com>
Message-ID: <CAE=gft4xL9+GN2NrM9ewyPg0Fog3pnf_sLGjWRNOg7KynNh-Dg@mail.gmail.com>
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

On Wed, Mar 18, 2020 at 6:48 AM Akash Asthana <akashast@codeaurora.org> wrote:
>
> Hi Evan,
>
> On 3/18/2020 12:38 AM, Evan Green wrote:
> > On Tue, Mar 17, 2020 at 5:13 AM Akash Asthana <akashast@codeaurora.org> wrote:
> >> Hi Matthias,
> >>
> >> On 3/14/2020 6:28 AM, Matthias Kaehlcke wrote:
> >>> Hi,
> >>>
> >>> On Fri, Mar 13, 2020 at 06:42:13PM +0530, Akash Asthana wrote:
> >>>> Get the interconnect paths for QSPI device and vote according to the
> >>>> current bus speed of the driver.
> >>>>
> >>>> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> >>>> ---
> >>>>    - As per Bjorn's comment, introduced and using devm_of_icc_get API for getting
> >>>>      path handle
> >>>>    - As per Matthias comment, added error handling for icc_set_bw call
> >>>>
> >>>>    drivers/spi/spi-qcom-qspi.c | 46 ++++++++++++++++++++++++++++++++++++++++++++-
> >>>>    1 file changed, 45 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
> >>>> index 3c4f83b..ad48f43 100644
> >>>> --- a/drivers/spi/spi-qcom-qspi.c
> >>>> +++ b/drivers/spi/spi-qcom-qspi.c
> >>>> @@ -2,6 +2,7 @@
> >>>>    // Copyright (c) 2017-2018, The Linux foundation. All rights reserved.
> >>>>
> >>>>    #include <linux/clk.h>
> >>>> +#include <linux/interconnect.h>
> >>>>    #include <linux/interrupt.h>
> >>>>    #include <linux/io.h>
> >>>>    #include <linux/module.h>
> >>>> @@ -139,7 +140,10 @@ struct qcom_qspi {
> >>>>       struct device *dev;
> >>>>       struct clk_bulk_data *clks;
> >>>>       struct qspi_xfer xfer;
> >>>> -    /* Lock to protect xfer and IRQ accessed registers */
> >>>> +    struct icc_path *icc_path_cpu_to_qspi;
> >>>> +    unsigned int avg_bw_cpu;
> >>>> +    unsigned int peak_bw_cpu;
> >>> This triplet is a recurring pattern, and is probably not limited to geni SE/QSPI.
> >>> On https://patchwork.kernel.org/patch/11436889/#23221925 I suggested the creation
> >>> of a geni SE specific struct, however adding a generic convenience struct to
> >>> 'linux/interconnect.h' might be the better solution:
> >>>
> >>> struct icc_client {
> >>>        struct icc_path *path;
> >>>        unsigned int avg_bw;
> >>>        unsigned int peak_bw;
> >>> };
> >>>
> >>> I'm sure there are better names for it, but this would be the idea.
> >> Yeah, I think introducing this to ICC header would be better solution.
> > +Georgi
> >
> > I'm not as convinced this structure is generally useful and belongs in
> > the interconnect core. The thing that strikes me as weird with putting
> > it in the core is now we're saving these values both inside and
> > outside the interconnect core.
> IIUC, you meant to say struct icc_req(inside icc_path) will be saving
> avg_bw and peak_bw so no need to save it outside icc_path?

Correct, it seems silly to store the same set of values twice in the
framework, but with different semantics about who's watching it.
-Evan
