Return-Path: <SRS0=VnZl=7Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A1DC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed,  3 Jun 2020 19:55:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 738962074B
	for <linux-devicetree@archiver.kernel.org>; Wed,  3 Jun 2020 19:55:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbgFCTzD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 3 Jun 2020 15:55:03 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:36702 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbgFCTzC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 3 Jun 2020 15:55:02 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id C641E80566;
        Wed,  3 Jun 2020 21:54:59 +0200 (CEST)
Date:   Wed, 3 Jun 2020 21:54:58 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Emil Velikov <emil.l.velikov@gmail.com>
Cc:     Liu Ying <victor.liu@nxp.com>,
        devicetree <devicetree@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        ML dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/panel: simple: Add support for KOE
 TX26D202VM0BWA panel
Message-ID: <20200603195458.GA79364@ravnborg.org>
References: <1590991880-24273-1-git-send-email-victor.liu@nxp.com>
 <CACvgo50UOby-xV_OYmM55VUXUbwLxK-q6bs2FoS_FuwB9ChYJg@mail.gmail.com>
 <20200602205653.GC56418@ravnborg.org>
 <CACvgo52fdrjp_-Q-mB1AYtNuKcQ722mvTOFsjWaXc139rjD58Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACvgo52fdrjp_-Q-mB1AYtNuKcQ722mvTOFsjWaXc139rjD58Q@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=G88y7es5 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=kj9zAlcOel0A:10 a=UwS8wxYxj5kew1OWHm4A:9 a=CjuIK1q_8ugA:10
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Emil.

> >
> > I expect to have some hours for linux work friday or saturday, but no
> > promises...
> >
> Don't worry - once the DT maintainers ack 1/2, I'll merge the series.
If it is in alphabetical order then we are good to go.
For such simple patches we do not need DT maintainer ack.
You can add my: r-b then you are fully covered.

	Sam
> 
> -Emil
