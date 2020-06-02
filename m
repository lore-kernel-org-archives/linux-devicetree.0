Return-Path: <SRS0=mVKz=7P=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05942C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 00:30:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA8082073B
	for <linux-devicetree@archiver.kernel.org>; Tue,  2 Jun 2020 00:30:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M/qPqksw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725804AbgFBAaw (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 1 Jun 2020 20:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbgFBAaw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 1 Jun 2020 20:30:52 -0400
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC4B5C061A0E
        for <devicetree@vger.kernel.org>; Mon,  1 Jun 2020 17:30:51 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id y123so1037532vsb.6
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2020 17:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lqhRyfHZO73MQUhs/Zp+nXZxRgQZUkjcr+cmXrXbt9M=;
        b=M/qPqkswDTql5gLZURjB2misYwhlTWCt6vGvmf0pPgHX1sQ0kYud8H/urR5O3Fd2qx
         uQiopd9+Z6tzHF45NjOHJObxbHM2rftiZjtQtSf/0ebx7rDAxz81SiVJR++rY1SjP3qe
         N/gygBELwUH9Q+fV4LeSdiSQk+ZdV0jg2Xh+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lqhRyfHZO73MQUhs/Zp+nXZxRgQZUkjcr+cmXrXbt9M=;
        b=Dr8Jhsv26UqIewM6o5Ou0hhgnYmIbg0HGM2rw76cYm5IPEGPkq4DFX7f+ffxwFTCC7
         zrhTo37MIJqiXmkCtlnMxu5iczTP7q/80eHvpwSE4CDjWBNTrA5WnSWF6ko4o+nYiBRt
         880KTs/K16NcKx45kUJdXV6+qgiiY5Mjsk/aG7WVFkiybjDh97KilbOnIi+iIaTlvibW
         /9GD83owj8GLa9pitT2OaTgKRMc5k6PRiEMaBZS6+cTvARhjwuWigVbRjG0jqLAuMPcF
         1+zmKmGUxKkha4qSG6DmBAuF4fGi3QI8Zr1HzyFLM/bA/ryzbOXUuw3AyQ74PlEvAsGf
         XQqg==
X-Gm-Message-State: AOAM532wiH3Galuiejqb9apPF1boh94nMJjHyC6QM7GI1RxsEH6wLLv7
        Xv0LgU7o+N+xk9zLwmNnrOL2YUMYxpg=
X-Google-Smtp-Source: ABdhPJzCDVAn9o3gTcutQbMHbleDmGORNrmCUMn3R+c/1FAbR2N1sr1JdtykdxDDvZLGoI2dQhzv7Q==
X-Received: by 2002:a67:f9d6:: with SMTP id c22mr7469932vsq.14.1591057850543;
        Mon, 01 Jun 2020 17:30:50 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id c6sm127364uac.18.2020.06.01.17.30.49
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2020 17:30:49 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id c1so1015046vsc.11
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2020 17:30:49 -0700 (PDT)
X-Received: by 2002:a67:1703:: with SMTP id 3mr16770923vsx.169.1591057849210;
 Mon, 01 Jun 2020 17:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200601083309.712606-1-sam@ravnborg.org> <20200601083309.712606-7-sam@ravnborg.org>
In-Reply-To: <20200601083309.712606-7-sam@ravnborg.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 1 Jun 2020 17:30:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UUiczTNUT6SU5WMV+Vye7p4YhGb+ZSuJ82NW7oSH2yHg@mail.gmail.com>
Message-ID: <CAD=FV=UUiczTNUT6SU5WMV+Vye7p4YhGb+ZSuJ82NW7oSH2yHg@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] drm: panel-simple: add LOGIC Technologies panels
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        =?UTF-8?Q?S=C3=B8ren_Andersen?= <san@skov.dk>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Mon, Jun 1, 2020 at 1:33 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> +static const struct drm_display_mode logictechno_lttd800480070_l6wh_rt_mode = {
> +       .clock = 33000,
> +       .hdisplay = 800,
> +       .hsync_start = 800 + 154,
> +       .hsync_end = 800 + 154 + 3,
> +       .htotal = 800 + 154 + 3 + 43,
> +       .vdisplay = 480,
> +       .vsync_start = 480 + 47,
> +       .vsync_end = 480 + 47 + 3,
> +       .vtotal = 480 + 47 + 3 + 20,
> +       .flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,

This is different than the "typ" mode from the random spreadsheet I
found on the internet:

https://logictechno.com/wp-content/uploads/2016/11/LTTD800480070-L6WH-RT-v1.1.pdf

As per my other comments, I wonder how important "vrefresh" is and if
we should include it.


-Doug
