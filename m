From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] of: Stop naming platform_device using dcr
 address
Date: Tue, 27 May 2014 13:47:49 +0100
Message-ID: <20140527124749.E196BC40FCB@trevor.secretlab.ca>
References: <1400801769-4506-1-git-send-email-grant.likely@linaro.org>
	<1400801769-4506-3-git-send-email-grant.likely@linaro.org>
	<4587381.5n3eMGkKaq@wuerfel>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4587381.5n3eMGkKaq@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 23 May 2014 16:07:08 +0200, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Friday 23 May 2014 08:36:09 Grant Likely wrote:
> > There is now a way to ensure all platform devices get a unique name when
> > populated from the device tree, and the DCR_NATIVE code path is broken
> > anyway. PowerPC Cell (PS3) is the only platform that actually uses this
> > path.  Most likely nobody will notice if it is killed. Remove the code
> > and associated ugly #ifdef.
> > 
> > The user-visible impact of this patch is that any DCR device on Cell
> > will get a new name in the /sys/devices hierarchy.
> 
> Isn't this used on all ppc440+ as well?

Yes, but the 440 code path is broken so that it always uses the default
name instead. Therefore only Cell is affected.

g.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
