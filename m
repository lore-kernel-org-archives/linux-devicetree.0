Return-Path: <SRS0=1UWY=PT=vger.kernel.org=devicetree-owner@kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:54634 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728122AbfAKMrS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 11 Jan 2019 07:47:18 -0500
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v4 1/4] dt-bindings: adv748x: make data-lanes property
 mandatory for CSI-2 endpoints
References: <20181129020147.22115-1-niklas.soderlund+renesas@ragnatech.se>
 <20181129020147.22115-2-niklas.soderlund+renesas@ragnatech.se>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <b4d05109-a382-ebc6-6230-943978ca7352@ideasonboard.com>
Date: Fri, 11 Jan 2019 12:47:12 +0000
MIME-Version: 1.0
In-Reply-To: <20181129020147.22115-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Niklas,

Thank you for this series.

On 29/11/2018 02:01, Niklas Söderlund wrote:
> The CSI-2 transmitters can use a different number of lanes to transmit
> data. Make the data-lanes mandatory for the endpoints that describe the
> transmitters as no good default can be set to fallback on.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

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
> diff --git a/Documentation/devicetree/bindings/media/i2c/adv748x.txt b/Documentation/devicetree/bindings/media/i2c/adv748x.txt
> index 5dddc95f9cc46084..4f91686e54a6b939 100644
> --- a/Documentation/devicetree/bindings/media/i2c/adv748x.txt
> +++ b/Documentation/devicetree/bindings/media/i2c/adv748x.txt
> @@ -48,7 +48,16 @@ are numbered as follows.
>  	  TXA		source		10
>  	  TXB		source		11
>  
> -The digital output port nodes must contain at least one endpoint.
> +The digital output port nodes, when present, shall contain at least one
> +endpoint. Each of those endpoints shall contain the data-lanes property as
> +described in video-interfaces.txt.
> +
> +Required source endpoint properties:
> +  - data-lanes: an array of physical data lane indexes
> +    The accepted value(s) for this property depends on which of the two
> +    sources are described. For TXA 1, 2 or 4 data lanes can be described
> +    while for TXB only 1 data lane is valid. See video-interfaces.txt
> +    for detailed description.
>  
>  Ports are optional if they are not connected to anything at the hardware level.
>  
> 

-- 
Regards
--
Kieran
