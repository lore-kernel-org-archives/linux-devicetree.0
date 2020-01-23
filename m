Return-Path: <SRS0=+P9T=3M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F5D5C33CAA
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jan 2020 07:53:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4C95D2467B
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jan 2020 07:53:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="M8iYzr2w"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbgAWHxA (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jan 2020 02:53:00 -0500
Received: from o1.b.az.sendgrid.net ([208.117.55.133]:26995 "EHLO
        o1.b.az.sendgrid.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725785AbgAWHxA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 23 Jan 2020 02:53:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
        h=subject:references:from:mime-version:in-reply-to:to:cc:content-type:
        content-transfer-encoding;
        s=001; bh=cPADCihrOp2iEwXvzCIzigYgIWVEfxQoks52hK/GuAw=;
        b=M8iYzr2wZajSMoERhcN+1Cq0YlnC8OTe2bv0Tjahox4L2siKNB7HoPTXpr4RZ0cvOmYg
        DbspjG37cNLLK5hLtGfZoGbpXyFPikL8GzDOL1NlLxNw9IPQjxga+Hw5/q24mEE1jh3z1I
        VoGD2wD3vwF6j5L1blj2ZAotuFD7pZIOU=
Received: by filterdrecv-p3iad2-57f487d66-whbch with SMTP id filterdrecv-p3iad2-57f487d66-whbch-18-5E2950DB-14
        2020-01-23 07:52:59.598201321 +0000 UTC m=+3222382.562160735
Received: from [192.168.1.14] (unknown [98.128.173.80])
        by ismtpd0007p1lon1.sendgrid.net (SG) with ESMTP id kejN4PUGRdmRt3MoLN_efA
        Thu, 23 Jan 2020 07:52:59.229 +0000 (UTC)
Subject: Re: [PATCH v7 06/12] drm/bridge: Add the necessary bits to support
 bus format negotiation
References: <20200122111700.1924960-1-boris.brezillon@collabora.com>
 <20200122111700.1924960-7-boris.brezillon@collabora.com>
 <5a15dda1-0791-c1b6-94aa-4fed25bbcca9@kwiboo.se>
 <20200123083933.64fc98be@collabora.com>
From:   Jonas Karlman <jonas@kwiboo.se>
Message-ID: <cc8ce5e0-f502-e3ee-e677-eeb7ad532513@kwiboo.se>
Date:   Thu, 23 Jan 2020 07:52:59 +0000 (UTC)
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200123083933.64fc98be@collabora.com>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h4TCeMaRXvlR+d+tH?=
 =?us-ascii?Q?o+itrL5Tkci994oX4c25qQtYI3EOV9qu3j+HXp3?=
 =?us-ascii?Q?SSfCyyWQOUZt2DcbVLohlrJdAjwRJhJGuDa35oO?=
 =?us-ascii?Q?zCvzh2JsLjfSGC+KSnUZkJUih0ZZCGuLhkHD+61?=
 =?us-ascii?Q?6obmElTQuUb1KmqKNwgINzPDFUzWMFvgxj4cxnw?=
 =?us-ascii?Q?ZB2Qv5GSX9Uu2AvwlMUEA=3D=3D?=
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     dri-devel@lists.freedesktop.org,
        Lucas Stach <l.stach@pengutronix.de>,
        Chris Healy <cphealy@gmail.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        kernel@collabora.com, Daniel Vetter <daniel@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset=us-ascii
Content-Language: sv
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 2020-01-23 08:39, Boris Brezillon wrote:
> On Wed, 22 Jan 2020 23:44:28 +0000 (UTC)
> Jonas Karlman <jonas@kwiboo.se> wrote:
> 
>>> +static int
>>> +drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
>>> +					struct drm_crtc_state *crtc_state,
>>> +					struct drm_connector_state *conn_state)
>>> +{
>>> +	struct drm_connector *conn = conn_state->connector;
>>> +	struct drm_encoder *encoder = bridge->encoder;
>>> +	struct drm_bridge_state *last_bridge_state;
>>> +	unsigned int i, num_out_bus_fmts;
>>> +	struct drm_bridge *last_bridge;
>>> +	u32 *out_bus_fmts;
>>> +	int ret = 0;
>>> +
>>> +	last_bridge = list_last_entry(&encoder->bridge_chain,
>>> +				      struct drm_bridge, chain_node);
>>> +	last_bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
>>> +							    last_bridge);
>>> +
>>> +	if (last_bridge->funcs->atomic_get_output_bus_fmts) {
>>> +		const struct drm_bridge_funcs *funcs = last_bridge->funcs;
>>> +
>>> +		/*
>>> +		 * If the driver implements ->atomic_get_output_bus_fmts() it
>>> +		 * should also implement the atomic state hooks.
>>> +		 */
>>> +		if (WARN_ON(last_bridge_state))  
>>
>> This looks wrong, with this changed to WARN_ON(!last_bridge_state)
>> my RK3328 HDMI2.0/YUV444/YUV420/10-bit branch at [1] starts working.
>>
>> With WARN_ON(last_bridge_state) I get:
>>
>> [    6.606658] WARNING: CPU: 0 PID: 167 at drivers/gpu/drm/drm_bridge.c:746 drm_atomic_bridge_chain_check+0x2b8/0x308
>> [    6.606673] Hardware name: Pine64 Rock64 (DT)
>>
>> [    6.606754] Call trace:
>> [    6.606759]  drm_atomic_bridge_chain_check+0x2b8/0x308
>> [    6.606764]  drm_atomic_helper_check_modeset+0x89c/0xab8
>> [    6.606768]  drm_atomic_helper_check+0x1c/0xa0
>> [    6.606772]  drm_atomic_check_only+0x464/0x708
>> [    6.606777]  drm_atomic_commit+0x18/0x58
> 
> Add
> 
> const drm_bridge_funcs ... = {
> 	...
> 	.atomic_reset = drm_atomic_helper_bridge_reset,
> 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> 	...
> };
> 
> and that should work.

That is what I added and what made that this warning is being triggered.
The comment state that atomic state is needed, but the check warns when there is a state.

I have this:

static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
	...
	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
	.atomic_get_output_bus_fmts = dw_hdmi_bridge_atomic_get_output_bus_fmts,
	.atomic_get_input_bus_fmts = dw_hdmi_bridge_atomic_get_input_bus_fmts,
	.atomic_check = dw_hdmi_bridge_atomic_check,
	.atomic_reset = drm_atomic_helper_bridge_reset,
	...
};

and

static const struct drm_bridge_funcs dw_hdmi_rockchip_bridge_funcs = {
	...
	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
	.atomic_get_input_bus_fmts = dw_hdmi_rockchip_get_input_bus_fmts,
	.atomic_check = dw_hdmi_rockchip_bridge_atomic_check,
	.atomic_reset = drm_atomic_helper_bridge_reset,
};

after applying the following I got a hdmi signal again

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 0c28816146ba..7e7b0fac8f4f 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -743,7 +743,7 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
 		 * If the driver implements ->atomic_get_output_bus_fmts() it
 		 * should also implement the atomic state hooks.
 		 */
-		if (WARN_ON(last_bridge_state))
+		if (WARN_ON(!last_bridge_state))
 			return -EINVAL;
 
 		out_bus_fmts = funcs->atomic_get_output_bus_fmts(last_bridge,

Regards,
Jonas

> 
>>
>> [1] https://github.com/Kwiboo/linux-rockchip/commits/next-20200122-bus-format
>>
>> Regards,
>> Jonas
