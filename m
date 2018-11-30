Return-Path: <SRS0=nKhH=OJ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52028 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbeK3Vea (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 30 Nov 2018 16:34:30 -0500
Date: Fri, 30 Nov 2018 11:25:37 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 6/6] [RFC] dt-bindings: power: r8a77965: Remove
 non-existent A3IR power domain
Message-ID: <20181130102536.pd33zeog2msfwd5z@verge.net.au>
References: <20181129105619.10695-1-geert+renesas@glider.be>
 <20181129105619.10695-7-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181129105619.10695-7-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Vladimir Barinov <vladimir.barinov@cogentembedded.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, Nov 29, 2018 at 11:56:19AM +0100, Geert Uytterhoeven wrote:
> The R-Car Gen3 HardWare Manual Errata for Rev. 0.80 (Feb 28, 2018)
> removed the A3IR power domain on R-Car M3-N, as this SoC does not have
> an Image Processing Unit (IMP-X5).
> 
> As this definition is no longer used from DT, it can be removed.
> 
> Fixes: a527709b78b3c997 ("soc: renesas: rcar-sysc: Add R-Car M3-N support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Marked as RFC, as this patch depends on "arm64: dts: renesas:
> r8a77965: Remove non-existent IPMMU-IR".
> 
> If the dependency goes in first, this patch can be squashed with "soc:
> renesas: r8a77965-sysc: Remove non-existent A3IR power domain".

I am marking this as deferred.
Lets handle this in the next development cycle when the dependency
should be present in an rc release.
