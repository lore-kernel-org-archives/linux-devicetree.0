From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v29 9/9] Documentation: dt: chosen properties for arm64
 kdump
Date: Tue, 10 Jan 2017 11:10:49 +0000
Message-ID: <20170110111048.GA21598@arm.com>
References: <20161228043347.27358-1-takahiro.akashi@linaro.org>
 <20161228043734.27535-1-takahiro.akashi@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161228043734.27535-1-takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: AKASHI Takahiro <takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: catalin.marinas-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, james.morse-5wv7dgnIgG8@public.gmane.org, geoff-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, bauerman-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, dyoung-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi James, Akashi,

On Wed, Dec 28, 2016 at 01:37:34PM +0900, AKASHI Takahiro wrote:
> From: James Morse <james.morse-5wv7dgnIgG8@public.gmane.org>
> 
> Add documentation for
> 	linux,crashkernel-base and crashkernel-size,
> 	linux,usable-memory-range
> 	linux,elfcorehdr
> used by arm64 kdump to decribe the kdump reserved area, and
> the elfcorehdr's location within it.
> 
> Signed-off-by: James Morse <james.morse-5wv7dgnIgG8@public.gmane.org>
> [takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org: added "linux,crashkernel-base" and "-size" ]
> Signed-off-by: AKASHI Takahiro <takahiro.akashi-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/chosen.txt | 50 ++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)

I need an ack from Rob or Mark before I can merge this.

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
