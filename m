Return-Path: <SRS0=/CI9=RE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60502 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727697AbfCAJeh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 1 Mar 2019 04:34:37 -0500
Date: Fri, 1 Mar 2019 10:34:33 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2] dt-bindings: power: r8a77965: Remove non-existent
 A3IR power domain
Message-ID: <20190301093432.palahslxko5byvwh@verge.net.au>
References: <20190228105119.548-1-geert+renesas@glider.be>
 <TY1PR01MB1770F8D490EB33636F24954AC0750@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1770F8D490EB33636F24954AC0750@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Sender: devicetree-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, Feb 28, 2019 at 11:36:28AM +0000, Fabrizio Castro wrote:
> > From: Geert Uytterhoeven <geert+renesas@glider.be>
> > Sent: 28 February 2019 10:51
> > Subject: [PATCH v2] dt-bindings: power: r8a77965: Remove non-existent A3IR power domain
> > 
> > The R-Car Gen3 HardWare Manual Errata for Rev. 0.80 (Feb 28, 2018)
> > removed the A3IR power domain on R-Car M3-N, as this SoC does not have
> > an Image Processing Unit (IMP-X5).
> > 
> > As of commit d8c6557bc93be73e ("arm64: dts: renesas: r8a77965: Remove
> > non-existent IPMMU-IR"), this definition is no longer used from DT, and
> > thus can be removed.
> > 
> > Fixes: a527709b78b3c997 ("soc: renesas: rcar-sysc: Add R-Car M3-N support")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks, applied for v5.2.
