Return-Path: <SRS0=1UAq=6U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A4A0C38A24
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 12:38:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5798206D5
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 May 2020 12:38:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kaEO8qV6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728133AbgEFMiB (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 May 2020 08:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728114AbgEFMiB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 May 2020 08:38:01 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 755B1C0610D5
        for <devicetree@vger.kernel.org>; Wed,  6 May 2020 05:37:59 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id d25so1184715lfi.11
        for <devicetree@vger.kernel.org>; Wed, 06 May 2020 05:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5vIN5MKPLeNGbWiYHgtJvnfkqaDr6sG1XDxpbHqc8lM=;
        b=kaEO8qV6PIFjtYwjIDIahnc/RQhVLTmcERmgJGOXglVl98mzoWY2lV+n22uUQ3sTU9
         oCcsrORlY/Y6EPw6AOdxdX5hS9ObK6ICW5Zc2X4VzbEsQvt+d3sAd06d4Xt9vP8o7oEg
         if+HkIsWMBp4gg383s9tXCLbndzR5RzR9/v/XEau0KqBATsQeodpC6OyXd2Fy7ZXdai/
         nY7FWkCB9mFTaKZX4MnTXzjyO++yl6X/9Rf4f69mnXz+wf1X5QyL27JvrRjNYJ5ZZVc3
         JOS/p3dYNhGBT6XWiogysHwo3eovKnA1xBe9i2RMBn6oMTaCUS3UByCH4WZIkA3jIhyt
         8fPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5vIN5MKPLeNGbWiYHgtJvnfkqaDr6sG1XDxpbHqc8lM=;
        b=YxhIWEF6a0PjK+CiNsOlUxxEJWVN+0ODB/ogTcq4YvMgURS1ZyM5c0Jdw5Cv/dsqNT
         mcnlYVRTV3Wdveog6WlrmbrQPd7IkoKiirkxSxjAT4ZSb0kTnsZ95OzF7uzAMqzTl0hv
         lQdQP+Y5aUhYAQqDLKPWWz3SFx/MxYMeMrYTVLjT3FHC52amWhEH6TeOnZ52cG9JJOtJ
         UjHF6c5ENBljkuXciESJ/XkMhLlVDa9ldaTdca6C1mezPP6SyM3Wtefk+6j2nvmN+xPq
         skrMNeZaKyvxlrpttw1ayQi42cgQWc6O4AEDSn7FL+SuVhcwXfxxOzAQ+XY5KboarCeg
         G2tw==
X-Gm-Message-State: AGi0PuZztkDHdqIRssOwW0kbxDKiax2FXIOBZp78Sk6DJC3pportc1Rq
        QzQ43LAGDfPCNMPQHcay5bANkqDOfZKcvK1GBeg3cw==
X-Google-Smtp-Source: APiQypIscBufxrzX8o55c1IMYLoTuOUYZIw8WZNx/RqZ9X8rS3BVqal75ivPG1WUGd3PnEmeKRrga5Mx5j8aXZYQyZ4=
X-Received: by 2002:ac2:414c:: with SMTP id c12mr4967725lfi.47.1588768677564;
 Wed, 06 May 2020 05:37:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200503172206.13782-1-xc-racer2@live.ca> <BN6PR04MB0660ABCDFF774833264D39A6A3A90@BN6PR04MB0660.namprd04.prod.outlook.com>
In-Reply-To: <BN6PR04MB0660ABCDFF774833264D39A6A3A90@BN6PR04MB0660.namprd04.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 6 May 2020 14:37:45 +0200
Message-ID: <CACRpkdanfaPRwm6vCGTDStxvZj38k8OTL5BviTmyTJcx0KtARQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] iio: accel: bma180: Prepare for different reset values
To:     Jonathan Bakker <xc-racer2@live.ca>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald <pmeerw@pmeerw.net>,
        Rob Herring <robh+dt@kernel.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux Input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, May 3, 2020 at 7:22 PM Jonathan Bakker <xc-racer2@live.ca> wrote:

> Some variants of the bma180 (eg bma023) have different reset
> values.  In preparation for adding support for them, factor
> out the reset value into the chip specific data.
>
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
