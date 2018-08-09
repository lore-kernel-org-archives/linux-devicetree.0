Return-Path: <robherring2@gmail.com>
Message-ID: <5b6cc30b.1c69fb81.682d3.1214@mx.google.com>
Date: Thu, 09 Aug 2018 16:41:14 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] rcar-vin: add R8A77980 support
References: <b2385c53-3eec-464d-f893-9fcdfb890466@cogentembedded.com>
In-Reply-To: <b2385c53-3eec-464d-f893-9fcdfb890466@cogentembedded.com>
To: sergei.shtylyov@cogentembedded.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hi, this is an automated email from Rob's (experimental) review bot. I
found a couple of common problems with your patch. Please see below.

On Mon, 6 Aug 2018 21:48:20 +0300, Sergei Shtylyov wrote:
> Add the R8A77980 SoC support to the R-Car VIN driver.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Acked-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 

The preferred subject prefix is "dt-bindings: <binding dir>: ...".

> ---
> This patch is against the 'media_tree.git' repo's 'master' branch.
> 
> Changes in version 2:
> - move the R8A77980 info/routes after R8A77970 ones;
> - added Niklas' ACK.
> 
>  Documentation/devicetree/bindings/media/rcar_vin.txt |    1 
>  drivers/media/platform/rcar-vin/rcar-core.c          |   32 +++++++++++++++++++
>  2 files changed, 33 insertions(+)
> 

DT bindings (including binding headers) should be a separate patch. See
Documentation/devicetree/bindings/submitting-patches.txt.
