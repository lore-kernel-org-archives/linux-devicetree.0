Return-Path: <SRS0=L07u=CG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5093BC433E6
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 15:06:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22944208FE
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Aug 2020 15:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598627207;
	bh=Nr0kxkFZWse9WtVRoe34d4YlUnG8tQeAyhzLDFCwgCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=AjTn0KJ4/BaeR/Qpy60Et3EtQl4OBPv83aQMRGHCF+UIe0eUwZGBiZKtngdOATyXl
	 PirgLIZJvE8zPEad0m9Y+7cMvpKNMs/WreuXxsgapIZ86MhSb56FDF4GTHugIKiv7f
	 PUYbkP+nU7nI3k5dLe+f6XdQcT3Y2KPK4L4QwjOE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbgH1PGq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 28 Aug 2020 11:06:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:56914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726321AbgH1PGp (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 28 Aug 2020 11:06:45 -0400
Received: from localhost (unknown [122.171.38.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 634F32075B;
        Fri, 28 Aug 2020 15:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598627205;
        bh=Nr0kxkFZWse9WtVRoe34d4YlUnG8tQeAyhzLDFCwgCU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yW2UZm+o4bnsSSNVxHlN4kqZfwWtrtVzR/9cee/m73r+xbWmTs6SZI9tN+9tQfKyE
         4fHXSLUXvPOLj31wSOTjrimqLj/HombWrJWSsash4S1CAYHB1nT34VR0B52fQ4BhqB
         aW1njn+YOPS97vku7as5eiY0HjzQf3LIIL5MpT8Q=
Date:   Fri, 28 Aug 2020 20:36:41 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Subject: Re: [PATCH v1 2/2] drm: bridge: add support for lontium LT9611UXC
 bridge
Message-ID: <20200828150641.GZ2639@vkoul-mobl>
References: <20200828120431.1636402-1-dmitry.baryshkov@linaro.org>
 <20200828120431.1636402-3-dmitry.baryshkov@linaro.org>
 <20200828141848.GX2639@vkoul-mobl>
 <d2afbd86-eb53-e273-6de6-dfae64624b37@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2afbd86-eb53-e273-6de6-dfae64624b37@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 28-08-20, 18:01, Dmitry Baryshkov wrote:
> On 28/08/2020 17:18, Vinod Koul wrote:
> > On 28-08-20, 15:04, Dmitry Baryshkov wrote:
> > > +static int lt9611uxc_bridge_attach(struct drm_bridge *bridge,
> > > +				enum drm_bridge_attach_flags flags)
> > > +{
> > > +	struct lt9611uxc *lt9611uxc = bridge_to_lt9611uxc(bridge);
> > > +	int ret;
> > > +
> > > +	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> > > +		dev_err(lt9611uxc->dev, "Fix bridge driver to make connector optional!");
> > 
> > Can we support both modes as I have done in lt9611, that way once the
> > conversion is done we can drop the init part and support conversion.
> > 
> > I have patch for msm driver to set DRM_BRIDGE_ATTACH_NO_CONNECTOR, you
> > can use that to test
> 
> Probably the message text is misleading. The driver as is does not work w/o
> DRM_BRIDGE_ATTACH_NO_CONNECTOR. Do you plan to push that patch into upstream
> tree?

It causes regression in laptop so have removed it ;( I need to fix that
first
The patch is here though and works on rb3 and db410c.
git.linaro.org/people/vinod.koul/kernel.git drm/no_connector

-- 
~Vinod
