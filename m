From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: DTS: r8a7794: alt: Fix PCF names for DU
Date: Thu, 3 Nov 2016 19:57:43 +0300
Message-ID: <085d178c-b0fb-ed42-79ce-590507baeba7@cogentembedded.com>
References: <1478180574-15464-1-git-send-email-jacopo@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478180574-15464-1-git-send-email-jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacopo Mondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>, horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 11/03/2016 04:42 PM, Jacopo Mondi wrote:

> Update the PCF pin groups and function names of DU interface for

    PFC maybe?

> r8a7794 ALT board.
>
> The currently specified pin groups and function names prevented PCF and
> DU interfaces from being correctly configured:
>
> sh-pfc e6060000.pin-controller: function 'du' not supported
> sh-pfc e6060000.pin-controller: invalid function du in map table
> sh-pfc e6060000.pin-controller: function 'du' not supported
> sh-pfc e6060000.pin-controller: invalid function du in map table
> sh-pfc e6060000.pin-controller: function 'du' not supported
> sh-pfc e6060000.pin-controller: invalid function du in map table
> sh-pfc e6060000.pin-controller: function 'du' not supported
> sh-pfc e6060000.pin-controller: invalid function du in map table
> rcar-du: probe of feb00000.display failed with error -22
>
> Signed-off-by: Jacopo Mondi <jacopo-AW8dsiIh9cEdnm+yROfE0A@public.gmane.org>
> ---
>
> Patch applied against Simon Horman's renesas/master branch.
> The PCF pin groups and function renaming was introduced by commit 56ed4bb9 and
> DTS for ALT board has never been update accordingly.

    We didn't care about Alt at the time, the patch was done in the interests 
of the SILK board. I didn't realize the DU pin groups were used for Alt before 
the actual support was added for them. Thank you for finally fixing this!

> Tested displaying frames on VGA interface: the rcar-du driver loads correctly.

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
