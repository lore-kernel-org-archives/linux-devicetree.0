Return-Path: <SRS0=EUt7=OT=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41546 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727058AbeLJME7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Dec 2018 07:04:59 -0500
Date: Mon, 10 Dec 2018 13:04:55 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a7796: salvator-xs: Convert
 to new LVDS DT bindings
Message-ID: <20181210120454.aib3gvqcufkijzed@verge.net.au>
References: <20181203151242.25875-1-geert+renesas@glider.be>
 <20181203151242.25875-3-geert+renesas@glider.be>
 <2791575.DKQRoZFgHM@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2791575.DKQRoZFgHM@avalon>
Sender: devicetree-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Dec 03, 2018 at 11:51:19PM +0200, Laurent Pinchart wrote:
> Hi Geert,
> 
> Thank you for the patch.
> 
> On Monday, 3 December 2018 17:12:42 EET Geert Uytterhoeven wrote:
> > As of commit 6d2ca85279becdff ("dt-bindings: display: renesas: Deprecate
> > LVDS support in the DU bindings"), the internal LVDS encoder has DT
> > bindings separate from the DU.  The device trees for all R-Car H3 and
> > M3-W development boards were ported over to the new model, but
> > Salvator-XS boards equipped with an R-Car M3-W SoC were forgotten.
> > 
> > Fixes: 58e8ed2ee9abe718 ("arm64: dts: renesas: Convert to new LVDS DT
> > bindings") Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Compile-tested only.
> 
> I can't test the patch either but it looks fine to me.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> I assume you will send this directly to Simon, so I don't plan to take the 
> patch in my tree.

Thanks, I have this one. I've applied this for v4.22.
