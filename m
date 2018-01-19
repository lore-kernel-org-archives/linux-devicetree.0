From: Rasmus Villemoes <rasmus.villemoes-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: ls1021a: add nodes for on-chip ram
Date: Fri, 19 Jan 2018 11:53:28 +0100
Message-ID: <439098cb-7342-39c4-1999-41573f4897b7@prevas.dk>
References: <1513870698-31264-1-git-send-email-rasmus.villemoes@prevas.dk>
 <1514994345-2471-1-git-send-email-rasmus.villemoes@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1514994345-2471-1-git-send-email-rasmus.villemoes-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2018-01-03 16:45, Rasmus Villemoes wrote:
> Although the two nodes constitute one contiguous 128K region, still
> describe them separately:
> 
> - That's how they are described in the reference manual: "Each OCRAM
>   occupies a 64 KB of address region...", and the names ocram1 and
>   ocram2 are also as used in the manual.
> 
> - The two areas are treated differently by the boot ROM code: OCRAM2 is
>   zero-initialized, while, again quoting the RM, "software must perform
>   the zero initialization of OCRAM1."

ping

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
