Return-Path: <SRS0=pYa2=ZY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DAF2C43215
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 17:19:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 62F6B20672
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 17:19:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oGIDxy1G"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727628AbfLBRT2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 12:19:28 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37714 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727493AbfLBRT2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Dec 2019 12:19:28 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCD9C309;
        Mon,  2 Dec 2019 18:19:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575307167;
        bh=1myNRC7SsLatx4Um/XtlYnXlHXwV+S/+jv3sPPcyRGM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oGIDxy1GY7K5W+sGA4pLqXht/OLU5+l+PsVZiMAWj+8UC1SLRQWNXj9CYnBzlDJOf
         Iv3zBXEGXH598Iar3g2xrJ6KszGwn2Xmkg+P1w0aDRfsNkMNgT6VFpGVBfz5vjckpT
         WEl3UZaRlwRE1ZPOyOCPpZgJRl/5WqYGc71OqC10=
Date:   Mon, 2 Dec 2019 19:19:20 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     dri-devel@lists.freedesktop.org,
        Lucas Stach <l.stach@pengutronix.de>,
        Chris Healy <cphealy@gmail.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        kernel@collabora.com, Daniel Vetter <daniel@ffwll.ch>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <robdclark@gmail.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 20/21] dt-bindings: display: panel: Add the
 LTA089AC29000 variant
Message-ID: <20191202171920.GT4929@pendragon.ideasonboard.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-21-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191023154512.9762-21-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Boris,

Thank you for the patch.

On Wed, Oct 23, 2019 at 05:45:11PM +0200, Boris Brezillon wrote:
> The LTA089AC29000 and LT089AC29000 are not exactly the same. Let's add
> a new compatible for the LTA variant.

What is the difference ? :-)

> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  .../bindings/display/panel/toshiba,lt089ac29000.txt          | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/toshiba,lt089ac29000.txt b/Documentation/devicetree/bindings/display/panel/toshiba,lt089ac29000.txt
> index 89826116628c..26ebfa098966 100644
> --- a/Documentation/devicetree/bindings/display/panel/toshiba,lt089ac29000.txt
> +++ b/Documentation/devicetree/bindings/display/panel/toshiba,lt089ac29000.txt
> @@ -1,7 +1,10 @@
>  Toshiba 8.9" WXGA (1280x768) TFT LCD panel
>  
>  Required properties:
> -- compatible: should be "toshiba,lt089ac29000"
> +- compatible: should be one of the following
> +	      "toshiba,lt089ac29000"
> +	      "toshiba,lta089ac29000"
> +
>  - power-supply: as specified in the base binding
>  
>  This binding is compatible with the simple-panel binding, which is specified

-- 
Regards,

Laurent Pinchart
