From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] media: platform: rcar_imr: add IMR-LSX3 support
Date: Thu, 29 Jun 2017 16:42:12 -0500
Message-ID: <20170629214212.6r4e5xqmuul7g4o2@rob-hp-laptop>
References: <20170628195719.333514117@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170628195719.333514117@cogentembedded.com>
Sender: linux-media-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, devicetree@vger.kernel.org, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 28, 2017 at 10:56:23PM +0300, Sergei Shtylyov wrote:
> Add support for the image renderer light SRAM extended 3 (IMR-LSX3) found
> only in the R-Car V2H (R8A7792) SoC.  It differs  from IMR-LX4 in that it
> supports only planar video formats but can use the video capture data for
> the textures.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This patch  is against the 'media_tree.git' repo's 'master' branch plus the
> latest version of the Renesas IMR driver...
> 
> Changes in version 3:
> - fixed compilation errors, resolved rejects, refreshed the patch atop of the
>   IMR driver patch (version 6).
> 
> Changes in version 2:
> - renamed *enum* 'imr_gen' to 'imr_type' and the *struct* field of this type
>   from 'gen' to 'type';
> - rename *struct* 'imr_type' to 'imr_info' and the fields/variables of this type
>   from 'type' to 'info';
> - added comments to IMR-LX4 only CMRCR2 bits;
> - added IMR type check to the WTS instruction writing to CMRCCR2.
> 
>  Documentation/devicetree/bindings/media/rcar_imr.txt |   11 +-

You missed my ack on v2.

>  drivers/media/platform/rcar_imr.c                    |  101 +++++++++++++++----
>  2 files changed, 92 insertions(+), 20 deletions(-)
