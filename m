Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4FECC33CA1
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 23:22:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 810982072C
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 23:22:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sSm9hD3q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbgAFXV7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 18:21:59 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35219 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbgAFXV7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 18:21:59 -0500
Received: by mail-lf1-f68.google.com with SMTP id 15so37535959lfr.2
        for <devicetree@vger.kernel.org>; Mon, 06 Jan 2020 15:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q9R5SEqk2RoVPGepo5eJYJ7/siY1dXTcAAns3GhcGVQ=;
        b=sSm9hD3qn1idlUngR9PmqFvVyQGsUEJNg330Oqc++mHytoNqHENjqV1D2Lzd/Dc9n9
         1kuq1LbiQDJ599KZDnQUitiLKphm6TL1rgNH84K9nVPWOyQHSMBfNW9K1P+1/6YhXli1
         p8hVsTK/I12hW+IgKfiXAaj7M61eWYJDnB5gJesbKLSZOAqeIMm/hne5jEUMtae/QErZ
         0QdmbGPsBE/Vg822ItQ08dREH8m/OujqwmNz09/wyiU8G4XJkFxW9Q1Krpl681Tb4o/C
         FDzC7dPiIuM/jmosglsxzHARgZrz4vcL8iHvXEBngRt5OZsFkqqk3NWHmDIw93dc3zal
         2K2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q9R5SEqk2RoVPGepo5eJYJ7/siY1dXTcAAns3GhcGVQ=;
        b=qbqaaeZh51i7wQp89G7AY2iYXCA3oSRwm+s44c/ReIxZXm+JjlxTixT3/VJ2Xhd3iT
         dv4DQQ+cbQKxQVcagXNoJrivuAt7lOyvo9ktUjPtgDoh0NOwdskN/hOEdIx8PdC7+meS
         4FiW7e9Hl0IoohDGUKfW18uaPRPWm4l9n2ZXPgiXG4bTH4Oq4MqaPtgMDWoQb60QnWx3
         ecbRHkiRYwJ3r5JBMSFtwzd8ETyXJ4lGYZ6//MMZ0mk09QSTlbPTJCl6dQyK7OxHYjU/
         Jz5831UgzZvZyW009zxSGlzViw4sH5GMZZ5Yb6olxESb2DokFsL7UP/CB0jUip8Ptn/0
         jVXw==
X-Gm-Message-State: APjAAAU90m/Dmh5CgtQdSUMYQTenjed1rBbgEMEjxUdKdK0Zrxf8EvON
        J0E/SH8VBcs3QO6PkaKpLtZ9Dw29i4z3NObd4T+iyA==
X-Google-Smtp-Source: APXvYqwoQAUkjQTsYoTFkqOnBlmMjpIRMA39LMGXRMH2D2HpRAwvznYtNOJozI8Qe4FpKNBY4J96Oe1eX0Er0+Qxwy4=
X-Received: by 2002:ac2:55a8:: with SMTP id y8mr57292729lfg.117.1578352916846;
 Mon, 06 Jan 2020 15:21:56 -0800 (PST)
MIME-Version: 1.0
References: <20191218062024.25475-1-rahul.tanwar@linux.intel.com>
In-Reply-To: <20191218062024.25475-1-rahul.tanwar@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 00:21:46 +0100
Message-ID: <CACRpkdbTAcKitq8SPKU5D+11x_W45+g5Rs8PQ_TutjYVB5NVNQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: intel: Update to use generic bindings
To:     Rahul Tanwar <rahul.tanwar@linux.intel.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        yixin.zhu@linux.intel.com, qi-ming.wu@intel.com,
        cheol.yong.kim@intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Dec 18, 2019 at 7:20 AM Rahul Tanwar
<rahul.tanwar@linux.intel.com> wrote:

> Kernel 5.5 adds generic pin mux & cfg node schema. Update pinctrl bindings
> for LGM to use these newly added schemas. Also, rename filename to match
> the compatible string.
>
> Signed-off-by: Rahul Tanwar <rahul.tanwar@linux.intel.com>

Thanks a lot for fixing this Rahul!

Patch applied.

Yours,
Linus Walleij
