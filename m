Return-Path: <SRS0=uNWD=7Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13ED1C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 17:16:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8C7C207F7
	for <linux-devicetree@archiver.kernel.org>; Fri, 12 Jun 2020 17:16:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WGBkayOQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgFLRQM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 12 Jun 2020 13:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbgFLRQL (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 12 Jun 2020 13:16:11 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DB64C03E96F
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2020 10:16:11 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id u5so4417080pgn.5
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2020 10:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=n/DVn370QK3JABveYtPvNqNj172JCYhZAS0aJ6zLWus=;
        b=WGBkayOQncqJWL1pDNSbpqpAEpYTm2lZZvE7RitUTK0s6D+ZleVTwP1Bz/70oWaMwH
         xd3bmuGEFILryOpWCyvdEcq0GOU7OeRSx/E9EqEms+tDKccxbR1k2aBJTrt38WRB/rAr
         uvcRVyY9xK4ldNcnC15gPh9Ovu+VeyfYIR3is=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=n/DVn370QK3JABveYtPvNqNj172JCYhZAS0aJ6zLWus=;
        b=G25CTtqroQEHcjBCZItT0qmUe2j636qICE2wtOcK/2avfGmGhG4lrU8+YQtiON/nam
         2CSsOtcD5zTWjEz4yXSyDdb6lGGAMM430MQ0rVeS2iyX426Yu52ySLWX/LkCSz5thhhL
         DIS/KZlaFAyZOqbagDOVoAI7fnySCrDBMqPvZ9l+CDw1fkpH/+NsYkwEAXmHaYZrS2uz
         Cyy9o5hyyxmERUkiYcX46i8TCemuzprXxbLgUeN2RtLfNqQLx0yGt/Qoq3m833t8dcjm
         aziAwcXAtyw60GY0RJ8IdifpTuj/Tw+TZ14i6FF49RQjcO4G3AOerKVPqMbKUpqOBAJx
         FZWg==
X-Gm-Message-State: AOAM531hLfwITVfVcRBemeWp4/Q2lQGeN7PJ9Aur7tK2Gx20JL3FquiC
        pZqKb23N4YIIk26bGwzQZIi8eQ==
X-Google-Smtp-Source: ABdhPJwE4ZR/5sUg0dBEEXbja2LUrZcrZoRctskyF3/CKvnB+1Ro3otf9lIPw5f35/N2RJ6tvvqKVQ==
X-Received: by 2002:a62:7695:: with SMTP id r143mr12733091pfc.31.1591982170707;
        Fri, 12 Jun 2020 10:16:10 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:476b:691:abc3:38db])
        by smtp.gmail.com with ESMTPSA id q6sm6668968pff.79.2020.06.12.10.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 10:16:09 -0700 (PDT)
Date:   Fri, 12 Jun 2020 10:16:09 -0700
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, robh+dt@kernel.org
Cc:     heikki.krogerus@linux.intel.com,
        Benson Leung <bleung@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: chrome: Add cros-ec-typec mux props
Message-ID: <20200612171609.GA255826@google.com>
References: <20200519214604.180036-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519214604.180036-1-pmalani@chromium.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

From the discussion in [1], it looks like reconciling ACPI and DT
bindings for these properties to be identical is challenging.

Let's drop this patch, and move forward with the Patch 2/2 in this
series [2] alone.

We'll continue the discussion about how we can add these properties to
devicetree bindings in a conformant way.

Thanks everyone,

-Prashant,

[1]:
https://lore.kernel.org/lkml/CAL_Jsq+ORkzHchpD0qsH97zDJzXGj3jWy8=orXSVhNQd4kr9Kg@mail.gmail.com/T/#t
[2]: https://lkml.org/lkml/2020/5/19/1219

(Trimming text);
On Tue, May 19, 2020 at 02:46:02PM -0700, Prashant Malani wrote:
> Add properties for mode, orientation and USB data role switches for
> Type C connectors. When available, these will allow the Type C connector
> class port driver to configure the various switches according to USB PD
> information (like orientation, alt mode etc.) provided by the Chrome OS
> EC controller.
> 
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> Acked-by: Benson Leung <bleung@chromium.org>
> ---
> 
> Changes in v3:
> - Fixed Acked-by tag typo.
> 
> Changes in v2:
> - Added more text to the switch descriptions, explaining their purpose,
>   and relation to the Type C connector class framework.
> 
>  .../bindings/chrome/google,cros-ec-typec.yaml | 40 ++++++++++++++++++-
>  1 file changed, 39 insertions(+), 1 deletion(-)
> 
