Return-Path: <SRS0=7YFh=7B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1510C433DF
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 23:07:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81C3020578
	for <linux-devicetree@archiver.kernel.org>; Tue, 19 May 2020 23:07:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZVcNchBu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726344AbgESXHq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 May 2020 19:07:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbgESXHp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 May 2020 19:07:45 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B46C061A0F
        for <devicetree@vger.kernel.org>; Tue, 19 May 2020 16:07:44 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id m185so975607wme.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2020 16:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=gtjA7rUrWvV/zWcpmtzFkkNrqaPYsU7iu5jd2njww+Y=;
        b=ZVcNchBuWC7ldH8aoRdu2LHqvs149CFaBuKaCLDqmTfS+32DVhNFKXNF/ycPayjar8
         nEnMHUME+wzXCQplMaJsIjuEG11AZRdohuMcjo8ekJRwQn8aXmJ8Fs0ZkswTqlTtZrlU
         Rr+G4dwVnuZ9jvZqlkuZZiaBTPNhEolichzmqEd3r0YJmP5sE65ximX0bXJbh+CRfqbe
         hdD9RoQ1cKMeLScbPTh8FURrNlGbbYYJdbQY7iqMmQAq3W5Dp+7sVz2wC8IZ6OBIeL56
         McRCVSE6W0h2PgjhGdDYvZsZblH939zKdMI+QnPC7SbMnUmupj+ARduQpYrz/DXMNI5n
         ZSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=gtjA7rUrWvV/zWcpmtzFkkNrqaPYsU7iu5jd2njww+Y=;
        b=O/15O/BLKitniRakmoVd/VRkaDbIjCcOhjbNc4qYXIEywbkqyfGSQEpSEfNKO7IM06
         /s81LzaElOmoPE3lvT3I137j1Mm6jxI27GGdgbdSLA6gkhyZ3dN2r+dvAwC8yRUBFxz+
         u4xY40YN0a7IXMJ1dOVMGq/I/n0WlbN6x8829MMuei4VRexRNR2kO/jfboc1EwXCqVA8
         lFpSRFITohPz+oHBxR9rc4/SRAtfteXV84qc+vBHTZ5h6WNiMPATXXwSPig6YAHfTCg/
         jMBajqfNRxPDEiv5I1bQn+EbjvyOr9k59rVse0jxMKqBVjT2Fvy2c2F4kL5n8D/P/ToC
         GHdQ==
X-Gm-Message-State: AOAM5305DOfm/ftYJoz6fw2UivCplYvVql3372siH1e1wCA3dZOoTkU+
        CHkZkkjNWjVpwZyADqWLwUhWig==
X-Google-Smtp-Source: ABdhPJy6NqRygJRgngTo1yF6jvvyMz1ITIgNjTcTPD+fMJ3UDtjsVqYza5H1OiV60sFHYarrPm7FEA==
X-Received: by 2002:a05:600c:22c9:: with SMTP id 9mr1645458wmg.162.1589929662556;
        Tue, 19 May 2020 16:07:42 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id p10sm968872wrn.10.2020.05.19.16.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 16:07:41 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org
Cc:     robh+dt@kernel.org, narmstrong@baylibre.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v4 0/4] meson-ee-pwrc: support for Meson8/8b/8m2 and GX
In-Reply-To: <20200515204709.1505498-1-martin.blumenstingl@googlemail.com>
References: <20200515204709.1505498-1-martin.blumenstingl@googlemail.com>
Date:   Tue, 19 May 2020 16:07:39 -0700
Message-ID: <7hv9krttfo.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> This series adds support for all "older" SoCs to the meson-ee-pwrc
> driver. I wanted to compare as much as I could between my Meson8b EC-100
> (Endless Mini) and the Le Potato board so I added support for GXBB, GXL
> and GXM as well as for the SoCs that I'm actually working on. I will
> send the ARM64 dts patches once all of this is reviewed and merged.
>
> I successfully tested the Meson8b part on EC-100 where u-boot does not
> initialize the VPU controller. So this the board where I have been
> struggling most.
>
> Kevin, I'm not sure if this can still make it into v5.8. If the
> series as a whole can't make it for some reason then I'd appreciate if
> patches #1 and #2 could end in v5.8 so I can push the .dts patches for
> v5.9.

Queuing for v5.8,

Thanks Martin!

Kevin
