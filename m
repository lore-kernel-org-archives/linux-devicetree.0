Return-Path: <SRS0=pYa2=ZY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA60C432C0
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 17:11:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E340E20833
	for <linux-devicetree@archiver.kernel.org>; Mon,  2 Dec 2019 17:11:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WYDlkz0F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727671AbfLBRLt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 2 Dec 2019 12:11:49 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37616 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727618AbfLBRLt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 2 Dec 2019 12:11:49 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6EF60309;
        Mon,  2 Dec 2019 18:11:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575306707;
        bh=ez0gH51I6qgqPMXkNunJleNN5vTi8Yxzgob6Cd0I57o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WYDlkz0FLmNriDMNvtU7AA1Jg1mck8b1K80YvWKz+qwTOwsiDeZS2epsAZmEOe3Mp
         ycr8rihRYkRCNOQfwX6v1HMTXAvN7fUkm+DQMTshAMyG1oI6VPxfJWnWXbe8NU6JlI
         XXnWRjS8/APlLqEkvAJrU0WKD8FUXeL7+ttzv6cw=
Date:   Mon, 2 Dec 2019 19:11:40 +0200
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
Subject: Re: [PATCH v3 17/21] dt-bindings: display: bridge: lvds-transmitter:
 Add new props
Message-ID: <20191202171140.GR4929@pendragon.ideasonboard.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-18-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191023154512.9762-18-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Boris,

Thank you for the patch.

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

Please note that lvds-transmitter has been renamed to lvds-codec and
converted to YAML as part of a pull request I've recently sent ([1]).
This patch will thus need to be rebased.

[1] https://patchwork.freedesktop.org/patch/342754/

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
>  
>  Example
>  -------

-- 
Regards,

Laurent Pinchart
