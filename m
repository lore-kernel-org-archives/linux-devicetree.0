From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 4/4] regulator: axp20x: add the AXP813
Date: Fri, 23 Sep 2016 17:27:05 -0500
Message-ID: <20160923222705.GA30134@rob-hp-laptop>
References: <cover.1474621107.git.moinejf@free.fr>
 <21ac1fd8ab33185ec2cdb436272f48571695ce54.1474621108.git.moinejf@free.fr>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDJIP47K7MERBO6YS27QKGQE5IMCW6I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <21ac1fd8ab33185ec2cdb436272f48571695ce54.1474621108.git.moinejf-GANU6spQydw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Sep 23, 2016 at 09:22:41AM +0200, Jean-Francois Moine wrote:
> The X-Powers AXP813 PMIC is close to the AXP803.
> It is used in some Allwinner boards as the Sinovoip BananaPi M3+.
> 
> Signed-off-by: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/axp20x.txt |   9 +-
>  drivers/mfd/axp20x.c                             |   2 +
>  drivers/regulator/Makefile                       |   2 +-
>  drivers/regulator/axp813.c                       | 229 +++++++++++++++++++++++
>  include/linux/mfd/axp20x.h                       |   1 +
>  5 files changed, 239 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/regulator/axp813.c
> 
> diff --git a/Documentation/devicetree/bindings/mfd/axp20x.txt b/Documentation/devicetree/bindings/mfd/axp20x.txt
> index 3332d02..62019fb 100644
> --- a/Documentation/devicetree/bindings/mfd/axp20x.txt
> +++ b/Documentation/devicetree/bindings/mfd/axp20x.txt
> @@ -8,11 +8,12 @@ axp221 (X-Powers)
>  axp223 (X-Powers)
>  axp803 (X-Powers)
>  axp809 (X-Powers)
> +axp813 (X-Powers)
>  
>  Required properties:
>  - compatible: "x-powers,axp152", "x-powers,axp202", "x-powers,axp209",
>  	      "x-powers,axp221", "x-powers,axp223", "x-powers,axp803",
> -	      "x-powers,axp806", "x-powers,axp809"
> +	      "x-powers,axp806", "x-powers,axp809", "x-powers,axp813"

Same comment here.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
