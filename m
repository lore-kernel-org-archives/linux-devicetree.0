From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] rtc: ds1302: support control with
 using GPIO lines
Date: Tue, 28 Jun 2016 15:57:04 -0500
Message-ID: <20160628205704.GT3737@rob-hp-laptop>
References: <1467026362-29446-1-git-send-email-akinobu.mita@gmail.com>
 <1467026362-29446-3-git-send-email-akinobu.mita@gmail.com>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBDJIP47K7MERBJ6JZO5QKGQEGTMDDFA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1467026362-29446-3-git-send-email-akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sergey Yanovich <ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 27, 2016 at 08:19:22PM +0900, Akinobu Mita wrote:
> This adds support control with GPIO lines connected to the DS1302
> which can communicate with three wires.
> 
> Signed-off-by: Akinobu Mita <akinobu.mita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Sergey Yanovich <ynvich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>
> Cc: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  .../devicetree/bindings/rtc/maxim-ds1302.txt       |  13 +
>  drivers/rtc/Kconfig                                |  17 +-
>  drivers/rtc/rtc-ds1302.c                           | 320 ++++++++++++++++++++-
>  3 files changed, 331 insertions(+), 19 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/maxim-ds1302.txt b/Documentation/devicetree/bindings/rtc/maxim-ds1302.txt
> index ba470c5..d489753 100644
> --- a/Documentation/devicetree/bindings/rtc/maxim-ds1302.txt
> +++ b/Documentation/devicetree/bindings/rtc/maxim-ds1302.txt
> @@ -27,6 +27,12 @@ Required SPI properties:
>  - spi-cs-high: DS-1302 has active high chip select line. This is
>    required unless inverted in hardware.
>  
> +Required properties when using GPIO lines:
> +
> +- gpio-ce: GPIO connected to CE pin
> +- gpio-io: GPIO connected to I/O pin
> +- gpio-reset: GPIO connected to SCLK pin
> +

IIRC, we got rid of the direct gpio bit-banging in this driver (or a 
similar one) and replaced it with SPI GPIO driver. We should do that 
here.

Rob

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
