Return-Path: <SRS0=BDx3=4U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F3AC3F2C6
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 18:18:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 694302072D
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 18:18:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730291AbgCCSSX convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Mar 2020 13:18:23 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:35431 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727070AbgCCSSW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Mar 2020 13:18:22 -0500
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id A38CA200006;
        Tue,  3 Mar 2020 18:18:17 +0000 (UTC)
Date:   Tue, 3 Mar 2020 19:18:16 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-arm-kernel@lists.infradead.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] dt-bindings: gpu: mali-bifrost: Add Rockchip PX30
 compatible
Message-ID: <20200303191816.11dbc313@xps13>
In-Reply-To: <2766954.FXckbfHlGz@diego>
References: <20200302155808.11273-1-miquel.raynal@bootlin.com>
        <2766954.FXckbfHlGz@diego>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


Heiko Stübner <heiko@sntech.de> wrote on Mon, 02 Mar 2020 17:29:02
+0100:

> Am Montag, 2. März 2020, 16:58:07 CET schrieb Miquel Raynal:
> > Rockchip PX30 SoCs feature a Bifrost Mali GPU.
> > 
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 1 +  
> 
> already in mainline ;-)
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ad848dd53385b61f3c2b94d3466bf799f31035a7
> 
> 

You should probably setup an automatic answer ;)

I admit that I wrote these patches some time ago when it was not in
mainline and did not check before sending it :$

Cheers,
Miquèl
