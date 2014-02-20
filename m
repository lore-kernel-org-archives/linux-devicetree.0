From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH v7 0/4] DT support for kirkwood based Synology NAS boxes
Date: Thu, 20 Feb 2014 10:18:45 +0100
Message-ID: <20140220091845.GH11878@lunn.ch>
References: <1392840157-31072-1-git-send-email-klightspeed@killerwolves.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1392840157-31072-1-git-send-email-klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 20, 2014 at 06:02:33AM +1000, klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org wrote:
> This patchset adds support for around 30 kirkwood bases Synology NAS
> boxes. Patch #1 documents vendor prefixes. Patch #2 generalizes the qnap
> power off driver so that it can also be used for Synology devices.
> Patch #3 adds sii,s35390a to i2c trivial devices. Patch #4 adds the 
> synology DT files.

Hi Ben

Thanks for finishing this.

Whole series:

Acked-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>

	  Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
