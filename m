Return-Path: <SRS0=lsCC=4C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D18C3F68F
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 17:15:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F2F46206CC
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 17:15:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404543AbgBNRPm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 14 Feb 2020 12:15:42 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:34566 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391923AbgBNQMH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 14 Feb 2020 11:12:07 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 34CB980477;
        Fri, 14 Feb 2020 17:11:58 +0100 (CET)
Date:   Fri, 14 Feb 2020 17:11:56 +0100
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
Subject: Re: [PATCH 2/4] dt-bindings: panel: lvds: Add properties for clock
 and data polarities
Message-ID: <20200214161156.GA18287@ravnborg.org>
References: <cover.b12a054012ce067fa2094894147f953ab816d8d0.1581682983.git-series.maxime@cerno.tech>
 <620a740cec4186177ce346b092d4ba451e1420dc.1581682983.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <620a740cec4186177ce346b092d4ba451e1420dc.1581682983.git-series.maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
        a=Tpc6Fu3lJ6wmHEW927AA:9 a=CjuIK1q_8ugA:10
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Maxime.

On Fri, Feb 14, 2020 at 01:24:39PM +0100, Maxime Ripard wrote:
> Some LVDS encoders can support multiple polarities on the data and
> clock lanes, and similarly some panels require a given polarity on
> their inputs. Add a property on the panel to configure the encoder
> properly.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Not a fan of this binding...
In display-timing.txt we have a specification/description of
the panel-timing node.

The panel-timing node already include information such as:
- hsync-active:
- vsync-active:
- de-active:
- pixelclk-active:
- syncclk-active:

But clock-active-low and data-active-low refer to the bus
more than an individual timing.
So maybe OK not to have it in a panel-timing node.
But then it would IMO be better to include
this in the display-timing node - so we make
this available and standard for all users of the
display-timing node.

I will dig up my patchset to make proper bindings for panel-timing and
display-timing this weeked and resend them.
Then we can discuss if this goes on top or this is specific for the
lvds binding.


> ---
>  Documentation/devicetree/bindings/display/panel/lvds.yaml | 10 ++++++++-
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> index d0083301acbe..4a1111a1ab38 100644
> --- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> @@ -90,6 +90,16 @@ properties:
>        CTL2: Data Enable
>        CTL3: 0
>  
> +  clock-active-low:
> +    type: boolean
> +    description: >

Should this be "|" and not ">"?
Did this pass dt_binding_check?

> +      If set, reverse the clock polarity on the clock lane.
This text could be a bit more specific. If this is set then
what?
And it seems strange that a clock is active low.
For a clock we often talk about raising or falling edge.

> +
> +  data-active-low:
> +    type: boolean
> +    description: >
Same comment with ">"

> +      If set, reverse the bit polarity on all data lanes.
Same comment about a more explicit description.


	Sam


>    data-mirror:
>      type: boolean
>      description:
> -- 
> git-series 0.9.1
