From: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 0/2] Replace /include/ (dtc) with #include
Date: Mon, 27 Jan 2014 20:07:04 +0900
Message-ID: <52E63DD8.9070909@samsung.com>
References: <1389348970-5498-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1389348970-5498-1-git-send-email-pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/10/2014 07:16 PM, Pankaj Dubey wrote:
> Replace /include/ (dtc) with #include (C pre-processor) for all ARM64
> based SoC dts files.
>
> Pankaj Dubey (2):
>    arm64: dts: use #include for all AppliedMicro device tree files
>    arm64: dts: use #include for all ARM fast model device tree file
>
>   arch/arm64/boot/dts/apm-mustang.dts    |    2 +-
>   arch/arm64/boot/dts/rtsm_ve-aemv8a.dts |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
Gentle ping.

Best Regards,
Pankaj Dubey
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
