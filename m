Return-Path: <SRS0=nKhH=OJ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51969 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbeK3V16 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 30 Nov 2018 16:27:58 -0500
Date: Fri, 30 Nov 2018 11:19:06 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/6] soc: renesas: r8a77970-sysc: Remove non-existent CR7
 power domain
Message-ID: <20181130101905.rnsgzjxylyma2has@verge.net.au>
References: <20181129105619.10695-1-geert+renesas@glider.be>
 <20181129105619.10695-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181129105619.10695-3-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Vladimir Barinov <vladimir.barinov@cogentembedded.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, Nov 29, 2018 at 11:56:15AM +0100, Geert Uytterhoeven wrote:
> The R-Car Gen3 HardWare Manual Errata for Rev. 0.80 (Feb 28, 2018)
> removed the CR7 power domain on R-Car V3M, as this SoC does not have an
> ARM Cortex-R7 Realtime Core.
> 
> As this definition was never used from DT, it can just be removed.
> 
> Fixes: 833bdb47c826a1a6 ("dt-bindings: power: add R8A77970 SYSC power domain definitions")
> Fixes: bab9b2a74fe9da96 ("soc: renesas: rcar-sysc: add R8A77970 support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.21.
