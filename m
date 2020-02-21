Return-Path: <SRS0=98KY=4J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE16C35657
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 13:49:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2D0AC208C4
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 13:49:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YG2Me4Pv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727470AbgBUNtf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Feb 2020 08:49:35 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41848 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727161AbgBUNte (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 21 Feb 2020 08:49:34 -0500
Received: by mail-lf1-f68.google.com with SMTP id m30so1527972lfp.8
        for <devicetree@vger.kernel.org>; Fri, 21 Feb 2020 05:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PyeTvkkAnCUH4kZEoAfj76XyH5K0PchtC9IwnXWSMfs=;
        b=YG2Me4PvMR7Nd4Rf3b4HuL0McVpAs2ooY3qUvclfGG6VO4MC/BBM0kQvM5dScEvBXr
         vLeI2IDKOaJ8uWbNrA6AcwrvTaDzjGvV/AJVCyf2NW98WsAGjXW5Z38taX4+3FP6BWDa
         ZhPxOuFJMqcsj8NFTN7q6izUJ5i3ydx3J1wyHqXRdMY8bOeh5SqZkJL/Sxl1xWoC5j60
         3TkvEeBUfubdnzFGAgOzJfMLzr9rS7PmQle/hlnsWoYThcmwnlzsk63lYUJDi5RR+bzr
         ulT/1tSnlezUrU0rBX6AwR70JEzyLctsHwyss5YrYaMNZ7c/lTVw9PYduwyD04b54Pq5
         sbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PyeTvkkAnCUH4kZEoAfj76XyH5K0PchtC9IwnXWSMfs=;
        b=O3BFX2zWKL5xCY9j/KP7tF+W5pXJgMTaFjf7lt0/jzG0bt8C2Gyd5SdGjJm08IN+Jq
         sAYZ2Bqc9LiiwivnQdrIlzpqXOs4v3YVqCgskaDAHHIp+eCBo3NzI9t+dGhIej9lmwsc
         LQm02IWF4GI1i42SfgrohVcgE4uOtje0nLT2+Rd1E/w3328IKPU2iEDdktGnk1DUacr6
         LfQTLYfTtJ1Y9wnoSYJuLrlXs89BPAT9eOdgNUUQ8jvMZG72Byrv6f5JA69xTL+yPcYZ
         tWGs09iZEhfzHuOtHbfI97/8uK6C6p44oATUCOaL/1bUJq6Io5sRv9iJWTnxdf0nARmm
         l/6g==
X-Gm-Message-State: APjAAAWmOY40CffHetO8FkkUxnfE38TYY+IQNXuuFqQSOwjgPe+R0Cti
        0n3NQJQmB+1vP/5DOQxB1AKgw2iO2N4eEpbnsP40EQ==
X-Google-Smtp-Source: APXvYqyD6Dr4b4HePic8xdZLes9fbr6+6iEYjYET6yQoleUZB8SKOT+AsIr4ANsP3MzU8OsOa8AganE0j95rngWdD5Q=
X-Received: by 2002:a19:5e1d:: with SMTP id s29mr20061128lfb.21.1582292972470;
 Fri, 21 Feb 2020 05:49:32 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581597365.git.matti.vaittinen@fi.rohmeurope.com> <1d333e88974571322c14cf3e881b9a854e94bd9d.1581597365.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <1d333e88974571322c14cf3e881b9a854e94bd9d.1581597365.git.matti.vaittinen@fi.rohmeurope.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Feb 2020 14:49:21 +0100
Message-ID: <CACRpkdY1oa859bkVrgwA4iai7982GL_EMxns5+wAhQr+ggf9Kw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/5] power: Add linear_range helper
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        mikko.mutanen@fi.rohmeurope.com, markus.laine@fi.rohmeurope.com,
        Mark Brown <broonie@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux PM list <linux-pm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Feb 14, 2020 at 8:37 AM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:

> Many devices have control registers which control some measurable
> property. Often a register contains control field so that change in
> this field causes linear change in the controlled property. It is not
> a rare case that user wants to give 'meaningfull' control values and
> driver needs to convert them to register field values. Even more
> often user wants to 'see' the currently set value - again in
> meaningfull units - and driver needs to convert the values it reads
> from register to these meaningfull units.

Rename meaningfull -> meaningful

> This ideas is stol... borrowed from regulator framework's
> regulator_linear_ranges handling.

Hehe maybe one day we can move the whole thing to lib/
but let's take one step at a time.

> Provide a linear_range helper which can do conversion from user value
> to register value 'selector'.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>
> Where should we put these?

This works.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
