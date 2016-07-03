From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 4/4] iio: potentiometer: Fix typo in Kconfig
Date: Sun, 3 Jul 2016 11:56:24 +0100
Message-ID: <b11ceda3-fd8e-4dca-ca97-bac44d517018@kernel.org>
References: <1467272091-28087-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1467272091-28087-5-git-send-email-florian.vaussard@heig-vd.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467272091-28087-5-git-send-email-florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Vaussard <florian.vaussard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Slawomir Stepien <sst-IjDXvh/HVVUAvxtiuMwx3w@public.gmane.org>, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cristina Moraru <cristina.moraru09-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 30/06/16 08:34, Florian Vaussard wrote:
> Fix s/potentiomenter/potentiometer/.
> 
> Suggested-by: Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>
> Signed-off-by: Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
Applied.
> ---
>  drivers/iio/potentiometer/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/potentiometer/Kconfig b/drivers/iio/potentiometer/Kconfig
> index 55c2414..2e9da1c 100644
> --- a/drivers/iio/potentiometer/Kconfig
> +++ b/drivers/iio/potentiometer/Kconfig
> @@ -10,7 +10,7 @@ config DS1803
>  	depends on I2C
>  	help
>  	  Say yes here to build support for the Maxim Integrated DS1803
> -	  digital potentiomenter chip.
> +	  digital potentiometer chip.
>  
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called ds1803.
> @@ -39,7 +39,7 @@ config MCP4131
>  	  MCP4241, MCP4242,
>  	  MCP4251, MCP4252,
>  	  MCP4261, MCP4262,
> -	  digital potentiomenter chips.
> +	  digital potentiometer chips.
>  
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called mcp4131.
> @@ -53,7 +53,7 @@ config MCP4531
>  	  MCP4551, MCP4552, MCP4561, MCP4562,
>  	  MCP4631, MCP4632, MCP4641, MCP4642,
>  	  MCP4651, MCP4652, MCP4661, MCP4662
> -	  digital potentiomenter chips.
> +	  digital potentiometer chips.
>  
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called mcp4531.
> 
