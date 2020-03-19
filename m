Return-Path: <SRS0=Rh3i=5E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C778DC4332B
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 06:43:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A9D352072C
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 06:43:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727011AbgCSGnD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Mar 2020 02:43:03 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:43298 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgCSGnC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Mar 2020 02:43:02 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 8293520023;
        Thu, 19 Mar 2020 07:42:53 +0100 (CET)
Date:   Thu, 19 Mar 2020 07:42:52 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Nikolaus Schaller <hns@goldelico.com>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Sandeep Panda <spanda@codeaurora.org>,
        dri-devel@lists.freedesktop.org,
        Paul Cercueil <paul@crapouillou.net>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Chris Zhong <zyw@rock-chips.com>,
        Marco Franchi <marco.franchi@nxp.com>,
        Stefan Mavrodiev <stefan@olimex.com>,
        Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
        Hoegeun Kwon <hoegeun.kwon@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Nickey Yang <nickey.yang@rock-chips.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        Vinay Simha BN <simhavcs@gmail.com>,
        Marek Belisko <marek@goldelico.com>,
        Heiko Schocher <hs@denx.de>,
        Brian Masney <masneyb@onstation.org>,
        devicetree@vger.kernel.org, Guido Gunther <agx@sigxcpu.org>,
        Mark Brown <broonie@kernel.org>,
        Alexandre Courbot <acourbot@nvidia.com>,
        Werner Johansson <werner.johansson@sonymobile.com>,
        Purism Kernel Team <kernel@puri.sm>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Lin Huang <hl@rock-chips.com>,
        Douglas Anderson <dianders@chromium.org>,
        linux-spi@vger.kernel.org, Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v1 0/36] dt-bindings: display: convert remaning panel
 bindings to DT Schema
Message-ID: <20200319064252.GA14227@ravnborg.org>
References: <20200315134416.16527-1-sam@ravnborg.org>
 <20200319032528.GL29911@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200319032528.GL29911@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
        a=vPVOqDrkTdbM1Wo0j7QA:9 a=CjuIK1q_8ugA:10
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rob

> I've gone rather quickly thru the series. Other than what I commented 
> on, the rest look fine generally. There may be a couple with similar 
> comments.

Thanks.
Some of this was trivial stuff I should have fixed while converting -
great with an extra pair of eyes.

I will re-spin and try to spot similar issues in the other bindings when
I do so.

	Sam
