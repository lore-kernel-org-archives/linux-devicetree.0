Return-Path: <SRS0=p22N=ON=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42233 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbeLDNq3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 4 Dec 2018 08:46:29 -0500
Date: Tue, 4 Dec 2018 05:46:25 -0800
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: dts: r8a7743: Remove legacy "renesas,rcar-thermal"
 compatibility
Message-ID: <20181204134624.vyawcthwat4ifzqn@verge.net.au>
References: <20181203150447.25316-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181203150447.25316-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das@bp.renesas.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Dec 03, 2018 at 04:04:47PM +0100, Geert Uytterhoeven wrote:
> The thermal hardware description for the RZ/G1M SoC was added to its DTS
> after the introduction of support for thermal zones, and included a
> thermal-zones node from the beginning.
> 
> Hence there is no need to claim compatibility with
> "renesas,rcar-thermal", which would be needed only for backwards
> compatibility with kernels predating thermal zone support.
> 
> Fixes: 6c76b4f7d89e89f0 ("ARM: dts: r8a7743: Add thermal device to DT")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks Geert,

applied for v4.21.
