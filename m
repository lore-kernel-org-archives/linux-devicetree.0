Return-Path: <SRS0=UCWN=6F=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C8B9C54FCC
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Apr 2020 20:00:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23FF7206B8
	for <linux-devicetree@archiver.kernel.org>; Tue, 21 Apr 2020 20:00:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YWDFSsi9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbgDUUAS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 21 Apr 2020 16:00:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbgDUUAS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 21 Apr 2020 16:00:18 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B9FBC0610D5
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2020 13:00:18 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id j7so3703364pgj.13
        for <devicetree@vger.kernel.org>; Tue, 21 Apr 2020 13:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eeH8yF/9tBuR9rIX99kSA4M4GEOU6qH/i5bCQV5HD3o=;
        b=YWDFSsi9ryGa8bDJzYeDNw+vx+TvNzV2BxgbgfORIvrP64vyZ1imeGOhyAgmGNngvm
         eCYaSD73vnaoGoKUeQgCKH+Hr66n7gWLTjfCaUfz+rjOnTy5EdTl9YkbziW6tCDs5Jff
         8eLrKW28QiInsEbBv0ijdwTtski0qBKHoilQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eeH8yF/9tBuR9rIX99kSA4M4GEOU6qH/i5bCQV5HD3o=;
        b=BIL3fjm24pGkGdY6raRmpwpGajwwqUKmnODEFGKaYNdAxiwTC/9411LtRbvzuFcnjp
         teXqBr1qXbj6CjVWW/OnNKeMdlOK6R8oddNsOG2oklTiXt1cetIXjDv30E+nE5jVomEW
         u5I8xkGdvQ8Q0xjZEUNjiJVYkgxKS8X9UbAamrI2Yy9gQ3QDp0ASMgYgEABWrRWkgHPF
         KnS2OuSMwNd5KanA3tApWTLmGIOiB0BoorT77QsytXfizxCtPcMdVtNEU1fIv+Xr8Wp1
         tFCJETW50aXAAgEfv/lk6z+D72BIIe2AKkYK5EYtpdm6UU+Oo8XFtb4aoTYs6Afxo9c/
         /2nw==
X-Gm-Message-State: AGi0PuYHErlNJiIPhHGbygXPZP1kSEDoSHkChXHcLy2Y1ZRA7E9N2CRe
        WTpE8NIKxeRaZtI0dCSOBNjdbA==
X-Google-Smtp-Source: APiQypIRuEpl74OEh/r7qvhYCkgt2cE/s/0bvJj5YQ7FRv0j5NRQrJj0QGCAqQNBlGDnOqKGb1/peQ==
X-Received: by 2002:a63:f14b:: with SMTP id o11mr23894600pgk.429.1587499217639;
        Tue, 21 Apr 2020 13:00:17 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id 20sm2423112pfx.116.2020.04.21.13.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2020 13:00:16 -0700 (PDT)
Date:   Tue, 21 Apr 2020 13:00:15 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        robdclark@gmail.com, seanpaul@chromium.org, sean@poorly.run
Subject: Re: [PATCH v11 1/2] drm/panel: add support for rm69299 visionox
 panel driver
Message-ID: <20200421200015.GH199755@google.com>
References: <20200421045508.21137-1-harigovi@codeaurora.org>
 <20200421045508.21137-2-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200421045508.21137-2-harigovi@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Tue, Apr 21, 2020 at 10:25:07AM +0530, Harigovindan P wrote:
> Add support for Visionox panel driver.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>

Please keep tags from previous versions (like my Reviewed-by from v7)
when making minimal changes.

Also there is no need to keep sending the bindings patch, it already
landed in drm-misc.

> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> new file mode 100644
> index 000000000000..3ef4cc80044a
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c

...

> +MODULE_DESCRIPTION("Visionox RM69299 DSI Panel Driver");
> -- 
> 2.25.1

The last two lines break the patch:

git am /tmp/v11-1-2-drm-panel-add-support-for-rm69299-visionox-panel-driver.patch
Applying: drm/panel: add support for rm69299 visionox panel driver
error: corrupt patch at line 379
Patch failed at 0001 drm/panel: add support for rm69299 visionox panel driver

Besides the broken format:

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
