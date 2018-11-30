Return-Path: <SRS0=nKhH=OJ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51889 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726469AbeK3VZ0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 30 Nov 2018 16:25:26 -0500
Date: Fri, 30 Nov 2018 11:16:32 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77965: Remove non-existent
 IPMMU-IR
Message-ID: <20181130101628.phhbkmxsl22qvfit@verge.net.au>
References: <20181129103435.9260-1-geert+renesas@glider.be>
 <20181129103435.9260-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181129103435.9260-2-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, Nov 29, 2018 at 11:34:34AM +0100, Geert Uytterhoeven wrote:
> The R-Car Gen3 HardWare Manual Errata for Rev. 1.00 (Aug 24, 2018)
> removed the IPMMU-IR IOMMU instance on R-Car M3-N, as this SoC does not
> have an Image Processing Unit (IMP-X5) nor the A3IR power domain.
> 
> Fixes: 55697cbb44e4f7ea ("arm64: dts: renesas: r8a779{65,80,90}: Add IPMMU devices nodes")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.21.
