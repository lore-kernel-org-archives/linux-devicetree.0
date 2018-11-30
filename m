Return-Path: <SRS0=nKhH=OJ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51992 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbeK3V3d (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 30 Nov 2018 16:29:33 -0500
Date: Fri, 30 Nov 2018 11:20:41 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 5/6] soc: renesas: r8a77980-sysc: Correct A3VIP[012]
 power domain hierarchy
Message-ID: <20181130102040.vl6r7cj6lijfuleb@verge.net.au>
References: <20181129105619.10695-1-geert+renesas@glider.be>
 <20181129105619.10695-6-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181129105619.10695-6-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Vladimir Barinov <vladimir.barinov@cogentembedded.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, Nov 29, 2018 at 11:56:18AM +0100, Geert Uytterhoeven wrote:
> The R-Car Gen3 HardWare Manual Errata for Rev. 0.80 (Feb 28, 2018)
> renamed the A3VIP power domain on R-Car V3H to A3VIP0, and clarified the
> power domain hierarchy for the A3VIP[012] power domains.
> 
> As the definition for the A3VIP0 domain is not yet used from DT, it can
> just be renamed.
> 
> Fixes: 7755b40d07a8dba7 ("dt-bindings: power: add R8A77980 SYSC power domain definitions")
> Fixes: 41d6d8bd8ae94ca9 ("soc: renesas: rcar-sysc: add R8A77980 support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.21.
