Return-Path: <SRS0=EFsK=6J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 382D3C54FCB
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Apr 2020 14:55:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1EECE20704
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Apr 2020 14:55:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbgDYOzh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 25 Apr 2020 10:55:37 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:44254 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbgDYOzh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 25 Apr 2020 10:55:37 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 87AB620085;
        Sat, 25 Apr 2020 16:55:34 +0200 (CEST)
Date:   Sat, 25 Apr 2020 16:55:33 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] dt-bindings: panel: Document some missing compatible
 strings
Message-ID: <20200425145533.GF32235@ravnborg.org>
References: <20200417065328.1578603-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417065328.1578603-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=kj9zAlcOel0A:10 a=Ikd4Dj_1AAAA:8 a=e5mUnYsNAAAA:8
        a=ALrkF4PwKyK47AGwkhQA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Apr 17, 2020 at 08:53:28AM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add missing compatible strings for the Panasonic and Chunghwa panels
> found on NVIDIA Dalmore and Cardhu boards.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
Applied to drm-misc-next.
The resulting patch in git looks strange because some of the
descriptions are the same. But end result is OK.

	Sam

> ---
>  .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> index b2e8742fd6af..88ac75333a5e 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> @@ -29,6 +29,8 @@ properties:
>        # compatible must be listed in alphabetical order, ordered by compatible.
>        # The description in the comment is mandatory for each compatible.
>  
> +        # Panasonic 10" WUXGA TFT LCD panel
> +      - panasonic,vvx10f004b00
>          # Panasonic 10" WUXGA TFT LCD panel
>        - panasonic,vvx10f034n00
>  
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 393ffc6acbba..6c21650664e2 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -82,6 +82,8 @@ properties:
>          # Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
>        - chunghwa,claa101wa01a
>          # Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
> +      - chunghwa,claa101wb01
> +        # Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
>        - chunghwa,claa101wb03
>          # DataImage, Inc. 7" WVGA (800x480) TFT LCD panel with 24-bit parallel interface.
>        - dataimage,scf0700c48ggu18
> -- 
> 2.24.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
