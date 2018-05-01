Return-Path: <robherring2@gmail.com>
Date: Tue, 1 May 2018 09:11:30 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] rcar-vin: remove generic gen3 compatible string
Message-ID: <20180501141130.GA29499@rob-hp-laptop>
References: <20180424234321.22367-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180424234321.22367-1-niklas.soderlund+renesas@ragnatech.se>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Apr 25, 2018 at 01:43:21AM +0200, Niklas S�derlund wrote:
> The compatible string "renesas,rcar-gen3-vin" was added before the
> Gen3 driver code was added but it's not possible to use. Each SoC in the
> Gen3 series require SoC specific knowledge in the driver to function.
> Remove it before it is added to any device tree descriptions.
> 
> Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  Documentation/devicetree/bindings/media/rcar_vin.txt | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
