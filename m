From: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: add vendor-prefix for Newhaven Display
Date: Fri, 4 Apr 2014 12:35:27 +0200
Message-ID: <20140404103527.GC9242@amd.pavel.ucw.cz>
References: <1396493527-26170-1-git-send-email-dinguyen@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1396493527-26170-1-git-send-email-dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed 2014-04-02 21:52:07, dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org wrote:
> From: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
> 
> Newhaven Display provides the worldwide marketplace with cost
> effective high quality display devices ranging from OLED and LCD
> Displays to VFD Displays.
> 
> Signed-off-by: Dinh Nguyen <dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>

Commit log should not be a place for advertising? :-)

Reviewed-by: Pavel Machek <pavel-ynQEQJNshbs@public.gmane.org>

> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 4685ec3..7037990 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -60,6 +60,7 @@ microchip	Microchip Technology Inc.
>  mosaixtech	Mosaix Technologies, Inc.
>  national	National Semiconductor
>  neonode		Neonode Inc.
> +newhaven	Newhaven Display International
>  nintendo	Nintendo
>  nvidia	NVIDIA
>  nxp	NXP Semiconductors

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
