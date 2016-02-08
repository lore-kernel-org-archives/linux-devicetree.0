From: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] Drivers: USB: DA8xx MUSB: added DT support
Date: Mon, 8 Feb 2016 14:04:22 +0100
Message-ID: <56B89256.9050708@barix.com>
References: <1454693676-20211-1-git-send-email-petr@barix.com>
 <364593765.PbysHF8iXJ@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <364593765.PbysHF8iXJ@wuerfel>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Arndt,

On 05.02.2016 23:22, Arnd Bergmann wrote:
> Please make this
>
> 	Should be one of "ti,da850-musb" or "ti,da830-musb"
>
> We don't use wildcards in compatible strings,

I'm seeing something different though:

$ grep -r "compatible.*xx" Documentation/devicetree/bindings/ |wc -l
44

> so better use specific model
> names in case we later find something that is different betweent the models.
OK, thanks.

Regards
Petr
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
