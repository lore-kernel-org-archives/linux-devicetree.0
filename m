From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] ARM: DTS: da850: fixed missing #gpio-cells in gpio node
Date: Thu, 7 Apr 2016 16:33:45 +0530
Message-ID: <57063E91.9010106@ti.com>
References: <1459848697-21006-1-git-send-email-petr@barix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459848697-21006-1-git-send-email-petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Petr,

On Tuesday 05 April 2016 03:01 PM, Petr Kulhavy wrote:
> The gpio node was missing the mandatory property #gpio-cells, which was
> causing runtime errors when using GPIOs e.g. with gpio-leds or gpio-keys:
> 
> "could not get #gpio-cells for /soc/gpio@1e26000"
> 
> This fixes the problem and adds the missing parameter.
> The value is 2 according to the gpio-davinci.txt binding.
> 
> Signed-off-by: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>

Thanks for the patch. Queuing this for v4.7 since it has been this way
since beginning and there seem to be no in-kernel device-tree files with
a gpio consumerm, so no one seems to be immediately affected.

Thanks,
Sekhar

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
