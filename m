From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] iio: proximity: as3935: noise detection + threshold
 changes
Date: Fri, 12 May 2017 14:40:00 -0500
Message-ID: <20170512194000.wbxf22kqfmp6k5l6@rob-hp-laptop>
References: <20170508015041.10285-1-matt.ranostay@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170508015041.10285-1-matt.ranostay-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matt Ranostay <matt.ranostay-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, May 07, 2017 at 06:50:41PM -0700, Matt Ranostay wrote:
> Most applications are too noisy to allow the default noise and
> watchdog settings, and thus need to be configurable via DT
> properties.
> 
> Also default settings to POR defaults on a reset, and register
> distuber interrupts as noise since it prevents proper usage.
> 
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Matt Ranostay <matt.ranostay-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> ---
>  .../devicetree/bindings/iio/proximity/as3935.txt   |  6 +++

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/iio/proximity/as3935.c                     | 43 ++++++++++++++++++++--
>  2 files changed, 46 insertions(+), 3 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
