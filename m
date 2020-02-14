Return-Path: <SRS0=lsCC=4C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF63C3B1A6
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 17:08:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2614F206CC
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 17:08:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389832AbgBNRIm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 14 Feb 2020 12:08:42 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:34754 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403996AbgBNQOE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 14 Feb 2020 11:14:04 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id BFFBF8045F;
        Fri, 14 Feb 2020 17:14:00 +0100 (CET)
Date:   Fri, 14 Feb 2020 17:13:59 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] drm/connector: Add data polarity flags
Message-ID: <20200214161359.GB18287@ravnborg.org>
References: <cover.b12a054012ce067fa2094894147f953ab816d8d0.1581682983.git-series.maxime@cerno.tech>
 <b541006fa0a1c34ac5f668dc561aa1598f8fd86c.1581682983.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b541006fa0a1c34ac5f668dc561aa1598f8fd86c.1581682983.git-series.maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
        a=8sOSbDn3uDz3MpWGLZkA:9 a=CjuIK1q_8ugA:10
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Maxime.

On Fri, Feb 14, 2020 at 01:24:38PM +0100, Maxime Ripard wrote:
> Some LVDS encoders can change the polarity of the data signals being
> sent. Add a DRM bus flag to reflect this.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  include/drm/drm_connector.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 221910948b37..9a08fe6ab7c2 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -330,6 +330,8 @@ enum drm_panel_orientation {
>   *					edge of the pixel clock
>   * @DRM_BUS_FLAG_SHARP_SIGNALS:		Set if the Sharp-specific signals
>   *					(SPL, CLS, PS, REV) must be used
> + * @DRM_BUS_FLAG_DATA_LOW:		The Data signals are active low
> + * @DRM_BUS_FLAG_DATA_HIGH:		The Data signals are active high
Reading the description of these falgs always confuses me.
In this case if neither bit 9 nor bit 10 is set then the data signals
are netiher active low nor active high.
So what can I then expect?

We have the same logic loophole for DRM_BUS_FLAG_SYNC_SAMPLE_POSEDGE
and DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE.
So it is not new, but can we do better here?

	Sam


>   */
>  enum drm_bus_flags {
>  	DRM_BUS_FLAG_DE_LOW = BIT(0),
> @@ -349,6 +351,8 @@ enum drm_bus_flags {
>  	DRM_BUS_FLAG_SYNC_SAMPLE_POSEDGE = DRM_BUS_FLAG_SYNC_NEGEDGE,
>  	DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE = DRM_BUS_FLAG_SYNC_POSEDGE,
>  	DRM_BUS_FLAG_SHARP_SIGNALS = BIT(8),
> +	DRM_BUS_FLAG_DATA_LOW = BIT(9),
> +	DRM_BUS_FLAG_DATA_HIGH = BIT(10),
>  };
>  
>  /**
> -- 
> git-series 0.9.1
