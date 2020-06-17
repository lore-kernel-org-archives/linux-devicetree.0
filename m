Return-Path: <SRS0=UIXH=76=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E5A4C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 14:55:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D6C3207DD
	for <linux-devicetree@archiver.kernel.org>; Wed, 17 Jun 2020 14:55:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cDnYNZzc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbgFQOzJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 17 Jun 2020 10:55:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726952AbgFQOzI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 17 Jun 2020 10:55:08 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67F97C061755
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2020 07:55:08 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id z47so856372uad.5
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2020 07:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rwgqDzLlKBlZHgeSExhyQD7IUX0bBrSxqALSEdkys8o=;
        b=cDnYNZzcuJY2Z8YxBUqI1q7VnRgPH6Ganx1dgOwjPXJnq1jOC75XvUqKB/ppGw0mMm
         2BR9fAx9ZjOId2omlKrwBFn19wnOwN1Kdne0r/o6xnS+s9XHyuiMegWXFfGW95OPNNaJ
         S6EczbN4+D9BhHWJ5roupqIvL90ghK7tP7CJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rwgqDzLlKBlZHgeSExhyQD7IUX0bBrSxqALSEdkys8o=;
        b=JBduU9L/cWZJzCn9WwXX/XhtG3qgQsLqvggCH8qNqhJGZSjd2NbH7kQ6LS5alHIAyu
         IxhvLoV6562C5Va3XCqVw5PZqU7MHi9qQk+zuNCt2mt5i7l7hCyzw90fNneEdIlhOOCq
         ruM1gEHHHWigSmcX1SS4cccgNYP0SmoifkeDDLWrOdWkwm4z7tfHsUms1kigqBSa6cMJ
         g6aVnH1pe3A6l0VPP+eUtePtYbwXviGwgDZ30Ue9/cIAn8eXEhRsx2H26jj5P7Ib8lfP
         wL7rcJONNNUcv3yHMkldoS+Irtgn44alSdz9v41ULJl4MH8Pr5+nPL0Ey2h7OIsFbDs/
         IAyQ==
X-Gm-Message-State: AOAM533FLuBafp8Sm5IW5lIlV3RI07A3hozMkJY/SrLYNDDMNNr0sMiV
        4l779gXxRIlDE4Rx9PWPDp06/I+7BUI=
X-Google-Smtp-Source: ABdhPJz9QpmtqTieSKq+/611UByA9lga+XiOdusYelcyZW98O6Uft1cQrkxIHi7Uc/e1XcV/RgzkwA==
X-Received: by 2002:ab0:6202:: with SMTP id m2mr6180897uao.51.1592405707040;
        Wed, 17 Jun 2020 07:55:07 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id m11sm1034183vko.34.2020.06.17.07.55.05
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2020 07:55:05 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id q2so1561233vsr.1
        for <devicetree@vger.kernel.org>; Wed, 17 Jun 2020 07:55:05 -0700 (PDT)
X-Received: by 2002:a67:1703:: with SMTP id 3mr6503266vsx.169.1592405704994;
 Wed, 17 Jun 2020 07:55:04 -0700 (PDT)
MIME-Version: 1.0
References: <1591868882-16553-1-git-send-email-rbokka@codeaurora.org>
 <1591868882-16553-3-git-send-email-rbokka@codeaurora.org> <CAD=FV=XSfMPehyCLB25hct+GE8JtU=5J=04KyU4AoHfg9cs50A@mail.gmail.com>
In-Reply-To: <CAD=FV=XSfMPehyCLB25hct+GE8JtU=5J=04KyU4AoHfg9cs50A@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 17 Jun 2020 07:54:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VAobLWeJvAn3wseNZ4JUJzta0m3wNUhiWiOoC0VcNisA@mail.gmail.com>
Message-ID: <CAD=FV=VAobLWeJvAn3wseNZ4JUJzta0m3wNUhiWiOoC0VcNisA@mail.gmail.com>
Subject: Re: [RFC v2 2/3] drivers: nvmem: Add QTI qfprom-efuse support
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

On Sat, Jun 13, 2020 at 1:33 PM Doug Anderson <dianders@chromium.org> wrote:
>
> In general I'm happy to post my series to the list myself to get
> review feedback.  For now I'm expecting that you can squash my changes
> in and send the next version.

I talked with Ravi offline and he suggested that I send out the v3, so
it's been posted.  For the cover letter, see:

https://lore.kernel.org/r/20200617145116.247432-1-dianders@chromium.org

-Doug
