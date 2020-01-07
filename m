Return-Path: <SRS0=83Av=24=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA8E3C33C8C
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 14:46:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9773E2146E
	for <linux-devicetree@archiver.kernel.org>; Tue,  7 Jan 2020 14:46:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728048AbgAGOqP (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 7 Jan 2020 09:46:15 -0500
Received: from mga14.intel.com ([192.55.52.115]:18529 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727958AbgAGOqP (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 7 Jan 2020 09:46:15 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Jan 2020 06:46:15 -0800
X-IronPort-AV: E=Sophos;i="5.69,406,1571727600"; 
   d="scan'208";a="233207651"
Received: from ideak-desk.fi.intel.com ([10.237.68.142])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Jan 2020 06:46:09 -0800
Date:   Tue, 7 Jan 2020 16:46:05 +0200
From:   Imre Deak <imre.deak@intel.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Cc:     dri-devel@lists.freedesktop.org,
        Mark Rutland <mark.rutland@arm.com>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        devicetree@vger.kernel.org,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>,
        Chris Healy <cphealy@gmail.com>
Subject: Re: [PATCH v6 1/4] drm/bridge: Add a drm_bridge_state object
Message-ID: <20200107144605.GD29830@ideak-desk.fi.intel.com>
Reply-To: imre.deak@intel.com
References: <20200106143409.32321-1-narmstrong@baylibre.com>
 <20200106143409.32321-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106143409.32321-2-narmstrong@baylibre.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Mon, Jan 06, 2020 at 03:34:06PM +0100, Neil Armstrong wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> One of the last remaining objects to not have its atomic state.
> 
> This is being motivated by our attempt to support runtime bus-format
> negotiation between elements of the bridge chain.
> This patch just paves the road for such a feature by adding a new
> drm_bridge_state object inheriting from drm_private_obj so we can
> re-use some of the existing state initialization/tracking logic.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
> [...]
> +
> +/**
> + * __drm_atomic_helper_bridge_duplicate_state() - Copy atomic bridge state
> + * @bridge: bridge object
> + * @state: atomic bridge state
> + *
> + * Copies atomic state from a bridge's current state and resets inferred values.
> + * This is useful for drivers that subclass the bridge state.
> + */
> +void __drm_atomic_helper_bridge_duplicate_state(struct drm_bridge *bridge,
> +						struct drm_bridge_state *state)
> +{
> +	__drm_atomic_helper_private_obj_duplicate_state(&bridge->base,
> +							&state->base);

When DRM and DRM_KMS_HELPER are built as modules the above will cause the
following build error:

depmod: ERROR: Cycle detected: drm_kms_helper -> drm -> drm_kms_helper
depmod: ERROR: Found 2 modules in dependency cycles!

Using __drm_atomic_helper_private_obj_duplicate_state will add the
drm.ko->drm_kms_helper.ko dependency but drm_kms_helper.ko already
depends on drm.ko

--Imre
