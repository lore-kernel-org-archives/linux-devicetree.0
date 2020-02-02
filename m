Return-Path: <SRS0=/AfF=3W=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4738C35249
	for <linux-devicetree@archiver.kernel.org>; Sun,  2 Feb 2020 18:23:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B0962206D3
	for <linux-devicetree@archiver.kernel.org>; Sun,  2 Feb 2020 18:23:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726909AbgBBSXv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 2 Feb 2020 13:23:51 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:33892 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726906AbgBBSXu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 2 Feb 2020 13:23:50 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 9248620026;
        Sun,  2 Feb 2020 19:23:47 +0100 (CET)
Date:   Sun, 2 Feb 2020 19:23:46 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Marek Vasut <marex@denx.de>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Sean Cross <xobs@kosagi.com>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: it6251: add bindings for IT6251
 LVDS-to-eDP bridge
Message-ID: <20200202182346.GA18495@ravnborg.org>
References: <20200127022023.379080-1-marex@denx.de>
 <20200127022023.379080-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200127022023.379080-2-marex@denx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8
        a=YpGV6msqAAAA:8 a=e5mUnYsNAAAA:8 a=BtaqeeuKE2emfkvH66kA:9
        a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22 a=7Sa5D-Tva0wx0rmpRu8Y:22
        a=Vxmtnl_E_bksehYqCbjh:22
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Marek.

On Mon, Jan 27, 2020 at 03:20:22AM +0100, Marek Vasut wrote:
> Add DT bindings for ITE IT6251 LVDS-to-eDP bridge.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sean Cross <xobs@kosagi.com>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
>  .../bindings/display/bridge/ite,it6251.txt    | 35 +++++++++++++++++++

Any chance you could make this follow the DT Schema (.yaml) syntax
so we get better verification of the DT files?

	Sam
