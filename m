Return-Path: <SRS0=so6l=OM=vger.kernel.org=devicetree-owner@kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:33202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbeLCWsJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 3 Dec 2018 17:48:09 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/2] ARM: dts: stout: Convert to new LVDS DT bindings
Date: Tue, 04 Dec 2018 00:48:41 +0200
Message-ID: <2301881.HCRvWxNAtB@avalon>
In-Reply-To: <068e770d-107d-002f-cebf-a26b5dc8a147@gmail.com>
References: <20181203151242.25875-1-geert+renesas@glider.be> <2069641.6dBh1jlBqR@avalon> <068e770d-107d-002f-cebf-a26b5dc8a147@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Marek,

On Tuesday, 4 December 2018 00:24:32 EET Marek Vasut wrote:
> On 12/03/2018 10:48 PM, Laurent Pinchart wrote:
> > On Monday, 3 December 2018 17:12:41 EET Geert Uytterhoeven wrote:
> >> As of commit 6d2ca85279becdff ("dt-bindings: display: renesas: Deprecate
> >> LVDS support in the DU bindings"), the internal LVDS encoder has DT
> >> bindings separate from the DU.  The Lager device tree was ported over to
> >> the new model, but the Stout device tree was forgotten.
> >> 
> >> Fixes: 15a1ff30d8f9bd83 ("ARM: dts: r8a7790: Convert to new LVDS DT
> >> bindings") Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> ---
> >> Compile-tested only.
> > 
> > I can't test the patch either but it looks fine to me.
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > I assume you will send this directly to Simon, so I don't plan to take the
> > patch in my tree.
> 
> I have a Stout if you need me to test something.

Could you test HDMI output ? We just need to ensure that everything is probed 
correctly, so display anything on the HDMI output will do.

-- 
Regards,

Laurent Pinchart
