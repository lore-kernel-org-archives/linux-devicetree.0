Return-Path: <SRS0=nKhH=OJ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51934 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726469AbeK3V0E (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 30 Nov 2018 16:26:04 -0500
Date: Fri, 30 Nov 2018 11:17:12 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a7795-es1: Add missing power
 domains to IPMMU nodes
Message-ID: <20181130101711.nvxen2resskismvl@verge.net.au>
References: <20181129103435.9260-1-geert+renesas@glider.be>
 <20181129103435.9260-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181129103435.9260-3-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, Nov 29, 2018 at 11:34:35AM +0100, Geert Uytterhoeven wrote:
> While commit 3b7e7848f0e88b36 ("arm64: dts: renesas: r8a7795: Add IPMMU
> device nodes") for R-Car H3 ES2.0 did include power-domains properties,
> they were forgotten in the counterpart for older R-Car H3 ES1.x SoCs.
> 
> Fixes: e4b9a493df45075b ("arm64: dts: renesas: r8a7795-es1: Add IPMMU device nodes")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.21.
