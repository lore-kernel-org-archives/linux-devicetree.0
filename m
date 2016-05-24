From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/4] firmware: Amlogic: Add secure monitor driver
Date: Tue, 24 May 2016 10:08:03 +0200
Message-ID: <20160524080803.GB18935@mephisto>
References: <1464021024-29380-1-git-send-email-carlo@caione.org>
 <1464021024-29380-2-git-send-email-carlo@caione.org>
 <m2posco5k2.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <m2posco5k2.fsf-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 23/05/16 13:58, Kevin Hilman wrote:

[...]
> > +	if (of_property_read_u32(np, "amlogic,sm-cmd-input-base", &cmd_in))
> > +		return -EINVAL;
> > +
> > +	if (of_property_read_u32(np, "amlogic,sm-cmd-output-base", &cmd_out))
> > +		return -EINVAL;
> > +
> > +	sm_phy_in_base = meson_sm_call(cmd_in, 0, 0, 0, 0, 0);
> 
> Should there be any error checking here?  Do we have any info on the
> return values here in case of error, or in case of missing firmware,
> etc.

We do not have any info on that but I can assume 0 is considered an
error as for other SMC calls. Fix in v4.

-- 
Carlo Caione
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
