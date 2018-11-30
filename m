Return-Path: <SRS0=nKhH=OJ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51945 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbeK3V1R (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 30 Nov 2018 16:27:17 -0500
Date: Fri, 30 Nov 2018 11:18:25 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/6] soc: renesas: r8a77965-sysc: Remove non-existent
 A3IR power domain
Message-ID: <20181130101824.xh4lxkndyzqt55ta@verge.net.au>
References: <20181129105619.10695-1-geert+renesas@glider.be>
 <20181129105619.10695-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181129105619.10695-2-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Vladimir Barinov <vladimir.barinov@cogentembedded.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, Nov 29, 2018 at 11:56:14AM +0100, Geert Uytterhoeven wrote:
> The R-Car Gen3 HardWare Manual Errata for Rev. 0.80 (Feb 28, 2018)
> removed the A3IR power domain on R-Car M3-N, as this SoC does not have
> an Image Processing Unit (IMP-X5).
> 
> The definition in the DT bindings header cannot be removed yet, until
> its (incorrect) user has been removed.
> 
> Fixes: a527709b78b3c997 ("soc: renesas: rcar-sysc: Add R-Car M3-N support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.21.
