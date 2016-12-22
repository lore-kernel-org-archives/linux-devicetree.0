From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 2/5] pinctrl: aspeed: Read and write bits in LPC and
 GFX controllers
Date: Thu, 22 Dec 2016 15:03:45 -0600
Message-ID: <20161222210345.s5cvix4uzmapjns3@rob-hp-laptop>
References: <20161220073551.28522-1-andrew@aj.id.au>
 <20161220073551.28522-3-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161220073551.28522-3-andrew-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 20, 2016 at 06:05:48PM +1030, Andrew Jeffery wrote:
> The System Control Unit IP block in the Aspeed SoCs is typically where
> the pinmux configuration is found, but not always. A number of pins
> depend on state in one of LPC Host Control (LHC) or SoC Display
> Controller (GFX) IP blocks, so the Aspeed pinmux drivers should have the
> means to adjust these as necessary.
> 
> We use syscon to cast a regmap over the GFX and LPC blocks, which is
> used as an arbitration layer between the relevant driver and the pinctrl
> subsystem. The regmaps are then exposed to the SoC-specific pinctrl
> drivers by phandles in the devicetree, and are selected during a mux
> request by querying a new 'ip' member in struct aspeed_sig_desc.
> 
> Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
> Reviewed-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
> ---
> 
> Joel: I kept your r-b tag here despite reworking the g5 example bindings, as
> you've given your r-b for the lpc bindings which are what I have added.
> 
>  .../devicetree/bindings/pinctrl/pinctrl-aspeed.txt |  80 ++++++++--

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

>  drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         |  18 +--
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         |  48 ++++--
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c            | 161 +++++++++++++--------
>  drivers/pinctrl/aspeed/pinctrl-aspeed.h            |  32 ++--
>  5 files changed, 242 insertions(+), 97 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
