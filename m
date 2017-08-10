From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: iio: timer: stm32: add support for
 STM32H7
Date: Thu, 10 Aug 2017 12:12:17 -0500
Message-ID: <20170810171217.gxms3ect2gpbizba@rob-hp-laptop>
References: <1501751654-14153-1-git-send-email-fabrice.gasnier@st.com>
 <1501751654-14153-2-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1501751654-14153-2-git-send-email-fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alexandre.torgue-qxv4g6HH51o@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, benjamin.gaignard-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 03, 2017 at 11:14:12AM +0200, Fabrice Gasnier wrote:
> STM32H7 has slightly different triggers than previous versions.
> Introduce st,stm32h7-timer-trigger compatible to handle this new variant.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier-qxv4g6HH51o@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/iio/timer/stm32-timer-trigger.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
