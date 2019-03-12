Return-Path: <robherring2@gmail.com>
Date: Tue, 12 Mar 2019 14:30:27 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: rcar-csi2: List resets as a
 mandatory property
Message-ID: <20190312193027.GA26420@bogus>
References: <20190308234722.25775-1-niklas.soderlund+renesas@ragnatech.se>
 <20190308234722.25775-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190308234722.25775-2-niklas.soderlund+renesas@ragnatech.se>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Sat,  9 Mar 2019 00:47:21 +0100, =?UTF-8?q?Niklas=20S=C3=B6derlund?= wrote:
> The resets property will become mandatory to operate the device, list it
> as such. All device tree source files have always included the reset
> property so making it mandatory will not introduce any regressions.
> 
> While at it improve the description for the clocks property.
> 
> Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  Documentation/devicetree/bindings/media/renesas,rcar-csi2.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
