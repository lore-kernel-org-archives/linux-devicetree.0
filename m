From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 2/2] of: Stop naming platform_device using dcr address
Date: Fri, 23 May 2014 16:07:08 +0200
Message-ID: <4587381.5n3eMGkKaq@wuerfel>
References: <1400801769-4506-1-git-send-email-grant.likely@linaro.org> <1400801769-4506-3-git-send-email-grant.likely@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400801769-4506-3-git-send-email-grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 23 May 2014 08:36:09 Grant Likely wrote:
> There is now a way to ensure all platform devices get a unique name when
> populated from the device tree, and the DCR_NATIVE code path is broken
> anyway. PowerPC Cell (PS3) is the only platform that actually uses this
> path.  Most likely nobody will notice if it is killed. Remove the code
> and associated ugly #ifdef.
> 
> The user-visible impact of this patch is that any DCR device on Cell
> will get a new name in the /sys/devices hierarchy.

Isn't this used on all ppc440+ as well?

I don't think PS3 has it either, it should only be the second generation
Cell blade doing this, which uses ppc440-derived I/O devices.

We will probably see a bunch of the same devices on APM's X-gene ARM64
machines as well, but we don't have to maintain a stable device name for
those yet.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
