From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] rcar_jpu: Add R-Car Gen2 Fallback Compatibility String
Date: Sun, 10 Jan 2016 20:56:37 -0600
Message-ID: <20160111025637.GA17825@rob-hp-laptop>
References: <1452478400-4267-1-git-send-email-horms+renesas@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452478400-4267-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-media-owner@vger.kernel.org
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-sh@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 11, 2016 at 11:13:20AM +0900, Simon Horman wrote:
> Add fallback compatibility string.
> This is in keeping with the fallback scheme being adopted wherever
> appropriate for drivers for Renesas SoCs.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> ---
> v2
> * Make fallback compat string for R-Car Gen2 rather than all renesas
>   hardware: that seems too generic
> ---
>  Documentation/devicetree/bindings/media/renesas,jpu.txt | 13 +++++++------
>  drivers/media/platform/rcar_jpu.c                       |  1 +
>  2 files changed, 8 insertions(+), 6 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
