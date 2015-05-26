From: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 06/21] of/platform: Add of_platform_device_ensure()
Date: Tue, 26 May 2015 11:56:54 -0700
Message-ID: <20150526185654.GE10571@dtor-ws>
References: <1432565608-26036-1-git-send-email-tomeu.vizoso@collabora.com>
 <1432565608-26036-7-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1432565608-26036-7-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?iso-8859-1?Q?St=E9phane?= Marchesin <stephane.marchesin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Tomeu,

On Mon, May 25, 2015 at 04:53:10PM +0200, Tomeu Vizoso wrote:
> This function ensures that the device that encloses the passed device
> node is registered, and thus probed if the corresponding driver has been
> registered already.

Even if the driver has already been registered this code will not
guarantee that the device has been probed if driver enabled asynchronous
probing (async probing should appear in 4.2 and the end goal is to have
async probing enabled by default for most drivers).

Also, why are we concentrating on platform drivers only? What about
other devices, for example a gpio expander behind i2c bus?

I am also concerned about adding OF-specific hooks into every subsystem
out there. Can we make process of instantiating OF devices iterative
instead and add them only if their parent has been already probed and
also devices corresponding to all phandles they reference have also been
probed? We could repeat scanning of the device tree every time we bind
a driver and bulk-add leftovers at late_initcall time. This would
mean that we could keep all logic in OF code (and maybe ACPI will add
their own implementation) and keep other subsystems unaware.

Thanks.

-- 
Dmitry
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
