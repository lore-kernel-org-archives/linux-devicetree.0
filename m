Return-Path: <SRS0=PVp5=7S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_CSS,URIBL_CSS_A
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C6F6C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri,  5 Jun 2020 15:47:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3784D2075B
	for <linux-devicetree@archiver.kernel.org>; Fri,  5 Jun 2020 15:47:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728001AbgFEPrR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 5 Jun 2020 11:47:17 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:39626 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728140AbgFEPrR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 5 Jun 2020 11:47:17 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id D48C320037;
        Fri,  5 Jun 2020 17:47:13 +0200 (CEST)
Date:   Fri, 5 Jun 2020 17:47:12 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Liu Ying <victor.liu@nxp.com>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        thierry.reding@gmail.com, linux-imx@nxp.com
Subject: Re: [PATCH 0/2] drm/panel: simple: Add a KOE WUXGA 10.1" LVDS panel
 support
Message-ID: <20200605154712.GA207594@ravnborg.org>
References: <1590991775-24188-1-git-send-email-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590991775-24188-1-git-send-email-victor.liu@nxp.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=edQTgYMH c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=kj9zAlcOel0A:10 a=yWwjhyuKAAAA:8 a=nC4w6PE1AAAA:8
        a=VtqsF2JDXepRWkxURg0A:9 a=CjuIK1q_8ugA:10 a=Af9y4jXI75YbyZfcaVTS:22
        a=6x2acwxlnJam7TDHjV8g:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, Jun 01, 2020 at 02:09:35PM +0800, Liu Ying wrote:
> This patch set adds a KOE WUXGA 10.1" LVDS panel support.
> The panel type is TX26D202VM0BWA.
> The panel has dual LVDS channels.
> 
> My panel is manufactured by US Micro Products(USMP).  There is a tag at
> the back of the panel, which indicates the panel type is 'TX26D202VM0BWA'
> and it's made by KOE in Taiwan.
> 
> The panel spec from USMP can be found at:
> https://www.usmicroproducts.com/sites/default/files/datasheets/USMP-T101-192120NDU-A0.pdf
> 
> The below panel spec from KOE is basically the same to the one from USMP.
> However, the panel type 'TX26D202VM0BAA' is a little bit different.
> It looks that the two types of panel are compatible with each other.
> http://www.koe.j-display.com/upload/product/TX26D202VM0BAA.pdf
> 
> Patch 1/2 adds compatible for the panel in the panel-simple DT binding doc.
> Patch 2/2 adds the panel support in the DRM panel-simple driver.

Thanks, both patches applied to drm-misc-next.

	Sam

> 
> Liu Ying (2):
>   dt-bindings: panel-simple: Add koe,tx26d202vm0bwa compatible
>   drm/panel: simple: Add support for KOE TX26D202VM0BWA panel
> 
>  .../bindings/display/panel/panel-simple.yaml       |  2 ++
>  drivers/gpu/drm/panel/panel-simple.c               | 34 ++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
> 
> -- 
> 2.7.4
