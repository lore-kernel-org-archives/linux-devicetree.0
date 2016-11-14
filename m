From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] mfd: rn5t618: Add Ricoh RC5T619 PMIC support
Date: Mon, 14 Nov 2016 10:02:12 -0600
Message-ID: <20161114160212.74e375p3siygiv2d@rob-hp-laptop>
References: <20161105161925.14910-1-phh@phh.me>
 <20161105161925.14910-2-phh@phh.me>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161105161925.14910-2-phh-8tEavu1zA38@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pierre-Hugues Husson <phh-8tEavu1zA38@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Nov 05, 2016 at 05:19:24PM +0100, Pierre-Hugues Husson wrote:
> The Ricoh RN5T567 is from the same family as the Ricoh RN5T618 is,
> the differences are:
> 
> + DCDC4/DCDC5
> + LDO7-10
> + Slightly different output voltage/currents
> + 32kHz Output
> + RTC
> + USB Charger detection
> 
> Signed-off-by: Pierre-Hugues Husson <phh-8tEavu1zA38@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/rn5t618.txt | 16 ++++++++++------
>  drivers/mfd/Kconfig                               |  3 ++-
>  drivers/mfd/rn5t618.c                             |  1 +
>  include/linux/mfd/rn5t618.h                       |  9 +++++++++
>  4 files changed, 22 insertions(+), 7 deletions(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
