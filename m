Return-Path: <SRS0=dseP=L2=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42434 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726221AbeILOim (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 12 Sep 2018 10:38:42 -0400
Date: Wed, 12 Sep 2018 11:34:56 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: Remove unneeded status from thermal
 nodes
Message-ID: <20180912093454.3mlevy6b4252wpsz@verge.net.au>
References: <20180911143730.9230-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180911143730.9230-1-geert+renesas@glider.be>
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Sep 11, 2018 at 04:37:30PM +0200, Geert Uytterhoeven wrote:
> The thermal device is supposed to be always enabled.  As the default
> value of the status property is "okay", there is no need to make this
> explicit in SoC-specific .dtsi files where no override is involved.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
