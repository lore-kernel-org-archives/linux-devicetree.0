From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] clocksource: moxart: Add AST2500 compatible string
Date: Thu, 25 May 2017 22:28:08 +0200
Message-ID: <20170525202808.GA9501@mai>
References: <20170516075840.23130-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170516075840.23130-1-andrew-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ryan_chen-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, May 16, 2017 at 03:58:40PM +0800, Andrew Jeffery wrote:
> Also clean up space-before-tab issues in the documentation.

Andrew,

I reworked the patch to apply to the changes Linus did recently to convert to
the fttrm010 driver.

Please have a look at:

https://git.linaro.org/people/daniel.lezcano/linux.git/commit/?h=clockevents/4.13&id=3ca904162ffdd72f4fad3ab731fc94a12c50f682

Shouldn't the compatible string be:

	"aspeed,ast2400-timer", "faraday,fttmr010"
	"aspeed,ast2500-timer", "faraday,fttmr010"


  -- Daniel

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
