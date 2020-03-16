Return-Path: <SRS0=Nmyu=5B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50EA0C3F2CE
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 17:00:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 174BF20719
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 17:00:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K7kVjtB+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731785AbgCPRAZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Mar 2020 13:00:25 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40192 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731809AbgCPRAZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Mar 2020 13:00:25 -0400
Received: by mail-pf1-f195.google.com with SMTP id l184so10263313pfl.7
        for <devicetree@vger.kernel.org>; Mon, 16 Mar 2020 10:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YjH5MjgZiWD2AsCPzj7RL36rRlVP+ZNEC4uN51b8qdI=;
        b=K7kVjtB+7y4URjn4G1hvdMzn78WcrIP9Oz7RSUfwUDvU/XnO2byPqav/Is3jiUWUkB
         W86Xg8p06VavshPMBHqPziU3vXTiy7N48VTAL2j/s2lTWb9lq92j1IU/quTDDTv6S2fu
         DEgpMw1cMNqIxgev0hk/hR3tQhU9JDTDTTbyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YjH5MjgZiWD2AsCPzj7RL36rRlVP+ZNEC4uN51b8qdI=;
        b=e4T3gXC/i/29vDVj2jrcPfScPqyLwpN1Roq7cXGjCfaLBnAKlR0tMPXW4KVJd7TTYw
         rTvi0mkZO6kc+0g4NpVzD/ryEFFFqn2TQUNPlmzVAWTE2T/5MLnkDAHngCVYSu3KjKZU
         uXE0Vzt8LZa6oc0dBY2x6fafiQ3wnH5OSBitquigjI5liOyMl0CTqceM4g+TNnGUTbt6
         u07FIRf/yPjUOYIJy5cgnP/CjjT5ZX8FkF0yJQDoc8il3FZdhLWLr7J26CrET40sA9d9
         dmaUaB57N/aKWrf9CwB5+jktex5ys71PbA89/jcfLmmltfZWTZfn04Q2CsC9S4FzOBr/
         HTpg==
X-Gm-Message-State: ANhLgQ2lRNYpFD8/5VJRZvVWqAUy+wQD5JkPozCbcp8McE9V4YJTa6rm
        0E/SLnUyZXQYTV5Mg23aO6/WVg==
X-Google-Smtp-Source: ADFU+vv9s0qOxourNNI2GtsjQWv3rsuzY2mQKW8R2dZ8kWjwvGLWsHZAnNuynD6l0oAx3VizaNsAAA==
X-Received: by 2002:a65:678e:: with SMTP id e14mr669453pgr.299.1584378022722;
        Mon, 16 Mar 2020 10:00:22 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id u126sm407308pfu.182.2020.03.16.10.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2020 10:00:22 -0700 (PDT)
Date:   Mon, 16 Mar 2020 10:00:20 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        robdclark@gmail.com, seanpaul@chromium.org, sean@poorly.run
Subject: Re: [PATCH v7 2/2] drm/panel: add support for rm69299 visionox panel
 driver
Message-ID: <20200316170020.GO144492@google.com>
References: <20200316041647.27953-1-harigovi@codeaurora.org>
 <20200316041647.27953-3-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200316041647.27953-3-harigovi@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Mar 16, 2020 at 09:46:47AM +0530, Harigovindan P wrote:
> Add support for Visionox panel driver.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
