Return-Path: <SRS0=eKhM=NS=vger.kernel.org=devicetree-owner@kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:52418 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727312AbeKHCBI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 7 Nov 2018 21:01:08 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a77990: Fix VIN endpoint numbering
Date: Wed, 07 Nov 2018 18:30:13 +0200
Message-ID: <2123959.7tZ4CAXCJB@avalon>
In-Reply-To: <20181106140031.y4da4deci6ig4fvf@verge.net.au>
References: <1541423563-790-1-git-send-email-jacopo+renesas@jmondi.org> <20181106140031.y4da4deci6ig4fvf@verge.net.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, geert@linux-m68k.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Koji Matsuoka <koji.matsuoka.xm@renesas.com>, Takeshi Kihara <takeshi.kihara.df@renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Simon,

On Tuesday, 6 November 2018 16:00:35 EET Simon Horman wrote:
> On Mon, Nov 05, 2018 at 02:12:43PM +0100, Jacopo Mondi wrote:
> > The VIN driver bindings dictates fixed numbering for VIN endpoints
> > connected to CSI-2 endpoints, even when a single endpoint exists.
> > 
> > Without proper endpoint numbering the VIN driver fails to probe.
> > 
> > Based on a patch in BSP from Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> > 
> > Fixes: ec70407ae7d7 ("arm64: dts: renesas: r8a77990: Add VIN and CSI-2
> > device nodes") Signed-off-by: Koji Matsuoka
> > <koji.matsuoka.xm@renesas.com>
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

I think you can go ahead and apply it.

-- 
Regards,

Laurent Pinchart
