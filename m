Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9964DC00523
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 09:58:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6A1A92070E
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 09:58:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LGhwTuIZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbgAHJ6c (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 04:58:32 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:37450 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727039AbgAHJ6c (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 04:58:32 -0500
Received: by mail-io1-f65.google.com with SMTP id k24so2558198ioc.4
        for <devicetree@vger.kernel.org>; Wed, 08 Jan 2020 01:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QAtR7WNLGbja1kZFYbC1LM6r/2gOOz73oNIxwZf1sK8=;
        b=LGhwTuIZMsvckUaUhJ+tDGp6Y0jn0LYn/xbxleZUSDMkTwotTTy+1Fg5ZHuiCgbnuW
         ABixaa78LQAMQqSXxlOdTlfDx+n2+WrJQM9cCO+dERP4pTnItxTE5IlWAuVhshqD5D0f
         0ZiCF95TJ+fR3w2e37nT74ePbWYE2y6TFcorU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QAtR7WNLGbja1kZFYbC1LM6r/2gOOz73oNIxwZf1sK8=;
        b=kranYCtSntcEaa4Z60OSGtmcRF198CoZmlozPNXsZVvnpMDOeSXxnPeCH+tTh51SLD
         CiWfotlwpyO3Amhahb1IZcGH3uAfajLIhKierawrj3CapfHVqpnO9pynFovkSjleXQNZ
         nS7fXt1+83MFAsRUbArbbBIl/GEQh9v8G3jAjVN5EvywlZrUQIShne27gY2ctJDrfQfd
         BmqPg77bV3adtBOJ0f5NNMiifOIkKAIEVznsi/gaIDUsjzEPJE0i17vH8bAwo4N5F9FU
         wWE+XxsMMkpvwfTl5oVQZtCY30HiNdXN9o5f8dkjFy1SRgvAgpVXNBO4UFm72XhjQOOX
         AZ5A==
X-Gm-Message-State: APjAAAVeKsNDwg7V+lONk1kWoSEwXcYSvCxeI/Uk+8CvQz/grLidZ9Ub
        ro/L+5+5etMAwkBY9UDb5bPqvfQHSJxWGQmLgRFAhw==
X-Google-Smtp-Source: APXvYqwH5rufYzM9JfRPQjj7bRhJ6sm9RgJQyx7qvhgpJjalHtt1/UbVPcBLfTvCu23laYbDf4TKavfcetdwMpGEoRY=
X-Received: by 2002:a6b:3845:: with SMTP id f66mr2819729ioa.102.1578477511547;
 Wed, 08 Jan 2020 01:58:31 -0800 (PST)
MIME-Version: 1.0
References: <20200103064407.19861-1-michael.kao@mediatek.com> <20200103064407.19861-7-michael.kao@mediatek.com>
In-Reply-To: <20200103064407.19861-7-michael.kao@mediatek.com>
From:   Hsin-Yi Wang <hsinyi@chromium.org>
Date:   Wed, 8 Jan 2020 17:58:05 +0800
Message-ID: <CAJMQK-hQ5BWp7isGDTz_Y4ttxfoM0guqfcAEFrh3Eq7SMcNM5w@mail.gmail.com>
Subject: Re: [PATCH v3,6/8] thermal: mediatek: mt8183: fix bank number settings
To:     Michael Kao <michael.kao@mediatek.com>
Cc:     Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-pm@vger.kernel.org, srv_heupstream@mediatek.com,
        Devicetree List <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Jan 3, 2020 at 2:44 PM Michael Kao <michael.kao@mediatek.com> wrote:
>
> MT8183_NUM_ZONES should be set to 1
> because MT8183 doesn't have multiple banks.
>
> Fixes: a4ffe6b52d27 ("thermal: mediatek: add support for MT8183")
> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> ---
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
