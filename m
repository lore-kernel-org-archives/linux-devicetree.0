From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH v3 2/9] ARM64: dts: meson-gxbb-p200: add the ethernet
 PHY's reset GPIO
Date: Fri, 20 Jan 2017 18:46:58 +0100
Message-ID: <20170120174658.GG25907@lunn.ch>
References: <20170120132650.9784-1-martin.blumenstingl@googlemail.com>
 <20170120152232.13943-1-martin.blumenstingl@googlemail.com>
 <20170120152232.13943-3-martin.blumenstingl@googlemail.com>
 <20170120162138.GE25907@lunn.ch>
 <CAFBinCA47Nng_jjxKrWrV_YBHr0bg+7xPaJrVswt_WnZ6wtyjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAFBinCA47Nng_jjxKrWrV_YBHr0bg+7xPaJrVswt_WnZ6wtyjA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 20, 2017 at 06:07:20PM +0100, Martin Blumenstingl wrote:
> I though that this is good practice - the documentation doesn't say
> that it should only be added in specific cases: [0]

Agreed, the text should be better, listing when it is appropriate to
use.

> my intention behind adding the PHY ID was to make it easier to see
> which devices uses which PHY. this is especially useful for devices
> with RTL8211F PHY (basically all devices with RGMII PHY except the
> P200) as these may need similar fixes than [1]

I would not say it is wrong to list the PHY ID, it just has
consequences if the PHY ever changes.

	     Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
