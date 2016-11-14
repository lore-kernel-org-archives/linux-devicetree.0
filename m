From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/3] ARM: dts: imx6qdl-apalis: Do not rely on DDC I2C
 bus bitbang for HDMI
Date: Mon, 14 Nov 2016 09:55:51 +0800
Message-ID: <20161114015549.GA3310@dragon>
References: <2263d508999ada9476268138b2922702eb50131f.1474260360.git.maitysanchayan@gmail.com>
 <20161022032559.GL30578@tiger>
 <3d2b6dfd-c03c-e635-8dc1-2dc9ac454f5a@mentor.com>
 <20161108173315.GA16082@Sanchayan-Arch.localdomain>
 <57268103e8fabf344723eae99b45ec7d@agner.ch>
 <7eb3df71-6d1a-006a-cc4c-83ff8df3c42c@mentor.com>
 <b68c1a07b6b5f027a6519c29b90217c1@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <b68c1a07b6b5f027a6519c29b90217c1-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 10, 2016 at 08:27:50PM -0800, Stefan Agner wrote:
> You probably saw it, Dave merged it today in his drm-next branch:
> https://cgit.freedesktop.org/~airlied/linux/?h=drm-next
> 
> I guess with that Shawn can go ahead and merge this patchset for next
> too...?

I merged #2 and #3 a couple of weeks ago.  But for the first one, I have
to wait for the drm changes to appear on my tree, i.e. v4.10-rc1 likely.
Otherwise, HDMI will stop working on my tree if I apply that patch right
now.

So please ping me when drm changes are in place.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
