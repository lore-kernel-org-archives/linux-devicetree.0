Return-Path: <SRS0=GiHI=NR=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43133 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726976AbeKFVjw (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 6 Nov 2018 16:39:52 -0500
Date: Tue, 6 Nov 2018 13:14:52 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH V2] arm64: dts: renesas: Switch eMMC bus to 1V8 on
 Salvator-X and ULCB
Message-ID: <20181106121451.4sjiceqkrnfuhhvt@verge.net.au>
References: <20181104203707.20996-1-marek.vasut+renesas@gmail.com>
 <20181106105717.bdrvfwbry4ci6pii@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181106105717.bdrvfwbry4ci6pii@ninjato>
Sender: devicetree-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Marek Vasut <marek.vasut@gmail.com>, devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Nov 06, 2018 at 11:57:17AM +0100, Wolfram Sang wrote:
> On Sun, Nov 04, 2018 at 09:37:07PM +0100, Marek Vasut wrote:
> > The eMMC card has two supplies, VCC and VCCQ. The VCC supplies the NAND
> > array and the VCCQ supplies the bus. On Salvator-X and ULCB, the VCC is
> > connected to 3.3V rail, while the VCCQ is connected to 1.8V rail. Adjust
> > the pinmux to match the bus, which is always operating in 1.8V mode.
> > 
> > While at it, deduplicate the pinmux entries, which are now the same for
> > both default and UHS modes. We still need the two pinctrl entries to
> > match the bindings though.
> > 
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > Cc: Simon Horman <horms+renesas@verge.net.au>
> > Cc: Wolfram Sang <wsa@the-dreams.de>
> > Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > Cc: linux-renesas-soc@vger.kernel.org
> > Cc: linux-mmc@vger.kernel.org
> 
> Tested on M3-N and H3 ES2.0 with HS400 enabled eMMC:
> 
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks, applied for v4.21.
