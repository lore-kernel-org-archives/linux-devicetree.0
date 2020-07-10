Return-Path: <SRS0=VTvW=AV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA7AC433E2
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 19:17:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A9C5B2078B
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 19:17:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbgGJTRe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Jul 2020 15:17:34 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:52114 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbgGJTRe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Jul 2020 15:17:34 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 23CAF8051F;
        Fri, 10 Jul 2020 21:17:31 +0200 (CEST)
Date:   Fri, 10 Jul 2020 21:17:29 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Cc:     linux-fbdev@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v1 0/1] dt-bindings: fix simple-framebuffer warning
Message-ID: <20200710191729.GB675682@ravnborg.org>
References: <20200704143544.789345-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200704143544.789345-1-sam@ravnborg.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=iMjSAy0jBA58sKMnvQ0A:9
        a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, Jul 04, 2020 at 04:35:43PM +0200, Sam Ravnborg wrote:
> Trivial fix for a long standing warning.
> At least not fixed in drm-msc-next for now.
> Just in case it was not fixed by someone else (Rob?) already.
> 
> 	Sam
> 
> Sam Ravnborg (1):
>       dt-bindings: fix simple-framebuffer example

Applied to drm-misc-next.

	Sam

> 
>  .../bindings/display/simple-framebuffer.yaml       | 45 +++++++++++-----------
>  1 file changed, 23 insertions(+), 22 deletions(-)
> 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
