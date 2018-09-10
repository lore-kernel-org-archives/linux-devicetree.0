Return-Path: <SRS0=4JYN=LY=verge.net.au=horms@kernel.org>
Date: Mon, 10 Sep 2018 14:38:56 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2] media: dt-bindings: adv748x: Fix decimal unit
 addresses
Message-ID: <20180910123855.q3uuunzprbjlywg6@verge.net.au>
References: <20180905132409.14456-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180905132409.14456-1-geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Sep 05, 2018 at 03:24:09PM +0200, Geert Uytterhoeven wrote:
> With recent dtc and W=1:
> 
>     Warning (graph_port): video-receiver@70/port@10: graph node unit address error, expected "a"
>     Warning (graph_port): video-receiver@70/port@11: graph node unit address error, expected "b"
> 
> Unit addresses are always hexadecimal (without prefix), while the bases
> of reg property values depend on their prefixes.
> 
> Fixes: e69595170b1cad85 ("media: adv748x: Add adv7481, adv7482 bindings")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
