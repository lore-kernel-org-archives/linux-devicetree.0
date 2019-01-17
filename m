Return-Path: <SRS0=YYYg=PZ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34288 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbfAQNQq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 17 Jan 2019 08:16:46 -0500
Date: Thu, 17 Jan 2019 14:16:41 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: dts: r8a7778: Add HSCIF0/1 support
Message-ID: <20190117131641.meqjsylxnwiwi4v5@verge.net.au>
References: <20190110153232.21212-1-geert+renesas@glider.be>
 <20190111135319.mgixoxa5iigmx5x4@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190111135319.mgixoxa5iigmx5x4@verge.net.au>
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Jan 11, 2019 at 02:53:20PM +0100, Simon Horman wrote:
> On Thu, Jan 10, 2019 at 04:32:32PM +0100, Geert Uytterhoeven wrote:
> > From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> > 
> > Add HSCIF0/1 clocks and device nodes, based on Rev. 1.00 of the R-Car
> > M1A datasheet.
> > 
> > Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> > [geert: Squashed two patches]
> > [geert: Correct HSCIF1 module clock index]
> > [geert: Correct reg properties for non-LPAE]
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks, applied for v5.1.
