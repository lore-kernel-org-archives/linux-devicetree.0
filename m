Return-Path: <SRS0=GiHI=NR=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44336 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730421AbeKFX0B (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 6 Nov 2018 18:26:01 -0500
Date: Tue, 6 Nov 2018 15:00:35 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a77990: Fix VIN endpoint
 numbering
Message-ID: <20181106140031.y4da4deci6ig4fvf@verge.net.au>
References: <1541423563-790-1-git-send-email-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1541423563-790-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: devicetree-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: geert@linux-m68k.org, laurent.pinchart@ideasonboard.com, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Koji Matsuoka <koji.matsuoka.xm@renesas.com>, Takeshi Kihara <takeshi.kihara.df@renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Nov 05, 2018 at 02:12:43PM +0100, Jacopo Mondi wrote:
> The VIN driver bindings dictates fixed numbering for VIN endpoints connected
> to CSI-2 endpoints, even when a single endpoint exists.
> 
> Without proper endpoint numbering the VIN driver fails to probe.
> 
> Based on a patch in BSP from Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> 
> Fixes: ec70407ae7d7 ("arm64: dts: renesas: r8a77990: Add VIN and CSI-2 device nodes")
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
