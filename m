Return-Path: <SRS0=T9D/=SR=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42466 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbfDOIls (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 15 Apr 2019 04:41:48 -0400
Date: Mon, 15 Apr 2019 10:41:43 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77965: Remove reg-names of
 display node
Message-ID: <20190415084142.6pk5sd7dupua34gs@verge.net.au>
References: <20190412120132.31119-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190412120132.31119-1-jacopo+renesas@jmondi.org>
Sender: devicetree-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: geert+renesas@glider.be, magnus.damm@gmail.com, Takeshi Kihara <takeshi.kihara.df@renesas.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Apr 12, 2019 at 02:01:32PM +0200, Jacopo Mondi wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> Remove the "reg-names" property from the display node of R-Car Gen3 R8A77965
> device tree.
> 
> No other mainline R-Car Gen3 SoC has that property specified.
> 
> Fixes: 2f2c71bfc8c5 ("arm64: dts: renesas: r8a77965: Populate the DU instance placeholder")
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [reworded commit message, sent upstream]
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks Jacopo,

applied for inclusion in v5.2.
