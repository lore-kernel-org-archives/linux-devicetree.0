From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v2 2/2] arch: arm: Show the serial number from devicetree
 in cpuinfo
Date: Sat, 18 Apr 2015 10:13:10 +0100
Message-ID: <20150418091310.GI12732@n2100.arm.linux.org.uk>
References: <1429296235-14123-1-git-send-email-contact@paulk.fr>
 <1429296235-14123-2-git-send-email-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1429296235-14123-2-git-send-email-contact-W9ppeneeCTY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Apr 17, 2015 at 08:43:55PM +0200, Paul Kocialkowski wrote:
>  static int __init init_machine_late(void)
>  {
> +#ifdef CONFIG_OF
> +	unsigned long dt_root;
> +	int size;
> +
> +	dt_root = of_get_flat_dt_root();
> +
> +	/* Scan for serial number */
> +	system_serial = of_get_flat_dt_prop(dt_root, "serial-number", &size);

I was really hoping for:

	if (of_property_read_string(of_root, "serial-number", &system_serial))
		system_serial = NULL;

here.  I can't see a reason to use the flattened DT at this point as
we've already parsed it.

I'd also put this after the call to machine_desc->init_late().

Thanks.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
