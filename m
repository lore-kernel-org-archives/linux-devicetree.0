Return-Path: <SRS0=c2W6=4V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA7D2C3F2D1
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Mar 2020 23:06:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 891B020870
	for <linux-devicetree@archiver.kernel.org>; Wed,  4 Mar 2020 23:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583363160;
	bh=dfCcZHgPaCMCJ/YUMYmqXiVaKbkXt61HvghsblFt2E0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=qYVpSH9xWlmxPep35IeyxqcWqKDAeyqijAB21GRWQxlbFaa/YTcKsxIiexnGwpZNt
	 J+R6CxgP4bgAFqHjID3fDG/uMgLZSikTRQDjFjOGppmtx7tf73zIYyB++q8eGptxho
	 9v9dJErKqpIDskoUQOLn3vioPAc5BXpxdduNxxCA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388400AbgCDXGA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 4 Mar 2020 18:06:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:54298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388389AbgCDXF7 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 4 Mar 2020 18:05:59 -0500
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5DDD22146E
        for <devicetree@vger.kernel.org>; Wed,  4 Mar 2020 23:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583363159;
        bh=dfCcZHgPaCMCJ/YUMYmqXiVaKbkXt61HvghsblFt2E0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pmH3tjsLahRaUae8E6YtTjm73zcT0vSYNjy3DuLVyYVeyqVqRfpvEhAM8/d9eKBer
         EstS2y1s88xOTeGj9Umq5Z3zTkkiLKg/MGEJqLL0OcPYde73E4KauIFLeubujUl4io
         tasUfzOjF0NcqjcXXiRwbH6EvncRDBM47c+WCEqc=
Received: by mail-qv1-f41.google.com with SMTP id fc12so1606510qvb.6
        for <devicetree@vger.kernel.org>; Wed, 04 Mar 2020 15:05:59 -0800 (PST)
X-Gm-Message-State: ANhLgQ0RuQjbYyRiLYXs0T69qPiBXCcETkz4vgkxzG2kUlHIOiGuSJlD
        5xyItQjD18L6QrXwtgyUZpt06llFPUsOwFeR4g==
X-Google-Smtp-Source: ADFU+vv3NO4m/Cu7MqQyFYfdopkkis72q5h5MH3355QWLYSCuUDdBiH7zLSmD50JGYjOMyah1dUdTCwt/GFyp8XW+oo=
X-Received: by 2002:a0c:e406:: with SMTP id o6mr3852327qvl.136.1583363158443;
 Wed, 04 Mar 2020 15:05:58 -0800 (PST)
MIME-Version: 1.0
References: <CAHLCerPCyYMmUttfz5mPrJiu3ApzoijTERLYjdZYau=EFVNDPw@mail.gmail.com>
In-Reply-To: <CAHLCerPCyYMmUttfz5mPrJiu3ApzoijTERLYjdZYau=EFVNDPw@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 4 Mar 2020 17:05:46 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ47Cm=XCaW2DXMtqcdm4+sdErpQsqgqb2jJyzEgmywuQ@mail.gmail.com>
Message-ID: <CAL_JsqJ47Cm=XCaW2DXMtqcdm4+sdErpQsqgqb2jJyzEgmywuQ@mail.gmail.com>
Subject: Re: Permission to relicense thermal bindings to GPL-v2 + BSD-2-Clause
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Mathieu Malaterre <malat@debian.org>,
        Caesar Wang <wxt@rock-chips.com>,
        Punit Agrawal <punit.agrawal@arm.com>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Mar 4, 2020 at 3:24 PM Amit Kucheria <amit.kucheria@linaro.org> wrote:
>
> Hi,
>
> Everyone on CC has contributed to the thermal bindings[1] in the
> kernel. They are currently licensed under GPLv2 but we'd like to
> relicense them as GPLv2 and BSD-2-Clause.
>
> If you agree, could you please send your ack to relicense the binding
> as GPLv2 + BSD-2-Clause. I will then add the BSD-2-Clause license to
> the yaml bindings sent to the list.[2]
>
> Regards,
> Amit
>
> [1] git log --no-merges
> Documentation/devicetree/bindings/thermal/thermal.txt | grep Author |
> uniq
> Author: Amit Kucheria <amit.kucheria@linaro.org>
> Author: Viresh Kumar <viresh.kumar@linaro.org>
> Author: Rob Herring <robh@kernel.org>
> Author: Mathieu Malaterre <malat@debian.org>
> Author: Caesar Wang <wxt@rock-chips.com>
> Author: Punit Agrawal <punit.agrawal@arm.com>
> Author: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Author: Eduardo Valentin <eduardo.valentin@ti.com>

Generally, the copyright is owned by the companies. I've already
gotten okays on any bindings from Linaro and Arm. Looks like it is
mainly Eduardo/TI that needs to agree. The remainder look to be
trivial changes.
