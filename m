From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: media: rcar_vin: Reverse SoC part
 number list
Date: Fri, 17 Nov 2017 14:31:48 -0600
Message-ID: <20171117203148.anvhqgrhbp6imptt@rob-hp-laptop>
References: <1510856571-30281-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1510856571-30281-2-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1510856571-30281-2-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 16, 2017 at 06:22:48PM +0000, Fabrizio Castro wrote:
> Change the sorting of the part numbers from descending to ascending to
> match with other documentation.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> ---
> v1->v2:
> * new patch triggered by Geert's comment, see the below link for details:
>   https://www.mail-archive.com/linux-media@vger.kernel.org/msg121992.html
> 
>  Documentation/devicetree/bindings/media/rcar_vin.txt | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
