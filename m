From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: wheat: add SDHI0 support
Date: Sun, 4 Sep 2016 00:49:12 +0300
Message-ID: <0defa744-2a9e-ee50-6212-589cee7e537f@cogentembedded.com>
References: <34968644.DhifNderY8@wasted.cogentembedded.com>
 <1659137.gEKJxNrmrk@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1659137.gEKJxNrmrk-gHKXc3Y1Z8zGSmamagVegGFoWSdPRAKMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 08/31/2016 01:24 AM, Sergei Shtylyov wrote:

> Define the Wheat board dependent  part of  the SDHI0 (connected to the
> micro-SD slot)  device node along with the necessary voltage regulator.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>
> ---
> This patch is against the 'renesas-devel-20160830-v4.8-rc4' of Simon Horman's
> 'renesas.git' repo plus the CAN patch posted yesterday.
> Starting with this patch, SMSC LAN89218 Ethernet chip starts to misbehave on my
> board...

    Fortunately, this ill effect has been fixed by Jeremy Lintion's smsc911x 
driver patches that should hit Linus' tree soon (they're alredy in DaveM's 
net.git)...

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
