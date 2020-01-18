Return-Path: <SRS0=Evye=3H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08DD2C33CB1
	for <linux-devicetree@archiver.kernel.org>; Sat, 18 Jan 2020 09:11:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D90EE2468B
	for <linux-devicetree@archiver.kernel.org>; Sat, 18 Jan 2020 09:11:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbgARJLr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 18 Jan 2020 04:11:47 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:52912 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbgARJLr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 18 Jan 2020 04:11:47 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id E15CA80440;
        Sat, 18 Jan 2020 10:11:41 +0100 (CET)
Date:   Sat, 18 Jan 2020 10:11:40 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: Convert a bunch of panels to DT
 schema
Message-ID: <20200118091140.GA12245@ravnborg.org>
References: <20200117231756.3141-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200117231756.3141-1-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
        a=mvVtXd7HAW45dodTMrUA:9 a=dLSrt29t64xHWj39:21 a=gagzr6WNY6cZXZWM:21
        a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob.

On Fri, Jan 17, 2020 at 05:17:56PM -0600, Rob Herring wrote:
> Convert all the 'simple' panels which match the constraints of the
> common panel-simple.yaml schema. This conversion is based on how the
> panels are documented. Some may turn out to be more complex once the
> schema is applied to actual dts files.

Thanks for updating this patch - and very good to reduce the number of
files with almost the same content.

One comment below, with that addressed:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

There are likely some dt files that assume panels need no power and need a
fixed-regulator or something as power-supply now is mandatory.
Should this be checked before we apply this patch?

As we continue to see new panels more or less every week I would like
this patch applied to drm-misc-next as soon as possible to avoid any
future conflicts.

> index 513f03466aba..000000000000
> --- a/Documentation/devicetree/bindings/display/panel/innolux,p120zdg-bf1.txt
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -Innolux P120ZDG-BF1 12.02 inch eDP 2K display panel
> -
> -This binding is compatible with the simple-panel binding, which is specified
> -in simple-panel.txt in this directory.
> -
> -Required properties:
> -- compatible: should be "innolux,p120zdg-bf1"
> -- power-supply: regulator to provide the supply voltage
> -
> -Optional properties:
> -- enable-gpios: GPIO pin to enable or disable the panel
> -- backlight: phandle of the backlight device attached to the panel
> -- no-hpd: If HPD isn't hooked up; add this property.

panel-simple.yaml does not include the no-hpd property.
We only have 2 bindings, this and sharp,ld-d5116z01b.yaml
that include the no-hpd property.

We have two options:
1) add the no-hpd property to panel-simple.yaml
2) keep an independent binding for panels using no-hpd

I suggest to keep an independent binding for innolux,p120zdg-bf1
so we keep panel-simple.yaml slim.
In other words do not delete this file and remove the compatible from
panel-simple.yaml

	Sam
