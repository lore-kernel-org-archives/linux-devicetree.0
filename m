Return-Path: <SRS0=dVBB=5N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 549D9C43331
	for <linux-devicetree@archiver.kernel.org>; Sat, 28 Mar 2020 20:30:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2691A206F6
	for <linux-devicetree@archiver.kernel.org>; Sat, 28 Mar 2020 20:30:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727167AbgC1Uab (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 28 Mar 2020 16:30:31 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:51672 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726604AbgC1Uab (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 28 Mar 2020 16:30:31 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 8264B20030;
        Sat, 28 Mar 2020 21:30:29 +0100 (CET)
Date:   Sat, 28 Mar 2020 21:30:28 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        dri-devel@lists.freedesktop.org,
        heiko.stuebner@theobroma-systems.com
Subject: Re: [PATCH 2/2] dt-bindings: display: xpp055c272: Remove the reg
 property
Message-ID: <20200328203028.GE32230@ravnborg.org>
References: <20200328183641.11226-1-festevam@gmail.com>
 <20200328183641.11226-2-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200328183641.11226-2-festevam@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8
        a=e5mUnYsNAAAA:8 a=5ar7rcKMfKY-4lI8FKsA:9 a=JfS-ByQT5vSXeFgf:21
        a=vAKdPAGF_sidF2Zy:21 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sat, Mar 28, 2020 at 03:36:41PM -0300, Fabio Estevam wrote:
> Commit 52120e8c7ae3 ("dt-bindings: display: fix panel warnings") removed
> the dsi unit name, but missed to remove the 'reg' property, which causes
> the following 'make dt_binding_check' warning:
> 
> Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.example.dts:17.5-29.11: Warning (unit_address_vs_reg): /example-0/dsi: node has a reg or ranges property, but no unit name
> 
> Fix it by removing the unneeded 'reg' property.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Thanks.

Added Fixes: line and applied to drm-misc-next.

	Sam

> ---
>  .../devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml    | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml b/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
> index d9fdb58e06b4..6913923df569 100644
> --- a/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
> @@ -37,7 +37,6 @@ examples:
>      dsi {
>          #address-cells = <1>;
>          #size-cells = <0>;
> -        reg = <0xff450000 0x1000>;
>  
>          panel@0 {
>              compatible = "xinpeng,xpp055c272";
> -- 
> 2.17.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
