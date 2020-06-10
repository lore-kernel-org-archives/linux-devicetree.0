Return-Path: <SRS0=7bfi=7X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74FE3C433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 10 Jun 2020 04:48:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A99520734
	for <linux-devicetree@archiver.kernel.org>; Wed, 10 Jun 2020 04:48:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B/qNLN4R"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbgFJEsA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 10 Jun 2020 00:48:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbgFJEr7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 10 Jun 2020 00:47:59 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C793C03E96B
        for <devicetree@vger.kernel.org>; Tue,  9 Jun 2020 21:47:59 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id 25so905029oiy.13
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2020 21:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EGCSz26NoE5P6k5GMe2KqoTYoFuUufwfEDJOt6jeNgY=;
        b=B/qNLN4Rw/cI3p2TpFOsoO+4rZo7DZL6F4QmvWPzVrUzH3gWEF3mSI9Z5lFcsYWQI2
         mYrbeQb2GOm1koc/DidSUqx4U2gsK3LFYIbqtkwTH+Is/vj1mPUvXEEsJQe/V9/5WbTH
         V7xwzWrbeLLUntipqOpNvZ1ouipQqwWtk0mer0hijH+4jXjdkFRoQ64s2aYitQVVqHoK
         +ezZ6QFTt8HEEZvwzSbnYNvNvimUxT/oJ+KrDC84DYuUwG5bcS6EwsB97bHuEcoGfILa
         UkhVgrXsP5bcr5Y1OMQkS5EndIMgYa3GfXWs3hmqtoL4lYV3326dRKMpVspmJipX86ip
         NmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EGCSz26NoE5P6k5GMe2KqoTYoFuUufwfEDJOt6jeNgY=;
        b=ETXi13wM22ZxtVjt3CySlYF48A2SVXnnByvSjyObDVTD/yAUP3Rhd2zAVhKSAsfujc
         b3SnQp4UGUhSXQfSi5ScxxRV32eOj0v+1rtU1994/SeWe9pm8BmP6NH29wtl2XXl7UiU
         gA/sQRh/vBgeIvirDjhVBhTqLe8l54EW2WOQFB27wz21JI0J9iLw/1K33pPZg35rVkzJ
         zSdUT3+hV1v3R2jomWklCm25G8/r6UDRw0abEuHQbwzjdRopixxtwiptSKPDieNFADbQ
         5TPt6aAUDiR6wK0LyDPJ4p1n+GBNSPJTrAwap0r1St6Z9GdgI7yrl+JSrBs7INP5bYjd
         Ox9A==
X-Gm-Message-State: AOAM533e7rVpcJdxgyB9K/7aOuub/XcS31m4O9IMPLr/Yd+z5lezZAXO
        2l4Zcf/EUYOGxJGQgfDl60uarkZBgvK5C0T3nDOCTg==
X-Google-Smtp-Source: ABdhPJzC0c77g+AGDUo2DunUSmAACYUSnLAp5bhVc44ja1V38Gxr6Z/cxgFKZLc+/Ubl1kXga15OBcscl6g6BOjXwFg=
X-Received: by 2002:aca:48d7:: with SMTP id v206mr1230018oia.97.1591764478602;
 Tue, 09 Jun 2020 21:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200610011934.49795-1-saravanak@google.com>
In-Reply-To: <20200610011934.49795-1-saravanak@google.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 9 Jun 2020 21:47:46 -0700
Message-ID: <CALAqxLVp-0cSed-E+_iXx2_cqYwmE2g51WOTpKTuE6JxF_mzzQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] fw_devlink: Improve cycle detection in DT
To:     Saravana Kannan <saravanak@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Jun 9, 2020 at 6:19 PM Saravana Kannan <saravanak@google.com> wrote:
>
> Patch 2/2 explain the series. Just using a cover letter to thread the
> series and add CC's.
>
> -Saravana
>
> v1 -> v2:
> Patch 2/2:
> - Added more comments
> - Fixed missing put_device()
> - Fixed stupid fall through in the error case
>
> Saravana Kannan (2):
>   driver core: Add device_is_dependent() to linux/device.h
>   of: property: Improve cycle detection when one of the devices is never
>     added
>
>  drivers/base/core.c    |  2 +-
>  drivers/of/property.c  | 62 ++++++++++++++++++++++++++++++++++++++----
>  include/linux/device.h |  1 +
>  3 files changed, 58 insertions(+), 7 deletions(-)

With both patches, booting with fw_devlink=on (instead of
deferred_probe_timeout=30) this allows all modules to properly load on
the db845c, and without these patches, we fail to get display.

Tested-by: John Stultz <john.stultz@linaro.org>

thanks
-john
