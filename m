Return-Path: <SRS0=lCsO=65=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82903C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 11:47:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D2A020767
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 11:47:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pmMhLVmk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbgEOLrt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 May 2020 07:47:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbgEOLrt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 15 May 2020 07:47:49 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFBEDC05BD0A
        for <devicetree@vger.kernel.org>; Fri, 15 May 2020 04:47:48 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id g1so1898183ljk.7
        for <devicetree@vger.kernel.org>; Fri, 15 May 2020 04:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4IC6ZZPGRIJnMH9sjYkXLAR8FAlAKMWG/aSqy+lxhBM=;
        b=pmMhLVmkms/aEGFPJaqTEzygKog4VD8tObWpypoVdOZbhsrCwDKQrPinYp59/uxTKP
         zGuZIpjD1i7IUJhqX5R9d2MSMtlGGBnsZ4L0qss5FlqTQsBvwr7fiM/XjHcxPmwefTOV
         wqpuata5/4BoezQCy+jOF2t4rF76nrWwDh54RvPkldtR8/qpFhgjObh+Kd1x3RmfD9Jv
         S5ya21CwVF+QqXAeDh9Jh1eldSNXW3IyVKzqNA1iNPn4FF5wO2bipeJAVugQvkQodNf4
         C7tVqIthUY7GKPExScs/DJEG8M8DYUkgz2Y5Cs0ZmmAYBwOv5w/UJQ3XT2ObLbKKHNwD
         da6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4IC6ZZPGRIJnMH9sjYkXLAR8FAlAKMWG/aSqy+lxhBM=;
        b=MjJ8OH1oG/Q9dp4DZKiV4GM9EjxoWPtdsTnT0zdy6lqd2jyhmO9LkCC9jPrP0Py7N1
         vZLbQcINe4WMM1HSCaB5JB2h8G7NVK4rfObebsU8G5UGt9M78vZ1KQDpxSMk7b2AkZPS
         Nl0IKKJsP88mjAJZFNUUFHa5v54n1SmAYD3wS+z7J2SOxt8DX4dGiLrnvAG5NOnb4T6Q
         NoQw/nkC5ZODzbGTmTQsPIs/8bYTbJbmMz2gj+Y8Fd7Oa07BVbJ1SlSS4SMUSdCg8Olv
         2bpNfEYFTWpD+8rKhScYhE6h0qAWp92k98UXrCekf7tLHVr1gdpWLe5rZ5u1uJr1+ceT
         bGog==
X-Gm-Message-State: AOAM531d/ZEg7+7qtIfmUTLpaBeVYrkLFq3PW3sox+uvB0V1lQmFoWL5
        0IJTpKR7LGPpsyvh6UmSs4kuyEP+b5gj4mUI1C5h8Q==
X-Google-Smtp-Source: ABdhPJxlcrIIyOso2g7s236yDsj3eCaQNX1y1jEmp8ycfcvQ+aR7VvmzOgIaBmXDgANWhN0eJ6z38fiT668MMvwWeHc=
X-Received: by 2002:a2e:9d5:: with SMTP id 204mr1116745ljj.168.1589543267270;
 Fri, 15 May 2020 04:47:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200514204901.3199-1-xc-racer2@live.ca> <BN6PR04MB06603F08B010828F7CBFB610A3BC0@BN6PR04MB0660.namprd04.prod.outlook.com>
In-Reply-To: <BN6PR04MB06603F08B010828F7CBFB610A3BC0@BN6PR04MB0660.namprd04.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 15 May 2020 13:47:36 +0200
Message-ID: <CACRpkdZPpF=Zi-tvDGVDoh4beNTC+LEm6QROd1-CFZXjQ1D0zQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] iio: accel: bma180: Rename center_temp to temp_offset
To:     Jonathan Bakker <xc-racer2@live.ca>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald <pmeerw@pmeerw.net>,
        Rob Herring <robh+dt@kernel.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-iio <linux-iio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, May 14, 2020 at 10:49 PM Jonathan Bakker <xc-racer2@live.ca> wrote:

> The bma180 driver is being extended to support the bma150.
> Its temperature channel is unsigned so the center_temp naming
> no longer makes.
>
> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
