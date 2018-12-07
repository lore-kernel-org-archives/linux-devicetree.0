Return-Path: <robherring2@gmail.com>
Date: Fri, 7 Dec 2018 17:08:11 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/4] dt-bindings: adv748x: make data-lanes property
 mandatory for CSI-2 endpoints
Message-ID: <20181207230811.GA2563@bogus>
References: <20181129020147.22115-1-niklas.soderlund+renesas@ragnatech.se>
 <20181129020147.22115-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181129020147.22115-2-niklas.soderlund+renesas@ragnatech.se>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Thu, 29 Nov 2018 03:01:44 +0100, =?UTF-8?q?Niklas=20S=C3=B6derlund?=          wrote:
> The CSI-2 transmitters can use a different number of lanes to transmit
> data. Make the data-lanes mandatory for the endpoints that describe the
> transmitters as no good default can be set to fallback on.
> 
> Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> 
> ---
> * Changes since v3
> - Add paragraph to describe the accepted values for the source endpoint
>   data-lane property. Thanks Jacopo for pointing this out and sorry for
>   missing this in v2.
> * Changes since v2
> - Update paragraph according to Laurents comments.
> ---
>  .../devicetree/bindings/media/i2c/adv748x.txt         | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
