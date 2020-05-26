Return-Path: <SRS0=q8LW=7I=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B671C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 09:22:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 559B1207CB
	for <linux-devicetree@archiver.kernel.org>; Tue, 26 May 2020 09:22:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MnxWolw9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388456AbgEZJWV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 May 2020 05:22:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388433AbgEZJWU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 26 May 2020 05:22:20 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32EF2C03E97E
        for <devicetree@vger.kernel.org>; Tue, 26 May 2020 02:22:20 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id m18so23602867ljo.5
        for <devicetree@vger.kernel.org>; Tue, 26 May 2020 02:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VakK3K1bdraH2CNaKAl1HsIOSqvOwW4BrMU1GIVbMHI=;
        b=MnxWolw9+48E82BoH0W4h0NGW8qNWn6yMAn4GAyxdbSVePnsGeI36UvX1g9L5RRBi8
         GmM11E2y1xIjISz2igNjVGdMCjBKrM7dGLaLrpPJt/vhSsAhQ32ci4eQ/Joq+sj/zxf+
         ZdBlienAY0XqjGtuVjQqycVSNEJFq7gk7pteYStezGwHhU3RBvGrWZg6O7UAPFBTZra5
         jMQ40HcgtLQwdQekePnYsX3Zhvn/0w52mgrC1lbXvcqldPEHypNpf2kG9KIh8jqLkT1i
         yvd1yL6iKiKNNxyS2HcwW4tOv/FS/YwC/HTfDTNd7pS7xmbG5epLeZYMGoTsofuPO8k6
         5KzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VakK3K1bdraH2CNaKAl1HsIOSqvOwW4BrMU1GIVbMHI=;
        b=fDDW8KUVJ+UVz+cC1W2dYESED/GW9pd9BC/GenL5D3aPRnsEnq2hB3xkfVq3Q1lA9t
         JEvegyT72H7+dnGw0DGYCHMyLAjE8RyB6U8vocpD1kxeqm7NSsnHx3TCbmnl6tDqr6F9
         8tG2M1jhMOLjopQu0VfIswqTDoAM65h3H2t9OIwbuMa3mAExrFl+5R+Z0KLAqiOpR534
         dNfYNElCAIdT/wtHZm7y3nFNmDgr7wZF0yfmmmRjJ1o5adJwedKLA8f/8TOcGTZ1N2AQ
         Flq3znUv51Gu2LQ9m6DWUeuhueNo49xMCKxqAPkuPCG4ZqWdm5Ip9KNz4F8XaYJNFPYx
         //VA==
X-Gm-Message-State: AOAM530LiXMfvCYRr9Z3piv2pgyMWOIKx73MsKTP0xApmSXlckbAvLBO
        iBZ12mPHsxJtT/vYqiVeTaF67eQAIC3ixrBTdOUSdQ==
X-Google-Smtp-Source: ABdhPJw8pZgJaIXNUkLHn6B/J6FuTQ9hom3jWdzfr1ToPBwixrVD38ffTLrjv381+a2u7Q5Qz7hclK+v3FW2m0rQXNA=
X-Received: by 2002:a05:651c:32d:: with SMTP id b13mr146695ljp.283.1590484938670;
 Tue, 26 May 2020 02:22:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200525151117.32540-1-jonathan.albrieux@gmail.com> <20200525151117.32540-4-jonathan.albrieux@gmail.com>
In-Reply-To: <20200525151117.32540-4-jonathan.albrieux@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 May 2020 11:22:07 +0200
Message-ID: <CACRpkdZo4PsC9Y8seMfS33escA6ZVKWwnbW2BCFOKiX2gY8RDw@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] dt-bindings: iio: magnetometer: ak8975: add gpio
 reset support
To:     Jonathan Albrieux <jonathan.albrieux@gmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Hartmut Knaack <knaack.h@gmx.de>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, May 25, 2020 at 5:13 PM Jonathan Albrieux
<jonathan.albrieux@gmail.com> wrote:

> Add reset-gpio support.
>
> Without reset's deassertion during ak8975_power_on(), driver's probe fails
> on ak8975_who_i_am() while checking for device identity for AK09911 chip.
>
> AK09911 has an active low reset gpio to handle register's reset.
> AK09911 datasheet says that, if not used, reset pin should be connected
> to VID. This patch emulates this situation.
>
> Signed-off-by: Jonathan Albrieux <jonathan.albrieux@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
