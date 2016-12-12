From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 6/6] mfd: dt: Move syscon bindings to syscon
 subdirectory
Date: Mon, 12 Dec 2016 09:39:11 -0600
Message-ID: <20161212153911.drhczoagyyhu7jm4@rob-hp-laptop>
References: <20161206025321.1792-1-andrew@aj.id.au>
 <20161206025321.1792-7-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161206025321.1792-7-andrew-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Corey Minyard <minyard-HInyCGIudOg@public.gmane.org>, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg-Bxea+6Xhats@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 06, 2016 at 01:53:21PM +1100, Andrew Jeffery wrote:
> The use of syscons is growing, lets collate them in their own part of
> the bindings tree.
> 
> Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mfd/{ => syscon}/aspeed-scu.txt         | 0
>  Documentation/devicetree/bindings/mfd/{ => syscon}/atmel-gpbr.txt         | 0
>  Documentation/devicetree/bindings/mfd/{ => syscon}/atmel-matrix.txt       | 0
>  Documentation/devicetree/bindings/mfd/{ => syscon}/atmel-smc.txt          | 0
>  Documentation/devicetree/bindings/mfd/{ => syscon}/qcom,tcsr.txt          | 0
>  Documentation/devicetree/bindings/mfd/{ => syscon}/syscon.txt             | 0
>  .../devicetree/bindings/mfd/{ => syscon}/ti-keystone-devctrl.txt          | 0
>  7 files changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/mfd/{ => syscon}/aspeed-scu.txt (100%)
>  rename Documentation/devicetree/bindings/mfd/{ => syscon}/atmel-gpbr.txt (100%)
>  rename Documentation/devicetree/bindings/mfd/{ => syscon}/atmel-matrix.txt (100%)
>  rename Documentation/devicetree/bindings/mfd/{ => syscon}/atmel-smc.txt (100%)
>  rename Documentation/devicetree/bindings/mfd/{ => syscon}/qcom,tcsr.txt (100%)
>  rename Documentation/devicetree/bindings/mfd/{ => syscon}/syscon.txt (100%)
>  rename Documentation/devicetree/bindings/mfd/{ => syscon}/ti-keystone-devctrl.txt (100%)

I'm not so sure this is the right direction. syscon usage is pretty much 
spread throughout the tree.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
