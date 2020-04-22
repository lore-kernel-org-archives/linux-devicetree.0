Return-Path: <SRS0=0pfk=6G=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8416C55189
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Apr 2020 10:30:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A06252073A
	for <linux-devicetree@archiver.kernel.org>; Wed, 22 Apr 2020 10:30:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l/AgPPBV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731031AbgDVK36 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 22 Apr 2020 06:29:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730767AbgDVK0q (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 22 Apr 2020 06:26:46 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C629C03C1A8
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2020 03:26:45 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id d184so846517pfd.4
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2020 03:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=+LkW/BzJ32FsN2pGJCrXVy4OKBpG4PL3ExgFBZeWAHg=;
        b=l/AgPPBVB7ZnyY6U66gMOrbJvBgO3tQRcVjGDqLNEBuZMo0KRrdys14l5NrYS2uqIb
         TBmsxmEicXKLeUCGAnLzeuOJkVu5w8L8TZgR4gHKWn/0MJHFk+9T3pv9vi2QHq6g8oNa
         D1iZtgy8CyjNCJQqw0mjxle4ztTML67IsaPgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=+LkW/BzJ32FsN2pGJCrXVy4OKBpG4PL3ExgFBZeWAHg=;
        b=ZO1bfhAqZ8oStMgbtPBqtegimj5h3XZ/WJvalCG/hqTrZOQNm+CCWHMIPUd+VSXzFS
         OGC/GcE2YiCGB7+SmJ34RwWIBsQLx/f1ZlFVcVZSJvoBqBOoubWr5MTPSZ6GT5xYtppA
         9J3EkJzprbANQeY8HJPAFypg5BnDH/nTNTDX6vjm5iSWVP+uuNbpG/5g++DDiDtobvRh
         7ZLCFa3+VRgWflayp6G74vaFNORRg9rAvxlsF2WtlI9TNW7eZLkfQkfDtL7KoQRSFVhz
         2fROOCUTH3ycvsHDDDOMqOoM14aMsXQPsq0e7yCshNCcNwsr6f3ewqVlp7JPPEXmjY6M
         s6Bw==
X-Gm-Message-State: AGi0PuYWuG4SQeEbFuMqrnSc3yrIGpP+XROwmDEvq/oP13r9+W9gR7JE
        bjRDLv7N++Rqc+fLfyoCGoLxuQ==
X-Google-Smtp-Source: APiQypLib3O6RbgwVKPe4RvKuaAL9L9i2kDZxvwLTOMEd5N7BqAlzniwrFclGQhmjQRCmw7yE1+ZTQ==
X-Received: by 2002:aa7:96e8:: with SMTP id i8mr26630487pfq.222.1587551204530;
        Wed, 22 Apr 2020 03:26:44 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id i6sm5080712pfg.138.2020.04.22.03.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 03:26:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200420220458.v2.5.I72892d485088e57378a4748c86bc0f6c2494d807@changeid>
References: <20200421050622.8113-1-dianders@chromium.org> <20200420220458.v2.5.I72892d485088e57378a4748c86bc0f6c2494d807@changeid>
Subject: Re: [PATCH v2 5/6] dt-bindings: drm/bridge: ti-sn65dsi86: Document no-hpd
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     jonas@kwiboo.se, jeffrey.l.hugo@gmail.com,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        jernej.skrabec@siol.net, bjorn.andersson@linaro.org,
        robdclark@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>,
        Laurent.pinchart@ideasonboard.com, a.hajda@samsung.com,
        airlied@linux.ie, bgolaszewski@baylibre.com, daniel@ffwll.ch,
        linus.walleij@linaro.org, narmstrong@baylibre.com,
        robh+dt@kernel.org, spanda@codeaurora.org
Date:   Wed, 22 Apr 2020 03:26:43 -0700
Message-ID: <158755120316.159702.16847202705854698366@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Quoting Douglas Anderson (2020-04-20 22:06:21)
> The ti-sn65dsi86 MIPI DSI to eDP bridge chip has a dedicated hardware
> HPD (Hot Plug Detect) pin on it, but it's mostly useless for eDP
> because of excessive debouncing in hardware.  Specifically there is no
> way to disable the debouncing and for eDP debouncing hurts you because
> HPD is just used for knowing when the panel is ready, not for
> detecting physical plug events.
>=20
> Currently the driver in Linux just assumes that nobody has HPD hooked
> up.  It relies on folks setting the "no-hpd" property in the panel
> node to specify that HPD isn't hooked up and then the panel driver
> using this to add some worst case delays when turning on the panel.
>=20
> Apparently it's also useful to specify "no-hpd" in the bridge node so
> that the bridge driver can make sure it's doing the right thing
> without peeking into the panel [1].  This would be used if anyone ever
> found it useful implement support for the HW HPD pin on the bridge.

useful to implement?

> Let's add this property to the bindings.
>=20
> NOTES:
> - This is somewhat of a backward-incompatible change.  All current
>   known users of ti-sn65dsi86 didn't have "no-hpd" specified in the
>   bridge node yet none of them had HPD hooked up.  This worked because
>   the current Linux driver just assumed that HPD was never hooked up.
>   We could make it less incompatible by saying that for this bridge
>   it's assumed HPD isn't hooked up _unless_ a property is defined, but
>   "no-hpd" is much more standard and it's unlikely to matter unless
>   someone quickly goes and implements HPD in the driver.
> - It is sensible to specify "no-hpd" at the bridge chip level and
>   specify "hpd-gpios" at the panel level.  That would mean HPD is
>   hooked up to some other GPIO in the system, just not the hardware
>   HPD pin on the bridge chip.
>=20
> [1] https://lore.kernel.org/r/20200417180819.GE5861@pendragon.ideasonboar=
d.com
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
