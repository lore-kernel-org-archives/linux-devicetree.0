Return-Path: <SRS0=V00+=YS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C6A4CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 19:57:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 35EB721D71
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 19:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572033434;
	bh=R+nIYD3X28Blea4UEeB3eh217QGo3wJ+lGot5D8N5pQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=J26pygUkIg0EyKX3MNFscL0NSb7SjKmfrt3570Yhzh2t6lyrISY6ZvAj0tOyvisZ5
	 xP8EjW+cJ9tbce1IieqE9GuK7QyyLYWuO1EeqfQhH/9z6XsJDTl4tilPyKUR4AYTd+
	 5eY4OsWDVAmy5rZtnhPxB04OrL5CfeAlvoRFAXCk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726434AbfJYT5N (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 25 Oct 2019 15:57:13 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38683 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbfJYT5N (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 25 Oct 2019 15:57:13 -0400
Received: by mail-ot1-f68.google.com with SMTP id e11so2871471otl.5
        for <devicetree@vger.kernel.org>; Fri, 25 Oct 2019 12:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vR6JfARNLEdQedVXU6cdnKK1oArUYjwjaYiXjYaoHc0=;
        b=fGs9VZ7RGFehitpCqAvRgx4MmHpWuj7QOGRXMnqAth03F8Q5+XyoTStQy7beeeq8Yi
         IFza3SWCHRKoopeuGPHmmjIFLFTfL+XDdiwTmG0IoqaPodcNHjZ4PgPUKaEiJHGfjaKx
         kN4a4rHC4UYTkY0nLUajdlzt6W0aPWeiu7BzHVqu3MTY+YkLC88a01kq9xcYJy5hUeLf
         AGCpw2moy4QLcaLEmnRbkYgTqPx5gLY9C8iPZJciMhiB54lLMMFZW6yvqtc6mV2hWgsF
         SBVXGByFD21Zx0Qo9tC+6zp9VjujZARWIqgCGL4uIGhsgdfLR30M9jX+XNnEznKbyVuY
         wmEg==
X-Gm-Message-State: APjAAAVdaErcdDaWUSPq/pqBAPy6p6Px5jk3IXzD7VmYmgUOpTpKpxWj
        n6250YeUu+cdOiI4O2fVdA==
X-Google-Smtp-Source: APXvYqwv9bZ/xqpklU+q/k/SuPV3s2p1vdM8b7SEvaExUIE1wvWyWTZsIszAxtQysWODjTSXm6aHnQ==
X-Received: by 2002:a9d:7a52:: with SMTP id z18mr4182159otm.234.1572033432552;
        Fri, 25 Oct 2019 12:57:12 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t18sm1010526otm.8.2019.10.25.12.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 12:57:11 -0700 (PDT)
Date:   Fri, 25 Oct 2019 14:57:11 -0500
From:   Rob Herring <robh@kernel.org>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     dri-devel@lists.freedesktop.org,
        Mark Rutland <mark.rutland@arm.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chris Healy <cphealy@gmail.com>, devicetree@vger.kernel.org,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Seung-Woo Kim <sw0312.kim@samsung.com>
Subject: Re: [PATCH v3 17/21] dt-bindings: display: bridge: lvds-transmitter:
 Add new props
Message-ID: <20191025195711.GA1074@bogus>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-18-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191023154512.9762-18-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, Oct 23, 2019 at 05:45:08PM +0200, Boris Brezillon wrote:
> Add the data-mapping property to describe the output bus format and
> the bus-width property to describe the input bus format.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Changes in v3:
> * New patch
> ---
>  .../bindings/display/bridge/lvds-transmitter.txt    | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
> index 60091db5dfa5..7b43b6f20279 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
> @@ -36,6 +36,19 @@ graph bindings specified in Documentation/devicetree/bindings/graph.txt.
>  - Video port 0 for parallel input
>  - Video port 1 for LVDS output
>  
> +Optional port 0 node properties:
> +
> +- bus-width: number of data lines use to transmit the RGB data.
> +	     Can be 18 or 24.
> +
> +Optional port 1 node properties:
> +
> +- data-mapping: see Documentation/devicetree/bindings/display/panel/lvds.yaml
> +		for more details about this LVDS data-mapping property.
> +		Supported values:
> +		"jeida-18"
> +		"jeida-24"
> +		"vesa-24"

This is already defined to be a panel property. Do we need it at both 
ends?

Also, why duplicate all the supported values.

Rob
