From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 1/3] firmware: Amlogic: Add secure monitor driver
Date: Thu, 26 May 2016 09:45:16 +0200
Message-ID: <20160526074516.GA14703@mephisto>
References: <1464207511-11786-1-git-send-email-carlo@caione.org>
 <1464207511-11786-2-git-send-email-carlo@caione.org>
 <5746A308.8070606@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5746A308.8070606-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 26/05/16 09:17, Neil Armstrong wrote:
> Hi Carlo,

Hi Neil,

> On 05/25/2016 10:18 PM, Carlo Caione wrote:
> > diff --git a/include/dt-bindings/firmware/meson-sm.h b/include/dt-bindings/firmware/meson-sm.h
> > new file mode 100644
> > index 0000000..3a52a13
> > --- /dev/null
> > +++ b/include/dt-bindings/firmware/meson-sm.h
> > @@ -0,0 +1,20 @@
> > +/*
> > + * Copyright (C) 2016 Endless Mobile, Inc.
> > + * Author: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License
> > + * version 2 as published by the Free Software Foundation.
> > + *
> > + * You should have received a copy of the GNU General Public License
> > + * along with this program. If not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#ifndef _MESON_DT_H_
> > +#define _MESON_DT_H_
> > +
> > +#define SM_EFUSE_READ		0
> > +#define SM_EFUSE_WRITE		1
> > +#define SM_EFUSE_USER_MAX	2
> > +
> > +#endif /* _MESON_DT_H_ */
> 
> Now this has been refactored, I don't see the point of this dt-bindings header ?
> 
> These defines should take place in linux/firmware/meson/meson-sm.h

Yes, that is a possibility I considered before submitting this version
and now it also seems probably the best way to do it. I'll change it in
the next revision.

Thanks,

-- 
Carlo Caione
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
